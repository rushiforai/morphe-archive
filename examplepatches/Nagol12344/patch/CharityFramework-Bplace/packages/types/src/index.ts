import maplibregl from 'maplibre-gl';
import react from 'react';
import reactDom from 'react-dom';
import reactJsxRuntime from 'react/jsx-runtime';
import { toast } from 'sonner';
import { Plugin } from './plugin';
import { FrameworkManifest } from './framework';

export * from './framework';
export * from './game';
export * from './patch';
export * from './plugin';

export type Charity = {
	game: {
		map: maplibregl.Map;
	};
	lib: {
		maplibre: typeof maplibregl;
		react: typeof react;
		reactDom: typeof reactDom;
		reactJsxRuntime: typeof reactJsxRuntime;
		sonner: { toast: typeof toast };
	};
	internal: {
		info: {
			name: string | null;
			description: string | null;
			version: string | null;
			author: string | null;
			license: string | null;
			homepage: string | null;
			supportURL: string | null;
			downloadURL: string | null;
			updateURL: string | null;
			contributionURL: string | null;
		};
		latestManifest?: FrameworkManifest;
		currentUrlOverride: string;
		plugins: Plugin[];
	};
};

declare global {
	interface Window {
		charity: Charity;
	}

	const charity: Charity;
}
