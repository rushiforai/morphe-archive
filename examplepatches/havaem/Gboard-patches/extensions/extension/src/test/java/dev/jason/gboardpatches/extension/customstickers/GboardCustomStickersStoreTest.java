package dev.jason.gboardpatches.extension.customstickers;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {26, 35})
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class GboardCustomStickersStoreTest {
    private final Context context = RuntimeEnvironment.getApplication();

    @Test public void packLifecycleKeepsIndexAndFilesInSync() throws Exception {
        GboardCustomStickersStore.Pack pack = GboardCustomStickersStore.createPack(context, "  Cats  ");
        assertEquals("Cats", pack.name);

        GboardCustomStickersStore.addSticker(context, pack.id, png(1024, 512));
        GboardCustomStickersStore.Pack saved = GboardCustomStickersStore.findPack(context, pack.id);
        assertEquals(1, saved.stickers.size());
        File sticker = GboardCustomStickersStore.stickerFile(context, pack.id, saved.stickers.get(0));
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(sticker.getPath(), bounds);
        assertEquals(GboardCustomStickersStore.MAX_STICKER_EDGE_PX, bounds.outWidth);
        assertEquals(GboardCustomStickersStore.MAX_STICKER_EDGE_PX / 2, bounds.outHeight);

        GboardCustomStickersStore.renamePack(context, pack.id, "Dogs");
        assertEquals("Dogs", GboardCustomStickersStore.findPack(context, pack.id).name);

        GboardCustomStickersStore.deleteSticker(context, pack.id, saved.stickers.get(0));
        assertFalse(sticker.exists());
        assertTrue(GboardCustomStickersStore.findPack(context, pack.id).stickers.isEmpty());

        GboardCustomStickersStore.deletePack(context, pack.id);
        assertNull(GboardCustomStickersStore.findPack(context, pack.id));
    }

    @Test public void coverDefaultsToFirstStickerAndFallsBackWhenDeleted() throws Exception {
        GboardCustomStickersStore.Pack pack = GboardCustomStickersStore.createPack(context, "Cover");
        assertNull(pack.cover);
        GboardCustomStickersStore.addSticker(context, pack.id, png(64, 64));
        GboardCustomStickersStore.addSticker(context, pack.id, png(32, 32));
        List<String> stickers = GboardCustomStickersStore.findPack(context, pack.id).stickers;
        assertEquals(stickers.get(0), GboardCustomStickersStore.findPack(context, pack.id).cover);

        GboardCustomStickersStore.setCover(context, pack.id, stickers.get(1));
        GboardCustomStickersStore.renamePack(context, pack.id, "Renamed");
        assertEquals(stickers.get(1), GboardCustomStickersStore.findPack(context, pack.id).cover);
        assertThrows(java.io.IOException.class,
                () -> GboardCustomStickersStore.setCover(context, pack.id, "missing.png"));

        GboardCustomStickersStore.deleteSticker(context, pack.id, stickers.get(1));
        assertEquals(stickers.get(0), GboardCustomStickersStore.findPack(context, pack.id).cover);
    }

    @Test public void editsKeepTheOriginalSoTheyCanBeChangedOrUndone() throws Exception {
        GboardCustomStickersStore.Pack pack = GboardCustomStickersStore.createPack(context, "Cut");
        Bitmap bitmap = Bitmap.createBitmap(40, 40, Bitmap.Config.ARGB_8888);
        bitmap.eraseColor(Color.WHITE);
        for (int y = 10; y < 30; y++) {
            for (int x = 10; x < 30; x++) bitmap.setPixel(x, y, Color.BLUE);
        }
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, output);
        GboardCustomStickersStore.addSticker(context, pack.id, output.toByteArray());
        GboardCustomStickersStore.addSticker(context, pack.id, png(8, 8));
        List<String> before = GboardCustomStickersStore.findPack(context, pack.id).stickers;

        String source = before.get(0);
        File original = GboardCustomStickersStore.stickerFile(context, pack.id, source);
        GboardCustomStickersStore.setCover(context, pack.id, source);
        GboardCustomStickersStore.Edits removeBackground =
                new GboardCustomStickersStore.Edits(48, 0, 0, Color.WHITE);

        String first = GboardCustomStickersStore.saveEdited(
                context, pack.id, source, removeBackground);

        GboardCustomStickersStore.Pack edited = GboardCustomStickersStore.findPack(context, pack.id);
        assertEquals(List.of(first, before.get(1)), edited.stickers);
        assertEquals(first, edited.cover);
        assertEquals(source, edited.sourceOf(first));
        assertEquals(removeBackground, edited.editsOf(first));
        assertTrue(original.exists());
        Bitmap cut = BitmapFactory.decodeFile(
                GboardCustomStickersStore.stickerFile(context, pack.id, first).getPath());
        // The background is gone and the cropped blue square is enlarged to fill the sticker.
        assertEquals(GboardCustomStickersStore.MAX_STICKER_EDGE_PX, cut.getWidth());
        assertEquals(Color.BLUE, cut.getPixel(0, 0));

        // Editing again starts from the original, not from the previous result.
        GboardCustomStickersStore.Edits outline =
                new GboardCustomStickersStore.Edits(0, 20, 8, Color.WHITE);
        String second = GboardCustomStickersStore.saveEdited(context, pack.id, first, outline);
        GboardCustomStickersStore.Pack reEdited =
                GboardCustomStickersStore.findPack(context, pack.id);
        assertEquals(source, reEdited.sourceOf(second));
        assertEquals(outline, reEdited.editsOf(second));
        assertFalse(GboardCustomStickersStore.stickerFile(context, pack.id, first).exists());

        // The settings survive a reload of the index.
        assertEquals(outline, GboardCustomStickersStore.fromJson(
                GboardCustomStickersStore.toJson(List.of(reEdited))).get(0).editsOf(second));

        // Clearing every edit brings back the untouched original.
        assertEquals(source, GboardCustomStickersStore.saveEdited(
                context, pack.id, second, GboardCustomStickersStore.Edits.NONE));
        GboardCustomStickersStore.Pack restored =
                GboardCustomStickersStore.findPack(context, pack.id);
        assertEquals(source, restored.stickers.get(0));
        assertTrue(restored.edited.isEmpty());
        assertFalse(GboardCustomStickersStore.stickerFile(context, pack.id, second).exists());

        // Deleting an edited sticker removes its original too.
        GboardCustomStickersStore.saveEdited(context, pack.id, source, outline);
        GboardCustomStickersStore.saveEdited(context, pack.id, before.get(1), outline);
        GboardCustomStickersStore.Pack batch = GboardCustomStickersStore.findPack(context, pack.id);
        assertEquals(2, batch.edited.size());
        GboardCustomStickersStore.deleteSticker(context, pack.id, batch.stickers.get(0));
        assertFalse(original.exists());

        // A solid image has no background to remove; the preview reports it, pixels stay.
        GboardCustomStickersStore.Rendered solid = GboardCustomStickersStore.render(
                GboardCustomStickersStore.stickerFile(context, pack.id,
                        batch.sourceOf(batch.stickers.get(1))),
                removeBackground);
        assertTrue(solid.backgroundNotFound);
        assertEquals(Color.BLUE, solid.bitmap.getPixel(0, 0));
    }

    @Test public void defaultsReorderingAndExportImportRoundTrip() throws Exception {
        GboardCustomStickersStore.Pack pack = GboardCustomStickersStore.createPack(context, "Mine");
        GboardCustomStickersStore.Edits defaults =
                new GboardCustomStickersStore.Edits(0, 30, 6, Color.BLACK);
        GboardCustomStickersStore.setDefaults(context, pack.id, defaults);
        GboardCustomStickersStore.addSticker(context, pack.id, png(16, 16));
        GboardCustomStickersStore.addSticker(context, pack.id, png(24, 24));
        GboardCustomStickersStore.addSticker(context, pack.id, png(32, 32));

        GboardCustomStickersStore.Pack saved = GboardCustomStickersStore.findPack(context, pack.id);
        assertEquals(defaults, saved.defaults);
        assertEquals(3, saved.edited.size());
        for (String sticker : saved.stickers) assertEquals(defaults, saved.editsOf(sticker));

        String last = saved.stickers.get(2);
        GboardCustomStickersStore.moveStickers(context, pack.id, List.of(last), 0);
        assertEquals(last, GboardCustomStickersStore.findPack(context, pack.id).stickers.get(0));

        ByteArrayOutputStream archive = new ByteArrayOutputStream();
        GboardCustomStickersStore.exportPack(context, pack.id, archive);
        GboardCustomStickersStore.Pack imported =
                GboardCustomStickersStore.importPack(context, archive.toByteArray());
        assertNotEquals(pack.id, imported.id);
        assertEquals("Mine", imported.name);
        assertEquals(GboardCustomStickersStore.findPack(context, pack.id).stickers,
                imported.stickers);
        assertEquals(defaults, imported.editsOf(imported.stickers.get(0)));
        File importedOriginal = GboardCustomStickersStore.stickerFile(context, imported.id,
                imported.sourceOf(imported.stickers.get(0)));
        assertTrue(importedOriginal.isFile());

        GboardCustomStickersStore.movePack(context, imported.id, 0);
        assertEquals(imported.id, GboardCustomStickersStore.load(context).get(0).id);

        assertThrows(java.io.IOException.class,
                () -> GboardCustomStickersStore.importPack(context, png(4, 4)));
    }

    @Test public void rejectsEmptyNamesAndNonImages() throws Exception {
        assertThrows(java.io.IOException.class,
                () -> GboardCustomStickersStore.createPack(context, "   "));
        GboardCustomStickersStore.Pack pack = GboardCustomStickersStore.createPack(context, "Pack");
        assertThrows(java.io.IOException.class,
                () -> GboardCustomStickersStore.addSticker(context, pack.id, new byte[] {1, 2, 3}));
        assertTrue(GboardCustomStickersStore.findPack(context, pack.id).stickers.isEmpty());
    }

    @Test public void parserDropsIdsAndFilesThatCouldEscapeTheFolder() throws Exception {
        String id = "0123456789abcdef0123456789abcdef";
        List<GboardCustomStickersStore.Pack> packs = GboardCustomStickersStore.fromJson(
                "{\"packs\":["
                        + "{\"id\":\"../../shared_prefs\",\"name\":\"bad\",\"stickers\":[]},"
                        + "{\"id\":\"" + id + "\",\"name\":\"ok\",\"stickers\":"
                        + "[\"../x.png\",\"" + id + ".png\",\"" + id + ".exe\"],"
                        + "\"cover\":\"../x.png\"}]}");
        assertEquals(1, packs.size());
        assertEquals(id, packs.get(0).id);
        assertEquals(List.of(id + ".png"), packs.get(0).stickers);
        assertEquals(id + ".png", packs.get(0).cover);
        assertEquals(1, GboardCustomStickersStore.fromJson(
                GboardCustomStickersStore.toJson(packs)).size());

        String other = "fedcba9876543210fedcba9876543210";
        GboardCustomStickersStore.Pack edited = GboardCustomStickersStore.fromJson(
                "{\"packs\":[{\"id\":\"" + id + "\",\"name\":\"ok\",\"stickers\":"
                        + "[\"" + id + ".png\",\"" + other + ".png\"],\"edited\":{"
                        + "\"" + id + ".png\":{\"source\":\"../../x.png\",\"outline\":5},"
                        + "\"" + other + ".png\":{\"source\":\"" + id + "1.png\","
                        + "\"outline\":99999}}}]}").get(0);
        assertEquals(id + ".png", edited.sourceOf(id + ".png"));
        assertEquals(other + ".png", edited.sourceOf(other + ".png"));
        assertTrue(edited.edited.isEmpty());
    }

    @Test public void parserClampsSavedEditSettings() throws Exception {
        String id = "0123456789abcdef0123456789abcdef";
        String shown = "fedcba9876543210fedcba9876543210.png";
        GboardCustomStickersStore.Pack pack = GboardCustomStickersStore.fromJson(
                "{\"packs\":[{\"id\":\"" + id + "\",\"name\":\"ok\",\"stickers\":"
                        + "[\"" + shown + "\"],\"edited\":{\"" + shown + "\":{\"source\":\""
                        + id + ".png\",\"corners\":500,\"outline\":99999}}}]}").get(0);
        assertEquals(100, pack.editsOf(shown).cornerPercent);
        assertEquals(GboardCustomStickersStore.MAX_OUTLINE_WIDTH, pack.editsOf(shown).outlineWidth);
    }

    private static byte[] png(int width, int height) {
        Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        bitmap.eraseColor(Color.BLUE);
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, output);
        return output.toByteArray();
    }
}
