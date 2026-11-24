package app.zonghome.extension;

/** Both rings return to the same orientation after 4.8s (outer 2 turns, inner 3). */
final class LoadingPhase {
    static float turn(long uptime){return (uptime%4800)*.15f;}
    static float pulse(long uptime){return (float)(.5+.5*Math.sin((uptime%4800)*Math.PI/1200));}
}
