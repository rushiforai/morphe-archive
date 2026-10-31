/* Copyright 2026 BDCrusher. GPL-3.0. Continuous Android-to-WebView playback clock. */
export class PlaybackClock {
  constructor(){this.reset();}
  reset(){this.initialized=false;this.position=0;this.at=0;this.playing=false;this.rate=1;this.revision=undefined;this.correction=0;this.duration=1000;}
  read(now){return this.position+(this.playing?Math.max(0,now-this.at)*this.rate:0)+this.correction*Math.min(1,Math.max(0,(now-this.at)/this.duration));}
  accept(sample,now,wallNow){
    if(!Number.isFinite(sample.position))return;
    const playing=sample.playing===true,rate=Number.isFinite(sample.rate)&&sample.rate>0?sample.rate:1;
    const delay=wallNow-sample.sampledAt;
    const age=Number.isFinite(delay)&&delay>=0&&delay<=1000?delay:0;
    const target=sample.position+(playing?age*rate:0),predicted=this.read(now),error=target-predicted;
    const discontinuity=Number.isFinite(sample.revision)&&this.revision!==undefined&&sample.revision!==this.revision;
    const snap=!this.initialized||!playing||playing!==this.playing||rate!==this.rate||discontinuity||Math.abs(error)>750;
    this.position=snap?target:predicted;this.at=now;this.playing=playing;this.rate=rate;this.revision=sample.revision;this.initialized=true;
    // Ordinary bridge jitter changes the rate slightly, never the current position.
    // Genuine seeks, track changes, pauses and playback-rate changes are immediate.
    this.correction=snap||Math.abs(error)<8?0:Math.max(-120,Math.min(120,error));
    this.duration=Math.max(1000,Math.abs(this.correction)/(0.08*rate));
  }
}
