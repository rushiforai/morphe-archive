.class public final Lcom/tantan/library/svga/utils/SVGASoundManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010%\n\u0002\u0010\u0008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u000e\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0004J\u001f\u0010\u0018\u001a\u00020\u000c2\u0008\u0010\u0019\u001a\u0004\u0018\u00010\r2\u0006\u0010\u001a\u001a\u00020\u001bH\u0000\u00a2\u0006\u0002\u0008\u001cJ\u0015\u0010\u001d\u001a\u00020\u00162\u0006\u0010\u001e\u001a\u00020\u000cH\u0000\u00a2\u0006\u0002\u0008\u001fJ\u0019\u0010 \u001a\u00020\u000c2\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u000cH\u0000\u00a2\u0006\u0004\u0008!\u0010\"J\u0006\u0010#\u001a\u00020\u0016J\u0015\u0010$\u001a\u00020\u00162\u0006\u0010\u001e\u001a\u00020\u000cH\u0000\u00a2\u0006\u0002\u0008%J\u001a\u0010&\u001a\u00020\u00162\u0006\u0010\u0013\u001a\u00020\u00142\n\u0008\u0002\u0010\'\u001a\u0004\u0018\u00010(J\u0019\u0010)\u001a\u00020\u00162\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u000cH\u0000\u00a2\u0006\u0004\u0008*\u0010+J\u0015\u0010,\u001a\u00020\u00162\u0006\u0010\u001e\u001a\u00020\u000cH\u0000\u00a2\u0006\u0002\u0008-R(\u0010\u0005\u001a\u0004\u0018\u00010\u00042\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0004@FX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\"\u0004\u0008\u0008\u0010\tR\u001a\u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u000c\u0012\u0004\u0012\u00020\r0\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\"\u0010\u0010\u001a\u0004\u0018\u00010\u000f2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u000f@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012R\u000e\u0010\u0013\u001a\u00020\u0014X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006."
    }
    d2 = {
        "Lcom/tantan/library/svga/utils/SVGASoundManager;",
        "",
        "()V",
        "value",
        "Ljava/io/File;",
        "cacheDir",
        "getCacheDir",
        "()Ljava/io/File;",
        "setCacheDir",
        "(Ljava/io/File;)V",
        "soundCallBackMap",
        "",
        "",
        "Lcom/tantan/library/svga/SoundCallBack;",
        "<set-?>",
        "Landroid/media/SoundPool;",
        "soundPool",
        "getSoundPool",
        "()Landroid/media/SoundPool;",
        "volume",
        "",
        "init",
        "",
        "dir",
        "load",
        "callBack",
        "path",
        "",
        "load$svga_lib_release",
        "pause",
        "soundId",
        "pause$svga_lib_release",
        "play",
        "play$svga_lib_release",
        "(Ljava/lang/Integer;)I",
        "release",
        "resume",
        "resume$svga_lib_release",
        "setVolume",
        "entity",
        "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
        "stop",
        "stop$svga_lib_release",
        "(Ljava/lang/Integer;)V",
        "unload",
        "unload$svga_lib_release",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final INSTANCE:Lcom/tantan/library/svga/utils/SVGASoundManager;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static cacheDir:Ljava/io/File;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private static final soundCallBackMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/tantan/library/svga/SoundCallBack;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static soundPool:Landroid/media/SoundPool;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private static volume:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantan/library/svga/utils/SVGASoundManager;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantan/library/svga/utils/SVGASoundManager;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tantan/library/svga/utils/SVGASoundManager;->INSTANCE:Lcom/tantan/library/svga/utils/SVGASoundManager;

    .line 7
    .line 8
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/tantan/library/svga/utils/SVGASoundManager;->soundCallBackMap:Ljava/util/Map;

    .line 14
    .line 15
    const/high16 v0, 0x3f800000    # 1.0f

    .line 16
    .line 17
    sput v0, Lcom/tantan/library/svga/utils/SVGASoundManager;->volume:F

    .line 18
    .line 19
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/media/SoundPool;II)V
    .locals 0

    .line 1
    sget-object p0, Lcom/tantan/library/svga/utils/SVGASoundManager;->soundCallBackMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-interface {p0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/tantan/library/svga/SoundCallBack;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-interface {p0, p1}, Lcom/tantan/library/svga/SoundCallBack;->onComplete(I)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static synthetic setVolume$default(Lcom/tantan/library/svga/utils/SVGASoundManager;FLcom/tantan/library/svga/compose/SVGAVideoEntity;ILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/utils/SVGASoundManager;->setVolume(FLcom/tantan/library/svga/compose/SVGAVideoEntity;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final getCacheDir()Ljava/io/File;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object p0, Lcom/tantan/library/svga/utils/SVGASoundManager;->cacheDir:Ljava/io/File;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getSoundPool()Landroid/media/SoundPool;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object p0, Lcom/tantan/library/svga/utils/SVGASoundManager;->soundPool:Landroid/media/SoundPool;

    .line 2
    .line 3
    return-object p0
.end method

.method public final init(Ljava/io/File;)V
    .locals 1
    .param p1    # Ljava/io/File;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/tantan/library/svga/utils/SVGASoundManager;->soundPool:Landroid/media/SoundPool;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/utils/SVGASoundManager;->setCacheDir(Ljava/io/File;)V

    .line 9
    .line 10
    .line 11
    new-instance p0, Landroid/media/SoundPool$Builder;

    .line 12
    .line 13
    invoke-direct {p0}, Landroid/media/SoundPool$Builder;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance p1, Landroid/media/AudioAttributes$Builder;

    .line 17
    .line 18
    invoke-direct {p1}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    invoke-virtual {p1, v0}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const/4 v0, 0x2

    .line 27
    invoke-virtual {p1, v0}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Landroid/media/SoundPool$Builder;->setAudioAttributes(Landroid/media/AudioAttributes;)Landroid/media/SoundPool$Builder;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const/16 p1, 0xc

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Landroid/media/SoundPool$Builder;->setMaxStreams(I)Landroid/media/SoundPool$Builder;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Landroid/media/SoundPool$Builder;->build()Landroid/media/SoundPool;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    sput-object p0, Lcom/tantan/library/svga/utils/SVGASoundManager;->soundPool:Landroid/media/SoundPool;

    .line 50
    .line 51
    if-eqz p0, :cond_0

    .line 52
    .line 53
    new-instance p1, Ll/ptd0;

    .line 54
    .line 55
    invoke-direct {p1}, Ll/ptd0;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p1}, Landroid/media/SoundPool;->setOnLoadCompleteListener(Landroid/media/SoundPool$OnLoadCompleteListener;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method

.method public final load$svga_lib_release(Lcom/tantan/library/svga/SoundCallBack;Ljava/lang/String;)I
    .locals 1
    .param p1    # Lcom/tantan/library/svga/SoundCallBack;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/tantan/library/svga/utils/SVGASoundManager;->soundPool:Landroid/media/SoundPool;

    .line 5
    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, p2, v0}, Landroid/media/SoundPool;->load(Ljava/lang/String;I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    sget-object p2, Lcom/tantan/library/svga/utils/SVGASoundManager;->soundCallBackMap:Ljava/util/Map;

    .line 16
    .line 17
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {p2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {p2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    :cond_0
    return p0

    .line 35
    :cond_1
    const/4 p0, -0x1

    .line 36
    return p0
.end method

.method public final pause$svga_lib_release(I)V
    .locals 0

    .line 1
    sget-object p0, Lcom/tantan/library/svga/utils/SVGASoundManager;->soundPool:Landroid/media/SoundPool;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/media/SoundPool;->pause(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final play$svga_lib_release(Ljava/lang/Integer;)I
    .locals 7
    .param p1    # Ljava/lang/Integer;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lcom/tantan/library/svga/utils/SVGASoundManager;->soundPool:Landroid/media/SoundPool;

    .line 2
    .line 3
    const/4 p0, -0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sget v2, Lcom/tantan/library/svga/utils/SVGASoundManager;->volume:F

    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    const/high16 v6, 0x3f800000    # 1.0f

    .line 19
    .line 20
    const/4 v4, 0x1

    .line 21
    move v3, v2

    .line 22
    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    :cond_1
    :goto_0
    return p0
.end method

.method public final release()V
    .locals 1

    .line 1
    sget-object p0, Lcom/tantan/library/svga/utils/SVGASoundManager;->soundCallBackMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 10
    .line 11
    .line 12
    :cond_0
    sget-object p0, Lcom/tantan/library/svga/utils/SVGASoundManager;->soundPool:Landroid/media/SoundPool;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/media/SoundPool;->release()V

    .line 17
    .line 18
    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    sput-object p0, Lcom/tantan/library/svga/utils/SVGASoundManager;->soundPool:Landroid/media/SoundPool;

    .line 21
    .line 22
    return-void
.end method

.method public final resume$svga_lib_release(I)V
    .locals 0

    .line 1
    sget-object p0, Lcom/tantan/library/svga/utils/SVGASoundManager;->soundPool:Landroid/media/SoundPool;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/media/SoundPool;->resume(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final setCacheDir(Ljava/io/File;)V
    .locals 1
    .param p1    # Ljava/io/File;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    sget-object v0, Lcom/tantan/library/svga/utils/Util;->INSTANCE:Lcom/tantan/library/svga/utils/Util;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/utils/Util;->deleteAll(Ljava/io/File;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    move-object p0, p1

    .line 16
    :cond_0
    if-eqz p0, :cond_2

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move-object p1, p0

    .line 23
    :cond_2
    :goto_0
    sput-object p1, Lcom/tantan/library/svga/utils/SVGASoundManager;->cacheDir:Ljava/io/File;

    .line 24
    .line 25
    return-void
.end method

.method public final setVolume(FLcom/tantan/library/svga/compose/SVGAVideoEntity;)V
    .locals 1
    .param p2    # Lcom/tantan/library/svga/compose/SVGAVideoEntity;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x0

    .line 2
    cmpg-float p0, p1, p0

    .line 3
    .line 4
    if-ltz p0, :cond_3

    .line 5
    .line 6
    const/high16 p0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    cmpl-float p0, p1, p0

    .line 9
    .line 10
    if-lez p0, :cond_0

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_0
    if-nez p2, :cond_1

    .line 14
    .line 15
    sput p1, Lcom/tantan/library/svga/utils/SVGASoundManager;->volume:F

    .line 16
    .line 17
    sget-object p0, Lcom/tantan/library/svga/utils/SVGASoundManager;->soundCallBackMap:Ljava/util/Map;

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-eqz p2, :cond_3

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    check-cast p2, Ljava/util/Map$Entry;

    .line 38
    .line 39
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    check-cast p2, Lcom/tantan/library/svga/SoundCallBack;

    .line 44
    .line 45
    invoke-interface {p2, p1}, Lcom/tantan/library/svga/SoundCallBack;->onVolumeChange(F)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    sget-object p0, Lcom/tantan/library/svga/utils/SVGASoundManager;->soundPool:Landroid/media/SoundPool;

    .line 50
    .line 51
    if-nez p0, :cond_2

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_2
    invoke-virtual {p2}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getAudioMap$svga_lib_release()Ljava/util/HashMap;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Ljava/util/Map$Entry;

    .line 77
    .line 78
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lcom/tantan/library/svga/compose/entities/SVGAAudio;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/entities/SVGAAudio;->getPlayID()Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    if-eqz v0, :cond_3

    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    invoke-virtual {p0, v0, p1, p1}, Landroid/media/SoundPool;->setVolume(IFF)V

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_3
    :goto_2
    return-void
.end method

.method public final stop$svga_lib_release(Ljava/lang/Integer;)V
    .locals 0
    .param p1    # Ljava/lang/Integer;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    sget-object p1, Lcom/tantan/library/svga/utils/SVGASoundManager;->soundPool:Landroid/media/SoundPool;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/media/SoundPool;->stop(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final unload$svga_lib_release(I)V
    .locals 1

    .line 1
    sget-object p0, Lcom/tantan/library/svga/utils/SVGASoundManager;->soundCallBackMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {p0, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/tantan/library/svga/utils/SVGASoundManager;->soundPool:Landroid/media/SoundPool;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/media/SoundPool;->stop(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/media/SoundPool;->unload(I)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
