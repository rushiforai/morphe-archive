import addPluginType from './types/add-plugin';
import turnstileType from './types/turnstile';
import debugType from './types/debug';

import { stylesheet, default as styles } from './styles/deeplink.module.css';
import { IS_PROD } from '../utils/constants';
const DEEPLINK_PATH = '/charity';
const DEEPLINK_APP_SHELL = `<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ DEEPLINK_TYPE_TITLE }} - Charity</title>
</head>
<body>
    <charity-root id="deeplinkRoot" class="${styles.root}"></charity-root>
</body>
`;

const DEEPLINK_TYPES: DeepLinkType[] = [addPluginType, !IS_PROD && turnstileType, debugType];

export interface DeepLinkType {
	id: string;
	title: string;
	condition: (url: URL) => boolean;
	render: (root: HTMLElement) => unknown;
}

export async function executeDeepLink(): Promise<boolean> {
	if (!window.location.pathname.startsWith(DEEPLINK_PATH)) return false;

	const url = new URL(window.location.href);
	for (const type of DEEPLINK_TYPES) {
		if (!type.condition(url)) continue;

		console.log('[Charity]', 'stopping execution and rendering deeplink type', type.id);
		const shell = DEEPLINK_APP_SHELL.replaceAll('{{ DEEPLINK_TYPE_TITLE }}', type.title);
		document.querySelector('html').innerHTML = shell;

		const styleElement = document.createElement('style');
		styleElement.setAttribute('type', 'text/css');
		styleElement.textContent = stylesheet;
		document.head.appendChild(styleElement);
		const ret = await type.render(document.getElementById('deeplinkRoot'));
		if (ret === false) return ret;

		document.documentElement.style.display = '';
		return true;
	}

	return false;
}
