package o;

import android.util.SparseIntArray;
import app.morphe.extension.chmate.ChainAboneVisibility;
import app.morphe.extension.chmate.Haiagaru;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public final class CopyPasteAboneTest {
    private static void check(boolean passed) {
        if (!passed) throw new AssertionError("Copy-paste transparency");
    }

    public static void main(String[] args) {
        var legacy = new m9ExternalSyntheticLambda1();
        var middle = new listener();
        var modern = new zzaW();
        legacy.N.put(1, 8);
        ChainAboneVisibility.apply(legacy);
        check(legacy.N.get(1, 0) == 8);
        Haiagaru.hideCopyPaste = true;
        ChainAboneVisibility.apply(legacy);
        ChainAboneVisibility.apply(middle);
        ChainAboneVisibility.apply(modern);
        check(legacy.N.get(1, 0) == 0x1008 && legacy.N.get(2, 0) == 0 && legacy.N.get(3, 0) == 0x1000);
        check(middle.K.equals(Map.of(1, 0x1000, 3, 0x1000)));
        check(modern.j.equals(Map.of(1, 0x1000, 3, 0x1000)));
        modern.i = false;
        modern.j.clear();
        ChainAboneVisibility.apply(modern);
        check(modern.j.isEmpty());
        System.out.println("Copy-paste transparency: normal/2, unrelated flags, settings off, native NG off");
    }
}

final class m9ExternalSyntheticLambda1 {
    boolean p = true;
    List<Row> K = List.of(new Row(1, 4), new Row(2, 8), new Row(3, 32));
    SparseIntArray N = new SparseIntArray();
}

final class listener {
    boolean r = true;
    List<Row> J = List.of(new Row(1, 4), new Row(2, 8), new Row(3, 32));
    Map<Integer,Integer> K = new HashMap<>();
}

final class zzaW {
    boolean i = true;
    List<Row> a = List.of(new Row(1, 4), new Row(2, 8), new Row(3, 32));
    Map<Integer,Integer> j = new HashMap<>();
}

final class Row {
    final int o, l, f, k;
    Row(int number, int flags) {
        o = l = number;
        f = k = flags;
    }
}
