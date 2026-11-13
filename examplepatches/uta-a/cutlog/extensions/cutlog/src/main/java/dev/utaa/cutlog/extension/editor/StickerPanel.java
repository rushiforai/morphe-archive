package dev.utaa.cutlog.extension.editor;

import android.content.Context;
import android.graphics.Color;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;

/** 絵文字・端末の画像のスタンプを足し、選んでいるスタンプのサイズ・角度・削除を扱う。 */
final class StickerPanel extends ToolPanel {
    private static final String[] EMOJIS = {
        "😀", "😂", "🥹", "😍", "😎", "🤔", "😭", "😡",
        "🥳", "😴", "👍", "👏", "🙏", "💪", "✌️", "👀",
        "🔥", "✨", "💯", "❤️", "💔", "💕", "⭐", "🌈",
        "☀️", "🌙", "⚡", "💥", "💦", "🎉", "🎂", "🍺",
        "☕", "🍜", "🍣", "🐶", "🐱", "🌸", "🍀", "🎵",
        "📸", "🚀", "✅", "❌", "❓", "‼️", "💤", "💢",
    };
    /** 絵文字を並べる段の数。 */
    private static final int ROWS = 2;
    private static final float DEFAULT_SIZE = 0.2f;

    private final Context context;
    private final LayerControls layerControls;
    private boolean built;

    StickerPanel(Context context, EditorHost host) {
        super(host);
        this.context = context;
        this.layerControls = new LayerControls(context, host, StickerSpec.class);
    }

    @Override
    protected View build() {
        LinearLayout panel = Ui.column(context);

        // 左に「画像」、右に 2 段の絵文字を横スクロールで並べる。
        LinearLayout pickers = Ui.row(context);
        TextView pick = Ui.text(context, "＋\n画像", 13, Color.WHITE, true);
        pick.setGravity(Gravity.CENTER);
        pick.setBackground(Ui.rounded(context, Ui.ACCENT, 16));
        pick.setContentDescription("端末の画像を選ぶ");
        pick.setClickable(true);
        pick.setOnClickListener(v -> host.pickImage(this::addImage));
        int cell = Ui.dp(context, 44);
        LinearLayout.LayoutParams pickParams = new LinearLayout.LayoutParams(Ui.dp(context, 56), cell * ROWS);
        pickParams.rightMargin = Ui.dp(context, 8);
        pickers.addView(pick, pickParams);

        HorizontalScrollView scroll = new HorizontalScrollView(context);
        scroll.setHorizontalScrollBarEnabled(false);
        LinearLayout columns = Ui.row(context);
        LinearLayout column = null;
        for (int i = 0; i < EMOJIS.length; i++) {
            if (i % ROWS == 0) {
                column = new LinearLayout(context);
                column.setOrientation(LinearLayout.VERTICAL);
                columns.addView(column);
            }
            String emoji = EMOJIS[i];
            TextView view = Ui.text(context, emoji, 26, Ui.TEXT_PRIMARY, false);
            view.setGravity(Gravity.CENTER);
            view.setClickable(true);
            view.setOnClickListener(v -> add(StickerSpec.emoji(emoji, DEFAULT_SIZE)));
            column.addView(view, new LinearLayout.LayoutParams(cell, cell));
        }
        scroll.addView(columns);
        pickers.addView(scroll, new LinearLayout.LayoutParams(0, cell * ROWS, 1f));
        panel.addView(pickers);

        panel.addView(layerControls.sizeRow(), spaced());
        panel.addView(layerControls.angleRow());
        panel.addView(layerControls.footer("ドラッグで移動、2 本指で拡大・回転"));

        built = true;
        onLayerSelected(host.selectedLayer());
        return panel;
    }

    private void addImage(android.graphics.Bitmap image) {
        add(StickerSpec.image(image, DEFAULT_SIZE * 1.5f));
    }

    private void add(StickerSpec sticker) {
        int count = 0;
        for (Layer layer : host.spec().layers) {
            if (layer instanceof StickerSpec) {
                count++;
            }
        }
        // 重ならないよう、足すたびに少しずつずらす。
        sticker.x = 0.5f + 0.06f * (count % 4);
        sticker.y = 0.4f + 0.06f * (count % 4);
        host.spec().layers.add(sticker);
        host.layersChanged();
        host.selectLayer(sticker);
    }

    private LinearLayout.LayoutParams spaced() {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = Ui.dp(context, 10);
        return params;
    }

    @Override
    void onLayerSelected(Layer layer) {
        if (built) {
            layerControls.refresh(layer);
        }
    }
}
