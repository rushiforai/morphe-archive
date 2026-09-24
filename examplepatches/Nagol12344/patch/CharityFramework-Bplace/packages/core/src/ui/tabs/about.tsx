import { resources } from '../../utils/resources';
import styles from '../styles/panel.module.css';
import { createSignal, Show } from 'solid-js';
import { Card, CardDescription, CardTitle } from '../components/card';
import { Button } from '../components/button';
import { checkForUpdates } from '../../utils/updates';

export function About() {
	const [isOutOfDate, setOutOfDate] = createSignal(true);
	checkForUpdates().then((ood) => setOutOfDate(ood));

	return (
		<div class={styles.about}>
			<Show when={isOutOfDate()}>
				<Card style='error'>
					<CardTitle>Charity is out of date!</CardTitle>
					<CardDescription>
						Charity Framework is currently out of date and some plugins or features may not work. Please click the
						button below to update.
					</CardDescription>

					<Button
						style={{
							width: '96px',
							height: '32px',
						}}
						buttonStyle='green'
						onClick={() => window.location.replace(window.charity.internal.info.updateURL)}
						onMouseDown={(e) => e.stopPropagation()}
					>
						Update
					</Button>
				</Card>
			</Show>
			<img src={resources.logo} class={styles.logo}></img>
			<p class={styles.description}>{window.charity.internal.info.description}</p>
			<div class={styles.aboutInfo}>
				<div class={styles.version}>
					<p>Version</p>
					<p class={styles.gray}>v{window.charity.internal.info.version}</p>
				</div>
				<div class={styles.author}>
					<p>Authors</p>
					<p class={styles.gray}>{window.charity.internal.info.author}</p>
				</div>
			</div>
			<div class={styles.aboutLinks}>
				<a href={window.charity.internal.info.supportURL} target='_blank'>
					Discord (Support)
				</a>
			</div>
		</div>
	);
}
