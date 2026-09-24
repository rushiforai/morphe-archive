import { expose } from '.';
import { Patch } from '@shuni64/charity-framework-bplace-types';
import { defineGlobalPath } from '../../utils/global';

export const exposeGame = (): Patch[] => {
	defineGlobalPath(window.charity, 'game');
	return [
		{
			name: 'exposeInstanceMap',
			find: 'Map creation failed',
			replace: {
				match: /new [a-zA-Z_$][\w$]*\.Map\(.*?}\)/,
				replace: (orig) => `(() => { const ret = ${orig}; ${expose('game', 'map', 'ret')} return ret; })()`,
			},
		},
	];
};
