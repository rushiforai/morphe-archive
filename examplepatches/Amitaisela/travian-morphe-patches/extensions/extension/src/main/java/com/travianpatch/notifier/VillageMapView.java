package com.travianpatch.notifier;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.DashPathEffect;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.view.MotionEvent;
import android.view.View;

import java.util.ArrayList;
import java.util.List;

/**
 * Draws a village's slots where the game's own screens put them (VillageLayout): the fields around the
 * village, or the buildings inside the village with the wall as a ring around them. Each slot shows its
 * level; a slot the game is building shows a hammer, a slot in the app's queue shows "→ N". Tapping a slot
 * reports its id.
 */
final class VillageMapView extends View {

    interface OnSlot {
        void tapped(int slotId);
    }

    static final class Spot {
        final int slotId, typeId, level, gameQueued, planned;
        final String name;

        Spot(int slotId, int typeId, int level, int gameQueued, int planned, String name) {
            this.slotId = slotId;
            this.typeId = typeId;
            this.level = level;
            this.gameQueued = gameQueued;
            this.planned = planned;
            this.name = name;
        }
    }

    private final boolean fields;
    private final int distribution;
    private final List<Spot> spots;
    private final Spot wall;
    private final OnSlot listener;
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint text = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final List<float[]> placed = new ArrayList<float[]>();
    private float radius;
    private final RectF ring = new RectF();

    /** fields: slots 1-18 around the village; otherwise slots 19+ (the wall, slot 40, becomes the ring). */
    VillageMapView(Context ctx, boolean fields, int distribution, List<Spot> all, OnSlot listener) {
        super(ctx);
        this.fields = fields;
        this.distribution = distribution;
        this.listener = listener;
        this.spots = new ArrayList<Spot>();
        Spot wallSpot = null;
        for (Spot s : all) {
            if (fields ? s.slotId <= 18 : s.slotId >= 19) {
                if (!fields && s.slotId == BuildChoices.WALL_SLOT) {
                    wallSpot = s;
                } else if (VillageLayout.position(s.slotId, distribution) != null) {
                    spots.add(s);
                }
            }
        }
        this.wall = wallSpot;
        text.setTextAlign(Paint.Align.CENTER);
    }

    @Override
    protected void onMeasure(int widthSpec, int heightSpec) {
        int w = MeasureSpec.getSize(widthSpec);
        setMeasuredDimension(w, (int) (w * (fields ? 0.78f : 0.82f)));
    }

    @Override
    protected void onDraw(Canvas c) {
        boolean dark = UiKit.dark(getContext());
        float w = getWidth(), h = getHeight();
        double minX = Double.MAX_VALUE, maxX = -Double.MAX_VALUE, minY = Double.MAX_VALUE, maxY = -Double.MAX_VALUE;
        for (Spot s : spots) {
            double[] p = VillageLayout.position(s.slotId, distribution);
            minX = Math.min(minX, p[0]);
            maxX = Math.max(maxX, p[0]);
            minY = Math.min(minY, p[1]);
            maxY = Math.max(maxY, p[1]);
        }
        if (spots.isEmpty()) {
            return;
        }
        radius = Math.min(w, h) * (fields ? 0.065f : 0.058f);
        float pad = radius * (fields ? 1.3f : 2.2f);
        double sx = (w - 2 * pad) / Math.max(0.01, maxX - minX);
        double sy = (h - 2 * pad - radius) / Math.max(0.01, maxY - minY);
        double scale = Math.min(sx, sy);
        float offX = (float) ((w - (maxX - minX) * scale) / 2);
        float offY = (float) ((h - radius - (maxY - minY) * scale) / 2);

        // Ground: fields sit on grass around the village; the village sits inside its wall.
        fill.setStyle(Paint.Style.FILL);
        fill.setColor(dark ? 0xFF1F2A1A : 0xFFE3EDD5);
        RectF ground = new RectF(offX - pad * 0.7f, offY - pad * 0.7f,
                (float) (offX + (maxX - minX) * scale + pad * 0.7f), (float) (offY + (maxY - minY) * scale + pad * 0.7f));
        c.drawOval(ground, fill);
        if (fields) {
            fill.setColor(dark ? 0xFF3A332A : 0xFFD9CBB4);
            c.drawCircle(ground.centerX(), ground.centerY(), radius * 1.1f, fill);
            text.setColor(UiKit.mutedColor(getContext()));
            text.setTextSize(radius * 0.42f);
            text.setTypeface(Typeface.DEFAULT);
            c.drawText("village", ground.centerX(), ground.centerY() + radius * 0.15f, text);
        } else {
            ring.set(ground.left + pad * 0.25f, ground.top + pad * 0.25f, ground.right - pad * 0.25f,
                    ground.bottom - pad * 0.25f);
            boolean hasWall = wall != null && wall.typeId != 0;
            stroke.setStyle(Paint.Style.STROKE);
            stroke.setStrokeWidth(radius * (hasWall ? 0.35f : 0.18f));
            stroke.setColor(hasWall ? (dark ? 0xFF8C7A5C : 0xFFA88F63) : UiKit.mutedColor(getContext()));
            stroke.setPathEffect(hasWall ? null : new DashPathEffect(new float[]{radius * 0.5f, radius * 0.35f}, 0));
            c.drawOval(ring, stroke);
            stroke.setPathEffect(null);
            if (wall != null) {
                drawSpot(c, wall, ring.centerX(), ring.bottom, dark, true);
            }
        }

        placed.clear();
        for (Spot s : spots) {
            double[] p = VillageLayout.position(s.slotId, distribution);
            float x = (float) (offX + (p[0] - minX) * scale);
            float y = (float) (offY + (maxY - p[1]) * scale);
            drawSpot(c, s, x, y, dark, false);
        }
    }

    private void drawSpot(Canvas c, Spot s, float x, float y, boolean dark, boolean isWall) {
        placed.add(new float[]{x, y, s.slotId});
        boolean empty = s.typeId == 0;
        fill.setStyle(Paint.Style.FILL);
        fill.setColor(empty ? (dark ? 0x22FFFFFF : 0x22000000) : colorFor(s.typeId, dark));
        c.drawCircle(x, y, radius, fill);
        stroke.setStyle(Paint.Style.STROKE);
        stroke.setStrokeWidth(radius * 0.12f);
        stroke.setColor(s.gameQueued > s.level ? UiKit.accentText(getContext())
                : empty ? UiKit.mutedColor(getContext()) : (dark ? 0xFF55504A : 0xFFB9B0A5));
        if (empty) {
            stroke.setPathEffect(new DashPathEffect(new float[]{radius * 0.3f, radius * 0.25f}, 0));
        }
        c.drawCircle(x, y, radius, stroke);
        stroke.setPathEffect(null);

        text.setTypeface(Typeface.DEFAULT_BOLD);
        text.setColor(UiKit.textColor(getContext()));
        text.setTextSize(radius * (empty ? 0.8f : 0.95f));
        c.drawText(empty ? "+" : String.valueOf(s.level), x, y + radius * 0.33f, text);

        String badge = s.gameQueued > s.level ? "⚒" + s.gameQueued : "";
        if (s.planned > Math.max(s.level, s.gameQueued)) {
            badge += (badge.isEmpty() ? "" : " ") + "→" + s.planned;
        }
        if (!badge.isEmpty()) {
            text.setTypeface(Typeface.DEFAULT_BOLD);
            text.setTextSize(radius * 0.5f);
            float bw = text.measureText(badge) + radius * 0.4f;
            RectF pill = new RectF(x + radius * 0.2f, y - radius * 1.35f, x + radius * 0.2f + bw, y - radius * 0.65f);
            fill.setColor(UiKit.ACCENT);
            c.drawRoundRect(pill, radius * 0.35f, radius * 0.35f, fill);
            text.setColor(0xFFFFFFFF);
            c.drawText(badge, pill.centerX(), pill.bottom - radius * 0.18f, text);
        }
        if (!fields || isWall) {
            text.setTypeface(Typeface.DEFAULT);
            text.setTextSize(radius * 0.42f);
            text.setColor(UiKit.mutedColor(getContext()));
            c.drawText(shortName(s, isWall), x, y + radius * 1.55f, text);
        }
    }

    private static String shortName(Spot s, boolean isWall) {
        if (s.typeId == 0) {
            return isWall ? "wall" : s.slotId == BuildChoices.RALLY_POINT_SLOT ? "rally point" : "slot " + s.slotId;
        }
        String n = s.name;
        return n.length() <= 13 ? n : n.substring(0, 12) + "…";
    }

    private static int colorFor(int typeId, boolean dark) {
        switch (typeId) {
            case 1: // woodcutter
                return dark ? 0xFF3C5A2A : 0xFFB9D59A;
            case 2: // clay pit
                return dark ? 0xFF6A3E26 : 0xFFE7B695;
            case 3: // iron mine
                return dark ? 0xFF4A4F57 : 0xFFC4CAD2;
            case 4: // cropland
                return dark ? 0xFF6B5A1E : 0xFFF1DC8A;
            default:
                return dark ? 0xFF3A3632 : 0xFFF6F1EA;
        }
    }

    @Override
    public boolean onTouchEvent(MotionEvent e) {
        if (e.getAction() == MotionEvent.ACTION_DOWN) {
            return true;
        }
        if (e.getAction() != MotionEvent.ACTION_UP) {
            return super.onTouchEvent(e);
        }
        float best = Float.MAX_VALUE;
        int slot = 0;
        for (float[] p : placed) {
            float d = (float) Math.hypot(p[0] - e.getX(), p[1] - e.getY());
            if (d < best) {
                best = d;
                slot = (int) p[2];
            }
        }
        if (!fields && wall != null) {
            // Anywhere on the wall ring counts as the wall.
            float rx = ring.width() / 2, ry = ring.height() / 2;
            double nx = (e.getX() - ring.centerX()) / rx, ny = (e.getY() - ring.centerY()) / ry;
            double off = Math.abs(Math.hypot(nx, ny) - 1) * Math.min(rx, ry);
            if (off < radius * 0.8f && off < best) {
                best = 0;
                slot = BuildChoices.WALL_SLOT;
            }
        }
        if (slot != 0 && best < radius * 1.6f) {
            performClick();
            listener.tapped(slot);
        }
        return true;
    }

    @Override
    public boolean performClick() {
        return super.performClick();
    }
}
