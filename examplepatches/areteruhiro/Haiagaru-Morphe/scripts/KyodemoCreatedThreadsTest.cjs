const fs=require('fs'),vm=require('vm'),{parseHTML}=require(process.argv[2]||'linkedom');
const source=fs.readFileSync('extensions/chmate/src/main/java/app/morphe/extension/chmate/HissiMenuController.java','utf8');
const start=source.indexOf('webView.evaluateJavascript("(function(){"',source.indexOf('private void configureHissiTabs'));
const block=source.slice(start,source.indexOf(', result ->',start));
const script=[...block.matchAll(/"(?:[^"\\]|\\.)*"/g)].map(m=>JSON.parse(m[0])).join('');
function post(n){return `<div class="post"><div class="r-head"><strong>${n}</strong>:名無し 2026/11/14</div><div class="clmess">本文${n}</div></div>`;}
const html=`<html><body><div id="blist"><div class="box content"><h2><a href="/a">A</a></h2>${post(1)+post(2)}</div><div class="box content"><h2><a href="/b">B</a></h2>${post(11)}</div><div class="box content"><h2><a href="/c">C</a></h2>${post(1)+post(21)}</div></div></body></html>`;
const {window}=parseHTML(html);window.HTMLElement.prototype.scrollIntoView=function(){};
const context=vm.createContext({window,document:window.document,location:{hostname:'www.kyodemo.net',search:'?hi=ReporterFixture',pathname:'/sdemo/b/e_e_liveedge/'}});
let checks=0;function ok(v,msg){if(!v)throw Error(msg);checks++;}
ok(vm.runInContext(script,context)===true,'initialized');
let created=window.document.getElementById('haiagaru-kyodemo-created');ok(created.querySelectorAll('.post').length===2,'only thread starters');ok([...created.querySelectorAll('strong')].every(n=>n.textContent==='1'),'only response 1, never 11/21');
window.haiagaruSelectHissiTab(3);ok(created.style.display==='','created tab shown');ok(window.document.getElementById('haiagaru-kyodemo-summary').style.display==='none','summary hidden');
window.haiagaruSelectHissiTab(0);ok(created.style.display==='none','normal responses restored');
ok(vm.runInContext(script,context)===true,'reinitialize');created=window.document.getElementById('haiagaru-kyodemo-created');ok(created.querySelectorAll('.post').length===2,'no duplicated clone after refresh');ok(window.document.querySelectorAll('#blist > .box.content .post').length===5,'native posts intact');
context.location.hostname='kyodemo.net';ok(vm.runInContext(script,context)===true,'bare Kyodemo host accepted');
context.location.hostname='other.invalid';ok(vm.runInContext(script,context)===false,'foreign page rejected');
console.log('PASS '+checks+' Kyodemo created-thread DOM checks');
