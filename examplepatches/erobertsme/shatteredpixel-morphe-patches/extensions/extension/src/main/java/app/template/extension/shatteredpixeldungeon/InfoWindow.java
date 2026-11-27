package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.items.food.Food;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;
import com.shatteredpixel.shatteredpixeldungeon.ui.BuffIcon;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.shatteredpixel.shatteredpixeldungeon.ui.ScrollPane;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;
import com.watabou.noosa.Game;
import com.watabou.noosa.Group;
import com.watabou.noosa.Image;

import java.util.ArrayList;
import java.util.List;

/**
 * Shows the text behind an [i] button. Paragraphs are separated by a blank line. A short first paragraph becomes the title, a line
 * starting with "## " at the start of a paragraph is a section heading for the lines below it, _text between underscores_ is highlighted,
 * and a paragraph that starts with {NAME} gets that icon beside it: an Icons name, an ITEM: or BUFF: token, or HEART, FOOD or STAR. Text
 * taller than the screen allows scrolls under the title, with hints at the edges while there is more to see.
 */
final class InfoWindow extends Window {

	private static final int WIDTH = 120;
	private static final int GAP = 4;
	private static final int ICON_SPACE = 18;
	private static final int HEADING_MAX = 32;
	private static final float MAX_HEIGHT_SHARE = 0.75f;
	private static final int HEART_ICON = 21;
	private static final int TEXT_SIZE = 6;
	private static final int SECTION_SIZE = 7;
	private static final String SECTION_MARK = "## ";

	private static final class Paragraph {
		final String icon;
		final String text;
		final boolean section;

		Paragraph(String icon, String text, boolean section) {
			this.icon = icon;
			this.text = text;
			this.section = section;
		}
	}

	private static final class Content {
		String heading;
		final List<Paragraph> paragraphs = new ArrayList<>();
	}

	static void show(String text) {
		Game.scene().addToFront(new InfoWindow(parse(text)));
	}

	private InfoWindow(Content content) {
		super();
		float top = 0;
		if (content.heading != null) {
			RenderedTextBlock heading = PixelScene.renderTextBlock(content.heading, 9);
			heading.hardlight(EditorWindow.TITLE_COLOR);
			heading.maxWidth(WIDTH);
			heading.setPos(0, 0);
			add(heading);
			top = heading.bottom() + 2 * GAP;
		}

		int firstPart = ScrollArea.partCount(this);
		float y = top;
		for (int i = 0; i < content.paragraphs.size(); i++) {
			Paragraph paragraph = content.paragraphs.get(i);
			if (paragraph.section && i > 0) y += GAP;
			y = addParagraph(this, paragraph, y) + GAP;
		}
		float bodyHeight = Math.max(0, y - GAP - top);
		float maxBody = PixelScene.uiCamera.height * MAX_HEIGHT_SHARE - top;
		ScrollPane pane = ScrollArea.wrapIfTall(this, firstPart, top, WIDTH, bodyHeight, maxBody);
		resize(WIDTH, (int) Math.ceil(top + (pane == null ? bodyHeight : maxBody)));
		ScrollArea.finish(this, pane);
	}

	private static float addParagraph(Group group, Paragraph paragraph, float y) {
		if (paragraph.section) {
			RenderedTextBlock heading = PixelScene.renderTextBlock(paragraph.text, SECTION_SIZE);
			heading.hardlight(EditorWindow.TITLE_COLOR);
			heading.maxWidth(WIDTH);
			heading.setPos(0, y);
			group.add(heading);
			return heading.bottom();
		}
		float left = 0;
		Image icon = paragraph.icon == null ? null : icon(paragraph.icon);
		if (icon != null) {
			icon.x = (ICON_SPACE - 2 - icon.width()) / 2f;
			icon.y = y;
			group.add(icon);
			left = ICON_SPACE;
		}
		RenderedTextBlock text = PixelScene.renderTextBlock(paragraph.text, TEXT_SIZE);
		text.maxWidth((int) (WIDTH - left));
		text.setPos(left, y);
		group.add(text);
		float bottom = text.bottom();
		if (icon != null) bottom = Math.max(bottom, icon.y + icon.height());
		return bottom;
	}

	private static Content parse(String text) {
		Content content = new Content();
		String[] parts = text.split("\n\n");
		int start = 0;
		if (parts.length > 1 && isHeading(parts[0])) {
			content.heading = parts[0];
			start = 1;
		}
		for (int i = start; i < parts.length; i++) {
			String part = parts[i].trim();
			if (part.isEmpty()) continue;
			if (part.startsWith(SECTION_MARK)) {
				int lineEnd = part.indexOf('\n');
				String heading = lineEnd < 0 ? part : part.substring(0, lineEnd);
				content.paragraphs.add(new Paragraph(null, heading.substring(SECTION_MARK.length()).trim(), true));
				if (lineEnd < 0) continue;
				part = part.substring(lineEnd + 1).trim();
				if (part.isEmpty()) continue;
			}
			String icon = null;
			if (part.startsWith("{")) {
				int end = part.indexOf('}');
				if (end > 1) {
					icon = part.substring(1, end);
					part = part.substring(end + 1).trim();
				}
			}
			content.paragraphs.add(new Paragraph(icon, part, false));
		}
		return content;
	}

	private static boolean isHeading(String text) {
		return text.length() <= HEADING_MAX && !text.contains(".") && !text.contains("\n") && !text.startsWith("{");
	}

	private static Image icon(String name) {
		try {
			if (name.startsWith("ITEM:") || name.startsWith("BUFF:")) return StatIcons.fromToken(name);
			if (name.equals("HEART")) return new BuffIcon(HEART_ICON, true);
			if (name.equals("STAR")) return Icons.get(Icons.TALENT);
			if (name.equals("FOOD")) return new ItemSprite(new Food());
			return Icons.get(Icons.valueOf(name));
		} catch (Throwable e) {
			return null;
		}
	}
}
