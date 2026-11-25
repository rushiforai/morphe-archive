package dev.materialtidal.extension.tidal.sheets;

import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

import java.util.Locale;

/**
 * Custom crisp Material 3 Expressive 24dp-grid vector icon kit for TIDAL context menus
 * (Song-Actions & Playlist-Actions), designed for high contrast and instant legibility.
 */
final class ExpressiveContextMenuIcons {

    private static final int ICON_PLAY_NEXT = 1;
    private static final int ICON_ADD_TO_QUEUE = 2;
    private static final int ICON_ADD_TO_PLAYLIST = 3;
    private static final int ICON_ADD_PLUS = 4;
    private static final int ICON_MOVE_TO_PLAYLIST = 5;
    private static final int ICON_HEART_OUTLINE = 6;
    private static final int ICON_HEART_FILLED = 7;
    private static final int ICON_ALBUM = 8;
    private static final int ICON_ARTIST = 9;
    private static final int ICON_RADIO = 10;
    private static final int ICON_SHARE = 11;
    private static final int ICON_COPY_LINK = 12;
    private static final int ICON_DOWNLOAD = 13;
    private static final int ICON_EDIT = 14;
    private static final int ICON_DELETE = 15;
    private static final int ICON_REMOVE = 16;
    private static final int ICON_CLOSE_X = 17;
    private static final int ICON_PRIVACY_LOCK = 18;
    private static final int ICON_PUBLIC_GLOBE = 19;
    private static final int ICON_INFO = 20;
    private static final int ICON_CREDITS = 21;
    private static final int ICON_BLOCK = 22;
    private static final int ICON_BOOKMARK_OUTLINE = 23;
    private static final int ICON_BOOKMARK_FILLED = 24;
    private static final int ICON_SHUFFLE = 25;
    private static final int ICON_SLEEP_OUTLINE = 26;
    private static final int ICON_SLEEP_FILLED = 27;
    private static final int ICON_COLLABORATORS = 28;
    private static final int ICON_CREATE_FOLDER = 29;
    private static final int ICON_MOVE_TO_FOLDER = 30;
    private static final int ICON_LEAVE = 31;
    private static final int ICON_REPORT_FLAG = 32;
    private static final int ICON_PURCHASE_TAG = 33;
    private static final int ICON_SPARKLE = 34;
    private static final int ICON_MORE = 35;
    private static final int ICON_PLAY = 36;
    private static final int ICON_PAUSE = 37;
    private static final int ICON_CROSSFADE = 38;

    private ExpressiveContextMenuIcons() {
    }

    static boolean isDestructiveDrawableName(String name) {
        if (name == null) {
            return false;
        }
        switch (name) {
            case "ic_delete":
            case "ic_remove":
            case "ic_block":
            case "ic_leave":
            case "ic_report":
            case "ic_report_20dp":
            case "ic_objects_flag_large":
                return true;
            default:
                return false;
        }
    }

    static boolean isAccentFilledDrawableName(String name) {
        if (name == null) {
            return false;
        }
        switch (name) {
            case "ic_favorite_filled":
            case "ic_bookmark_filled":
            case "ic_sleep_timer_filled":
                return true;
            default:
                return false;
        }
    }

    static Drawable createIcon(
            float density,
            String drawableResName,
            String fallbackTitle,
            boolean isCrossfadeItem
    ) {
        int kind = resolveIconKind(drawableResName, fallbackTitle, isCrossfadeItem);
        if (kind == 0) {
            return null;
        }
        int intrinsicPx = Math.max(24, Math.round(24f * density));
        return new ExpressiveVectorIconDrawable(kind, intrinsicPx);
    }

    private static int resolveIconKind(
            String name,
            String fallbackTitle,
            boolean isCrossfadeItem
    ) {
        if (isCrossfadeItem) {
            return ICON_CROSSFADE;
        }
        if (name != null) {
            switch (name) {
                case "ic_play_next":
                    return ICON_PLAY_NEXT;
                case "ic_add_to_queue_last":
                    return ICON_ADD_TO_QUEUE;
                case "ic_add_to_playlist":
                    return ICON_ADD_TO_PLAYLIST;
                case "ic_add_24dp_cyan":
                    return ICON_ADD_PLUS;
                case "ic_move_to_playlist":
                case "ic_move_playlist":
                    return ICON_MOVE_TO_PLAYLIST;
                case "ic_favorite_cyan":
                    return ICON_HEART_OUTLINE;
                case "ic_favorite_filled":
                    return ICON_HEART_FILLED;
                case "ic_album":
                    return ICON_ALBUM;
                case "ic_artist":
                    return ICON_ARTIST;
                case "ic_radio":
                    return ICON_RADIO;
                case "ic_share":
                case "ic_twitter":
                    return ICON_SHARE;
                case "ic_copy_link":
                    return ICON_COPY_LINK;
                case "ic_downloaded":
                    return ICON_DOWNLOAD;
                case "ic_edit_mode":
                case "ic_rename":
                    return ICON_EDIT;
                case "ic_delete":
                    return ICON_DELETE;
                case "ic_remove":
                    return ICON_REMOVE;
                case "ic_cross_24dp":
                    return ICON_CLOSE_X;
                case "ic_private_24dp":
                    return ICON_PRIVACY_LOCK;
                case "ic_public_24dp":
                    return ICON_PUBLIC_GLOBE;
                case "ic_info":
                    return ICON_INFO;
                case "ic_contributors":
                    return ICON_CREDITS;
                case "ic_block":
                    return ICON_BLOCK;
                case "ic_bookmark":
                    return ICON_BOOKMARK_OUTLINE;
                case "ic_bookmark_filled":
                    return ICON_BOOKMARK_FILLED;
                case "ic_shuffle":
                    return ICON_SHUFFLE;
                case "ic_sleep_timer":
                    return ICON_SLEEP_OUTLINE;
                case "ic_sleep_timer_filled":
                    return ICON_SLEEP_FILLED;
                case "ic_collaborators":
                    return ICON_COLLABORATORS;
                case "ic_create_folder":
                    return ICON_CREATE_FOLDER;
                case "ic_move_to_folder":
                    return ICON_MOVE_TO_FOLDER;
                case "ic_leave":
                    return ICON_LEAVE;
                case "ic_report":
                case "ic_report_20dp":
                case "ic_objects_flag_large":
                    return ICON_REPORT_FLAG;
                case "ic_purchase_tag":
                    return ICON_PURCHASE_TAG;
                case "ic_sparkle":
                case "ic_sparkle_12":
                    return ICON_SPARKLE;
                case "ic_more":
                    return ICON_MORE;
                case "ic_media_play_regular":
                    return ICON_PLAY;
                case "ic_media_pause_regular":
                    return ICON_PAUSE;
                default:
                    break;
            }
        }
        if (fallbackTitle != null) {
            String lower = fallbackTitle.toLowerCase(Locale.ROOT);
            if (lower.contains("crossfade")) {
                return ICON_CROSSFADE;
            }
        }
        return 0;
    }

    private static final class ExpressiveVectorIconDrawable extends Drawable {

        private final int kind;
        private final int intrinsicPx;
        private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final RectF arcRect = new RectF();

        private ColorStateList tintList;
        private int currentTintColor = 0xFFFFFFFF;
        private int alpha = 255;
        private ColorFilter externalColorFilter;

        ExpressiveVectorIconDrawable(int kind, int intrinsicPx) {
            this.kind = kind;
            this.intrinsicPx = intrinsicPx;

            strokePaint.setStyle(Paint.Style.STROKE);
            strokePaint.setStrokeCap(Paint.Cap.ROUND);
            strokePaint.setStrokeJoin(Paint.Join.ROUND);
            strokePaint.setStrokeWidth(2.05f);

            fillPaint.setStyle(Paint.Style.FILL);
        }

        @Override
        public int getIntrinsicWidth() {
            return intrinsicPx;
        }

        @Override
        public int getIntrinsicHeight() {
            return intrinsicPx;
        }

        @Override
        public void setTint(int tintColor) {
            setTintList(ColorStateList.valueOf(tintColor));
        }

        @Override
        public void setTintList(ColorStateList tint) {
            this.tintList = tint;
            updateTintFromState(getState());
            invalidateSelf();
        }

        @Override
        public void setTintMode(PorterDuff.Mode tintMode) {
        }

        @Override
        public boolean isStateful() {
            return (tintList != null && tintList.isStateful()) || super.isStateful();
        }

        @Override
        protected boolean onStateChange(int[] state) {
            boolean changed = updateTintFromState(state);
            if (changed) {
                invalidateSelf();
            }
            return changed || super.onStateChange(state);
        }

        private boolean updateTintFromState(int[] state) {
            int nextColor = tintList != null
                    ? tintList.getColorForState(state, tintList.getDefaultColor())
                    : 0xFFFFFFFF;
            if (nextColor != currentTintColor) {
                currentTintColor = nextColor;
                return true;
            }
            return false;
        }

        @Override
        public void setAlpha(int alpha) {
            if (this.alpha != alpha) {
                this.alpha = Math.max(0, Math.min(255, alpha));
                invalidateSelf();
            }
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            this.externalColorFilter = colorFilter;
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }

        private int resolvedArgb() {
            int baseAlpha = Color.alpha(currentTintColor);
            int finalAlpha = (baseAlpha * alpha) / 255;
            return (currentTintColor & 0x00FFFFFF) | (finalAlpha << 24);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) {
                return;
            }
            int col = resolvedArgb();
            strokePaint.setColor(col);
            fillPaint.setColor(col);
            strokePaint.setColorFilter(externalColorFilter);
            fillPaint.setColorFilter(externalColorFilter);
            strokePaint.setStrokeWidth(2.05f);

            float w = b.width();
            float h = b.height();
            float s = Math.min(w, h) / 24f;
            float dx = b.left + (w - 24f * s) * 0.5f;
            float dy = b.top + (h - 24f * s) * 0.5f;

            canvas.save();
            canvas.translate(dx, dy);
            canvas.scale(s, s);
            drawGlyph(canvas);
            canvas.restore();
        }

        private void drawGlyph(Canvas c) {
            switch (kind) {
                case ICON_PLAY_NEXT: {
                    // Crisp filled play triangle on left + 3 queue bars on right
                    path.reset();
                    path.moveTo(4.0f, 6.8f);
                    path.lineTo(11.2f, 12.0f);
                    path.lineTo(4.0f, 17.2f);
                    path.close();
                    c.drawPath(path, fillPaint);
                    c.drawPath(path, strokePaint);
                    c.drawLine(14.0f, 7.2f, 20.5f, 7.2f, strokePaint);
                    c.drawLine(14.0f, 12.0f, 20.5f, 12.0f, strokePaint);
                    c.drawLine(14.0f, 16.8f, 20.5f, 16.8f, strokePaint);
                    break;
                }
                case ICON_ADD_TO_QUEUE: {
                    // Queue bars + bold bottom-right plus
                    c.drawLine(3.8f, 6.8f, 20.0f, 6.8f, strokePaint);
                    c.drawLine(3.8f, 11.8f, 13.0f, 11.8f, strokePaint);
                    c.drawLine(3.8f, 16.8f, 11.0f, 16.8f, strokePaint);
                    c.drawLine(17.5f, 12.5f, 17.5f, 19.5f, strokePaint);
                    c.drawLine(14.0f, 16.0f, 21.0f, 16.0f, strokePaint);
                    break;
                }
                case ICON_ADD_TO_PLAYLIST: {
                    // Music note notehead + playlist lines + crisp plus
                    c.drawLine(3.8f, 6.5f, 16.5f, 6.5f, strokePaint);
                    c.drawLine(3.8f, 11.5f, 16.5f, 11.5f, strokePaint);
                    c.drawLine(3.8f, 16.5f, 10.5f, 16.5f, strokePaint);
                    c.drawLine(17.2f, 13.2f, 17.2f, 19.8f, strokePaint);
                    c.drawLine(13.9f, 16.5f, 20.5f, 16.5f, strokePaint);
                    break;
                }
                case ICON_ADD_PLUS: {
                    // Clean circular plus badge
                    c.drawCircle(12f, 12f, 9f, strokePaint);
                    c.drawLine(12f, 8.2f, 12f, 15.8f, strokePaint);
                    c.drawLine(8.2f, 12f, 15.8f, 12f, strokePaint);
                    break;
                }
                case ICON_MOVE_TO_PLAYLIST: {
                    // Stacked list lines + crisp forward arrow
                    c.drawLine(3.8f, 6.8f, 17.5f, 6.8f, strokePaint);
                    c.drawLine(3.8f, 11.8f, 12.0f, 11.8f, strokePaint);
                    c.drawLine(3.8f, 16.8f, 10.5f, 16.8f, strokePaint);
                    c.drawLine(13.5f, 16.5f, 20.5f, 16.5f, strokePaint);
                    path.reset();
                    path.moveTo(17.2f, 13.3f);
                    path.lineTo(20.5f, 16.5f);
                    path.lineTo(17.2f, 19.7f);
                    c.drawPath(path, strokePaint);
                    break;
                }
                case ICON_HEART_OUTLINE:
                case ICON_HEART_FILLED: {
                    path.reset();
                    path.moveTo(12.0f, 20.2f);
                    path.cubicTo(6.6f, 16.0f, 3.3f, 12.6f, 3.3f, 8.7f);
                    path.cubicTo(3.3f, 5.8f, 5.6f, 3.8f, 8.2f, 3.8f);
                    path.cubicTo(9.9f, 3.8f, 11.3f, 4.7f, 12.0f, 6.1f);
                    path.cubicTo(12.7f, 4.7f, 14.1f, 3.8f, 15.8f, 3.8f);
                    path.cubicTo(18.4f, 3.8f, 20.7f, 5.8f, 20.7f, 8.7f);
                    path.cubicTo(20.7f, 12.6f, 17.4f, 16.0f, 12.0f, 20.2f);
                    path.close();
                    if (kind == ICON_HEART_FILLED) {
                        c.drawPath(path, fillPaint);
                    } else {
                        c.drawPath(path, strokePaint);
                    }
                    break;
                }
                case ICON_ALBUM: {
                    // Clean vinyl disc with inner ring & spindle dot
                    c.drawCircle(12f, 12f, 9f, strokePaint);
                    c.drawCircle(12f, 12f, 3.1f, strokePaint);
                    c.drawCircle(12f, 12f, 1.0f, fillPaint);
                    break;
                }
                case ICON_ARTIST: {
                    // Bold person bust (head + rounded shoulders arch)
                    c.drawCircle(12f, 7.6f, 3.6f, strokePaint);
                    path.reset();
                    path.moveTo(4.8f, 20.0f);
                    path.cubicTo(4.8f, 15.9f, 8.0f, 14.0f, 12.0f, 14.0f);
                    path.cubicTo(16.0f, 14.0f, 19.2f, 15.9f, 19.2f, 20.0f);
                    c.drawPath(path, strokePaint);
                    break;
                }
                case ICON_RADIO: {
                    // Broadcast tower dot + symmetric signal arcs
                    c.drawCircle(12f, 12f, 2.2f, fillPaint);
                    arcRect.set(7.0f, 7.0f, 17.0f, 17.0f);
                    c.drawArc(arcRect, -48f, 96f, false, strokePaint);
                    c.drawArc(arcRect, 132f, 96f, false, strokePaint);
                    arcRect.set(3.5f, 3.5f, 20.5f, 20.5f);
                    c.drawArc(arcRect, -50f, 100f, false, strokePaint);
                    c.drawArc(arcRect, 130f, 100f, false, strokePaint);
                    break;
                }
                case ICON_SHARE: {
                    // Iconic 3-node Material share graph
                    c.drawLine(8.2f, 10.9f, 15.3f, 6.9f, strokePaint);
                    c.drawLine(8.2f, 13.1f, 15.3f, 17.1f, strokePaint);
                    c.drawCircle(17.5f, 5.6f, 2.5f, fillPaint);
                    c.drawCircle(6.2f, 12.0f, 2.5f, fillPaint);
                    c.drawCircle(17.5f, 18.4f, 2.5f, fillPaint);
                    break;
                }
                case ICON_COPY_LINK: {
                    // Interlocked horizontal chain links
                    path.reset();
                    path.moveTo(10.0f, 16.2f);
                    path.lineTo(7.5f, 16.2f);
                    path.cubicTo(5.0f, 16.2f, 3.3f, 14.4f, 3.3f, 12.0f);
                    path.cubicTo(3.3f, 9.6f, 5.0f, 7.8f, 7.5f, 7.8f);
                    path.lineTo(10.0f, 7.8f);
                    c.drawPath(path, strokePaint);

                    path.reset();
                    path.moveTo(14.0f, 7.8f);
                    path.lineTo(16.5f, 7.8f);
                    path.cubicTo(19.0f, 7.8f, 20.7f, 9.6f, 20.7f, 12.0f);
                    path.cubicTo(20.7f, 14.4f, 19.0f, 16.2f, 16.5f, 16.2f);
                    path.lineTo(14.0f, 16.2f);
                    c.drawPath(path, strokePaint);

                    c.drawLine(8.5f, 12.0f, 15.5f, 12.0f, strokePaint);
                    break;
                }
                case ICON_DOWNLOAD: {
                    // Crisp arrow into rounded download tray
                    c.drawLine(12f, 4.2f, 12f, 14.8f, strokePaint);
                    path.reset();
                    path.moveTo(7.8f, 11.2f);
                    path.lineTo(12f, 15.3f);
                    path.lineTo(16.2f, 11.2f);
                    c.drawPath(path, strokePaint);

                    path.reset();
                    path.moveTo(4.8f, 16.0f);
                    path.lineTo(4.8f, 18.4f);
                    path.quadTo(4.8f, 19.8f, 6.2f, 19.8f);
                    path.lineTo(17.8f, 19.8f);
                    path.quadTo(19.2f, 19.8f, 19.2f, 18.4f);
                    path.lineTo(19.2f, 16.0f);
                    c.drawPath(path, strokePaint);
                    break;
                }
                case ICON_EDIT: {
                    // Crisp Material diagonal pencil
                    path.reset();
                    path.moveTo(4.5f, 19.5f);
                    path.lineTo(5.4f, 15.2f);
                    path.lineTo(15.6f, 5.0f);
                    path.quadTo(16.8f, 3.8f, 18.0f, 5.0f);
                    path.lineTo(19.0f, 6.0f);
                    path.quadTo(20.2f, 7.2f, 19.0f, 8.4f);
                    path.lineTo(8.8f, 18.6f);
                    path.close();
                    c.drawPath(path, strokePaint);
                    c.drawLine(13.8f, 6.8f, 17.2f, 10.2f, strokePaint);
                    break;
                }
                case ICON_DELETE: {
                    // Crisp rounded trash can + lid
                    c.drawLine(4.8f, 7.0f, 19.2f, 7.0f, strokePaint);
                    path.reset();
                    path.moveTo(9.4f, 7.0f);
                    path.lineTo(9.4f, 5.0f);
                    path.quadTo(9.4f, 4.0f, 10.4f, 4.0f);
                    path.lineTo(13.6f, 4.0f);
                    path.quadTo(14.6f, 4.0f, 14.6f, 5.0f);
                    path.lineTo(14.6f, 7.0f);
                    c.drawPath(path, strokePaint);

                    path.reset();
                    path.moveTo(6.6f, 7.2f);
                    path.lineTo(7.4f, 18.6f);
                    path.quadTo(7.5f, 20.0f, 8.9f, 20.0f);
                    path.lineTo(15.1f, 20.0f);
                    path.quadTo(16.5f, 20.0f, 16.6f, 18.6f);
                    path.lineTo(17.4f, 7.2f);
                    c.drawPath(path, strokePaint);

                    c.drawLine(10.3f, 10.5f, 10.3f, 16.4f, strokePaint);
                    c.drawLine(13.7f, 10.5f, 13.7f, 16.4f, strokePaint);
                    break;
                }
                case ICON_REMOVE: {
                    // Circle with clear minus bar
                    c.drawCircle(12f, 12f, 9f, strokePaint);
                    c.drawLine(8.0f, 12f, 16.0f, 12f, strokePaint);
                    break;
                }
                case ICON_CLOSE_X: {
                    c.drawLine(6.2f, 6.2f, 17.8f, 17.8f, strokePaint);
                    c.drawLine(17.8f, 6.2f, 6.2f, 17.8f, strokePaint);
                    break;
                }
                case ICON_PRIVACY_LOCK: {
                    // Clean padlock body + shackle + keyhole
                    arcRect.set(5.5f, 10.6f, 18.5f, 20.2f);
                    c.drawRoundRect(arcRect, 2.6f, 2.6f, strokePaint);
                    arcRect.set(8.2f, 4.3f, 15.8f, 11.9f);
                    c.drawArc(arcRect, 180f, 180f, false, strokePaint);
                    c.drawLine(8.2f, 8.1f, 8.2f, 10.6f, strokePaint);
                    c.drawLine(15.8f, 8.1f, 15.8f, 10.6f, strokePaint);
                    c.drawCircle(12f, 15.4f, 1.35f, fillPaint);
                    break;
                }
                case ICON_PUBLIC_GLOBE: {
                    // Clean legible globe
                    c.drawCircle(12f, 12f, 9f, strokePaint);
                    c.drawLine(3.2f, 12f, 20.8f, 12f, strokePaint);
                    arcRect.set(8.2f, 3.1f, 15.8f, 20.9f);
                    c.drawOval(arcRect, strokePaint);
                    break;
                }
                case ICON_INFO: {
                    c.drawCircle(12f, 12f, 9f, strokePaint);
                    c.drawCircle(12f, 7.9f, 1.2f, fillPaint);
                    c.drawLine(12f, 11.2f, 12f, 16.4f, strokePaint);
                    break;
                }
                case ICON_CREDITS: {
                    // Person & track credit lines
                    c.drawCircle(8.4f, 8.4f, 2.7f, strokePaint);
                    path.reset();
                    path.moveTo(4.0f, 18.4f);
                    path.cubicTo(4.0f, 15.2f, 6.0f, 13.7f, 8.4f, 13.7f);
                    path.cubicTo(10.8f, 13.7f, 12.8f, 15.2f, 12.8f, 18.4f);
                    c.drawPath(path, strokePaint);
                    c.drawLine(14.5f, 8.2f, 20.4f, 8.2f, strokePaint);
                    c.drawLine(14.5f, 12.2f, 20.4f, 12.2f, strokePaint);
                    c.drawLine(15.6f, 16.2f, 20.4f, 16.2f, strokePaint);
                    break;
                }
                case ICON_BLOCK: {
                    c.drawCircle(12f, 12f, 9f, strokePaint);
                    c.drawLine(5.8f, 5.8f, 18.2f, 18.2f, strokePaint);
                    break;
                }
                case ICON_BOOKMARK_OUTLINE:
                case ICON_BOOKMARK_FILLED: {
                    path.reset();
                    path.moveTo(6.8f, 4.4f);
                    path.lineTo(17.2f, 4.4f);
                    path.quadTo(18.0f, 4.4f, 18.0f, 5.4f);
                    path.lineTo(18.0f, 19.6f);
                    path.lineTo(12.0f, 15.8f);
                    path.lineTo(6.0f, 19.6f);
                    path.lineTo(6.0f, 5.4f);
                    path.quadTo(6.0f, 4.4f, 6.8f, 4.4f);
                    path.close();
                    if (kind == ICON_BOOKMARK_FILLED) {
                        c.drawPath(path, fillPaint);
                    } else {
                        c.drawPath(path, strokePaint);
                    }
                    break;
                }
                case ICON_SHUFFLE: {
                    // Clean Material shuffle arrows
                    path.reset();
                    path.moveTo(3.8f, 16.6f);
                    path.lineTo(7.8f, 16.6f);
                    path.cubicTo(10.6f, 16.6f, 12.6f, 7.4f, 15.6f, 7.4f);
                    path.lineTo(19.8f, 7.4f);
                    c.drawPath(path, strokePaint);

                    path.reset();
                    path.moveTo(17.0f, 4.7f);
                    path.lineTo(20.0f, 7.4f);
                    path.lineTo(17.0f, 10.1f);
                    c.drawPath(path, strokePaint);

                    path.reset();
                    path.moveTo(3.8f, 7.4f);
                    path.lineTo(7.8f, 7.4f);
                    path.cubicTo(10.6f, 7.4f, 12.6f, 16.6f, 15.6f, 16.6f);
                    path.lineTo(19.8f, 16.6f);
                    c.drawPath(path, strokePaint);

                    path.reset();
                    path.moveTo(17.0f, 13.9f);
                    path.lineTo(20.0f, 16.6f);
                    path.lineTo(17.0f, 19.3f);
                    c.drawPath(path, strokePaint);
                    break;
                }
                case ICON_SLEEP_OUTLINE:
                case ICON_SLEEP_FILLED: {
                    // Clean crescent moon + crisp star accent
                    path.reset();
                    path.moveTo(12.2f, 4.0f);
                    path.cubicTo(7.5f, 4.3f, 4.2f, 8.2f, 4.4f, 12.9f);
                    path.cubicTo(4.6f, 17.5f, 8.5f, 20.6f, 13.3f, 20.3f);
                    path.cubicTo(16.1f, 20.1f, 18.6f, 18.6f, 19.9f, 16.2f);
                    path.cubicTo(15.2f, 17.2f, 11.4f, 13.6f, 12.2f, 8.5f);
                    path.cubicTo(12.4f, 6.8f, 13.1f, 5.2f, 14.3f, 4.1f);
                    path.cubicTo(13.6f, 4.0f, 12.9f, 4.0f, 12.2f, 4.0f);
                    path.close();
                    if (kind == ICON_SLEEP_FILLED) {
                        c.drawPath(path, fillPaint);
                    } else {
                        c.drawPath(path, strokePaint);
                    }
                    c.drawCircle(18.2f, 6.4f, 1.25f, fillPaint);
                    break;
                }
                case ICON_COLLABORATORS: {
                    // Two people silhouettes
                    c.drawCircle(9.0f, 8.0f, 3.1f, strokePaint);
                    path.reset();
                    path.moveTo(3.6f, 19.0f);
                    path.cubicTo(3.6f, 15.6f, 6.0f, 14.0f, 9.0f, 14.0f);
                    path.cubicTo(12.0f, 14.0f, 14.4f, 15.6f, 14.4f, 19.0f);
                    c.drawPath(path, strokePaint);

                    arcRect.set(13.6f, 5.6f, 18.8f, 10.8f);
                    c.drawArc(arcRect, -70f, 140f, false, strokePaint);
                    path.reset();
                    path.moveTo(16.6f, 14.3f);
                    path.cubicTo(18.9f, 14.7f, 20.5f, 16.3f, 20.5f, 19.0f);
                    c.drawPath(path, strokePaint);
                    break;
                }
                case ICON_CREATE_FOLDER:
                case ICON_MOVE_TO_FOLDER: {
                    // Crisp folder outline + '+' or arrow inside
                    path.reset();
                    path.moveTo(3.8f, 7.0f);
                    path.quadTo(3.8f, 5.4f, 5.4f, 5.4f);
                    path.lineTo(9.4f, 5.4f);
                    path.lineTo(11.3f, 7.4f);
                    path.lineTo(18.6f, 7.4f);
                    path.quadTo(20.2f, 7.4f, 20.2f, 9.0f);
                    path.lineTo(20.2f, 17.2f);
                    path.quadTo(20.2f, 18.8f, 18.6f, 18.8f);
                    path.lineTo(5.4f, 18.8f);
                    path.quadTo(3.8f, 18.8f, 3.8f, 17.2f);
                    path.close();
                    c.drawPath(path, strokePaint);
                    if (kind == ICON_CREATE_FOLDER) {
                        c.drawLine(12f, 10.6f, 12f, 15.8f, strokePaint);
                        c.drawLine(9.4f, 13.2f, 14.6f, 13.2f, strokePaint);
                    } else {
                        c.drawLine(9.0f, 13.2f, 15.0f, 13.2f, strokePaint);
                        path.reset();
                        path.moveTo(12.6f, 10.8f);
                        path.lineTo(15.2f, 13.2f);
                        path.lineTo(12.6f, 15.6f);
                        c.drawPath(path, strokePaint);
                    }
                    break;
                }
                case ICON_LEAVE: {
                    // Doorway + bold exit arrow
                    path.reset();
                    path.moveTo(12.2f, 4.6f);
                    path.lineTo(6.2f, 4.6f);
                    path.quadTo(4.6f, 4.6f, 4.6f, 6.2f);
                    path.lineTo(4.6f, 17.8f);
                    path.quadTo(4.6f, 19.4f, 6.2f, 19.4f);
                    path.lineTo(12.2f, 19.4f);
                    c.drawPath(path, strokePaint);
                    c.drawLine(10.0f, 12.0f, 19.5f, 12.0f, strokePaint);
                    path.reset();
                    path.moveTo(16.2f, 8.6f);
                    path.lineTo(19.8f, 12.0f);
                    path.lineTo(16.2f, 15.4f);
                    c.drawPath(path, strokePaint);
                    break;
                }
                case ICON_REPORT_FLAG: {
                    c.drawLine(5.8f, 4.4f, 5.8f, 20.0f, strokePaint);
                    path.reset();
                    path.moveTo(5.8f, 5.2f);
                    path.lineTo(13.2f, 5.2f);
                    path.lineTo(14.2f, 6.9f);
                    path.lineTo(18.6f, 6.9f);
                    path.lineTo(18.6f, 14.2f);
                    path.lineTo(12.8f, 14.2f);
                    path.lineTo(11.8f, 12.6f);
                    path.lineTo(5.8f, 12.6f);
                    c.drawPath(path, strokePaint);
                    break;
                }
                case ICON_PURCHASE_TAG: {
                    path.reset();
                    path.moveTo(4.5f, 10.6f);
                    path.lineTo(4.5f, 5.6f);
                    path.quadTo(4.5f, 4.5f, 5.6f, 4.5f);
                    path.lineTo(10.6f, 4.5f);
                    path.lineTo(19.3f, 13.2f);
                    path.quadTo(20.1f, 14.0f, 19.3f, 14.8f);
                    path.lineTo(14.8f, 19.3f);
                    path.quadTo(14.0f, 20.1f, 13.2f, 19.3f);
                    path.close();
                    c.drawPath(path, strokePaint);
                    c.drawCircle(8.4f, 8.4f, 1.35f, fillPaint);
                    break;
                }
                case ICON_SPARKLE: {
                    path.reset();
                    path.moveTo(12.0f, 3.2f);
                    path.quadTo(13.4f, 10.6f, 20.8f, 12.0f);
                    path.quadTo(13.4f, 13.4f, 12.0f, 20.8f);
                    path.quadTo(10.6f, 13.4f, 3.2f, 12.0f);
                    path.quadTo(10.6f, 10.6f, 12.0f, 3.2f);
                    path.close();
                    c.drawPath(path, fillPaint);
                    break;
                }
                case ICON_MORE: {
                    c.drawCircle(5.8f, 12f, 1.85f, fillPaint);
                    c.drawCircle(12.0f, 12f, 1.85f, fillPaint);
                    c.drawCircle(18.2f, 12f, 1.85f, fillPaint);
                    break;
                }
                case ICON_PLAY: {
                    path.reset();
                    path.moveTo(7.4f, 5.2f);
                    path.lineTo(18.4f, 12.0f);
                    path.lineTo(7.4f, 18.8f);
                    path.close();
                    c.drawPath(path, fillPaint);
                    c.drawPath(path, strokePaint);
                    break;
                }
                case ICON_PAUSE: {
                    arcRect.set(6.5f, 5.2f, 10.1f, 18.8f);
                    c.drawRoundRect(arcRect, 1.6f, 1.6f, fillPaint);
                    arcRect.set(13.9f, 5.2f, 17.5f, 18.8f);
                    c.drawRoundRect(arcRect, 1.6f, 1.6f, fillPaint);
                    break;
                }
                case ICON_CROSSFADE: {
                    // Two smooth expressive audio transition curves crossing smoothly
                    path.reset();
                    path.moveTo(3.8f, 16.8f);
                    path.cubicTo(9.2f, 16.8f, 14.8f, 7.2f, 20.2f, 7.2f);
                    c.drawPath(path, strokePaint);
                    path.reset();
                    path.moveTo(3.8f, 7.2f);
                    path.cubicTo(9.2f, 7.2f, 14.8f, 16.8f, 20.2f, 16.8f);
                    c.drawPath(path, strokePaint);
                    c.drawCircle(20.2f, 7.2f, 1.5f, fillPaint);
                    c.drawCircle(20.2f, 16.8f, 1.5f, fillPaint);
                    break;
                }
                default:
                    break;
            }
        }
    }
}
