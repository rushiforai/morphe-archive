package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.watabou.noosa.ColorBlock;
import com.watabou.noosa.Image;

import java.util.List;

/**
 * A grid of every look the hero can have. Tapping one puts it on the hero straight away.
 */
public class HeroSpriteWindow extends EditorWindow {

	private static final String INFO = "Hero Sprite\n\n"
		+ "Tap a picture to make your hero look like it: your own hero, another hero, or any enemy or NPC. It changes straight away and only the look changes.\n\n"
		+ "_The name_ of your choice shows above the grid.\n_The first picture_ puts your own look back.";
	private static final int CELL = 22;
	private static final int COLUMNS = 5;
	private static final int ICON_SPACE = CELL - 4;
	private static final int SELECTED_BORDER = 1;
	private static final int SELECTED_COLOR = 0xFF000000 | EditorWindow.TITLE_COLOR;

	private final int page;

	public HeroSpriteWindow(int page) {
		super();
		this.page = page;
		addTitle("Hero Sprite", INFO);

		HeroSkin.Skin current = HeroSkin.current();
		RenderedTextBlock name = PixelScene.renderTextBlock(current.name, 7);
		name.hardlight(EditorWindow.TITLE_COLOR);
		name.setPos((WIDTH - name.width()) / 2f, pos);
		PixelScene.align(name);
		add(name);
		pos = name.bottom() + 2 * GAP;

		List<HeroSkin.Skin> skins = HeroSkin.skins();
		int perPage = perPage();
		int pages = pageCount(skins.size(), perPage);
		int shown = Math.min(page, pages - 1);
		float gridWidth = COLUMNS * CELL + (COLUMNS - 1) * GAP;
		float left = (WIDTH - gridWidth) / 2f;
		float top = pos;
		int start = shown * perPage;
		for (int i = start; i < Math.min(skins.size(), start + perPage); i++) {
			int slot = i - start;
			addCell(skins.get(i), current, left + (slot % COLUMNS) * (CELL + GAP), top + (slot / COLUMNS) * (CELL + GAP));
		}
		pos = top + rows() * (CELL + GAP);
		addPager(shown, pages, newPage -> replaceWith(new HeroSpriteWindow(newPage)));

		finishWithBack(() -> show(new FunWindow()));
	}

	private void addCell(HeroSkin.Skin skin, HeroSkin.Skin current, float x, float y) {
		if (skin == current) {
			ColorBlock border = new ColorBlock(CELL + 2 * SELECTED_BORDER, CELL + 2 * SELECTED_BORDER, SELECTED_COLOR);
			border.x = x - SELECTED_BORDER;
			border.y = y - SELECTED_BORDER;
			add(border);
		}
		RedButton button = new RedButton("") {
			@Override
			public void onClick() {
				HeroSkin.choose(skin);
				replaceWith(new HeroSpriteWindow(page));
			}
		};
		button.setRect(x, y, CELL, CELL);
		add(button);

		Image icon = HeroSkin.icon(skin);
		if (icon == null) return;
		float scale = Math.min(1f, Math.min(ICON_SPACE / icon.width(), ICON_SPACE / icon.height()));
		icon.scale.set(scale, scale);
		icon.x = x + (CELL - icon.width()) / 2f;
		icon.y = y + (CELL - icon.height()) / 2f;
		PixelScene.align(icon);
		add(icon);
	}

	private static int rows() {
		return perPage(6, 3);
	}

	private static int perPage() {
		return rows() * COLUMNS;
	}

	/**
	 * The page that shows [skin].
	 */
	static int pageOf(HeroSkin.Skin skin) {
		return Math.max(0, HeroSkin.skins().indexOf(skin)) / perPage();
	}

	@Override
	protected void reopen() {
		show(new HeroSpriteWindow(page));
	}
}
