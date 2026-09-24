// Mobile WebView entry point.
//
// The order of these side-effect imports matters: the GM shim must be fully
// installed before the framework body runs. This entry is only used by the
// `mobile` rollup target — the desktop userscript build keeps using
// `packages/core/src/index.ts` directly.
import './shim';
import '../index';