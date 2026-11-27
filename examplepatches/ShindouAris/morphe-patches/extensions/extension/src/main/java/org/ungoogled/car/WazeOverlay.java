package org.ungoogled.car;

import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.DashPathEffect;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Draws Waze Mod's data over Maps' car UI as Waze Mod draws its own Android Auto speedometer (AaSpeedo): the speed
 * limit sign (a red disc, a white face, the road-sign numerals), beside it the speed as a dark dial with an arc
 * (style 3), as a small badge with a dashed rim over the sign's edge (style 2), or not at all (style 4); the average
 * speed zone sign after them; and under them the nearest alert (its Waze icon and distance).
 *
 * Where and how big is {@link OverlaySettings}. The icons and fonts are Waze Mod's and WazeHUD's, which the patch
 * copies into Maps' assets, under ungoogled/waze/.
 */
final class WazeOverlay implements FrameRelay.Overlay {
    private static final String ICONS = "ungoogled/waze/";

    private final AssetManager assets;
    private final OverlaySettings settings;
    private volatile WazeData data;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.SUBPIXEL_TEXT_FLAG);
    private final Paint image = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    /** Icons by path; null for one that is missing. Drawing thread only. */
    private final Map<String, Bitmap> icons = new HashMap<>();
    private Typeface signFont, digitFont;
    private boolean fontsLoaded;

    WazeOverlay(AssetManager assets, OverlaySettings settings) {
        this.assets = assets;
        this.settings = settings;
    }

    void set(WazeData data) {
        this.data = data;
    }

    /** The distance to the vehicle ahead from xADAS, in metres (-1: none), and its verdict. */
    private volatile int leadMeters = -1, leadVerdict;

    void lead(int meters, int verdict) {
        leadMeters = meters;
        leadVerdict = verdict;
    }

    /** Where the overlay was last laid out, in Maps' display coordinates; null before. */
    private volatile Rect bounds;
    /** How far from its place it is drawn, to clear Maps' cards; null: not drawn. */
    private volatile android.graphics.Point shift = new android.graphics.Point();

    /** Where it goes before any shift, in Maps' display coordinates; null before the first layout. */
    Rect bounds() {
        return bounds;
    }

    /** Moves it by [shift] pixels, or hides it (null). Returns whether this changed what is shown. */
    boolean place(android.graphics.Point shift) {
        boolean changed = !java.util.Objects.equals(this.shift, shift);
        this.shift = shift;
        return changed;
    }

    private void loadFonts() {
        if (fontsLoaded) return;
        fontsLoaded = true;
        try {
            signFont = Typeface.createFromAsset(assets, ICONS + "fonts/TGL_0-1451Eng.ttf");
        } catch (RuntimeException ignored) {
        }
        try {
            digitFont = Typeface.createFromAsset(assets, ICONS + "fonts/JetBrainsMono-Bold.ttf");
        } catch (RuntimeException ignored) {
        }
    }

    @Override
    public void draw(Canvas canvas, Rect area, Rect safe, float density) {
        WazeData data = this.data;
        int leadMeters = settings.xadas ? this.leadMeters : -1;
        if (data == null && leadMeters < 0 || !settings.enabled) return;
        if (data == null) data = WazeData.NONE;
        boolean waze = data != WazeData.NONE;
        loadFonts();
        float scale = settings.scale / 100f;
        int style = settings.style;
        float diameter = Math.max(48, 88 * density * scale);

        // The cluster, as AaSpeedo lays it out.
        float currentLeft = style == OverlaySettings.STYLE_BADGE ? diameter * 0.76f : diameter * 1.08f;
        float currentDiameter = style == OverlaySettings.STYLE_BADGE ? Math.max(30, diameter * 0.60f) : diameter;
        boolean showCurrent = style != OverlaySettings.STYLE_SIGNS;
        float clusterWidth = showCurrent ? Math.max(diameter, currentLeft + currentDiameter) : diameter;
        float clusterHeight = showCurrent ? Math.max(diameter, currentDiameter) : diameter;
        if (!waze) {
            clusterWidth = 0;
            clusterHeight = 0;
        }
        Bitmap average = data.averageZone ? icon("alerts/no_passing_in.png") : null;
        float gap = Math.max(3, 6 * density * scale);
        float signsWidth = waze ? clusterWidth + (average == null ? 0 : gap + diameter) : 0;

        // The cards under it: the nearest alert, then the vehicle ahead (xADAS).
        WazeData.Alert alert = data.alert;
        String distance = alert == null ? null : distance(alert.distance);
        float cardHeight = diameter * 0.55f;
        float cardWidth = 0;
        if (alert != null) {
            digits(cardHeight * 0.5f);
            cardWidth = cardHeight * 0.2f + cardHeight * 0.75f + cardHeight * 0.2f + paint.measureText(distance) + cardHeight * 0.3f;
        }
        boolean showLead = leadMeters >= 0;
        float leadSize = showLead ? Math.max(diameter * 1.2f, 64) : 0;
        float width = Math.max(signsWidth, Math.max(cardWidth, leadSize));

        // Where each part starts, from the top of the overlay.
        float used = clusterHeight;
        float alertTop = 0, leadTop = 0;
        if (alert != null) {
            alertTop = used + (used > 0 ? gap : 0);
            used = alertTop + cardHeight;
        }
        if (showLead) {
            leadTop = used + (used > 0 ? gap : 0);
            used = leadTop + leadSize;
        }

        boolean right = settings.position == OverlaySettings.TOP_RIGHT;
        float margin = 12 * density;
        float left = right ? safe.right - margin - width : safe.left + 112 * density;
        float top = right ? safe.top + margin : safe.top + 136 * density;
        float signsLeft = right ? left + width - signsWidth : left;

        // Where it is, in Maps' display coordinates, for the check of what covers it.
        float height = used;
        bounds = new Rect((int) (left - area.left), (int) (top - area.top),
                (int) (left - area.left + width), (int) (top - area.top + height));
        android.graphics.Point shift = this.shift;
        if (shift == null) return;
        left += shift.x;
        signsLeft += shift.x;
        top += shift.y;

        if (waze) {
            drawLimit(canvas, signsLeft, top, diameter, data.limit);
            boolean over = data.limit >= 10 && data.speed > data.limit || data.overspeed;
            if (style == OverlaySettings.STYLE_BADGE) {
                drawBadge(canvas, signsLeft + currentLeft, top, currentDiameter, data.speed, over);
            } else if (style == OverlaySettings.STYLE_DIAL) {
                drawDial(canvas, signsLeft + currentLeft, top, currentDiameter, data.speed, data.limit, over);
            }
            if (average != null) {
                canvas.drawBitmap(average, null, new RectF(signsLeft + clusterWidth + gap, top,
                        signsLeft + clusterWidth + gap + diameter, top + diameter), image);
            }
        }

        if (showLead) {
            float dialLeft = right ? left + width - leadSize : left;
            drawLead(canvas, dialLeft, top + leadTop, leadSize, leadMeters, leadVerdict, data.speed);
        }

        if (alert != null) {
            float cardTop = top + alertTop;
            float cardLeft = right ? left + width - cardWidth : left;
            RectF card = new RectF(cardLeft, cardTop, cardLeft + cardWidth, cardTop + cardHeight);
            drawCard(canvas, card, cardHeight, 0xCCE0E0E0);
            float iconSize = cardHeight * 0.75f;
            RectF box = new RectF(card.left + cardHeight * 0.2f, card.centerY() - iconSize / 2,
                    card.left + cardHeight * 0.2f + iconSize, card.centerY() + iconSize / 2);
            Bitmap icon = alertIcon(alert);
            if (icon != null) canvas.drawBitmap(icon, null, fit(icon, box), image);
            digits(cardHeight * 0.5f);
            paint.setColor(Color.WHITE);
            paint.setTextAlign(Paint.Align.LEFT);
            Paint.FontMetrics metrics = paint.getFontMetrics();
            canvas.drawText(distance, box.right + cardHeight * 0.2f, card.centerY() - (metrics.ascent + metrics.descent) / 2, paint);
            paint.setTextAlign(Paint.Align.CENTER);
        }
    }

    /** A dark rounded card with a thin rim of [rim]. */
    private void drawCard(Canvas canvas, RectF card, float cardHeight, int rim) {
        float corner = cardHeight * 0.25f;
        paint.setPathEffect(null);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xE61B1F29);
        canvas.drawRoundRect(card, corner, corner, paint);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(Math.max(1.5f, cardHeight * 0.04f));
        paint.setColor(rim);
        canvas.drawRoundRect(card, corner, corner, paint);
        paint.setStyle(Paint.Style.FILL);
        paint.setStrokeWidth(0);
    }

    /**
     * The minimum safe distance to the vehicle ahead, in metres, by speed in km/h (the Vietnamese rule: 35 m at 60,
     * 55 m up to 80, 70 m up to 100, 100 m up to 120). Under 60 the rule leaves it to the driver: it falls in step
     * with the speed here. xADAS does not share its own minimum.
     */
    static float minimumDistance(int speed) {
        if (speed > 100) return 100;
        if (speed > 80) return 70;
        if (speed > 60) return 55;
        return 35f * speed / 60f;
    }

    /**
     * The distance to the vehicle ahead, as xADAS' own small window draws it (xadas-hud-link, docs/hien-thi.md, round
     * screen 240x240, scaled to [size]): a 300 degree ring from 7 o'clock over the top to 5 o'clock, the distance scale
     * from 0 to twice the minimum, a red mark for the minimum at the top, the value arc coloured by the verdict, the
     * number and "m" in the middle, "xADAS" over it and the speed under it.
     */
    private void drawLead(Canvas canvas, float left, float top, float size, int meters, int verdict, int speed) {
        float u = size / 240f, cx = left + size / 2, cy = top + size / 2;
        int color = verdict == 1 ? 0xFF9BE89B : verdict == 2 ? 0xFFFF5252 : 0xFF8C96A0;
        paint.setPathEffect(null);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xF0000000);
        canvas.drawCircle(cx, cy, size / 2, paint);

        float minimum = speed >= 10 ? minimumDistance(speed) : 0;
        RectF ring = new RectF(cx - 100 * u, cy - 100 * u, cx + 100 * u, cy + 100 * u);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(12 * u);
        paint.setStrokeCap(Paint.Cap.ROUND);
        paint.setColor(0xFF1F1F1F);
        canvas.drawArc(ring, 120, 300, false, paint);
        if (minimum > 0) {
            paint.setColor(0xFF571C1C);
            canvas.drawArc(ring, 120, 150, false, paint);
            float share = Math.max(0.02f, Math.min(1f, meters / (2 * minimum)));
            paint.setColor(color);
            canvas.drawArc(ring, 120, 300 * share, false, paint);
            paint.setStrokeCap(Paint.Cap.BUTT);
            paint.setStrokeWidth(5 * u);
            paint.setColor(0xFFFF5252);
            canvas.drawLine(cx, cy - 109 * u, cx, cy - 91 * u, paint);
        }
        paint.setStrokeCap(Paint.Cap.BUTT);
        if (verdict == 2) {
            paint.setStrokeWidth(3 * u);
            paint.setColor(0xFF8C2D2D);
            canvas.drawCircle(cx, cy, 118.5f * u, paint);
        }

        paint.setStyle(Paint.Style.FILL);
        paint.setStrokeWidth(0);
        paint.setTextAlign(Paint.Align.CENTER);
        paint.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        paint.setTextSize(15 * u);
        paint.setColor(0xFF6B737C);
        canvas.drawText("xADAS", cx, top + 62 * u, paint);
        paint.setTextSize((meters >= 100 ? 78 : 92) * u);
        paint.setColor(color);
        centered(canvas, String.valueOf(meters), cx, top + 113 * u);
        paint.setTextSize(24 * u);
        paint.setColor((color & 0x00FFFFFF) | 0xBF000000);
        canvas.drawText("m", cx, top + 172 * u, paint);
        if (speed >= 0) {
            paint.setTextSize(20 * u);
            paint.setColor(0xFFA3ACB5);
            canvas.drawText(speed + " km/h", cx, top + 226 * u, paint);
        }
        paint.setTypeface(Typeface.DEFAULT);
    }

    /** The maximum speed sign: a red disc with an inset white face and the limit ("--" when none). */
    private void drawLimit(Canvas canvas, float left, float top, float diameter, int limit) {
        float radius = diameter / 2, cx = left + radius, cy = top + radius;
        paint.setPathEffect(null);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xFFE6261F);
        canvas.drawCircle(cx, cy, radius, paint);
        paint.setColor(Color.WHITE);
        canvas.drawCircle(cx, cy, radius * 0.79f, paint);
        String text = limit >= 10 ? String.valueOf(limit) : "--";
        float size = diameter * 0.43f;
        paint.setColor(Color.BLACK);
        paint.setTextSize(text.length() >= 3 ? size * 0.85f : size);
        paint.setTypeface(signFont != null ? signFont : Typeface.DEFAULT_BOLD);
        paint.setTextScaleX(signFont != null ? 1.16f : 1f);
        paint.setTextAlign(Paint.Align.CENTER);
        paint.setStyle(Paint.Style.FILL_AND_STROKE);
        paint.setStrokeWidth(size * 0.035f);
        centered(canvas, text, cx, cy);
        paint.setStyle(Paint.Style.FILL);
        paint.setStrokeWidth(0);
        paint.setTextScaleX(1f);
    }

    /** Style 2: a small pale badge with a dashed rim, blue, or red when too fast. */
    private void drawBadge(Canvas canvas, float left, float top, float diameter, int speed, boolean over) {
        float radius = diameter / 2, cx = left + radius, cy = top + radius;
        paint.setPathEffect(null);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xFFE1E5E9);
        canvas.drawCircle(cx, cy, radius, paint);
        float stroke = Math.max(2, diameter * 0.035f);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(stroke);
        paint.setPathEffect(new DashPathEffect(new float[]{Math.max(3, diameter * 0.10f), Math.max(2, diameter * 0.06f)}, 0));
        paint.setColor(over ? 0xFFFF3B30 : 0xFF168DE2);
        canvas.drawCircle(cx, cy, radius - stroke / 2, paint);
        paint.setPathEffect(null);
        paint.setStyle(Paint.Style.FILL);
        paint.setStrokeWidth(0);
        digits(diameter * 0.43f, speed);
        paint.setColor(over ? 0xFFFF3B30 : 0xFF17191D);
        centered(canvas, speed >= 0 ? String.valueOf(speed) : "--", cx, cy);
    }

    /** Style 3: a dark dial, its arc filled up to the limit, cyan, or red when too fast. */
    private void drawDial(Canvas canvas, float left, float top, float diameter, int speed, int limit, boolean over) {
        float radius = diameter / 2, cx = left + radius, cy = top + radius;
        paint.setPathEffect(null);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xFF171A22);
        canvas.drawCircle(cx, cy, radius, paint);
        float stroke = Math.max(3, diameter * 0.075f);
        RectF arc = new RectF(left + stroke / 2, top + stroke / 2, left + diameter - stroke / 2, top + diameter - stroke / 2);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(stroke);
        paint.setStrokeCap(Paint.Cap.ROUND);
        paint.setColor(0xFF303642);
        canvas.drawArc(arc, 135, 270, false, paint);
        float max = limit >= 10 ? limit : 160;
        float progress = Math.max(0, Math.min(1, speed / max));
        if (progress > 0) {
            paint.setColor(over ? 0xFFFF3B30 : 0xFF16D8E8);
            canvas.drawArc(arc, 135, 270 * progress, false, paint);
        }
        paint.setStrokeCap(Paint.Cap.BUTT);
        paint.setStyle(Paint.Style.FILL);
        paint.setStrokeWidth(0);
        String value = speed >= 0 ? String.valueOf(speed) : "--";
        digits(diameter * 0.38f, speed);
        paint.setColor(over ? 0xFFFF6259 : Color.WHITE);
        centered(canvas, value, cx, cy - diameter * 0.08f);
        paint.setTypeface(Typeface.DEFAULT);
        paint.setTextSize(diameter * 0.12f);
        paint.setColor(over ? 0xFFFF6259 : 0xFFD8DADF);
        centered(canvas, "Km/h", cx, cy + diameter * 0.29f);
    }

    /** The digits' face (JetBrains Mono Bold, as Waze Mod's), at [size]; three digits a little smaller. */
    private void digits(float size, int value) {
        digits(value >= 100 ? size * 0.78f : size);
    }

    private void digits(float size) {
        paint.setTypeface(digitFont != null ? digitFont : Typeface.DEFAULT_BOLD);
        paint.setTextSize(size);
        paint.setTextScaleX(1f);
        paint.setTextAlign(Paint.Align.CENTER);
    }

    private void centered(Canvas canvas, String text, float cx, float cy) {
        Paint.FontMetrics metrics = paint.getFontMetrics();
        canvas.drawText(text, cx, cy - (metrics.ascent + metrics.descent) / 2, paint);
    }

    private static String distance(int meters) {
        return meters >= 1000 ? String.format(Locale.ROOT, "%.1fKM", meters / 1000f) : meters + "M";
    }

    /** [bitmap] scaled into [box], keeping its proportions. */
    private static RectF fit(Bitmap bitmap, RectF box) {
        float scale = Math.min(box.width() / bitmap.getWidth(), box.height() / bitmap.getHeight());
        float w = bitmap.getWidth() * scale, h = bitmap.getHeight() * scale;
        return new RectF(box.centerX() - w / 2, box.centerY() - h / 2, box.centerX() + w / 2, box.centerY() + h / 2);
    }

    private Bitmap limitIcon(int limit) {
        if (limit < 10 || limit > 120 || limit % 10 != 0) return null;
        return icon("speedLimit/speed_limit_" + limit + ".png");
    }

    private Bitmap alertIcon(WazeData.Alert alert) {
        if (alert.type == 8 && alert.value > 0) {
            Bitmap limit = limitIcon(alert.value);
            if (limit != null) return limit;
        }
        String file = alertFile(alert);
        Bitmap icon = file == null ? null : icon("alerts/" + file);
        return icon != null ? icon : icon("alerts/bigpin_hazard.png");
    }

    private Bitmap icon(String path) {
        if (icons.containsKey(path)) return icons.get(path);
        Bitmap bitmap = null;
        try (InputStream in = assets.open(ICONS + path)) {
            bitmap = BitmapFactory.decodeStream(in);
        } catch (Exception ignored) {
        }
        icons.put(path, bitmap);
        return bitmap;
    }

    /** WazeHUD's icon for each alert type of the Data API (bubble/Signs.kt). */
    private static String alertFile(WazeData.Alert alert) {
        switch (alert.type) {
            case 1: return "bigpin_police.png";
            case 2: return "bigpin_speed_camera.png";
            case 3: return "bigpin_red_light_camera.png";
            case 4: return "bigpin_hazard.png";
            case 5: return "bigpin_accident.png";
            case 6: return "bigpin_traffic_" + Math.max(1, Math.min(4, alert.severity > 0 ? alert.severity : 1)) + ".png";
            case 7: case 38: return "bigpin_closure.png";
            case 9: return "no_passing_in.png";
            case 10: return "no_passing_out.png";
            case 11: return "bigpin_railroad.png";
            case 12: return "bigpin_permanent_hazard_toll_booth.png";
            case 13: return "bigpin_hazard_stopped.png";
            case 14: return "bigpin_hazard_construction.png";
            case 15: return "bigpin_hazard_pothole.png";
            case 16: return "bigpin_bad_weather.png";
            case 17: return "bigpin_blocked_lane.png";
            case 18: return "bigpin_permanent_hazard_intersection.png";
            case 19: return "loi_ra.png";
            case 20: case 21: return "bigpin_parking.png";
            case 22: case 25: return "end_of_previous_prohibitions.png";
            case 23: return "residential_area_start.png";
            case 24: return "residential_area_end.png";
            case 26: case 35: return "cam_oto.png";
            case 27: case 36: return "cam_xe_may.png";
            case 28: case 67: case 68: case 72: return "no_left_turn.png";
            case 29: case 65: case 73: return "no_right_turn.png";
            case 30: case 74: return "no_u_turn.png";
            case 31: case 32: return "only_go_straight.png";
            case 33: return "only_turn_right.png";
            case 34: return "only_turn_left.png";
            case 37: case 60: return "bigpin_permanent_hazard_fork.png";
            case 39: case 66: case 69: return "no_left_and_u_turn.png";
            case 40: return "bigpin_phone_camera.png";
            case 41: return "bigpin_dummy_camera.png";
            case 42: return "bigpin_seatbelt_camera.png";
            case 43: return "bigpin_distance_between_vehicles_camera.png";
            case 44: return "bigpin_bus_lane_cam.png";
            case 45: return "bigpin_noise_camera.png";
            case 46: return "bigpin_stop_sign_camera.png";
            case 47: return "bigpin_animal.png";
            case 48: return "bigpin_hazard_object_on_road.png";
            case 49: return "bigpin_hazard_roadkill.png";
            case 50: return "bigpin_hazard_weather_flood.png";
            case 51: return "bigpin_hazard_weather_fog.png";
            case 52: return "bigpin_hazard_weather_hail.png";
            case 53: return "bigpin_hazard_weather_snow.png";
            case 54: return "bigpin_hazard_weather_ice.png";
            case 55: return "bigpin_slippery_road.png";
            case 56: return "bigpin_permanent_hazard_speed_bumps.png";
            case 57: return "bigpin_permanent_hazard_school_zone.png";
            case 58: return "bigpin_permanent_hazard_lanes_merging.png";
            case 59: return "bigpin_permanent_hazard_dangerous_curves.png";
            case 61: return "bigpin_hazard_broken_light.png";
            case 62: return "bigpin_cyclist.png";
            case 63: return "bigpin_emergency_vehicle.png";
            case 64: return "bigpin_personal_safety_a.png";
            case 70: case 71: return "no_right_and_u_turn.png";
            case 75: return "bigpin_traffic_light.png";
            default: return null;
        }
    }
}
