import { createIcon } from './icon';
import { createPanel } from './panel';

import { stylesheet as globalCss } from './styles/global.module.css';
import { stylesheet as panelCss } from './styles/panel.module.css';

export function init() {
	document.addEventListener('charity-right-sidebar', (sidebar: CustomEvent) => createIcon(sidebar.detail));

	const host = document.createElement(`charity-${Math.random().toString(36).slice(2, 8)}`);
	const shadowRoot = host.attachShadow({ mode: 'open' });

	const globalStyles = document.createElement('style');
	globalStyles.setAttribute('type', 'text/css');
	globalStyles.textContent = globalCss;
	document.head.appendChild(globalStyles);

	const panelStyles = document.createElement('style');
	panelStyles.setAttribute('type', 'text/css');
	panelStyles.textContent = panelCss;
	shadowRoot.append(panelStyles);

	createPanel(shadowRoot);
	document.body.appendChild(host);
}
