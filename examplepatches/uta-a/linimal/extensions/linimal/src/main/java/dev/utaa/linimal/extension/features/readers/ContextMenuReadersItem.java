package dev.utaa.linimal.extension.features.readers;

import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import dev.utaa.linimal.extension.i18n.LinimalText;

/**
 * メッセージ長押しメニューの格子に「既読者」を 1 マス加えます。
 *
 * <p>LINE は最後の行の余ったマスにも項目の View を inflate し、中身を空のまま置きます。その空きマスが
 * あればそこへ入れ、なければ同じ layout で行を 1 つ足します。layout と ID は名前から引き、
 * 見つからない場合は何もしません。この処理は LINE がメニューへ配色を当てる直前に走るため、
 * 追加したマスも LINE 自身の項目と同じ配色になります。</p>
 */
final class ContextMenuReadersItem {
    private static final String ROW_LAYOUT = "chat_ui_message_context_menu_content_row";
    private static final String ITEM_LAYOUT = "chat_ui_message_context_menu_content_item";
    private static final String ROW_CONTAINER = "chat_ui_message_context_menu_row_container";
    private static final String ROW_DIVIDER = "chat_ui_message_context_menu_row_divider";
    private static final String ITEM_DIVIDER = "chat_ui_message_context_menu_item_divider";
    private static final String ITEM_CONTENT = "chat_ui_message_context_content_layout";
    private static final String ITEM_IMAGE = "chat_ui_message_context_menu_item_image";
    private static final String ITEM_TITLE = "chat_ui_message_context_menu_item_title";

    private ContextMenuReadersItem() {
    }

    /** 追加できたかどうかを返します。 */
    static boolean add(ViewGroup actionContainer, Runnable onClick) {
        Context context = actionContainer.getContext();
        Ids ids = Ids.resolve(context);
        if (ids == null || actionContainer.getChildCount() == 0) {
            return false;
        }
        View lastRow = actionContainer.getChildAt(actionContainer.getChildCount() - 1);
        ViewGroup lastCells = (ViewGroup) lastRow.findViewById(ids.rowContainer);
        if (lastCells == null || lastCells.getChildCount() == 0) {
            return false;
        }
        View template = firstFilledCell(lastCells, ids);
        if (template == null) {
            return false;
        }

        View cell = firstEmptyCell(lastCells, ids);
        if (cell == null) {
            cell = appendRow(actionContainer, lastCells.getChildCount(), ids);
        }
        if (cell == null) {
            return false;
        }
        fill(cell, template, ids, onClick);
        return true;
    }

    private static View firstFilledCell(ViewGroup cells, Ids ids) {
        for (int i = 0; i < cells.getChildCount(); i++) {
            View content = cells.getChildAt(i).findViewById(ids.itemContent);
            if (content != null && content.hasOnClickListeners()) {
                return cells.getChildAt(i);
            }
        }
        return null;
    }

    /** LINE が null 項目のために置いた空のマス。title が空で、押しても何も起きません。 */
    private static View firstEmptyCell(ViewGroup cells, Ids ids) {
        for (int i = 0; i < cells.getChildCount(); i++) {
            View cell = cells.getChildAt(i);
            View content = cell.findViewById(ids.itemContent);
            TextView title = (TextView) cell.findViewById(ids.itemTitle);
            if (content != null && title != null && !content.hasOnClickListeners()
                    && (title.getText() == null || title.getText().length() == 0)) {
                return cell;
            }
        }
        return null;
    }

    /** 既存の行と同じ数のマスを持つ行を足し、その先頭のマスを返します。 */
    private static View appendRow(ViewGroup actionContainer, int cellCount, Ids ids) {
        LayoutInflater inflater = LayoutInflater.from(actionContainer.getContext());
        View row = inflater.inflate(ids.rowLayout, actionContainer, false);
        ViewGroup cells = (ViewGroup) row.findViewById(ids.rowContainer);
        View divider = row.findViewById(ids.rowDivider);
        if (cells == null) {
            return null;
        }
        if (divider != null) {
            divider.setVisibility(View.VISIBLE);
        }
        View first = null;
        for (int i = 0; i < cellCount; i++) {
            View cell = inflater.inflate(ids.itemLayout, cells, false);
            cells.addView(cell);
            View cellDivider = cell.findViewById(ids.itemDivider);
            if (cellDivider != null) {
                cellDivider.setVisibility(i == 0 ? View.GONE : View.VISIBLE);
            }
            if (first == null) {
                first = cell;
            }
        }
        actionContainer.addView(row);
        return first;
    }

    private static void fill(View cell, View template, Ids ids, Runnable onClick) {
        TextView title = (TextView) cell.findViewById(ids.itemTitle);
        ImageView image = (ImageView) cell.findViewById(ids.itemImage);
        View content = cell.findViewById(ids.itemContent);
        View templateContent = template.findViewById(ids.itemContent);
        if (title == null || image == null || content == null) {
            return;
        }
        String label = LinimalText.t("既読者");
        title.setText(label);
        title.setContentDescription(label);
        image.setImageDrawable(new ReadersIconDrawable(title));
        if (templateContent != null) {
            content.setBackgroundTintList(templateContent.getBackgroundTintList());
        }
        content.setOnClickListener(view -> onClick.run());
    }

    /** 開いているメニューを閉じてから一覧を開く操作。 */
    static Runnable openReaders(Object menuDialog, Context context, String chatId, long messageId,
            String senderMid) {
        return () -> {
            if (menuDialog instanceof DialogInterface) {
                try {
                    ((DialogInterface) menuDialog).dismiss();
                } catch (RuntimeException ignored) {
                    // 閉じられなくても一覧は開きます。
                }
            }
            ReadersDialog.show(context, chatId, messageId, senderMid);
        };
    }

    /** layout と ID を名前から引いた結果。1 つでも欠ければ null です。 */
    private static final class Ids {
        final int rowLayout;
        final int itemLayout;
        final int rowContainer;
        final int rowDivider;
        final int itemDivider;
        final int itemContent;
        final int itemImage;
        final int itemTitle;

        private Ids(int rowLayout, int itemLayout, int rowContainer, int rowDivider, int itemDivider,
                int itemContent, int itemImage, int itemTitle) {
            this.rowLayout = rowLayout;
            this.itemLayout = itemLayout;
            this.rowContainer = rowContainer;
            this.rowDivider = rowDivider;
            this.itemDivider = itemDivider;
            this.itemContent = itemContent;
            this.itemImage = itemImage;
            this.itemTitle = itemTitle;
        }

        static Ids resolve(Context context) {
            Resources resources = context.getResources();
            String pkg = context.getPackageName();
            int[] values = {
                    resources.getIdentifier(ROW_LAYOUT, "layout", pkg),
                    resources.getIdentifier(ITEM_LAYOUT, "layout", pkg),
                    resources.getIdentifier(ROW_CONTAINER, "id", pkg),
                    resources.getIdentifier(ROW_DIVIDER, "id", pkg),
                    resources.getIdentifier(ITEM_DIVIDER, "id", pkg),
                    resources.getIdentifier(ITEM_CONTENT, "id", pkg),
                    resources.getIdentifier(ITEM_IMAGE, "id", pkg),
                    resources.getIdentifier(ITEM_TITLE, "id", pkg),
            };
            for (int value : values) {
                if (value == 0) {
                    return null;
                }
            }
            return new Ids(values[0], values[1], values[2], values[3], values[4], values[5], values[6],
                    values[7]);
        }
    }

    /**
     * 人のシルエットに確認の印を添えた線画。色は隣の title の文字色に合わせ、LINE の配色が
     * 後から当たっても追従します。
     */
    static final class ReadersIconDrawable extends Drawable {
        private final TextView colorSource;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final RectF oval = new RectF();

        ReadersIconDrawable(TextView colorSource) {
            this.colorSource = colorSource;
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        public void draw(Canvas canvas) {
            float width = getBounds().width();
            float height = getBounds().height();
            if (width <= 0 || height <= 0) {
                return;
            }
            float size = Math.min(width, height);
            float left = getBounds().left + (width - size) / 2f;
            float top = getBounds().top + (height - size) / 2f;
            paint.setColor(colorSource.getCurrentTextColor());
            paint.setStrokeWidth(size * 0.075f);

            // 頭
            float headRadius = size * 0.16f;
            float headX = left + size * 0.40f;
            float headY = top + size * 0.32f;
            canvas.drawCircle(headX, headY, headRadius, paint);
            // 肩
            oval.set(left + size * 0.12f, top + size * 0.56f, left + size * 0.68f, top + size * 1.08f);
            canvas.drawArc(oval, 200f, 140f, false, paint);
            // 確認の印
            path.reset();
            path.moveTo(left + size * 0.62f, top + size * 0.70f);
            path.lineTo(left + size * 0.72f, top + size * 0.80f);
            path.lineTo(left + size * 0.90f, top + size * 0.60f);
            canvas.drawPath(path, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
