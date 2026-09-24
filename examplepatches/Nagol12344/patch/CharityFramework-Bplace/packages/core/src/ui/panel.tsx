import { render } from 'solid-js/web';
import { createSignal, Show } from 'solid-js';

import styles from './styles/panel.module.css';
import { Plugins } from './tabs/plugins';
import { About } from './tabs/about';

let wrapper: HTMLDivElement;
let body: HTMLDivElement;

function Panel() {
	const [getTab, setTab] = createSignal<'about' | 'plugins'>('about');
	return (
		<div ref={wrapper} class={styles.wrapper} onMouseDown={drag}>
			<div ref={body} class={styles.body}>
				<nav class={styles.nav}>
					<a
						style={getTab() === 'about' ? 'text-decoration: underline' : ''}
						onClick={() => setTab('about')}
						onMouseDown={(e) => e.stopPropagation()}
					>
						About
					</a>
					<a
						style={getTab() === 'plugins' ? 'text-decoration: underline' : ''}
						onClick={() => setTab('plugins')}
						onMouseDown={(e) => e.stopPropagation()}
					>
						Plugins
					</a>
					<button class={styles.close} onClick={closePanel} onMouseDown={(e) => e.stopPropagation()}>
						<svg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24'>
							<path
								d='M5 5h2v2H5V5zm4 4H7V7h2v2zm2 2H9V9h2v2zm2 0h-2v2H9v2H7v2H5v2h2v-2h2v-2h2v-2h2v2h2v2h2v2h2v-2h-2v-2h-2v-2h-2v-2zm2-2v2h-2V9h2zm2-2v2h-2V7h2zm0 0V5h2v2h-2z'
								fill='currentColor'
							/>
						</svg>
					</button>
				</nav>
				<Show when={getTab() === 'about'}>
					<About />
				</Show>
				<Show when={getTab() === 'plugins'}>
					<Plugins />
				</Show>
			</div>
		</div>
	);
}

export function createPanel(parent: Node) {
	render(Panel, parent);
}

export function showPanel() {
	wrapper.style.display = '';
	const { width, height } = wrapper.getBoundingClientRect();
	const x = window.innerWidth / 2 - width / 2;
	const y = window.innerHeight / 2 - height / 2;
	wrapper.style.inset = `${y}px auto auto ${x}px`;
}

function closePanel() {
	wrapper.style.inset = '';
	wrapper.style.display = 'none';
}

let dragging: { x: number; y: number } = null;
function drag(event: MouseEvent) {
	const onMouseMove = (event: MouseEvent) => {
		if (dragging === null) return;
		const width = document.documentElement.clientWidth - wrapper.offsetWidth;
		const height = document.documentElement.clientHeight - wrapper.offsetHeight;
		const left = Math.min(width, Math.max(0, event.clientX - dragging.x));
		const top = Math.min(height, Math.max(0, event.clientY - dragging.y));
		const position = { top: top + 'px', left: left + 'px', right: 'auto', bottom: 'auto' };
		Object.assign(wrapper.style, position);
	};

	const onMouseUp = () => {
		dragging = null;
		document.removeEventListener('mousemove', onMouseMove);
		document.removeEventListener('mouseup', onMouseUp);
		wrapper.classList.remove(styles.grabbing);
	};

	event.preventDefault();
	event.stopPropagation();
	const { x, y } = wrapper.getBoundingClientRect();
	dragging = { x: event.clientX - x, y: event.clientY - y };
	wrapper.classList.add(styles.grabbing);
	document.addEventListener('mousemove', onMouseMove);
	document.addEventListener('mouseup', onMouseUp);
}
