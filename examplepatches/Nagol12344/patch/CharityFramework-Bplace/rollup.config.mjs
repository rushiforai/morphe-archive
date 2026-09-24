import { isAbsolute, relative, resolve } from 'path';
import { defineConfig } from 'rollup';

import babelPlugin from '@rollup/plugin-babel';
import commonjsPlugin from '@rollup/plugin-commonjs';
import jsonPlugin from '@rollup/plugin-json';
import resolvePlugin from '@rollup/plugin-node-resolve';
import replacePlugin from '@rollup/plugin-replace';
import userscript from 'rollup-plugin-userscript';
import postcssPlugin from 'rollup-plugin-postcss';
import terserPlugin from '@rollup/plugin-terser';

import { readPackageUp } from 'read-package-up';
import { execSync } from "child_process"

const { packageJson } = await readPackageUp();

const extensions = ['.ts', '.tsx', '.mjs', '.js', '.jsx'];

// The mobile WebView build is produced on request (BUILD_MOBILE=1) so the
// default `rollup -c` output stays byte-for-byte identical to upstream.
const configs = [
	{
		input: 'packages/core/src/index.ts',
		plugins: [
			postcssPlugin({
				inject: false,
				minimize: true,
				modules: {
					generateScopedName: 'charity-[hash:base64:6]',
				},
			}),
			babelPlugin({
				babelHelpers: 'runtime',
				plugins: [
					[
						import.meta.resolve('@babel/plugin-transform-runtime'),
						{
							useESModules: true,
							version: '^7.5.0'
						}
					]
				],
				exclude: 'node_modules/**',
				extensions
			}),
			replacePlugin({
				values: {
					'process.env.NODE_ENV': JSON.stringify(process.env.NODE_ENV),
				},
				preventAssignment: true,
			}),
			resolvePlugin({ browser: false, extensions }),
			commonjsPlugin(),
			jsonPlugin(),
			pageExecution(),
			terserPlugin(),
			userscript((meta) => meta
				.replace('process.env.AUTHOR', author())
				.replace('process.env.VERSION', packageJson.version)
				.replace('process.env.LICENSE', packageJson.license)
			),
			frameworkManifest()
		],
		external: defineExternal(['https://esm.sh/es-module-shims']),
		output: {
			format: 'iife',
			file: 'dist/CharityFramework.user.js',
			indent: false,
			strict: false,
		},
		onwarn(warning, warn) {
			if (warning.code === 'EVAL') return;
			warn(warning);
		},
	},
];

// Mobile WebView build: same framework, but with a GM shim and no
// isolated-world wrapper. Output is meant to be evaluateJavascript'd
// into the bplace app's WebView at document-start. Only emitted when
// BUILD_MOBILE=1 so the default `rollup -c` output stays byte-for-byte
// identical to upstream.
const mobileConfig = {
		input: 'packages/core/src/mobile/index.ts',
		plugins: [
			postcssPlugin({
				inject: false,
				minimize: true,
				modules: {
					generateScopedName: 'charity-[hash:base64:6]',
				},
			}),
			babelPlugin({
				babelHelpers: 'runtime',
				plugins: [
					[
						import.meta.resolve('@babel/plugin-transform-runtime'),
						{
							useESModules: true,
							version: '^7.5.0'
						}
					]
				],
				exclude: 'node_modules/**',
				extensions
			}),
			replacePlugin({
				values: {
					'process.env.NODE_ENV': JSON.stringify(process.env.NODE_ENV),
					'process.env.VERSION': JSON.stringify(packageJson.version),
					'process.env.AUTHOR': JSON.stringify(author()),
					'process.env.LICENSE': JSON.stringify(packageJson.license),
				},
				preventAssignment: true,
			}),
			resolvePlugin({ browser: false, extensions }),
			commonjsPlugin(),
			jsonPlugin(),
			mobilePageExecution(),
			terserPlugin(),
			userscript((meta) => meta
				.replace('process.env.AUTHOR', author())
				.replace('process.env.VERSION', packageJson.version)
				.replace('process.env.LICENSE', packageJson.license)
			)
		],
		external: defineExternal(['https://esm.sh/es-module-shims']),
		output: {
			format: 'iife',
			file: 'dist/CharityFramework.mobile.js',
			indent: false,
			strict: false,
		},
		onwarn(warning, warn) {
			if (warning.code === 'EVAL') return;
			warn(warning);
		},
};

export default defineConfig(
	process.env.BUILD_MOBILE === '1' ? [...configs, mobileConfig] : configs
);

// package.json "author" is a plain string for this project.
function author() {
	const a = packageJson.author;
	if (typeof a === 'string') return a;
	return a?.name ?? '';
}

function defineExternal(externals) {
	return (id) =>
		externals.some((pattern) => {
		if (typeof pattern === 'function') return pattern(id);
		if (pattern && typeof pattern.test === 'function')
			return pattern.test(id);
		if (isAbsolute(pattern))
			return !relative(pattern, resolve(id)).startsWith('..');
		return id === pattern || id.startsWith(pattern + '/');
	});
}

function pageExecution() {
	return {
		name: 'pageExecution',
		renderChunk(code) {
			// if (typeof globalThis.cloneInto !== "function") globalThis.cloneInto = (value) => structuredClone(value);
			// Object.defineProperty(unsafeWindow, 'charity', { configurable: false, enumerable: true, writable: false, value: cloneInto({}, unsafeWindow) });
			// Object.defineProperty(unsafeWindow.charity, 'internal', { configurable: false, enumerable: false, writable: false, value: cloneInto({}, unsafeWindow) });
			// Object.defineProperty(unsafeWindow.charity.internal, 'info', { configurable: false, enumerable: true, writable: false, value: cloneInto({
			// 	name: GM.info.scriptMetaStr.match(/^\/\/[ \t\f\v]+@name[ \t\f\v]+(.+)$/m)?.[1].trim() ?? null,
			// 	description: GM.info.scriptMetaStr.match(/^\/\/[ \t\f\v]+@description[ \t\f\v]+(.+)$/m)?.[1].trim() ?? null,
			// 	version: GM.info.scriptMetaStr.match(/^\/\/[ \t\f\v]+@version[ \t\f\v]+(.+)$/m)?.[1].trim() ?? null,
			// 	author: GM.info.scriptMetaStr.match(/^\/\/[ \t\f\v]+@author[ \t\f\v]+(.+)$/m)?.[1].trim() ?? null,
			// 	license: GM.info.scriptMetaStr.match(/^\/\/[ \t\f\v]+@license[ \t\f\v]+(.+)$/m)?.[1].trim() ?? null,
			// 	homepage: GM.info.scriptMetaStr.match(/^\/\/[ \t\f\v]+@(?:homepage|homepageURL|website|source)[ \t\f\v]+(.+)$/m)?.[1].trim() ?? null,
			// 	supportURL: GM.info.scriptMetaStr.match(/^\/\/[ \t\f\v]+@(?:support|supportURL)[ \t\f\v]+(.+)$/m)?.[1].trim() ?? null,
			// 	downloadURL: GM.info.scriptMetaStr.match(/^\/\/[ \t\f\v]+@(?:downloadURL|installURL)[ \t\f\v]+(.+)$/m)?.[1].trim() ?? null,
			// 	updateURL: GM.info.scriptMetaStr.match(/^\/\/[ \t\f\v]+@updateURL[ \t\f\v]+(.+)$/m)?.[1].trim() ?? null,
			// 	contributionURL: GM.info.scriptMetaStr.match(/^\/\/[ \t\f\v]+@contributionURL[ \t\f\v]+(.+)$/m)?.[1].trim() ?? null,
			// }, unsafeWindow) });
			const info = `"function"!=typeof globalThis.cloneInto&&(globalThis.cloneInto=v=>structuredClone(v)),Object.defineProperty(unsafeWindow,"charity",{configurable:!1,enumerable:!0,writable:!1,value:cloneInto({},unsafeWindow)}),Object.defineProperty(unsafeWindow.charity,"internal",{configurable:!1,enumerable:!1,writable:!1,value:cloneInto({},unsafeWindow)}),Object.defineProperty(unsafeWindow.charity.internal,"info",{configurable:!1,enumerable:!0,writable:!1,value:cloneInto({name:GM.info.scriptMetaStr.match(/^\\/\\/[ \\t\\f\\v]+@name[ \\t\\f\\v]+(.+)$/m)?.[1].trim()??null,description:GM.info.scriptMetaStr.match(/^\\/\\/[ \\t\\f\\v]+@description[ \\t\\f\\v]+(.+)$/m)?.[1].trim()??null,version:GM.info.scriptMetaStr.match(/^\\/\\/[ \\t\\f\\v]+@version[ \\t\\f\\v]+(.+)$/m)?.[1].trim()??null,author:GM.info.scriptMetaStr.match(/^\\/\\/[ \\t\\f\\v]+@author[ \\t\\f\\v]+(.+)$/m)?.[1].trim()??null,license:GM.info.scriptMetaStr.match(/^\\/\\/[ \\t\\f\\v]+@license[ \\t\\f\\v]+(.+)$/m)?.[1].trim()??null,homepage:GM.info.scriptMetaStr.match(/^\\/\\/[ \\t\\f\\v]+@(?:homepage|homepageURL|website|source)[ \\t\\f\\v]+(.+)$/m)?.[1].trim()??null,supportURL:GM.info.scriptMetaStr.match(/^\\/\\/[ \\t\\f\\v]+@(?:support|supportURL)[ \\t\\f\\v]+(.+)$/m)?.[1].trim()??null,downloadURL:GM.info.scriptMetaStr.match(/^\\/\\/[ \\t\\f\\v]+@(?:downloadURL|installURL)[ \\t\\f\\v]+(.+)$/m)?.[1].trim()??null,updateURL:GM.info.scriptMetaStr.match(/^\\/\\/[ \\t\\f\\v]+@updateURL[ \\t\\f\\v]+(.+)$/m)?.[1].trim()??null,contributionURL:GM.info.scriptMetaStr.match(/^\\/\\/[ \\t\\f\\v]+@contributionURL[ \\t\\f\\v]+(.+)$/m)?.[1].trim()??null},unsafeWindow)});`
			// window.addEventListener('message', async (event) => {
			//     if (!event.data?.func?.startsWith("GM.")) return;
			//     try {
			//         const func = event.data.func.slice(3);
			//         if (typeof GM[func] !== "function") throw new Error("No such GM function: " + func);
			// 		if (func === 'xmlHttpRequest') {
			// 			const filter = (response) => Object.fromEntries(["context", "finalUrl", "lengthComputable", "loaded", "readyState", "response", "responseHeaders", "responseText", "status", "statusText", "total"].map(key => [key, response[key]]));
			// 			GM[func]({
			// 				...event.data.args[0],
			// 				onload: (response) => window.postMessage({ id: event.data.id, load: filter(response) }, event.origin),
			// 				onerror: (response) => window.postMessage({ id: event.data.id, error: filter(response) }, event.origin),
			// 				ontimeout: (response) => window.postMessage({ id: event.data.id, timeout: filter(response) }, event.origin),
			// 				onabort: (response) => window.postMessage({ id: event.data.id, abort: filter(response) }, event.origin),
			// 				onprogress: (response) => window.postMessage({ id: event.data.id, progress: filter(response) }, event.origin),
			// 				onreadystatechange: (response) => window.postMessage({ id: event.data.id, readystatechange: filter(response) }, event.origin),
			// 			});
			// 			return;
			// 		}
			//         window.postMessage({ id: event.data.id, result: await GM[func](...(event.data.args || [])) }, event.origin);
			//     } catch (err) {
			//         window.postMessage({ id: event.data.id, error: String(err) }, event.origin);
			//     }
			// });
			const apis = `window.addEventListener("message",async e=>{if(e.data?.func?.startsWith("GM."))try{let f=e.data.func.slice(3);if("function"!=typeof GM[f])throw Error("No such GM function: "+f);if("xmlHttpRequest"===f){let m=r=>Object.fromEntries(["context","finalUrl","lengthComputable","loaded","readyState","response","responseHeaders","responseText","status","statusText","total"].map(k=>[k,r[k]]));GM[f]({...e.data.args[0],onload:r=>window.postMessage({id:e.data.id,load:m(r)},e.origin),onerror:r=>window.postMessage({id:e.data.id,error:m(r)},e.origin),ontimeout:r=>window.postMessage({id:e.data.id,timeout:m(r)},e.origin),onabort:r=>window.postMessage({id:e.data.id,abort:m(r)},e.origin),onprogress:r=>window.postMessage({id:e.data.id,progress:m(r)},e.origin),onreadystatechange:r=>window.postMessage({id:e.data.id,readystatechange:m(r)},e.origin)});return}window.postMessage({id:e.data.id,result:await GM[f](...e.data.args||[])},e.origin)}catch(x){window.postMessage({id:e.data.id,error:String(x)},e.origin)}});`;
			// const script = document.createElement("script");
			// script.textContent=`(\${(()=>{<INSERT CODE HERE>}).toString()})();`;
			// document.documentElement.appendChild(script);
			const script = `const s=document.createElement('script');s.textContent=\`(\${(()=>{${code}}).toString()})();\`;document.documentElement.appendChild(s);`;
			return `${info}${apis}${script}`;
		},
	};
};


function mobilePageExecution() {
	return {
		name: 'mobilePageExecution',
		renderChunk(code) {
			// The WebView variant runs directly in the page (no isolated
			// world), so no userscript wrapper is needed. We still defer the
			// framework until <html> exists: the app's onPageStarted fires
			// before any markup is parsed, and the framework immediately
			// touches document.documentElement (hides the page / re-renders).
			return `(function(){function start(){\n${code}\n}if(document.documentElement){start();}else{var t=setInterval(function(){if(document.documentElement){clearInterval(t);start();}},5);}})();`;
		},
	};
};

function frameworkManifest() {
	return {
		name: "frameworkManifest",
		buildStart() {
			const manifest = {
				version: packageJson.version,
				commit: execSync("git rev-parse HEAD").toString().trim()
			}

			this.emitFile({
				type: "asset",
				fileName: "manifest.json",
				source: JSON.stringify(manifest, null ,2)
			})
		}
	}
}