import { createSignal, onMount } from 'solid-js';
import { render } from 'solid-js/web';

import { DeepLinkType } from '..';
import { DeeplinkLayout } from '../components/deeplink-layout';
import styles from '../styles/deeplink.module.css';
import { getPluginStates, setPluginStates } from '../../plugins/loader';
import { Button } from '../components/button';
import { PluginState } from '../../plugins';

export function Debug() {
	const [getStates, setStates] = createSignal<PluginState[]>([]);

	onMount(async () => {
		setStates(await getPluginStates());
	});

	return (
		<DeeplinkLayout>
			<h2 class={styles.mono}>Debugging Page</h2>
			<Button className={styles.pixel} onClick={() => location.replace('/')}>
				Go back to wplace
			</Button>

			<div
				style={{
					display: 'flex',
					'flex-direction': 'column',
					gap: '6px',
				}}
				class={styles.mono}
			>
				<p>Version v{window.charity.internal.info.version}</p>
				<span>Total Plugin States: {getStates().length}</span>
				<span>Enabled Plugin States: {getStates().filter((s) => s.enabled).length}</span>

				<div
					style={{
						display: 'flex',
						gap: '8px',
					}}
				>
					<Button className={styles.pixel} buttonStyle='red' onClick={() => setPluginStates([])}>
						Clear Plugin States
					</Button>
					<Button
						className={styles.pixel}
						onClick={() => setPluginStates(getStates().map((s) => ({ ...s, enabled: true })))}
					>
						Enable all plugins
					</Button>
					<Button
						className={styles.pixel}
						buttonStyle='red'
						onClick={() => setPluginStates(getStates().map((s) => ({ ...s, enabled: false })))}
					>
						Disable all plugins
					</Button>
				</div>
			</div>
		</DeeplinkLayout>
	);
}

export default {
	id: 'debug',
	title: 'Debug',
	// executes last as a default
	condition: () => true,
	render: (root) => render(Debug, root),
} as DeepLinkType;
