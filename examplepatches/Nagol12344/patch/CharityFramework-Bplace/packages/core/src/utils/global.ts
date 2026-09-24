// eslint-disable-next-line @typescript-eslint/no-explicit-any
export const defineGlobalPath = (parent: any, name: string) =>
	!parent[name] ?
		Object.defineProperty(parent, name, { configurable: false, enumerable: true, writable: false, value: {} })
	:	false;

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export const defineHiddenPath = (parent: any, name: string) =>
	!parent[name] ?
		Object.defineProperty(parent, name, { configurable: false, enumerable: false, writable: false, value: {} })
	:	false;

// globally share data under window using a Symbol
// returns a string that can be evaluated to retrieve the stored value
// eslint-disable-next-line @typescript-eslint/no-explicit-any
export const storeSharedValue = (data: any): string => {
	const uuid = crypto.randomUUID();
	const symbol = Symbol.for(uuid);
	window[symbol] = data;
	return `window[Symbol.for("${uuid}")]`;
};
