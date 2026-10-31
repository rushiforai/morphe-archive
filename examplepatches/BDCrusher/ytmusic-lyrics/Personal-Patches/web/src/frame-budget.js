/* Copyright 2026 BDCrusher. GPL-3.0. Bounded callback diagnostics, no recording. */
export class FrameBudget {
  constructor(){this.reset(0);}
  reset(now){this.last=0;this.nominal=1000/60;this.frames=0;this.late=0;this.worst=0;this.reportAt=now+30000;this.warmUntil=now+1500;}
  sample(now,playing){
    if(!playing){this.last=0;return;}
    const gap=this.last?now-this.last:0;this.last=now;
    if(gap<=0||now<this.warmUntil)return;
    this.frames++;this.worst=Math.max(this.worst,gap);
    if(gap>Math.max(20,this.nominal*1.8))this.late++;
    this.nominal+=(Math.min(gap,this.nominal*2)-this.nominal)*.05;
    if(now<this.reportAt)return;
    const report=this.late?`Callback gaps: ${this.late}/${this.frames}; worst ${this.worst.toFixed(1)} ms; estimated interval ${this.nominal.toFixed(1)} ms`:undefined;
    this.frames=0;this.late=0;this.worst=0;this.reportAt=now+30000;return report;
  }
}
