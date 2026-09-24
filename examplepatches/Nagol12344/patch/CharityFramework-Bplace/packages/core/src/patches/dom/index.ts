import { Patch } from '@shuni64/charity-framework-bplace-types';
import { storeSharedValue } from '../../utils/global';
import { type jsx as jsxType } from 'react/jsx-runtime';

// wrapper div to function as bridge between React and normal DOM operations
const CharityIconWrapper = ({ element }) => {
	const React = charity.lib.react;

	const ref = React.useRef(null);

	React.useLayoutEffect(() => {
		if (ref.current) {
			document.dispatchEvent(new CustomEvent('charity-right-sidebar', { detail: ref.current }));
		}
	}, [element]);

	return React.createElement('div', {
		ref: ref,
		className:
			'inline-flex h-[48px] items-center justify-end gap-1 rounded-[99px] border border-black/5 bg-white shadow-[0_16px_32px_0_rgba(0,0,0,0.10)] flex-shrink-0 px-1 animate-slide-in-down',
	});
};

// check if a given React DOM element contains a the menu button
function elementContainsMenu(elem: React.ReactElement): boolean {
	if (!elem.props) {
		return false;
	}
	if (Object.hasOwn(elem.props as object, 'onInfoClick')) {
		return true;
	}
	if (!elem.props['children']) {
		return false;
	}
	// TODO: hande this properly, apparently it's valid???
	if (typeof elem.props['children'] == 'object') {
		return false;
	}
	for (const child of elem.props['children']) {
		if (child && elementContainsMenu(child)) {
			return true;
		}
	}
	return false;
}

const customJsxFragment =
	(jsx: typeof jsxType) =>
	// eslint-disable-next-line @typescript-eslint/no-explicit-any
	(type: React.ElementType, props: unknown, ...args: any[]) => {
		// find and extend OptionBar container
		if (
			props['style'] != undefined &&
			typeof props['style']['top'] == 'string' &&
			props['style']['top'].includes('16px') &&
			typeof props['className'] == 'string' &&
			props['className'].includes('left-4')
		) {
			const children = props['children'];
			if (
				children instanceof Array &&
				children.some((elem: React.ReactElement | null) => (elem ? elementContainsMenu(elem) : false))
			) {
				children.push(jsx(CharityIconWrapper, {}));
			}
		}
		const ret = jsx(type, props, ...args);
		return ret;
	};

const customJsxFragmentShared = storeSharedValue(customJsxFragment);

export const domEvents = (): Patch[] => {
	return [
		{
			name: 'domOptionBar',
			find: 'react-jsx-runtime.production.min.js',
			replace: {
				match: /([a-zA-Z_$][\w$]*)\.jsx=([a-zA-Z_$][\w$]*);([a-zA-Z_$][\w$]*)\.jsxs=([a-zA-Z_$][\w$]*);/,
				replace: (orig, elem) =>
					`${orig}${elem}.jsx = ${customJsxFragmentShared}(${elem}.jsx);${elem}.jsxs = ${customJsxFragmentShared}(${elem}.jsxs);`,
			},
		},
	];
};
