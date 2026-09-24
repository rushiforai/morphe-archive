export interface Patch {
	name: string;
	find: string;
	disable?: boolean;
	replace: {
		match: RegExp | string;
		replace: (substring: string, ...args: string[]) => string;
	};
}
