import { JSX } from 'solid-js/jsx-runtime';
import styles from '../styles/panel.module.css';

type CardStyle = 'normal' | 'info' | 'error';

const styleToCssClass: Record<CardStyle, string> = {
	normal: 'cardStyleNormal',
	info: 'cardStyleInfo',
	error: 'cardStyleError',
};

export function CardTitle({ children }: { children: JSX.Element }) {
	return <h1 class={styles.cardTitle}>{children}</h1>;
}

export function CardDescription(props: { children: JSX.Element } & JSX.HTMLAttributes<HTMLParagraphElement>) {
	return (
		<p {...props} class={styles.cardDescription}>
			{props.children}
		</p>
	);
}
export function Card({ children, style = 'normal' }: { children: JSX.Element; style?: CardStyle }) {
	const styleClass = styles[styleToCssClass[style]];

	return <div class={`${styles.card} ${styleClass}`}>{children}</div>;
}
