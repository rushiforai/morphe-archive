/* Copyright 2026 BDCrusher. GPL-3.0. Cadence evidence, never a scrolling driver. */
export class RenderDiagnostics {
 constructor(log){this.log=log;this.enabled=false;this.last=0;this.index=-1;this.schedule=[];this.gaps=[];this.frames=0;this.gapMax=0;this.cpuMax=0;this.reportAt=0;this.nominal=1000/60;}
 enable(value){if(this.enabled===value)return;this.enabled=value;this.last=0;this.frames=0;this.gaps=[];this.reportAt=0;this.log('Debug',value?'Renderer diagnostics enabled':'Renderer diagnostics disabled');}
 pause(){this.last=0;this.frames=0;this.gaps=[];this.reportAt=0;this.gapMax=this.cpuMax=0;}
 lines(lines){this.schedule=lines.map((line,index)=>({time:line.time,index})).filter(x=>Number.isFinite(x.time)).sort((a,b)=>a.time-b.time);this.index=-1;}
 sample(now,position,cpu,playing){
  if(!this.enabled||!playing){this.pause();return;}const gap=this.last?now-this.last:0;this.last=now;
  if(gap>0){this.gaps.push(gap);if(this.gaps.length>120)this.gaps.shift();this.gapMax=Math.max(this.gapMax,gap);this.frames++;}this.cpuMax=Math.max(this.cpuMax,cpu);
  let lo=0,hi=this.schedule.length;while(lo<hi){const mid=(lo+hi)>>>1;if(this.schedule[mid].time<=position)lo=mid+1;else hi=mid;}const index=lo?this.schedule[lo-1].index:-1;
  if(index!==this.index){this.log('Line-transition',`line=${index} playbackMs=${Math.round(position*1000)} callbackGapMs=${gap.toFixed(1)} tickCpuMs=${cpu.toFixed(2)}`);this.index=index;}
  if(!this.reportAt)this.reportAt=now+2000;
  if(now>=this.reportAt){const sorted=[...this.gaps].sort((a,b)=>a-b),median=sorted[Math.floor(sorted.length/2)]||0;this.log('Renderer-cadence',`line=${index} samples=${this.frames} intervalMedianMs=${median.toFixed(1)} callbackGapMaxMs=${this.gapMax.toFixed(1)} tickCpuMaxMs=${this.cpuMax.toFixed(2)} estimatedFps=${median?(1000/median).toFixed(1):0}; callback cadence is not a dropped-frame count`);this.frames=0;this.gapMax=this.cpuMax=0;this.reportAt=now+2000;}
 }
}
