import { JSX } from 'solid-js/jsx-runtime';
import styles from '../styles/panel.module.css';

type ButtonStyle = 'green' | 'red';

const styleToCssClass: Record<ButtonStyle, string> = {
	green: 'buttonStyleGreen',
	red: 'buttonStyleRed',
};

export function Button(
	props: {
		buttonStyle?: ButtonStyle;
		className?: string;
		children: JSX.Element;
	} & JSX.ButtonHTMLAttributes<HTMLButtonElement>,
) {
	const { buttonStyle = 'green', className, children } = props;
	const styleClass = styles[styleToCssClass[buttonStyle]];

	return (
		<button {...props} class={`${styles.button} ${styleClass} ${className ?? ''}`}>
			{children}
		</button>
	);
}
