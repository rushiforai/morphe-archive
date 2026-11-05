.class public final Le/e/a/FontSelection195;
.super Ljava/lang/Object;
.source "FontSelection195.java"


# static fields
.field static face:Landroid/graphics/Typeface;

.field static last:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 6
    const-string v0, ""

    sput-object v0, Le/e/a/FontSelection195;->last:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static declared-synchronized current(Landroid/content/Context;)Landroid/graphics/Typeface;
    .registers 6

    const-class v0, Le/e/a/FontSelection195;

    monitor-enter v0

    .line 7
    :try_start_3
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "comment_font_file"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "comment_font_enabled"

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_19

    const/4 v4, 0x0

    goto :goto_1a

    :cond_19
    const/4 v4, 0x1

    :goto_1a
    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_74

    const/4 v3, 0x0

    if-nez v1, :cond_23

    monitor-exit v0

    return-object v3

    .line 8
    :cond_23
    :try_start_23
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v1
    :try_end_27
    .catchall {:try_start_23 .. :try_end_27} :catchall_74

    if-eqz v1, :cond_2b

    monitor-exit v0

    return-object v3

    :cond_2b
    :try_start_2b
    sget-object v1, Le/e/a/FontSelection195;->last:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_70

    sput-object v3, Le/e/a/FontSelection195;->face:Landroid/graphics/Typeface;
    :try_end_35
    .catchall {:try_start_2b .. :try_end_35} :catchall_74

    :try_start_35
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string v3, "comment-fonts"

    invoke-direct {v1, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance p0, Ljava/io/File;

    invoke-direct {p0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6e

    invoke-static {p0}, Landroid/graphics/Typeface;->createFromFile(Ljava/io/File;)Landroid/graphics/Typeface;

    move-result-object p0

    sput-object p0, Le/e/a/FontSelection195;->face:Landroid/graphics/Typeface;
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_6c} :catch_6d
    .catchall {:try_start_35 .. :try_end_6c} :catchall_74

    goto :goto_6e

    :catch_6d
    move-exception p0

    :cond_6e
    :goto_6e
    :try_start_6e
    sput-object v2, Le/e/a/FontSelection195;->last:Ljava/lang/String;

    :cond_70
    sget-object p0, Le/e/a/FontSelection195;->face:Landroid/graphics/Typeface;
    :try_end_72
    .catchall {:try_start_6e .. :try_end_72} :catchall_74

    monitor-exit v0

    return-object p0

    .line 6
    :catchall_74
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static isFontKey(Ljava/lang/String;)Z
    .registers 2

    .line 5
    const-string v0, "comment_font_file"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "comment_font_enabled"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12

    const/4 p0, 0x0

    return p0

    :cond_12
    const/4 p0, 0x1

    return p0
.end method
