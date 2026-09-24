import { Patch } from '@shuni64/charity-framework-bplace-types';
import { exposeLibraries } from './libs';
//import { exposeData } from './data';
//import { exposeClasses } from './classes';
import { exposeGame } from './game';

export const expose = (path: string, name: string, value: string): string =>
	`Object.defineProperty(window.charity${path !== '' ? '.' : ''}${path},'${name}',{configurable:false,enumerable:true,writable:false,value:${value}});document.dispatchEvent(new CustomEvent('charity-expose',{detail:{path:'${path}',name:'${name}'}}));`;

export const exposePatches = (): Patch[] => [
	...exposeLibraries(),
	//...exposeData(),
	//...exposeClasses(),
	...exposeGame(),
];
