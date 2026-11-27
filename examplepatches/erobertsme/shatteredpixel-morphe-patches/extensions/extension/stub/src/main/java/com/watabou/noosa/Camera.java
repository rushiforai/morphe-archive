package com.watabou.noosa;

import com.watabou.utils.PointF;

public class Camera extends Gizmo {
	public com.watabou.utils.PointF scroll;
	public static Camera main;
	public int width;
	public int height;
	public float zoom;
	public int x;
	public int y;

	public synchronized void shift(PointF point) { throw new RuntimeException("Stub"); }

	public PointF screenToCamera(int x, int y) { throw new RuntimeException("Stub"); }
	public com.watabou.utils.Point cameraToScreen(float x, float y) { throw new RuntimeException("Stub"); }
}
