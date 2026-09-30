package com.feixiangdao.doubanplayerbridge;

import java.util.ArrayList;
import java.util.List;

final class MediaInfo {
    String title;
    Integer year;
    String preferredType = "movie";
    final List<String> aliases = new ArrayList<>();

    String cacheKey() {
        return (title == null ? "" : title.trim().toLowerCase()) +
                "|" + (year == null ? "" : year) +
                "|" + preferredType;
    }

    String debugText() {
        StringBuilder b = new StringBuilder();
        b.append("识别结果\n");
        b.append("标题: ").append(title == null ? "?" : title).append("\n");
        b.append("年份: ").append(year == null ? "?" : year).append("\n");
        b.append("类型: ").append(preferredType).append("\n");
        if (!aliases.isEmpty()) {
            b.append("候选标题: ");
            for (int i = 0; i < Math.min(3, aliases.size()); i++) {
                if (i > 0) b.append(" / ");
                b.append(aliases.get(i));
            }
        }
        return b.toString();
    }
}
