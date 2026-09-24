/// <reference types="@violentmonkey/types" />
import { PluginUtils } from 'types/src';

// When the framework runs inside the bplace app's WebView (no userscript
// manager), the app injects a page-level GM implementation (see
// packages/core/src/mobile/shim.ts). Calling it directly mirrors what the
// userscript's postMessage bridge does, so the exact same GmAPI surface is
// used in both environments.
// eslint-disable-next-line @typescript-eslint/no-explicit-any
function getInPageGM(): any {
	// eslint-disable-next-line @typescript-eslint/no-explicit-any
	const gm = (globalThis as any).GM;
	if (gm && typeof gm === 'object') return gm;
	return null;
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function handleGM<T>(func: string, ...args: any[]): Promise<T> {
	const gm = getInPageGM();
	const gmFunc = gm?.[func.slice(3)];
	if (typeof gmFunc === 'function') {
		try {
			return Promise.resolve(gmFunc.apply(gm, args));
		} catch (err) {
			return Promise.reject(err);
		}
	}
	return new Promise((resolve, reject) => {
		try {
			const id = `charity-${Math.random().toString(36).slice(2, 8)}`;
			const callback = (event: MessageEvent) => {
				if (event.data?.func !== undefined) return;
				if (event.data?.id !== id) return;
				resolve(event.data?.result);
				window.removeEventListener('message', callback);
			};
			window.addEventListener('message', callback);
			window.postMessage({ id, func: func, args }, window.origin);
		} catch (err) {
			reject(err);
		}
	});
}

export const getValue: typeof GM.getValue = (name, defaultValue) => {
	return handleGM('GM.getValue', name, defaultValue);
};

export const setValue: typeof GM.setValue = (name, value) => {
	return handleGM('GM.setValue', name, value);
};

export const deleteValue: typeof GM.deleteValue = (name) => {
	return handleGM('GM.deleteValue', name);
};

export const listValues: typeof GM.listValues = () => {
	return handleGM('GM.listValues');
};

export const getResourceUrl: typeof GM.getResourceUrl = (name, isBlobUrl) => {
	return handleGM('GM.getResourceUrl', name, isBlobUrl);
};

export const xmlHttpRequest = async <T = string | object | Document | ArrayBuffer | Blob>(
	details: VMScriptGMXHRDetails<T>,
) => {
	const onload = details.onload ?? (() => {});
	const onerror = details.onerror ?? (() => {});
	const ontimeout = details.ontimeout ?? (() => {});
	const onabort = details.onabort ?? (() => {});
	const onreadystatechange = details.onreadystatechange ?? (() => {});
	const onprogress = details.onprogress ?? (() => {});

	// In-page GM (mobile WebView shim) — call it directly. The shim adds
	// `context` to every callback payload itself.
	const gm = getInPageGM();
	if (gm && typeof gm.xmlHttpRequest === 'function') {
		return gm.xmlHttpRequest(details);
	}

	const id = `charity-${Math.random().toString(36).slice(2, 8)}`;
	const callback = (event: MessageEvent) => {
		if (event.data?.func !== undefined) return;
		if (event.data?.id !== id) return;
		if (event.data?.load !== undefined) onload({ ...event.data?.load, context: details.context });
		if (event.data?.error !== undefined) onerror({ ...event.data?.error, context: details.context });
		if (event.data?.timeout !== undefined) ontimeout({ ...event.data?.timeout, context: details.context });
		if (event.data?.abort !== undefined) onabort({ ...event.data?.abort, context: details.context });
		if (event.data?.readystatechange !== undefined)
			onreadystatechange({ ...event.data?.readystatechange, context: details.context });
		if (event.data?.progress !== undefined) onprogress({ ...event.data?.progress, context: details.context });

		if (
			event.data?.load !== undefined ||
			event.data?.error !== undefined ||
			event.data?.abort !== undefined ||
			event.data?.timeout !== undefined
		) {
			window.removeEventListener('message', callback);
		}
	};
	window.addEventListener('message', callback);
	window.postMessage(
		{
			id,
			func: 'GM.xmlHttpRequest',
			args: [
				Object.fromEntries(
					[
						'anonymous',
						'binary',
						'data',
						'headers',
						'method',
						'overrideMimeType',
						'password',
						'responseType',
						'timeout',
						'url',
						'user',
					].map((key) => [key, details[key]]),
				),
			],
		},
		window.origin,
	);
};

export const fetchWithoutCors: typeof fetch = (input, init) => {
	return new Promise((resolve, reject) => {
		const request = new Request(input, init);

		const onAbort = () => reject(new DOMException('Aborted', 'AbortError'));
		if (request.signal) {
			if (request.signal.aborted) return reject(new DOMException('Aborted', 'AbortError'));
			request.signal.addEventListener('abort', onAbort, { once: true });
		}

		const headers: Record<string, string> = {};
		if (init && typeof init.headers === 'object' && !(init.headers instanceof Headers)) {
			const names: string[] = [];
			Object.getOwnPropertyNames(init.headers).forEach((name) => {
				if (typeof name !== 'string') name = String(name);
				if (/[^a-z0-9\-#$%&'*+.^_`|~!]/i.test(name) || name === '') {
					throw new TypeError(`Invalid character in header field name: "${name}"`);
				}
				names.push(name.toLowerCase());
				headers[name] = typeof init.headers[name] !== 'string' ? String(init.headers[name]) : init.headers[name];
			});
			request.headers.forEach((value, name) => {
				if (!names.includes(name)) {
					headers[name] = value;
				}
			});
		} else {
			request.headers.forEach((value, name) => {
				headers[name] = value;
			});
		}

		xmlHttpRequest({
			method: request.method,
			url: request.url === '' && location.href ? location.href : request.url,
			headers,
			data: request.body,
			responseType: 'text',
			anonymous: request.credentials === 'omit',
			timeout: 10000,
			onload: (response) => {
				resolve(
					new Response(
						(
							typeof response.response === 'string' ||
							response.response instanceof Blob ||
							response.response instanceof ArrayBuffer
						) ?
							response.response
						:	response.responseText,
						{
							headers: (() => {
								const headers = new Headers();
								const preProcessedHeaders = response.responseHeaders.replace(/\r?\n[\t ]+/g, ' ');
								preProcessedHeaders
									.split('\r')
									.map((header) => (header.indexOf('\n') === 0 ? header.substring(1, header.length) : header))
									.forEach((line) => {
										const parts = line.split(':');
										const key = parts.shift().trim();
										if (key) {
											const value = parts.join(':').trim();
											try {
												headers.append(key, value);
											} catch (error) {
												console.warn('Response ' + error.message);
											}
										}
									});
								return headers;
							})(),
							status:
								request.url.indexOf('file://') === 0 && (response.status < 200 || response.status > 599) ?
									200
								:	response.status,
							statusText: response.statusText,
						},
					),
				);
			},
			onerror: () => {
				reject(new TypeError('Network request failed'));
			},
			ontimeout: () => {
				reject(new TypeError('Network request timed out'));
			},
			onabort: () => {
				reject(new DOMException('Aborted', 'AbortError'));
			},
			onreadystatechange: (response) => {
				if (response.readyState === 4) request.signal.removeEventListener('abort', onAbort);
			},
		});
	});
};

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function structuredClonable(value: any): boolean {
	try {
		structuredClone(value);
		return true;
	} catch {
		return false;
	}
}

export function getUtils(pluginId: string) {
	return {
		async getValue(name, defaultValue) {
			if (!structuredClonable(defaultValue)) throw new Error('defaultValue of getValue must be structured clonable.');
			return getValue(`${pluginId}_${name}`, defaultValue);
		},
		async setValue(name, value) {
			if (!structuredClonable(value)) throw new Error('value of setValue must be structured clonable.');
			return setValue(`${pluginId}_${name}`, value);
		},
		async deleteValue(name) {
			return deleteValue(`${pluginId}_${name}`);
		},
		async listValues() {
			return listValues();
		},
		fetchWithoutCors,
	} as PluginUtils;
}
