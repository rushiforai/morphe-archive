package app.template.extension.shatteredpixeldungeon;

/**
 * Converts colors between RGB and hue, saturation and lightness.
 */
final class Colors {

	private Colors() {
	}

	/**
	 * Hue in degrees (0 to 360), saturation and lightness from 0 to 1.
	 */
	static float[] toHsl(int rgb) {
		float r = ((rgb >> 16) & 0xFF) / 255f;
		float g = ((rgb >> 8) & 0xFF) / 255f;
		float b = (rgb & 0xFF) / 255f;
		float max = Math.max(r, Math.max(g, b));
		float min = Math.min(r, Math.min(g, b));
		float l = (max + min) / 2f;
		if (max == min) return new float[] { 0, 0, l };
		float d = max - min;
		float s = l > 0.5f ? d / (2f - max - min) : d / (max + min);
		float h;
		if (max == r) {
			h = (g - b) / d + (g < b ? 6 : 0);
		} else if (max == g) {
			h = (b - r) / d + 2;
		} else {
			h = (r - g) / d + 4;
		}
		return new float[] { h * 60f, s, l };
	}

	static int fromHsl(float hue, float saturation, float lightness) {
		float h = (((hue % 360) + 360) % 360) / 360f;
		if (saturation <= 0) {
			int v = Math.round(lightness * 255);
			return (v << 16) | (v << 8) | v;
		}
		float q = lightness < 0.5f ? lightness * (1 + saturation) : lightness + saturation - lightness * saturation;
		float p = 2 * lightness - q;
		int r = Math.round(channel(p, q, h + 1f / 3) * 255);
		int g = Math.round(channel(p, q, h) * 255);
		int b = Math.round(channel(p, q, h - 1f / 3) * 255);
		return (r << 16) | (g << 8) | b;
	}

	private static float channel(float p, float q, float t) {
		if (t < 0) t += 1;
		if (t > 1) t -= 1;
		if (t < 1f / 6) return p + (q - p) * 6 * t;
		if (t < 1f / 2) return q;
		if (t < 2f / 3) return p + (q - p) * (2f / 3 - t) * 6;
		return p;
	}
}
