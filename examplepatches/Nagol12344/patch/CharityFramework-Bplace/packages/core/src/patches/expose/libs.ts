import { expose } from '.';
import { Patch } from '@shuni64/charity-framework-bplace-types';
import { defineGlobalPath } from '../../utils/global';

export const exposeLibraries = (): Patch[] => {
	defineGlobalPath(window.charity, 'lib');

	defineGlobalPath(window.charity.lib, 'sonner');

	return [
		// maplibre
		{
			name: 'exposeMapLibre',
			find: 'Map creation failed',
			replace: {
				match: /new ([a-zA-Z_$][\w$]*)\.Map\(.*?}\)/,
				replace: (orig, mapLibreVar) => `(() => { ${expose('lib', 'maplibre', mapLibreVar)} return ${orig}; })()`,
			},
		},
		// react
		{
			name: 'exposeReact',
			find: '.useEffect=',
			replace: {
				match: /([a-zA-Z_$][\w$]*).useEffect=/,
				replace: (orig, reactVar) => `${expose('lib', 'react', reactVar)}${orig}`,
			},
		},
		// react-dom
		{
			name: 'exposeReactDom',
			find: 'hydrateRoot;',
			replace: {
				match: /([a-zA-Z_$][\w$]*)\.hydrateRoot;/,
				replace: (orig, reactDomVar) => `${orig}${expose('lib', 'reactDom', reactDomVar)}`,
			},
		},
		// react-jsx-runtime
		{
			name: 'exposeReactJsxRuntime',
			find: 'react-jsx-runtime.production.min.js',
			replace: {
				match: /([a-zA-Z_$][\w$]*)\.jsx=([a-zA-Z_$][\w$]*);([a-zA-Z_$][\w$]*)\.jsxs=([a-zA-Z_$][\w$]*);/,
				replace: (orig, reactJsxRuntimeVar) => `${orig}${expose('lib', 'reactJsxRuntime', reactJsxRuntimeVar)}`,
			},
		},
		// sonner
		{
			name: 'exposeSonner',
			find: 'data-sonner-toaster',
			replace: {
				match: /var ([a-zA-Z_$][\w$]*)=([a-zA-Z_$][\w$]*)=>{[^}]*closeButtonAriaLabel[^}]*}=.*/s,
				replace: (orig, sonnerVar) => `${orig}\n${expose('lib.sonner', 'toast', sonnerVar)}`,
			},
		},
	];
};
