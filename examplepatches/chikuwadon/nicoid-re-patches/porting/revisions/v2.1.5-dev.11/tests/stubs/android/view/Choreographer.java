package android.view;
public class Choreographer {public interface FrameCallback{void doFrame(long frameTimeNanos);} public static Choreographer getInstance(){return new Choreographer();} public void postFrameCallback(FrameCallback c){} public void removeFrameCallback(FrameCallback c){}}
