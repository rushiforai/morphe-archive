.class public final synthetic Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"


# direct methods
.method public static bridge synthetic m()I
    .registers 1

    .line 0
    invoke-static {}, Landroid/view/WindowInsets$Type;->ime()I

    move-result v0

    return v0
.end method

.method public static bridge synthetic m(Landroid/graphics/Insets;)I
    .registers 1

    .line 0
    iget p0, p0, Landroid/graphics/Insets;->bottom:I

    return p0
.end method

.method public static bridge synthetic m(Ljava/util/stream/IntStream;)J
    .registers 3

    .line 0
    invoke-interface {p0}, Ljava/util/stream/IntStream;->count()J

    move-result-wide v0

    return-wide v0
.end method

.method public static bridge synthetic m(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;
    .registers 2

    .line 0
    invoke-virtual {p0, p1}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/view/WindowMetrics;)Landroid/graphics/Rect;
    .registers 1

    .line 0
    invoke-virtual {p0}, Landroid/view/WindowMetrics;->getBounds()Landroid/graphics/Rect;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m()Landroid/net/Uri;
    .registers 1

    .line 0
    sget-object v0, Landroid/provider/MediaStore$Downloads;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    return-object v0
.end method

.method public static bridge synthetic m(Landroid/content/res/Configuration;)Landroid/os/LocaleList;
    .registers 1

    .line 0
    invoke-virtual {p0}, Landroid/content/res/Configuration;->getLocales()Landroid/os/LocaleList;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;)Landroid/view/WindowInsetsController;
    .registers 1

    .line 0
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->getWindowInsetsController()Landroid/view/WindowInsetsController;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/view/WindowManager;)Landroid/view/WindowMetrics;
    .registers 1

    .line 0
    invoke-interface {p0}, Landroid/view/WindowManager;->getCurrentWindowMetrics()Landroid/view/WindowMetrics;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m()Ljava/lang/Character$UnicodeScript;
    .registers 1

    .line 0
    sget-object v0, Ljava/lang/Character$UnicodeScript;->HAN:Ljava/lang/Character$UnicodeScript;

    return-object v0
.end method

.method public static bridge synthetic m(I)Ljava/lang/Character$UnicodeScript;
    .registers 1

    .line 0
    invoke-static {p0}, Ljava/lang/Character$UnicodeScript;->of(I)Ljava/lang/Character$UnicodeScript;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 0
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/util/Map;Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;
    .registers 3

    .line 0
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/util/concurrent/ConcurrentHashMap;Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;
    .registers 3

    .line 0
    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/ConcurrentHashMap;->computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/util/function/Function;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 0
    invoke-interface {p0, p1}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/util/function/Supplier;)Ljava/lang/Object;
    .registers 1

    .line 0
    invoke-interface {p0}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/io/File;)Ljava/nio/file/Path;
    .registers 1

    .line 0
    invoke-virtual {p0}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/nio/file/Path;Ljava/nio/file/Path;[Ljava/nio/file/CopyOption;)Ljava/nio/file/Path;
    .registers 3

    .line 0
    invoke-static {p0, p1, p2}, Ljava/nio/file/Files;->move(Ljava/nio/file/Path;Ljava/nio/file/Path;[Ljava/nio/file/CopyOption;)Ljava/nio/file/Path;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m()Ljava/nio/file/StandardCopyOption;
    .registers 1

    .line 0
    sget-object v0, Ljava/nio/file/StandardCopyOption;->REPLACE_EXISTING:Ljava/nio/file/StandardCopyOption;

    return-object v0
.end method

.method public static bridge synthetic m(Ljava/util/Comparator;)Ljava/util/Comparator;
    .registers 1

    .line 0
    invoke-interface {p0}, Ljava/util/Comparator;->reversed()Ljava/util/Comparator;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/util/function/Function;)Ljava/util/Comparator;
    .registers 1

    .line 0
    invoke-static {p0}, Ljava/util/Comparator;->comparing(Ljava/util/function/Function;)Ljava/util/Comparator;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/util/function/ToLongFunction;)Ljava/util/Comparator;
    .registers 1

    .line 0
    invoke-static {p0}, Ljava/util/Comparator;->comparingLong(Ljava/util/function/ToLongFunction;)Ljava/util/Comparator;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/os/LocaleList;I)Ljava/util/Locale;
    .registers 2

    .line 0
    invoke-virtual {p0, p1}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/lang/String;)Ljava/util/stream/IntStream;
    .registers 1

    .line 0
    invoke-virtual {p0}, Ljava/lang/String;->codePoints()Ljava/util/stream/IntStream;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/util/stream/IntStream;Ljava/util/function/IntPredicate;)Ljava/util/stream/IntStream;
    .registers 2

    .line 0
    invoke-interface {p0, p1}, Ljava/util/stream/IntStream;->filter(Ljava/util/function/IntPredicate;)Ljava/util/stream/IntStream;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Landroid/view/WindowInsetsController;I)V
    .registers 2

    .line 0
    invoke-interface {p0, p1}, Landroid/view/WindowInsetsController;->show(I)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/widget/TextView;I)V
    .registers 2

    .line 0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setAutoSizeTextTypeWithDefaults(I)V

    return-void
.end method

.method public static bridge synthetic m(Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;I)V
    .registers 2

    .line 0
    invoke-virtual {p0, p1}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->setImportantForAutofill(I)V

    return-void
.end method

.method public static bridge synthetic m(Ljava/util/List;Ljava/util/Comparator;)V
    .registers 2

    .line 0
    invoke-interface {p0, p1}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    return-void
.end method

.method public static bridge synthetic m(Landroid/view/WindowInsets;I)Z
    .registers 2

    .line 0
    invoke-virtual {p0, p1}, Landroid/view/WindowInsets;->isVisible(I)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Ljava/util/List;Ljava/util/function/Predicate;)Z
    .registers 2

    .line 0
    invoke-interface {p0, p1}, Ljava/util/List;->removeIf(Ljava/util/function/Predicate;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Ljava/util/function/Predicate;Ljava/lang/Object;)Z
    .registers 2

    .line 0
    invoke-interface {p0, p1}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Ljava/util/stream/IntStream;Ljava/util/function/IntPredicate;)Z
    .registers 2

    .line 0
    invoke-interface {p0, p1}, Ljava/util/stream/IntStream;->anyMatch(Ljava/util/function/IntPredicate;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Ljava/nio/file/Path;)[B
    .registers 1

    .line 0
    invoke-static {p0}, Ljava/nio/file/Files;->readAllBytes(Ljava/nio/file/Path;)[B

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m(Ljava/util/stream/IntStream;)[I
    .registers 1

    .line 0
    invoke-interface {p0}, Ljava/util/stream/IntStream;->toArray()[I

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic m$1()Ljava/lang/Character$UnicodeScript;
    .registers 1

    .line 0
    sget-object v0, Ljava/lang/Character$UnicodeScript;->HIRAGANA:Ljava/lang/Character$UnicodeScript;

    return-object v0
.end method

.method public static bridge synthetic m$1()Ljava/nio/file/StandardCopyOption;
    .registers 1

    .line 0
    sget-object v0, Ljava/nio/file/StandardCopyOption;->ATOMIC_MOVE:Ljava/nio/file/StandardCopyOption;

    return-object v0
.end method

.method public static bridge synthetic m$2()Ljava/lang/Character$UnicodeScript;
    .registers 1

    .line 0
    sget-object v0, Ljava/lang/Character$UnicodeScript;->KATAKANA:Ljava/lang/Character$UnicodeScript;

    return-object v0
.end method

.method public static bridge synthetic m$3()Ljava/lang/Character$UnicodeScript;
    .registers 1

    .line 0
    sget-object v0, Ljava/lang/Character$UnicodeScript;->HANGUL:Ljava/lang/Character$UnicodeScript;

    return-object v0
.end method
