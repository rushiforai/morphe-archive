package app.template.extension.shatteredpixeldungeon;

/**
 * The Fun patch's options.
 */
public class FunWindow extends EditorWindow {

	private static final String INFO = "Fun\n\n"
		+ "Options that are just for fun.\n\n"
		+ "_Hero Sprite:_ make your hero look like another hero, an enemy or an NPC. Only the look changes. Chosen in a game, it applies to that game; on the main menu, it's the look for new games.";

	public FunWindow() {
		super();
		addTitle("Fun", INFO);
		addButton("Hero Sprite", 0, WIDTH, () -> {
			hide();
			show(new HeroSpriteWindow(HeroSpriteWindow.pageOf(HeroSkin.current())));
		}).icon(HeroSkin.icon(HeroSkin.skins().get(0)));
		pos += ROW_HEIGHT + 2 * GAP;
		finishWithBack(() -> CloverlordMenu.show());
	}

	@Override
	protected void reopen() {
		show(new FunWindow());
	}
}
