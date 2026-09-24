// Mobile WebView shim for Charity Framework Bplace.
//
// When the framework runs inside the bplace app's WebView there is no
// userscript manager, so the Greasemonkey/Violentmonkey API surface
// (`GM.*`, `unsafeWindow`, `cloneInto`) does not exist. This module installs
// working stand-ins that keep the framework's core functionality intact:
//
//   - localStorage-backed GM.getValue/setValue/deleteValue/listValues
//   - GM.getResourceUrl → the resource URL itself
//   - GM.xmlHttpRequest → native fetch bridge when available (CORS-free,
//     mirrors the userscript behaviour), otherwise plain fetch
//   - window.charity bootstrap (same shape the userscript metadata produces)
//
// Every definition is guarded so the shim is inert on desktop userscript
// builds where the real API is already present.

/* eslint-disable @typescript-eslint/no-explicit-any */

const w = window as any;

if (typeof w.unsafeWindow === 'undefined') {
	Object.defineProperty(w, 'unsafeWindow', {
		configurable: false,
		enumerable: false,
		writable: false,
		value: w,
	});
}

if (typeof w.cloneInto !== 'function') {
	Object.defineProperty(w, 'cloneInto', {
		configurable: false,
		enumerable: false,
		writable: false,
		value: (value: unknown) => value,
	});
}

// `@resource` entries from the userscript metadata, keyed by name.
const RESOURCES: Record<string, string> = {
	logo: 'https://bplace-framework-scripts.shuni.moe/framework/assets/logo.png',
};

// Keys are namespaced so the framework's storage never collides with the
// app's own localStorage usage.
const STORAGE_PREFIX = 'charity:gm:';

function getStorage(): Storage | null {
	try {
		return window.localStorage;
	} catch {
		return null;
	}
}

async function bodyToString(body: any): Promise<string | null> {
	if (body == null) return null;
	if (typeof body === 'string') return body;
	if (body instanceof Blob) return await body.text();
	if (body instanceof ArrayBuffer) return new TextDecoder().decode(body);
	if (ArrayBuffer.isView(body)) return new TextDecoder().decode(new Uint8Array(body.buffer, body.byteOffset, body.byteLength));
	if (typeof body.getReader === 'function') {
		// ReadableStream (e.g. the body of a fetch Request)
		const reader = body.getReader();
		const chunks: Uint8Array[] = [];
		for (;;) {
			const { done, value } = await reader.read();
			if (done) break;
			chunks.push(value);
		}
		let total = 0;
		for (const chunk of chunks) total += chunk.length;
		const out = new Uint8Array(total);
		let offset = 0;
		for (const chunk of chunks) {
			out.set(chunk, offset);
			offset += chunk.length;
		}
		return new TextDecoder().decode(out);
	}
	return String(body);
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function dispatchCallbacks(details: any, states: Array<{ readyState: number; extra?: any }>, final: 'load' | 'error' | 'timeout', finalExtra?: any) {
	const onreadystatechange = details.onreadystatechange ?? (() => {});
	for (const state of states) {
		onreadystatechange({
			...state.extra,
			context: details.context,
			readyState: state.readyState,
		});
	}
	const callback =
		final === 'load' ? details.onload : final === 'timeout' ? details.ontimeout : details.onerror;
	(callback ?? (() => {}))({
		...finalExtra,
		context: details.context,
	});
}

if (!w.GM) {
	const GM = {
		async getValue(name: string, defaultValue?: unknown) {
			const raw = getStorage()?.getItem(STORAGE_PREFIX + name);
			if (raw == null) return defaultValue;
			try {
				return JSON.parse(raw);
			} catch {
				return raw;
			}
		},
		async setValue(name: string, value: unknown) {
			if (value === undefined) throw new Error('value of setValue must not be undefined');
			getStorage()?.setItem(STORAGE_PREFIX + name, JSON.stringify(value));
		},
		async deleteValue(name: string) {
			getStorage()?.removeItem(STORAGE_PREFIX + name);
		},
		async listValues() {
			const storage = getStorage();
			if (!storage) return [];
			const keys: string[] = [];
			for (let i = 0; i < storage.length; i++) {
				const key = storage.key(i);
				if (key && key.startsWith(STORAGE_PREFIX)) {
					keys.push(key.slice(STORAGE_PREFIX.length));
				}
			}
			return keys;
		},
		async getResourceUrl(name: string, isBlobUrl?: boolean) {
			return RESOURCES[name] ?? '';
		},
		async xmlHttpRequest(details: any) {
			const url: string = details.url ?? '';
			const method: string = details.method ?? 'GET';
			const timeout: number = details.timeout ?? 0;

			// The app exposes a native bridge (see ScriptHook/CharityBridge).
			// Like the real GM.xmlHttpRequest it is not subject to CORS.
			const native = w.charityNative;
			if (native && typeof native.fetch === 'function') {
				try {
					const body = await bodyToString(details.data);
					const envelope = JSON.parse(
						native.fetch(
							method,
							url,
							JSON.stringify(details.headers ?? {}),
							body,
							!!details.anonymous,
							timeout,
							details.responseType ?? 'text',
						),
					);

					if (envelope.timedout) {
						dispatchCallbacks(details, [{ readyState: 0 }, { readyState: 4 }], 'timeout', {
							status: 0,
							statusText: 'timeout',
							finalUrl: url,
						});
						return;
					}
					if (envelope.error || envelope.status === 0) {
						dispatchCallbacks(details, [{ readyState: 0 }, { readyState: 4 }], 'error', {
							status: 0,
							statusText: envelope.error?.statusText ?? 'error',
							error: envelope.error,
							finalUrl: url,
						});
						return;
					}

					dispatchCallbacks(
						details,
						[
							{ readyState: 1, extra: { status: 0 } },
							{ readyState: 2, extra: { status: envelope.status } },
							{ readyState: 3, extra: { status: envelope.status } },
						],
						'load',
						{
							status: envelope.status,
							statusText: envelope.statusText,
							responseText: envelope.responseText,
							response: envelope.responseText,
							responseHeaders: envelope.responseHeaders,
							finalUrl: envelope.finalUrl ?? url,
							readyState: 4,
							loaded: envelope.total ?? envelope.responseText?.length ?? 0,
							total: envelope.total ?? envelope.responseText?.length ?? 0,
							lengthComputable: true,
						},
					);
				} catch (err) {
					dispatchCallbacks(details, [{ readyState: 0 }, { readyState: 4 }], 'error', {
						status: 0,
						statusText: 'error',
						error: String(err),
						finalUrl: url,
					});
				}
				return;
			}

			// Fallback: plain fetch (still subject to CORS in the WebView).
			try {
				const controller = new AbortController();
				const timer = timeout ? setTimeout(() => controller.abort(), timeout) : null;
				const response = await fetch(url, {
					method,
					headers: details.headers ?? {},
					body: (await bodyToString(details.data)) ?? undefined,
					signal: controller.signal,
					credentials: details.anonymous ? 'omit' : 'include',
				});
				if (timer) clearTimeout(timer);
				const text = await response.text();
				dispatchCallbacks(details, [{ readyState: 1 }, { readyState: 2 }, { readyState: 3 }], 'load', {
					status: response.status,
					statusText: response.statusText,
					responseText: text,
					response: text,
					responseHeaders: response.headers.toString(),
					finalUrl: url,
					readyState: 4,
					loaded: text.length,
					total: text.length,
					lengthComputable: true,
				});
			} catch (err) {
				const timedOut = err instanceof DOMException && err.name === 'AbortError';
				dispatchCallbacks(
					details,
					[{ readyState: 0 }, { readyState: 4 }],
					timedOut ? 'timeout' : 'error',
					timedOut ?
						{ status: 0, statusText: 'timeout', finalUrl: url }
					:	{ status: 0, statusText: 'error', error: String(err), finalUrl: url },
				);
			}
		},
		info: {
			scriptMetaStr: [
				'// ==UserScript==',
				'// @name        Charity Framework Bplace',
				'// @namespace   bplace-charity.shuni.moe',
				'// @description A plugin loader for bplace.art (originally wplace.live).',
				'// @version     ' + process.env.VERSION,
				'// @author      ' + process.env.AUTHOR,
				'// @license     ' + process.env.LICENSE,
				'// ==/UserScript==',
			].join('\n'),
		},
	};

	Object.defineProperty(w, 'GM', {
		configurable: false,
		enumerable: true,
		writable: false,
		value: GM,
	});
}

// window.charity bootstrap — same shape the userscript metadata produces.
if (!w.charity) {
	Object.defineProperty(w, 'charity', {
		configurable: false,
		enumerable: true,
		writable: false,
		value: {},
	});
}
if (!w.charity.internal) {
	Object.defineProperty(w.charity, 'internal', {
		configurable: false,
		enumerable: false,
		writable: false,
		value: {},
	});
}
if (!w.charity.internal.info) {
	Object.defineProperty(w.charity.internal, 'info', {
		configurable: false,
		enumerable: true,
		writable: false,
		value: {
			name: 'Charity Framework Bplace',
			description: 'A plugin loader for bplace.art (originally wplace.live).',
			version: process.env.VERSION,
			author: process.env.AUTHOR,
			license: process.env.LICENSE,
			homepage: null,
			supportURL: null,
			downloadURL: 'https://bplace-framework-scripts.shuni.moe/framework/CharityFramework.user.js',
			updateURL: 'https://bplace-framework-scripts.shuni.moe/framework/CharityFramework.user.js',
			contributionURL: null,
		},
	});
}

export {};