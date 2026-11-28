.class public final Le/e/a/TemporaryCache221;
.super Ljava/lang/Object;
.source "TemporaryCache221.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/TemporaryCache221$Result;
    }
.end annotation


# static fields
.field private static final IMAGE:Ljava/util/regex/Pattern;

.field private static final OLD_VIDEO:Ljava/lang/String; = "nicoid_old_cache_delete"

.field private static final TEMP:Ljava/lang/String; = "nicoid_temporary_cache_delete"

.field private static final VIDEO:Ljava/lang/String; = "cache_all_delete"

.field private static busy:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 25
    const-string v0, "[a-f0-9]{64}\\.img|image--?[0-9]+\\.tmp"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/TemporaryCache221;->IMAGE:Ljava/util/regex/Pattern;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static category(Ljava/lang/String;)[I
    .registers 3

    .line 37
    const-string v0, "nicoid_temporary_cache_delete"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/16 v1, 0xd

    if-eqz v0, :cond_0

    const/4 p0, 0x4

    filled-new-array {v1, p0}, [I

    move-result-object p0

    return-object p0

    .line 38
    :cond_0
    const-string v0, "cache_all_delete"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p0, 0x5

    filled-new-array {v1, p0}, [I

    move-result-object p0

    return-object p0

    .line 39
    :cond_1
    const-string v0, "nicoid_old_cache_delete"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x6

    filled-new-array {v1, p0}, [I

    move-result-object p0

    return-object p0

    .line 40
    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method static categoryItems([Ljava/lang/String;)[Ljava/lang/String;
    .registers 3

    .line 29
    const/4 v0, 0x7

    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    .line 30
    const/4 v0, 0x4

    const-string v1, "\u30a2\u30d7\u30ea\u306e\u4e00\u6642\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u524a\u9664"

    aput-object v1, p0, v0

    .line 31
    const/4 v0, 0x5

    const-string v1, "\u30ad\u30e3\u30c3\u30b7\u30e5\u6e08\u307f\u52d5\u753b\u3092\u3059\u3079\u3066\u524a\u9664"

    aput-object v1, p0, v0

    .line 32
    const/4 v0, 0x6

    const-string/jumbo v1, "\u65e7\u4fdd\u5b58\u5148\u306e\u30ad\u30e3\u30c3\u30b7\u30e5\u6e08\u307f\u52d5\u753b\u3092\u524a\u9664"

    aput-object v1, p0, v0

    .line 33
    return-object p0
.end method

.method private static clear(Landroid/preference/PreferenceActivity;Le/e/a/ImageDiskCache;)V
    .registers 4

    .line 120
    sget-boolean v0, Le/e/a/TemporaryCache221;->busy:Z

    if-eqz v0, :cond_0

    return-void

    .line 121
    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Le/e/a/TemporaryCache221;->busy:Z

    .line 122
    # getter for: Le/e/a/ShortImages;->memory:Landroid/util/LruCache;
    invoke-static {}, Le/e/a/ShortImages;->access$2()Landroid/util/LruCache;

    move-result-object v0

    invoke-virtual {v0}, Landroid/util/LruCache;->evictAll()V

    .line 123
    sget-object v0, Le/e/a/TabPreview235;->CACHE:Landroid/util/LruCache;

    invoke-virtual {v0}, Landroid/util/LruCache;->evictAll()V

    .line 124
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda3;

    invoke-direct {v1, p1, p0}, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda3;-><init>(Le/e/a/ImageDiskCache;Landroid/preference/PreferenceActivity;)V

    const-string p0, "nicoid-temporary-cache-clear"

    invoke-direct {v0, v1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 138
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 139
    return-void
.end method

.method private static confirmation(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    .line 88
    const-string v0, "Remove temporary thumbnail files and clear thumbnails and tab previews from memory. Cached videos, saved MP4 and MP3 files, settings, sign-in and watch history are kept."

    const-string v1, "\u522a\u9664\u7e2e\u5716\u66ab\u5b58\u6a94\uff0c\u4e26\u6e05\u9664\u8a18\u61b6\u9ad4\u4e2d\u7684\u7e2e\u5716\u548c\u5206\u9801\u9810\u89bd\u3002\u5df2\u5feb\u53d6\u5f71\u7247\u3001\u5df2\u5132\u5b58\u7684 MP4 \u548c MP3\u3001\u8a2d\u5b9a\u3001\u767b\u5165\u72c0\u614b\u548c\u89c0\u770b\u7d00\u9304\u6703\u4fdd\u7559\u3002"

    const-string v2, "\u30b5\u30e0\u30cd\u30a4\u30eb\u306e\u4e00\u6642\u30d5\u30a1\u30a4\u30eb\u3068\u3001\u30b5\u30e0\u30cd\u30a4\u30eb\u30fb\u30bf\u30d6\u30d7\u30ec\u30d3\u30e5\u30fc\u306e\u30e1\u30e2\u30ea\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u524a\u9664\u3057\u307e\u3059\u3002\u30ad\u30e3\u30c3\u30b7\u30e5\u6e08\u307f\u52d5\u753b\u3001\u4fdd\u5b58\u3057\u305fMP4\u30fbMP3\u3001\u8a2d\u5b9a\u3001\u30ed\u30b0\u30a4\u30f3\u60c5\u5831\u3001\u8996\u8074\u5c65\u6b74\u306f\u4fdd\u6301\u3055\u308c\u307e\u3059\u3002"

    invoke-static {p0, v2, v0, v1}, Le/e/a/TemporaryCache221;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static inspect(Landroid/preference/PreferenceActivity;)V
    .registers 4

    .line 95
    sget-boolean v0, Le/e/a/TemporaryCache221;->busy:Z

    if-eqz v0, :cond_0

    return-void

    .line 96
    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Le/e/a/TemporaryCache221;->busy:Z

    .line 97
    invoke-static {p0}, Le/e/a/ShortImages;->cacheForCleanup(Landroid/content/Context;)Le/e/a/ImageDiskCache;

    move-result-object v0

    .line 98
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda0;

    invoke-direct {v2, v0, p0}, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda0;-><init>(Le/e/a/ImageDiskCache;Landroid/preference/PreferenceActivity;)V

    const-string p0, "nicoid-temporary-cache-inspect"

    invoke-direct {v1, v2, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 116
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 117
    return-void
.end method

.method static install(Landroid/preference/PreferenceActivity;)V
    .registers 6

    .line 44
    const-string v0, "cache_all_delete"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 45
    if-nez v0, :cond_0

    return-void

    .line 46
    :cond_0
    invoke-virtual {v0}, Landroid/preference/Preference;->getParent()Landroid/preference/PreferenceGroup;

    move-result-object v1

    .line 47
    if-nez v1, :cond_1

    return-void

    .line 48
    :cond_1
    invoke-static {p0}, Le/e/a/TemporaryCache221;->videoTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 50
    const-string v2, "Delete all cached videos from the current cache location."

    const-string v3, "\u522a\u9664\u76ee\u524d\u5feb\u53d6\u4f4d\u7f6e\u4e2d\u6240\u6709\u5df2\u5feb\u53d6\u7684\u5f71\u7247\u3002"

    const-string/jumbo v4, "\u73fe\u5728\u306e\u30ad\u30e3\u30c3\u30b7\u30e5\u4fdd\u5b58\u5148\u306b\u3042\u308b\u30ad\u30e3\u30c3\u30b7\u30e5\u6e08\u307f\u52d5\u753b\u3092\u3059\u3079\u3066\u524a\u9664\u3057\u307e\u3059\u3002"

    invoke-static {p0, v4, v2, v3}, Le/e/a/TemporaryCache221;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 53
    const/4 v2, 0x5

    invoke-virtual {v0, v2}, Landroid/preference/Preference;->setOrder(I)V

    .line 54
    const-string v0, "nicoid_old_cache_delete"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 55
    if-eqz v0, :cond_2

    .line 56
    const-string v2, "Delete cached videos from the old location"

    const-string v3, "\u522a\u9664\u820a\u5132\u5b58\u4f4d\u7f6e\u7684\u5df2\u5feb\u53d6\u5f71\u7247"

    const-string/jumbo v4, "\u65e7\u4fdd\u5b58\u5148\u306e\u30ad\u30e3\u30c3\u30b7\u30e5\u6e08\u307f\u52d5\u753b\u3092\u524a\u9664"

    invoke-static {p0, v4, v2, v3}, Le/e/a/TemporaryCache221;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 58
    const-string v2, "Delete cached videos remaining in the former app-private folder."

    const-string v3, "\u522a\u9664\u820a\u61c9\u7528\u7a0b\u5f0f\u5c08\u7528\u8cc7\u6599\u593e\u4e2d\u5269\u9918\u7684\u5df2\u5feb\u53d6\u5f71\u7247\u3002"

    const-string v4, "\u4ee5\u524d\u306e\u30a2\u30d7\u30ea\u5c02\u7528\u30d5\u30a9\u30eb\u30c0\u306b\u6b8b\u3063\u3066\u3044\u308b\u30ad\u30e3\u30c3\u30b7\u30e5\u6e08\u307f\u52d5\u753b\u3092\u524a\u9664\u3057\u307e\u3059\u3002"

    invoke-static {p0, v4, v2, v3}, Le/e/a/TemporaryCache221;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 61
    const/4 v2, 0x6

    invoke-virtual {v0, v2}, Landroid/preference/Preference;->setOrder(I)V

    .line 63
    :cond_2
    const-string v0, "nicoid_temporary_cache_delete"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    .line 64
    if-nez v2, :cond_3

    .line 65
    new-instance v2, Landroid/preference/Preference;

    invoke-direct {v2, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 66
    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 67
    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setPersistent(Z)V

    .line 68
    const/4 v0, 0x4

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setOrder(I)V

    .line 69
    invoke-virtual {v1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 71
    :cond_3
    invoke-static {p0}, Le/e/a/TemporaryCache221;->title(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 72
    invoke-static {p0}, Le/e/a/TemporaryCache221;->summary(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 73
    new-instance v0, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0}, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda5;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 77
    return-void
.end method

.method static synthetic lambda$clear$4(Landroid/preference/PreferenceActivity;Le/e/a/TemporaryCache221$Result;)V
    .registers 5

    .line 127
    const/4 v0, 0x0

    sput-boolean v0, Le/e/a/TemporaryCache221;->busy:Z

    .line 128
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 129
    :cond_0
    iget v0, p1, Le/e/a/TemporaryCache221$Result;->failed:I

    if-nez v0, :cond_1

    .line 130
    const-string v0, "Temporary cache cleared (%s)"

    const-string v1, "\u5df2\u6e05\u9664\u66ab\u5b58\u5feb\u53d6\uff08%s\uff09"

    const-string v2, "\u4e00\u6642\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u524a\u9664\u3057\u307e\u3057\u305f\uff08%s\uff09"

    invoke-static {p0, v2, v0, v1}, Le/e/a/TemporaryCache221;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 132
    :cond_1
    const-string v0, "Some temporary cache could not be cleared (%s removed)"

    const-string/jumbo v1, "\u90e8\u5206\u66ab\u5b58\u5feb\u53d6\u7121\u6cd5\u6e05\u9664\uff08\u5df2\u6e05\u9664 %s\uff09"

    const-string v2, "\u4e00\u90e8\u306e\u4e00\u6642\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u524a\u9664\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\uff08\u524a\u9664\u6e08\u307f %s\uff09"

    invoke-static {p0, v2, v0, v1}, Le/e/a/TemporaryCache221;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 135
    :goto_0
    iget-wide v1, p1, Le/e/a/TemporaryCache221$Result;->bytes:J

    .line 136
    invoke-static {p0, v1, v2}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    .line 135
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    .line 136
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 137
    return-void

    .line 128
    :cond_2
    :goto_1
    return-void
.end method

.method static synthetic lambda$clear$5(Le/e/a/ImageDiskCache;Landroid/preference/PreferenceActivity;)V
    .registers 3

    .line 125
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Le/e/a/ImageDiskCache;->cleanup(Z)Le/e/a/TemporaryCache221$Result;

    move-result-object p0

    .line 126
    new-instance v0, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda4;

    invoke-direct {v0, p1, p0}, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda4;-><init>(Landroid/preference/PreferenceActivity;Le/e/a/TemporaryCache221$Result;)V

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 138
    return-void
.end method

.method static synthetic lambda$inspect$1(Landroid/preference/PreferenceActivity;Le/e/a/ImageDiskCache;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 113
    invoke-static {p0, p1}, Le/e/a/TemporaryCache221;->clear(Landroid/preference/PreferenceActivity;Le/e/a/ImageDiskCache;)V

    return-void
.end method

.method static synthetic lambda$inspect$2(Landroid/preference/PreferenceActivity;Le/e/a/TemporaryCache221$Result;Le/e/a/ImageDiskCache;)V
    .registers 7

    .line 101
    const/4 v0, 0x0

    sput-boolean v0, Le/e/a/TemporaryCache221;->busy:Z

    .line 102
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 103
    :cond_0
    iget v0, p1, Le/e/a/TemporaryCache221$Result;->failed:I

    if-nez v0, :cond_1

    .line 104
    iget-wide v0, p1, Le/e/a/TemporaryCache221$Result;->bytes:J

    invoke-static {p0, v0, v1}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 105
    :cond_1
    const-string p1, "Some sizes are unavailable"

    const-string/jumbo v0, "\u90e8\u5206\u5927\u5c0f\u7121\u6cd5\u78ba\u8a8d"

    const-string v1, "\u4e00\u90e8\u3092\u78ba\u8a8d\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p0, v1, p1, v0}, Le/e/a/TemporaryCache221;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 106
    :goto_0
    const-string v0, "Estimated file space to clear: %s"

    const-string/jumbo v1, "\u9810\u8a08\u6e05\u9664\u7684\u6a94\u6848\u7a7a\u9593\uff1a%s"

    const-string v2, "\u524a\u9664\u4e88\u5b9a\u5bb9\u91cf\uff08\u30d5\u30a1\u30a4\u30eb\uff09 %s"

    invoke-static {p0, v2, v0, v1}, Le/e/a/TemporaryCache221;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 108
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 109
    invoke-static {p0}, Le/e/a/TemporaryCache221;->title(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 110
    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p0}, Le/e/a/TemporaryCache221;->confirmation(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 111
    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 112
    const-string v0, "\u524a\u9664"

    const-string v1, "Clear"

    const-string/jumbo v2, "\u6e05\u9664"

    invoke-static {p0, v0, v1, v2}, Le/e/a/TemporaryCache221;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p2}, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda1;-><init>(Landroid/preference/PreferenceActivity;Le/e/a/ImageDiskCache;)V

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 114
    invoke-static {p0}, Le/e/a/UiDialogs;->showBuilder(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    .line 115
    return-void

    .line 102
    :cond_2
    :goto_1
    return-void
.end method

.method static synthetic lambda$inspect$3(Le/e/a/ImageDiskCache;Landroid/preference/PreferenceActivity;)V
    .registers 4

    .line 99
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Le/e/a/ImageDiskCache;->cleanup(Z)Le/e/a/TemporaryCache221$Result;

    move-result-object v0

    .line 100
    new-instance v1, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1, v0, p0}, Le/e/a/TemporaryCache221$$ExternalSyntheticLambda2;-><init>(Landroid/preference/PreferenceActivity;Le/e/a/TemporaryCache221$Result;Le/e/a/ImageDiskCache;)V

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 116
    return-void
.end method

.method static synthetic lambda$install$0(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 2

    .line 74
    invoke-static {p0}, Le/e/a/TemporaryCache221;->inspect(Landroid/preference/PreferenceActivity;)V

    .line 75
    const/4 p0, 0x1

    return p0
.end method

.method public static refreshLabels(Landroid/preference/PreferenceActivity;)V
    .registers 1

    invoke-static {p0}, Le/e/a/TemporaryCache221;->install(Landroid/preference/PreferenceActivity;)V

    return-void
.end method

.method static scan(Ljava/io/File;Z)Le/e/a/TemporaryCache221$Result;
    .registers 10

    .line 142
    new-instance v0, Le/e/a/TemporaryCache221$Result;

    invoke-direct {v0}, Le/e/a/TemporaryCache221$Result;-><init>()V

    .line 143
    invoke-virtual {p0}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object p0

    .line 145
    const/4 v1, 0x1

    :try_start_0
    const-class v2, Ljava/nio/file/attribute/BasicFileAttributes;

    new-array v3, v1, [Ljava/nio/file/LinkOption;

    sget-object v4, Ljava/nio/file/LinkOption;->NOFOLLOW_LINKS:Ljava/nio/file/LinkOption;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {p0, v2, v3}, Ljava/nio/file/Files;->readAttributes(Ljava/nio/file/Path;Ljava/lang/Class;[Ljava/nio/file/LinkOption;)Ljava/nio/file/attribute/BasicFileAttributes;

    move-result-object v2

    .line 146
    invoke-interface {v2}, Ljava/nio/file/attribute/BasicFileAttributes;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_0

    .line 147
    iget p0, v0, Le/e/a/TemporaryCache221$Result;->failed:I

    add-int/2addr p0, v1

    iput p0, v0, Le/e/a/TemporaryCache221$Result;->failed:I
    :try_end_0
    .catch Ljava/nio/file/NoSuchFileException; {:try_start_0 .. :try_end_0} :catch_8
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_6

    .line 148
    return-object v0

    .line 155
    :cond_0
    nop

    .line 156
    :try_start_1
    invoke-static {p0}, Ljava/nio/file/Files;->newDirectoryStream(Ljava/nio/file/Path;)Ljava/nio/file/DirectoryStream;

    move-result-object p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/nio/file/DirectoryIteratorException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_3

    .line 157
    :try_start_2
    invoke-interface {p0}, Ljava/nio/file/DirectoryStream;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/nio/file/Path;

    .line 158
    sget-object v4, Le/e/a/TemporaryCache221;->IMAGE:Ljava/util/regex/Pattern;

    invoke-interface {v3}, Ljava/nio/file/Path;->getFileName()Ljava/nio/file/Path;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v4, :cond_1

    goto :goto_0

    .line 160
    :cond_1
    :try_start_3
    const-class v4, Ljava/nio/file/attribute/BasicFileAttributes;

    new-array v6, v1, [Ljava/nio/file/LinkOption;

    sget-object v7, Ljava/nio/file/LinkOption;->NOFOLLOW_LINKS:Ljava/nio/file/LinkOption;

    aput-object v7, v6, v5

    invoke-static {v3, v4, v6}, Ljava/nio/file/Files;->readAttributes(Ljava/nio/file/Path;Ljava/lang/Class;[Ljava/nio/file/LinkOption;)Ljava/nio/file/attribute/BasicFileAttributes;

    move-result-object v4

    .line 162
    invoke-interface {v4}, Ljava/nio/file/attribute/BasicFileAttributes;->isRegularFile()Z

    move-result v6

    if-nez v6, :cond_2

    goto :goto_0

    .line 163
    :cond_2
    if-eqz p1, :cond_3

    invoke-static {v3}, Ljava/nio/file/Files;->deleteIfExists(Ljava/nio/file/Path;)Z

    move-result v3

    if-eqz v3, :cond_4

    :cond_3
    iget-wide v6, v0, Le/e/a/TemporaryCache221$Result;->bytes:J

    invoke-interface {v4}, Ljava/nio/file/attribute/BasicFileAttributes;->size()J

    move-result-wide v3

    add-long/2addr v6, v3

    iput-wide v6, v0, Le/e/a/TemporaryCache221$Result;->bytes:J
    :try_end_3
    .catch Ljava/nio/file/NoSuchFileException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    .line 166
    :catch_0
    move-exception v3

    goto :goto_1

    :catch_1
    move-exception v3

    .line 167
    :goto_1
    :try_start_4
    iget v3, v0, Le/e/a/TemporaryCache221$Result;->failed:I

    add-int/2addr v3, v1

    iput v3, v0, Le/e/a/TemporaryCache221$Result;->failed:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_3

    .line 164
    :catch_2
    move-exception v3

    .line 168
    :cond_4
    :goto_2
    nop

    .line 169
    :goto_3
    goto :goto_0

    .line 170
    :cond_5
    if-eqz p0, :cond_6

    :try_start_5
    invoke-interface {p0}, Ljava/nio/file/DirectoryStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/nio/file/DirectoryIteratorException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_5} :catch_3

    .line 172
    :cond_6
    goto :goto_6

    .line 156
    :catchall_0
    move-exception p1

    if-eqz p0, :cond_7

    :try_start_6
    invoke-interface {p0}, Ljava/nio/file/DirectoryStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_4

    :catchall_1
    move-exception p0

    :try_start_7
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_7
    :goto_4
    throw p1
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5
    .catch Ljava/nio/file/DirectoryIteratorException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Ljava/lang/SecurityException; {:try_start_7 .. :try_end_7} :catch_3

    .line 170
    :catch_3
    move-exception p0

    goto :goto_5

    :catch_4
    move-exception p0

    goto :goto_5

    :catch_5
    move-exception p0

    .line 171
    :goto_5
    iget p0, v0, Le/e/a/TemporaryCache221$Result;->failed:I

    add-int/2addr p0, v1

    iput p0, v0, Le/e/a/TemporaryCache221$Result;->failed:I

    .line 173
    :goto_6
    return-object v0

    .line 152
    :catch_6
    move-exception p0

    goto :goto_7

    :catch_7
    move-exception p0

    .line 153
    :goto_7
    iget p0, v0, Le/e/a/TemporaryCache221$Result;->failed:I

    add-int/2addr p0, v1

    iput p0, v0, Le/e/a/TemporaryCache221$Result;->failed:I

    .line 154
    return-object v0

    .line 150
    :catch_8
    move-exception p0

    .line 151
    return-object v0
.end method

.method private static summary(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    .line 88
    const-string v0, "Clear temporary thumbnail and tab preview caches"

    const-string/jumbo v1, "\u6e05\u9664\u7e2e\u5716\u8207\u5206\u9801\u9810\u89bd\u7684\u66ab\u5b58\u5feb\u53d6"

    const-string v2, "\u30b5\u30e0\u30cd\u30a4\u30eb\u3084\u30bf\u30d6\u306e\u30d7\u30ec\u30d3\u30e5\u30fc\u306e\u4e00\u6642\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u524a\u9664\u3057\u307e\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/TemporaryCache221;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static title(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    .line 84
    const-string v0, "Clear temporary app cache"

    const-string/jumbo v1, "\u6e05\u9664\u61c9\u7528\u7a0b\u5f0f\u66ab\u5b58\u5feb\u53d6"

    const-string v2, "\u30a2\u30d7\u30ea\u306e\u4e00\u6642\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u524a\u9664"

    invoke-static {p0, v2, v0, v1}, Le/e/a/TemporaryCache221;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 80
    invoke-static {p0, p1, p2, p3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static videoTitle(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    const-string v0, "Delete all cached videos"

    const-string v1, "\u522a\u9664\u6240\u6709\u5df2\u5feb\u53d6\u7684\u5f71\u7247"

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u6e08\u307f\u52d5\u753b\u3092\u3059\u3079\u3066\u524a\u9664"

    invoke-static {p0, v2, v0, v1}, Le/e/a/TemporaryCache221;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
