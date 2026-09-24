declare global {
	interface Window {
		esmsInitOptions?: {
			shimMode?: boolean;
			nativePassthrough?: boolean;
			// eslint-disable-next-line @typescript-eslint/no-explicit-any
			source?: (...args: any[]) => any;
		};
	}

	declare var process: {
		env: {
			NODE_ENV: string;
			VERSION: string;
			AUTHOR: string;
			LICENSE: string;
		};
	};
}

export {};
