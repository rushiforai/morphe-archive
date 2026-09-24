import { expose } from '.';
import { Patch } from '@shuni64/charity-framework-bplace-types';

export const exposeData = (): Patch[] => {
	return [
		{
			name: 'exposeAudio',
			find: '.plop.play()',
			replace: {
				match: /([a-zA-Z_$][\w$]*)\.plop\.play\(\)[\s\S]*$/,
				replace: (orig, audioVar) => `${orig}${expose('data', 'audio', audioVar)}`,
			},
		},
		{
			name: 'exposeData',
			find: '.seasons.length',
			replace: {
				match: /([a-zA-Z_$][\w$]*)={[^{]*?seasons:[^}]*?}[\s\S]*$/,
				replace: (orig, dataVar) =>
					`${orig}${expose('', 'data', `${dataVar}`)}${expose('data', 'currentSeason', `${dataVar}.seasons.length-1`)}${expose('data', 'zoom', `${dataVar}.seasons[window.charity.data.currentSeason].zoom`)}${expose('data', 'tileSize', `${dataVar}.seasons[window.charity.data.currentSeason].tileSize`)}`,
			},
		},
		{
			name: 'exposePalette',
			find: 'show-all-colors',
			replace: {
				match: /(\[[\d,]*32[\d,]*\])\.map\([a-zA-Z_$][\w$]*=>\({\.\.\.[a-zA-Z_$][\w$]*\.colors[\s\S]*$/,
				replace: (orig, paletteVar) =>
					`${orig}${expose('data', 'palette', `${paletteVar}.map((idx)=>({...window.charity.data.colors[idx],idx}))`)}`,
			},
		},
		{
			name: 'exposeReducedPalette',
			find: 'show-all-colors',
			replace: {
				match: /(\[(?!32)\d*(?:,(?!32)\d+)*\])\.map\([a-zA-Z_$][\w$]*=>\({\.\.\.[a-zA-Z_$][\w$]*\.colors[\s\S]*$/,
				replace: (orig, reducedPaletteVar) =>
					`${orig}${expose('data', 'reducedPalette', `${reducedPaletteVar}.map((idx)=>({...window.charity.data.colors[idx],idx}))`)}`,
			},
		},
	];
};
