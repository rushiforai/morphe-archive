package dev.utaa.linimal.extension.features.theme;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

/**
 * AMOLED テーマで黒にする LINE の resource と、その上書き表を組み立てる処理。
 *
 * <p>対象は、ダークモードで画面全体の地になる背景色と、下部タブの背景画像だけです。パッチ側の
 * {@code AmoledThemeResourcePatch} が、同じ名前の resource が想定どおりにあることを build 時に
 * 確かめます（{@code AmoledThemeResourcePatchTest} が両者の一覧の一致を検証します）。
 * カード、ポップアップ、区切り線などの一段明るい面は、背景と見分けられるよう元の色のまま残します。</p>
 */
public final class AmoledThemeColors {
    public static final int BLACK = 0xFF000000;

    /**
     * 夜間設定で黒にする色 resource の名前。
     *
     * <p>{@code linegray900} はパレットの色で、LINE はダークモードの下部のナビゲーションバーの背景に
     * これを直接使います。夜間設定では背景と同じ色の面にしか使われないため、黒にしても区別は失われません。</p>
     */
    static final List<String> NAMES = Collections.unmodifiableList(Arrays.asList(
            "primaryBackground",
            "primarySurface",
            "secondaryAltBackground",
            "tertiaryAltBackground",
            "splashBackground",
            "statusbarBackground",
            "chatBackground",
            "linegray900"));

    /**
     * 不透明な部分を黒に塗り替えた画像へ差し替える drawable resource の名前。
     *
     * <p>下部タブの背景画像で、LINE は既定の着せかえを端末のダークモードで表示するときだけこれを使います。
     * 背景の View は画像の高さで大きさが決まるため、単色ではなく同じ寸法の画像に差し替えます。</p>
     */
    static final List<String> DRAWABLE_NAMES = Collections.unmodifiableList(Arrays.asList(
            "navi_bottom_bg_dark"));

    private AmoledThemeColors() {
    }

    /** resource の解決と画像の用意を担う seam。Android の {@code Resources} から実装します。 */
    interface Resolver {
        /** resource の ID。見つからなければ 0。 */
        int id(String name, String type);

        /** resource ID の type 名。見つからなければ null。 */
        String typeName(int resourceId);

        /** resource ID の package 名。見つからなければ null。 */
        String packageName(int resourceId);

        /** 塗り替えた画像を用意できた drawable の density。用意できなければ 0。 */
        int imageDensity(int resourceId);
    }

    /** loader に渡す resources.arsc と、そこから参照するファイルのパスと元の resource ID。 */
    static final class Table {
        final byte[] arsc;
        final Map<String, Integer> files;

        Table(byte[] arsc, Map<String, Integer> files) {
            this.arsc = arsc;
            this.files = Collections.unmodifiableMap(files);
        }
    }

    /**
     * 解決できた resource だけで上書き表を組み立てます。1 件も解決できない場合や、ID の package が
     * そろわない場合、ID の type が名前と合わない場合は null を返し、LINE の元の値を使います。
     */
    static Table buildTable(Resolver resolver) {
        Map<Integer, NightResourceTable.Chunk> chunks = new LinkedHashMap<>();
        Map<String, Integer> files = new TreeMap<>();
        SortedMap<Integer, Boolean> typeIds = new TreeMap<>();
        int packageId = -1;
        int sampleId = 0;
        for (Map.Entry<String, List<String>> group : targets().entrySet()) {
            String type = group.getKey();
            boolean drawable = "drawable".equals(type);
            int typeId = -1;
            for (String name : group.getValue()) {
                int id = resolver.id(name, type);
                if (id == 0) {
                    continue;
                }
                int entryPackage = (id >>> 24) & 0xff;
                int entryType = (id >>> 16) & 0xff;
                if (packageId == -1) {
                    packageId = entryPackage;
                    sampleId = id;
                } else if (packageId != entryPackage) {
                    return null;
                }
                if (typeId == -1) {
                    if (!type.equals(resolver.typeName(id))) {
                        return null;
                    }
                    typeId = entryType;
                } else if (typeId != entryType) {
                    return null;
                }
                int density = 0;
                NightResourceTable.Entry entry;
                if (drawable) {
                    density = resolver.imageDensity(id);
                    if (density <= 0 || density > 0xffff) {
                        continue;
                    }
                    String path = "res/drawable-night/linimal_amoled_" + name + ".png";
                    entry = NightResourceTable.Entry.file(name, path);
                    files.put(path, id);
                } else {
                    entry = NightResourceTable.Entry.color(name, BLACK);
                }
                int key = (typeId << 16) | density;
                NightResourceTable.Chunk chunk = chunks.get(key);
                if (chunk == null) {
                    chunk = new NightResourceTable.Chunk(typeId, density);
                    chunks.put(key, chunk);
                }
                chunk.put(id & 0xffff, entry);
                typeIds.put(typeId, Boolean.TRUE);
            }
        }
        if (chunks.isEmpty() || typeIds.firstKey() < 1) {
            return null;
        }
        String packageName = resolver.packageName(sampleId);
        if (packageName == null) {
            return null;
        }
        List<String> typeNames = new ArrayList<>();
        for (int type = 1; type <= typeIds.lastKey(); type++) {
            String typeName = resolver.typeName((packageId << 24) | (type << 16));
            // 名前は ID からの検索にしか使われないため、解決できない type は仮の名前で埋めます。
            typeNames.add(typeName != null ? typeName : "linimal_type_" + type);
        }
        byte[] arsc = NightResourceTable.encode(
                packageName, packageId, typeNames, new ArrayList<>(chunks.values()));
        return new Table(arsc, files);
    }

    /**
     * 不透明な画素だけを黒にします。影やぼかしの半透明な画素は元のまま残し、タブと内容の境目を保ちます。
     *
     * @param pixels ARGB の画素。この配列を書き換えます
     */
    static void blackenOpaquePixels(int[] pixels) {
        for (int index = 0; index < pixels.length; index++) {
            if ((pixels[index] >>> 24) == 0xff) {
                pixels[index] = BLACK;
            }
        }
    }

    private static Map<String, List<String>> targets() {
        Map<String, List<String>> targets = new LinkedHashMap<>();
        targets.put("color", NAMES);
        targets.put("drawable", DRAWABLE_NAMES);
        return targets;
    }
}
