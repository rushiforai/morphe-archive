// Synthetic Store/account contract, not application code or a network client.
const specifications={subscription:{def:null,allowed:e=>!0,save:!0,nativeSync:!0}};
const values=new Map(Object.entries(input.values));
let xr;
const N={get(key){return values.has(key)?values.get(key):(key==='subscription'?specifications.subscription.def:null)},
 set(key,value){values.set(key,value)},once(){},remove(key){values.delete(key)}};
xr=!!N.get(`subscription`),xr||N.once(`subscription`,e=>xr=!!e);
let ju=()=>N.get(`subscription`)!==null;
function clear(){let e=N.get(`subscription`);
 N.set(`subscription`,null),N.set(`subscriptionInfo`,null);
 if(document.body){e&&document.body.classList.remove(`subs-${e}`)}
 events.push('clear');}
function active(info){N.set('subscription',info.tier);N.set('subscriptionInfo',info)}
function logout(){clear();account.user=null;account.token=null;events.push('logout')}
account.token='real-token';
const api={clear,active,logout,result(){return{latch:xr,hasAny:ju(),feature:xr?input.savedFeature:'default',
 subscription:N.get('subscription'),info:N.get('subscriptionInfo')}}};
