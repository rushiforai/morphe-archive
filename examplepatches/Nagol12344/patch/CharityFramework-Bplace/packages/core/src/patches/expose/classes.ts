import { expose } from '.';
import { Patch } from '@shuni64/charity-framework-bplace-types';
import { defineGlobalPath } from '../../utils/global';

export const exposeClasses = (): Patch[] => {
	defineGlobalPath(window.charity, 'classes');
	return [
		{
			name: 'exposeClassMercator',
			find: 'initialResolution',
			replace: {
				match: /class ([a-zA-Z_$][\w$]*)[^}]*initialResolution[\s\S]*$/,
				replace: (orig, mercatorClass) => `${orig}${expose('classes', 'Mercator', mercatorClass)}`,
			},
		},
		{
			name: 'exposeClassAPI',
			find: '/auth/logout',
			replace: {
				match: /class ([a-zA-Z_$][\w$]*)(?:(?!class).)*?`\/s.*?\/pixel\/.*?\/.*?`[\s\S]*$/,
				replace: (orig, apiClass) => `${orig}${expose('classes', 'API', apiClass)}`,
			},
		},
		{
			name: 'exposeClassUser',
			find: 'user-channel',
			replace: {
				match: /class ([a-zA-Z_$][\w$]*)[^}]*user-channel[\s\S]*$/,
				replace: (orig, userClass) => `${orig}${expose('classes', 'User', userClass)}`,
			},
		},
	];
};
