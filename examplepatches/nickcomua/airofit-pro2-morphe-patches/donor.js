// PRO2 ONLY. Legacy magnitudes, Elite low-level sign (inhale negative).
// Unofficial model-port experiment, not a physically validated flow meter.
// Standalone method: no captured bindings, arrays, shapes or new string IDs.
function calculateFlow(p) {
  var u = Math.abs(p);
  if (u < 0.5) return 0;
  var dial = p < 0 ? this.currentInspiratoryDial : this.currentExpiratoryDial;
  var a, b;
  if (dial === '1') { a=0.091511898; b=3.25553551e-19; }
  else if (dial === '2') { a=0.0344820555; b=5.42717246e-16; }
  else if (dial === '3') { a=0.025401428; b=5.11559816e-16; }
  else if (dial === '4') { a=0.0199647997; b=4.2249698000000005e-15; }
  else if (dial === '5') { a=0.0158217455; b=3.0944707199999997e-14; }
  else if (dial === '6') { a=0.0109280244; b=7.93376067e-22; }
  else if (dial === 'A') { a=0.0800801905; b=1.04654337e-17; }
  else if (dial === 'B') { a=0.0328319704; b=2.3044426800000003e-15; }
  else if (dial === 'C') { a=0.0196188426; b=1.99499767e-25; }
  else if (dial === 'D') { a=0.0127760108; b=1.24626392e-20; }
  else if (dial === 'E') { a=0.00973044827; b=1.35042457e-19; }
  else if (dial === 'F') { a=0.0052698318; b=1.9154316e-15; }
  else { throw new Error('Missing orifice constant for dial '); }
  var q = Math.max(0, Math.sqrt(a * (b + u)));
  return p < 0 ? -q : q;
}
