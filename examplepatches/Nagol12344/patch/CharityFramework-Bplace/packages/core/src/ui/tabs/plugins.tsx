import { createSignal, For, Show } from 'solid-js';

import { addPlugin, getPluginStates, removePlugin } from '../../plugins/loader';
import styles from '../styles/panel.module.css';
import { Card, CardDescription, CardTitle } from '../components/card';
import { PluginState } from '../../plugins';
import { Plugin } from '@shuni64/charity-framework-bplace-types';
import { Button } from '../components/button';

let input: HTMLInputElement;

export function Plugins() {
	const [getStates, setStates] = createSignal<PluginState[]>([]);
	const [getPlugins, setPlugins] = createSignal<(Plugin & { removed: boolean })[]>([]);
	const [getBrokenPlugins, setBrokenPlugins] = createSignal<PluginState[]>([]);
	const [getReloadRecomended, setReloadRecomended] = createSignal(false);
	const [getInstallError, setInstallError] = createSignal(false);

	const refreshStates = async () => {
		setStates(await getPluginStates());
		setPlugins(
			window.charity.internal.plugins.map((p) => ({
				...p,
				removed: !getStates().find((s) => s.id === p.manifest.id),
			})),
		);
		setBrokenPlugins(getStates().filter((s) => s.enabled && s.error));
		setReloadRecomended(
			!!getStates().find(
				(s) => s.enabled && !s.error && !window.charity.internal.plugins.find((p) => p.manifest.id === s.id),
			) || !!window.charity.internal.plugins.find((p) => !getStates().find((s) => s.id === p.manifest.id)),
		);
	};

	refreshStates();
	return (
		<div class={styles.plugins}>
			<div class={styles.addPlugin}>
				<input
					ref={input}
					type='text'
					placeholder='Enter plugin URL here...'
					onMouseDown={(e) => e.stopPropagation()}
				/>
				<Button
					onClick={async () => {
						setInstallError(false);
						try {
							await addPlugin(input.value);
							refreshStates();
							input.value = '';
						} catch (err) {
							console.error('[Charity]', err);
							setInstallError(true);
						}
					}}
					onMouseDown={(e) => e.stopPropagation()}
					buttonStyle='green'
				>
					Add
				</Button>
			</div>
			<Show when={getInstallError()}>
				<p class={styles.red} style={{ display: 'inline-block', margin: '4px' }}>
					An error occured while adding that plugin. Please check your console or contact the author.
				</p>
			</Show>
			<Show when={getBrokenPlugins().length > 0}>
				<Card style='error'>
					<CardTitle>Some plugins failed to load</CardTitle>
					<CardDescription>
						Plugins can fail to load for various reasons, check your console for the error or ask for support in our{' '}
						<a href={window.charity.internal.info.supportURL}>discord server</a>.
					</CardDescription>
				</Card>
			</Show>
			<Show when={getReloadRecomended()}>
				<Card style='info'>
					<CardDescription
						style={{
							'margin-bottom': '8px',
						}}
					>
						Some plugins need you to reload the page from them to enable/disable, click the button below to do so.
					</CardDescription>
					<Button
						style={{
							width: '96px',
							height: '32px',
						}}
						buttonStyle='green'
						onClick={() => window.location.reload()}
						onMouseDown={(e) => e.stopPropagation()}
					>
						Reload
					</Button>
				</Card>
			</Show>
			<div class={styles.pluginList}>
				<For each={getBrokenPlugins()}>
					{(brokenPlugin) => (
						<div class={styles.plugin}>
							<div class={styles.pluginName}>
								<span class={styles.gray}>{brokenPlugin.id}</span>&nbsp;
								<span class={styles.red}>failed to load</span>
							</div>
							<Button
								onClick={() => {
									removePlugin(brokenPlugin.id);
									refreshStates();
								}}
								onMouseDown={(e) => e.stopPropagation()}
								buttonStyle='red'
							>
								Remove
							</Button>
						</div>
					)}
				</For>
				<For each={getPlugins()}>
					{(plugin) => {
						return (
							<div class={styles.plugin}>
								<div class={styles.pluginName}>
									{plugin.manifest.name}&nbsp;<span class={styles.gray}>by {plugin.manifest.authors.join(', ')}</span>
									{plugin.removed && <span class={styles.red}>&nbsp;(Removed)</span>}
								</div>
								{!plugin.removed && (
									<Button
										onClick={() => {
											removePlugin(plugin.manifest.id);
											refreshStates();
										}}
										onMouseDown={(e) => e.stopPropagation()}
										buttonStyle='red'
									>
										Remove
									</Button>
								)}
							</div>
						);
					}}
				</For>
			</div>
		</div>
	);
}
