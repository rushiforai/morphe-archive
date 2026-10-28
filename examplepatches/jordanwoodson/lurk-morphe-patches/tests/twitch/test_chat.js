'use strict';
const assert = require('node:assert/strict'), fs = require('node:fs'), vm = require('node:vm');
const source = process.argv[2];
assert.ok(fs.existsSync(source), 'compiled RN chat consumer source exists');
let stageOverride,afterOverride,stockStage;
let config = {version:1}, rowProps, bodyProps, effects = [], state = {lines:[]}, providerCalls=[];
const rowRef={current:0};let refreshes=0, catalogRevision=1, providerActive=true;const providerLeases=new Map();const timers=new Map();let timerId=0;
const tick=()=>{const pending=Array.from(timers.entries());timers.clear();for(const [,f] of pending)f();};
const element = (type, props, ...children) => ({type, props:{...props, ...(children.length ? {children:children.length===1?children[0]:children}: {})}});
const React = {Fragment:Symbol('Fragment'),createElement:element, cloneElement:(e,p)=>({ ...e,props:{...e.props,...p}}), isValidElement:e=>!!(e&&e.props),
 useState:initial=>[initial,()=>{refreshes++;}], useRef:()=>rowRef, useMemo:f=>f(), useEffect:f=>effects.push(f), useContext:c=>c.value, createContext:value=>({value,Provider:'Provider'}), memo:f=>({type:f})};
const modules = {
  react:React, native:{Text:'Text',View:'View',Animated:{View:'AnimatedView'},StyleSheet:{flatten:s=>Object.assign({},...[s].flat(10).filter(Boolean))},
   NativeModules:{TwitchRNFeedSettings:{getLurkChatData:raw=>{const q=JSON.parse(raw);providerCalls.push(q);if(q.op==='acquire')providerLeases.set(q.id,q);if(q.op==='release')providerLeases.delete(q.id);const lease=providerLeases.get(q.id)||{};return JSON.stringify(q.op==='revision'?{active:providerActive&&!!config.providers,token:String(catalogRevision)}:q.op==='catalog'?{id:q.id,channel:lease.channel,user:lease.user,userId:lease.userId,generation:1,emotes:{Kappa:'lurk7s_abc'},badges:[{title:'he/him',url:'data:image/png;base64,AA=='}]}:(q.op==='acquire'||q.op==='watch')?{active:true}:q.op==='config'?config:q.op==='verdict'?{verdict:q.body.includes('hide')?2:q.body.includes('bright')?1:0}:{});}}}},
  row:{ChatMessageRow:React.memo(p=>{rowProps=p;return element('Row',p);})},
  body:{MessageBody:p=>{bodyProps=p;return element('Text',{style:{fontSize:14},children:element('Text',{style:{fontSize:14},children:p.body})});}},
  time:{formatTimestamp:()=> '13:05',TimestampPart:p=>element('Text',{style:{fontSize:12},children:['13:05','\u00a0']})},
  store:{useChatStore:()=>store,useChatSelector:(s,select)=>select(s.getState())},
  badges:{badgeKey:(set,v)=>set+'/'+v},
  column:{useColumnTrackWidth:(expanded,collapsed,wide)=>expanded?wide:collapsed},
  stage:{useClassicStagePresentation:p=>(stockStage={rootStyle:{backgroundColor:'#181818',paddingBottom:12},beforePlayerRegion:stageOverride||element(React.Fragment,{children:[element('View',{pointerEvents:'none',accessibilityElementsHidden:true,importantForAccessibility:'no-hide-descendants',children:[element('AnimatedView',{style:{width:'75%',backgroundColor:'#000000'}}),element('AnimatedView',{style:[{width:'25%',backgroundColor:'#181818'},null]})]}),element('View',{testID:'unrelated-overlay'})]}),
    afterPlayerRegion:afterOverride||element(React.Fragment,{children:[element('AnimatedView',{style:{flexDirection:'column',overflow:'hidden',width:'25%',backgroundColor:'#181818'},children:[element('View',{style:{flexShrink:0},children:'header'}),element('View',{style:{flex:1,minHeight:0,overflow:'hidden'},children:p.chat})]}),null,null,element('View',{testID:'foreground-extra'}),null]}),widths:[modules.column.useColumnTrackWidth(false,'66.6667%','50%',true),modules.column.useColumnTrackWidth(false,'33.3333%','50%',true)]})},
  metrics:{ChatTextMetricsContext:{value:{xHeight:7,ascender:12,calibrationSettled:true}},ChatFontScaleContext:{value:1}}
};
React.useLayoutEffect=React.useEffect;
modules.overlayHost={OneChatOverlayHost:()=>null};modules.theatreStore={useTheatreChatStore:()=>store};
const store = {getState:()=>state,subscribe:()=>()=>{}};
modules.classicColumn={ClassicChatColumn:()=>null};modules.chatArea={ChatArea:()=>null};
const originals = Object.fromEntries(Object.entries(modules).map(([k,v])=>[k,{...v}]));
const global = {console,Date,Map,Set,WeakMap,WeakSet,setTimeout:f=>{const id=++timerId;timers.set(id,f);return id;},clearTimeout:id=>timers.delete(id),__r:id=>modules[id],RN$registerCallableModule:()=>{}};
global.globalThis=global;
vm.runInNewContext(fs.readFileSync(source,'utf8'),global);
const contract = Object.fromEntries(Object.keys(modules).map(k=>[k,k]));
global.LurkTwitchChat.configure(JSON.stringify(contract));
assert.equal(modules.row.ChatMessageRow,originals.row.ChatMessageRow,'all off preserves export identity');
config={version:1,timestamps:true,clock:1,deleted:true,keywords:true,appearance:true,scale:115,plain:true,alternate:true};global.LurkTwitchChat.invalidate();
global.LurkTwitchChat.configure(JSON.stringify(contract));
const render = p=>{const c=modules.row.ChatMessageRow;return (c.type||c)(p);};
const msg = {id:'m1',type:'chat',user:'viewer',body:'normal',tmiSentTs:new Date(2026,0,1,13,5).valueOf()};
render({message:msg,channelID:'42',chatStore:store});
assert.equal(rowProps.showTimestamp,true);
assert.equal(rowProps.message,msg);
assert.equal(modules.time.formatTimestamp(msg.tmiSentTs,{}),'1:05');
assert.equal(modules.time.TimestampPart({tmiSentTs:msg.tmiSentTs}).props.children[0],'1:05');
render({message:{...msg,deleted:true},channelID:'42',chatStore:store});
assert.equal(rowProps.message.deleted,true);
assert.equal(rowProps.message.modActionType,'delete','received ordinary viewer line uses stock deleted presentation');
const action=()=>{throw Error('retained message action must remain unavailable');};
render({message:{...msg,deleted:true},channelID:'42',chatStore:store,openURL:action,onPressEmote:action,onReply:action,onOpenThread:action});
for(const name of ['openURL','onPressEmote','onReply','onOpenThread']) assert.equal(rowProps[name],undefined,'retained row suppresses '+name);
for(const protection of [{hidden:true},{isUnpublished:true},{maskedRanges:[{start:0,end:4}]},{lowTrust:true}]) {
 const protectedMsg={...msg,...protection,deleted:true};
 render({message:protectedMsg,channelID:'42',chatStore:store,maskedRanges:protection.maskedRanges});
 assert.equal(rowProps.message,protectedMsg,'protected line remains stock');
}
const raw={...msg,id:'projected'};
state={lines:[{key:'projected',line:raw}]};
const projected={...raw};delete projected.type;
render({message:projected,channelID:'42',chatStore:store});
state={lines:[{key:'projected',line:{...raw,deleted:true}}]};
render({message:{...projected,deleted:true},channelID:'42',chatStore:store});
assert.equal(rowProps.message.modActionType,'delete','actual ChatLineComponent projection omits type');
const unknown={...msg,id:'unknown',deleted:true};render({message:unknown,channelID:'42',chatStore:store});assert.equal(rowProps.message,unknown);
render({message:{...msg,deleted:true},channelID:'different',chatStore:store});assert.equal(rowProps.message.modActionType,undefined,'proof is channel scoped');
const hidden={key:'h',line:{...msg,id:'h',body:'hide me'}}, visible={key:'v',line:msg};
state={lines:[hidden,visible],paused:false};
assert.equal(modules.store.useChatStore('channel'),store,'original store identity');
const lines=modules.store.useChatSelector(store,s=>s.lines);assert.deepEqual(Array.from(lines),[visible]);
assert.equal(modules.store.useChatSelector(store,s=>s.lines),lines,'stable filtered snapshot');assert.equal(state.lines.length,2,'store not mutated');
modules.body.MessageBody({body:'hello',action:true});assert.equal(bodyProps.action,false);
{
 // chat_text_size: any whole percent from 50 to 200 scales message text; 0 (Twitch's default) and others don't.
 const before=config,flat=s=>Object.assign({},...[s].flat(10).filter(Boolean));
 const size=scale=>{config={...before,scale};global.LurkTwitchChat.invalidate();return flat(modules.body.MessageBody({body:'hello'}).props.style).fontSize;};
 assert.ok(Math.abs(size(115)-16.1)<1e-9,'115% (an original choice) still scales');
 assert.ok(Math.abs(size(90)-12.6)<1e-9,'finer sizes scale');
 assert.ok(Math.abs(size(200)-28)<1e-9,'largest size scales');
 for(const stock of [0,100,49,201,87.5,'90'])assert.equal(size(stock),14,'no scaling for '+JSON.stringify(stock));
 config=before;global.LurkTwitchChat.invalidate();
}
const delayed={...msg,id:'delayed'};assert.equal(global[1998063107](delayed,{kind:'delete',targetMsgId:'delayed'}),false);assert.equal(delayed.deleted,true);
const unrelated={...delayed};render({message:unrelated,channelID:'other-room',chatStore:store});
assert.equal(rowProps.message,unrelated,'delayed proof cannot cross stores through matching IDs/content');
render({message:delayed,channelID:'42',chatStore:store});assert.equal(rowProps.message.modActionType,'delete','original delayed object retains presentation');
for(const kind of ['timeout','ban']) {const line={...msg,id:kind};assert.equal(global[1998063107](line,{kind,userLogin:'viewer'}),false);assert.equal(line.deleted,true);}
assert.equal(global[1998063107]({...msg,hidden:true},{kind:'delete',targetMsgId:'m1'}),undefined);
assert.equal(global[1998063107](msg,{kind:'clear'}),undefined);
config={version:1,keywords:true,vibrate:true};global.LurkTwitchChat.invalidate();
const liveHandlers=new Set();state={lines:[],_tmiClient:{lineHandlers:liveHandlers}};
effects=[];modules.store.useChatStore('theburntpeanut_247');
const liveCleanups=effects.map(f=>f());
assert.equal(liveHandlers.size,1,'actual login-keyed store owns one live ingress listener');
assert.equal(providerCalls.filter(q=>q.op==='watch').at(-1).channel,'theburntpeanut_247','store login remains exact owner identity');
const emit=line=>liveHandlers.forEach(f=>f(line));
providerCalls=[];emit({...msg,id:'live',body:'bright'});
assert.equal(providerCalls.filter(q=>q.op==='live').length,1,'new live line reaches native keyword vibration gate');
for(const extra of [{isHistorical:true},{deleted:true},{hidden:true},{isUnpublished:true},{maskedRanges:[1]}])emit({...msg,...extra,id:'protected'});
assert.equal(providerCalls.filter(q=>q.op==='live').length,1,'history/deletion/protected events never notify');
config={version:1,keywords:false,vibrate:true};global.LurkTwitchChat.invalidate();emit({...msg,id:'off'});
assert.equal(providerCalls.filter(q=>q.op==='live').length,1,'current opt-out blocks ingress');
liveCleanups.forEach(f=>{if(f)f();});assert.equal(liveHandlers.size,0,'navigation removes old store listener');
for(const channel of ['bad/room','x'.repeat(26),'']){effects=[];modules.store.useChatStore(channel);effects.forEach(f=>f());assert.equal(liveHandlers.size,0,'invalid store identity is rejected');}
effects=[];modules.store.useChatStore('42');const numericCleanups=effects.map(f=>f());assert.equal(liveHandlers.size,1,'numeric store identity remains bounded and supported');numericCleanups.forEach(f=>{if(f)f();});
config={version:1,providers:true};global.LurkTwitchChat.invalidate();
const providerMessage={...msg,id:'providers',body:'😀 Kappa',emotes:[],badges:{subscriber:'1'}};
state={lines:[{key:'providers',line:providerMessage}]};
effects=[];render({message:providerMessage,channelID:'42',chatStore:store,badgeRegistry:{'subscriber/1':{title:'Subscriber'}}});
const beforeRefresh=refreshes;
const cleanups=effects.map(f=>f());
assert.equal(refreshes,beforeRefresh+1,'successful committed provider acquisition refreshes cached row presentation');
assert.ok(providerCalls.some(q=>q.op==='acquire'&&q.channel==='42'),'committed row explicitly acquires provider demand');
render({message:providerMessage,channelID:'42',chatStore:store,badgeRegistry:{'subscriber/1':{title:'Subscriber'}}});
assert.equal(rowProps.message.emotes[0].start,2,'history emote offsets use Unicode code points');
assert.equal(rowProps.message.emotes[0].end,6);
assert.equal(rowProps.message.badges.subscriber,'1');
assert.ok(Object.values(rowProps.badgeRegistry).some(b=>b.title==='he/him'),'cached pronoun/badge registry reaches actual row');
const stockEmote={...providerMessage,emotes:[{id:'native',start:2,end:6}]};
render({message:stockEmote,channelID:'42',chatStore:store,badgeRegistry:{}});
assert.equal(rowProps.message.emotes,stockEmote.emotes,'native emote keeps precedence and array identity');
const nativeBridge=modules.native.NativeModules.TwitchRNFeedSettings.getLurkChatData;
modules.native.NativeModules.TwitchRNFeedSettings.getLurkChatData=raw=>JSON.parse(raw).op==='catalog'?
 JSON.stringify({...JSON.parse(nativeBridge(raw)),generation:2,emotes:{Kappa:'lurk7a_a',BTTV:'lurkbs_b',FFZ:'lurkfs_c'}}):nativeBridge(raw);
render({message:{...providerMessage,body:'😀 Kappa BTTV FFZ Kappa!'},channelID:'42',chatStore:store,badgeRegistry:{}});
assert.deepEqual(Array.from(rowProps.message.emotes,e=>e.id),['lurk7a_a','lurkbs_b','lurkfs_c'],'all providers and animation preserve whole-token boundaries');
modules.native.NativeModules.TwitchRNFeedSettings.getLurkChatData=nativeBridge;
cleanups.forEach(f=>{if(f)f();});assert.ok(providerCalls.some(q=>q.op==='release'),'unmount releases row demand');
config={version:1,appearance:true,alternate:true,width:25,opacity:50};global.LurkTwitchChat.invalidate();
const first=render({message:{...msg,id:'stripe1'},channelID:'stripes',chatStore:store});
const second=render({message:{...msg,id:'stripe2'},channelID:'stripes',chatStore:store});
assert.equal(React.isValidElement(first),true);
assert.equal(modules.native.StyleSheet.flatten(second.props.style).backgroundColor,'rgba(128,128,128,0.0784313725490196)','alternate row uses native shade');
assert.equal(modules.native.StyleSheet.flatten(render({message:{...msg,id:'stripe2'},channelID:'stripes',chatStore:store}).props.style).backgroundColor,
 modules.native.StyleSheet.flatten(second.props.style).backgroundColor,'stripe remains stable on rerender');
const stage=modules.stage.useClassicStagePresentation({mode:'landscape-column-chat',chat:'chat'});
assert.deepEqual(Array.from(stage.widths),['75%','25%'],'landscape player and chat widths stay complementary');
const chatBackground=stage.beforePlayerRegion.props.children[0].props.children[1];
const chatStyle=modules.native.StyleSheet.flatten(chatBackground.props.style);
assert.equal(chatStyle.backgroundColor,'#000000','chat has opaque black backing so alpha cannot blend over identical root color');
assert.equal(chatStyle.width,'25%','existing animated width preserved');
assert.equal(chatBackground.props.children,undefined,'empty background remains empty; no new view');
const foreground=stage.afterPlayerRegion.props.children[0];
assert.equal(modules.native.StyleSheet.flatten(foreground.props.style).backgroundColor,'rgba(24,24,24,0.5)','only foreground background color gets alpha');
assert.equal(foreground.props.children[0],stockStage.afterPlayerRegion.props.children[0].props.children[0],'foreground header unchanged');
assert.equal(foreground.props.children[1].props.children.props.children,stockStage.afterPlayerRegion.props.children[0].props.children[1].props.children,'original chat element preserved within Provider');
assert.equal(stage.afterPlayerRegion.props.children[3],stockStage.afterPlayerRegion.props.children[3],'foreground sibling unchanged');
assert.equal(stage.rootStyle,stockStage.rootStyle,'root color and gutters remain original');
assert.equal(stage.beforePlayerRegion.props.children[1],stockStage.beforePlayerRegion.props.children[1],'unrelated fragment sibling unchanged');
assert.equal(stage.beforePlayerRegion.props.children[0].props.children[0],stockStage.beforePlayerRegion.props.children[0].props.children[0],'player background unchanged');
assert.equal(modules.native.StyleSheet.flatten(stockStage.beforePlayerRegion.props.children[0].props.children[1].props.style).backgroundColor,'#181818','stock tree not mutated');
const pinnedShape=stockStage.beforePlayerRegion;
for(const bad of [element('View',pinnedShape.props),element(React.Fragment,{children:[null,null]}),element(React.Fragment,{children:[element('View',{...pinnedShape.props.children[0].props,pointerEvents:'auto'}),null]}),element(React.Fragment,{children:[element('View',{...pinnedShape.props.children[0].props,children:[null,pinnedShape.props.children[0].props.children[1]]}),null]})]){
 stageOverride=bad;const v=modules.stage.useClassicStagePresentation({mode:'landscape-column-chat'});assert.equal(v.beforePlayerRegion,bad,'unsupported background shape stays stock');
}
stageOverride=element(React.Fragment,{children:[element('View',{...pinnedShape.props.children[0].props,children:[pinnedShape.props.children[0].props.children[0],element('AnimatedView',{...pinnedShape.props.children[0].props.children[1].props,children:element('View',{testID:'future-content'})})]}),pinnedShape.props.children[1]]});
const occupied=modules.stage.useClassicStagePresentation({mode:'landscape-column-chat'});assert.equal(occupied.beforePlayerRegion,stageOverride,'nonempty chat background remains stock');
stageOverride=undefined;
const pinnedAfter=stage.afterPlayerRegion;
for(const bad of [element('View',pinnedAfter.props),element(React.Fragment,{children:[null]}),element(React.Fragment,{children:[element('View',pinnedAfter.props.children[0].props),null,null,null,null]}),element(React.Fragment,{children:[element('AnimatedView',{...pinnedAfter.props.children[0].props,style:{flexDirection:'row',overflow:'hidden'}}),null,null,null,null]})]){
 afterOverride=bad;const v=modules.stage.useClassicStagePresentation({mode:'landscape-column-chat'});assert.equal(v,stockStage,'unsupported foreground shape preserves entire presentation');
}
afterOverride=undefined;
for(const extra of [{mode:'landscape-one-chat'},{mode:'landscape-no-chat'},{mode:'portrait'},{pipFloatSettled:true},{pipCompactFrame:true},{isTheatreDocked:true}]){
 const v=modules.stage.useClassicStagePresentation({mode:'landscape-column-chat',...extra});assert.equal(v.beforePlayerRegion,stockStage.beforePlayerRegion,'excluded background stays original');assert.equal(v.afterPlayerRegion.props.children[0].props.style,stockStage.afterPlayerRegion.props.children[0].props.style);assert.equal(v.afterPlayerRegion.props.children[0].props.children[1].props.children.props.value,null,'excluded tree has neutral authority');
}
for(const change of [{appearance:false},{opacity:0}]){const old=config;config={...config,...change};global.LurkTwitchChat.invalidate();const v=modules.stage.useClassicStagePresentation({mode:'landscape-column-chat'});assert.equal(v.beforePlayerRegion,stockStage.beforePlayerRegion,'off/default background stays original');assert.equal(v.afterPlayerRegion.props.children[0].props.style,stockStage.afterPlayerRegion.props.children[0].props.style);assert.equal(v.afterPlayerRegion.props.children[0].props.children[1].props.children.props.value,null);config=old;global.LurkTwitchChat.invalidate();}
const portrait=modules.stage.useClassicStagePresentation({mode:'portrait',chat:'chat'});
assert.deepEqual(Array.from(portrait.widths),['66.6667%','33.3333%']);
config={version:1,providers:true};global.LurkTwitchChat.invalidate();providerActive=true;
const mounted=[];
for(let i=0;i<2;i++) {rowRef.current=null;effects=[];render({message:{...msg,id:'poll'+i},channelID:'42',chatStore:store});mounted.push(...effects.map(f=>f()));}
assert.equal(timers.size,1,'multiple provider rows share one runtime timer');
providerCalls=[];tick();const primedRefreshes=refreshes;
providerCalls=[];tick();assert.equal(refreshes,primedRefreshes,'unchanged token never refreshes rows');
assert.deepEqual(providerCalls.map(q=>q.op),['revision'],'unchanged poll is one small native call, no catalogs or acquisition');
catalogRevision++;tick();assert.equal(refreshes,primedRefreshes+2,'late provider completion refreshes both committed rows');
mounted.forEach(f=>{if(f)f();});assert.equal(timers.size,0,'last release clears runtime poll');
rowRef.current=null;effects=[];render({message:msg,channelID:'42',chatStore:store});const disposed=effects.map(f=>f());
providerActive=false;tick();assert.equal(timers.size,0,'native runtime disposal stops polling');disposed.forEach(f=>{if(f)f();});
providerActive=true;rowRef.current=null;effects=[];render({message:msg,channelID:'42',chatStore:store});const optedOut=effects.map(f=>f());
config={version:1,providers:false};global.LurkTwitchChat.invalidate();tick();assert.equal(timers.size,0,'provider opt-out stops polling');optedOut.forEach(f=>{if(f)f();});
// Native calls per render: one config read is shared until invalidated, and a rerendered line keeps its verdict.
config={version:1,timestamps:true,keywords:true};global.LurkTwitchChat.invalidate();providerCalls=[];
for(const id of ['c1','c2','c3']){render({message:{...msg,id,body:'bright'},channelID:'42',chatStore:store});
 modules.body.MessageBody({body:'x'});modules.time.TimestampPart({tmiSentTs:msg.tmiSentTs});modules.time.formatTimestamp(msg.tmiSentTs,{});}
assert.equal(providerCalls.filter(q=>q.op==='config').length,1,'rows, bodies and timestamps share one config read');
assert.equal(providerCalls.filter(q=>q.op==='verdict').length,3,'one verdict per line');
render({message:{...msg,id:'c1',body:'bright'},channelID:'42',chatStore:store});
assert.equal(providerCalls.filter(q=>q.op==='verdict').length,3,'a rerendered line reuses its verdict');
render({message:{...msg,id:'c1',body:'changed'},channelID:'42',chatStore:store});
assert.equal(providerCalls.filter(q=>q.op==='verdict').length,4,'changed content is classified again');
global.LurkTwitchChat.invalidate();render({message:{...msg,id:'c1',body:'bright'},channelID:'42',chatStore:store});
assert.equal(providerCalls.filter(q=>q.op==='config').length,2,'invalidate reads the config again');
config={version:1};global.LurkTwitchChat.invalidate();
global.LurkTwitchChat.configure(JSON.stringify(contract));
for(const k of ['row','body','time','store','stage','column']) for(const n of Object.keys(originals[k])) assert.equal(modules[k][n],originals[k][n],'off restores '+n);
assert.equal(global[1998063107](msg,{kind:'delete',targetMsgId:'m1'}),undefined,'off predicate delegates to stock');
console.log('PASS RN timestamps, received-only deleted presentation, protected rows, history selector identity, plain action and delayed marking');
