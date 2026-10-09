.class public final Le/e/a/CommentStyle;
.super Ljava/lang/Object;
.source "CommentStyle.java"


# static fields
.field private static volatile bold:Z

.field private static final listener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

.field private static volatile preferences:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 14
    new-instance v0, Le/e/a/CommentStyle$0;

    invoke-direct {v0}, Le/e/a/CommentStyle$0;-><init>()V

    sput-object v0, Le/e/a/CommentStyle;->listener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Landroid/graphics/Paint;Landroid/content/Context;)Z
    .registers 4
    .param p0, "paint"    # Landroid/graphics/Paint;
    .param p1, "context"    # Landroid/content/Context;

    .line 28
    sget-object v0, Le/e/a/CommentStyle;->preferences:Landroid/content/SharedPreferences;

    if-nez v0, :cond_7

    invoke-static {p1}, Le/e/a/CommentStyle;->initialize(Landroid/content/Context;)V

    .line 29
    :cond_7
    sget-boolean v0, Le/e/a/CommentStyle;->bold:Z

    .line 30
    .local v0, "requested":Z
    invoke-virtual {p0}, Landroid/graphics/Paint;->isFakeBoldText()Z

    move-result v1

    if-ne v1, v0, :cond_11

    const/4 v1, 0x0

    return v1

    .line 31
    :cond_11
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 32
    invoke-virtual {p0}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    invoke-static {v1, v0}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 33
    const/4 v1, 0x1

    return v1
.end method

.method public static bind(Landroid/view/View;)V
    .registers 4
    .param p0, "renderer"    # Landroid/view/View;

    .line 20
    :try_start_0
    const-string v0, "e.e.a.u"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    const-string v0, "r0"

    goto :goto_15

    :cond_13
    const-string v0, "s0"

    .line 21
    .local v0, "field":Ljava/lang/String;
    :goto_15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Paint;

    .line 22
    .local v1, "paint":Landroid/graphics/Paint;
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v1, v2}, Le/e/a/CommentStyle;->apply(Landroid/graphics/Paint;Landroid/content/Context;)Z
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2a} :catch_2c

    .line 25
    nop

    .end local v0    # "field":Ljava/lang/String;
    .end local v1    # "paint":Landroid/graphics/Paint;
    goto :goto_34

    .line 23
    :catch_2c
    move-exception v0

    .line 24
    .local v0, "error":Ljava/lang/Exception;
    const-string v1, "nicoid-comment-style"

    const-string v2, "Could not configure comment font"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 26
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_34
    return-void
.end method

.method private static declared-synchronized initialize(Landroid/content/Context;)V
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    const-class v0, Le/e/a/CommentStyle;

    monitor-enter v0

    .line 36
    :try_start_3
    sget-object v1, Le/e/a/CommentStyle;->preferences:Landroid/content/SharedPreferences;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_1f

    if-eqz v1, :cond_9

    monitor-exit v0

    return-void

    .line 37
    :cond_9
    :try_start_9
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 38
    .local v1, "prefs":Landroid/content/SharedPreferences;
    sget-object v2, Le/e/a/CommentStyle;->listener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 39
    const-string v2, "comment_bold"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    sput-boolean v2, Le/e/a/CommentStyle;->bold:Z

    .line 40
    sput-object v1, Le/e/a/CommentStyle;->preferences:Landroid/content/SharedPreferences;
    :try_end_1d
    .catchall {:try_start_9 .. :try_end_1d} :catchall_1f

    .line 41
    monitor-exit v0

    return-void

    .line 35
    .end local v1    # "prefs":Landroid/content/SharedPreferences;
    .end local p0    # "context":Landroid/content/Context;
    :catchall_1f
    move-exception p0

    :try_start_20
    monitor-exit v0
    :try_end_21
    .catchall {:try_start_20 .. :try_end_21} :catchall_1f

    throw p0
.end method

.method static synthetic lambda$static$0(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 3
    .param p0, "prefs"    # Landroid/content/SharedPreferences;
    .param p1, "key"    # Ljava/lang/String;

    .line 15
    const-string v0, "comment_bold"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Le/e/a/CommentStyle;->bold:Z

    .line 16
    :cond_f
    return-void
.end method
