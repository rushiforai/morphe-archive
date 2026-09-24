declare module '*.module.css' {
	export const stylesheet: string;
	const classMap: {
		[key: string]: string;
	};
	export default classMap;
}

declare module '*.css' {
	const css: string;
	export default css;
}
