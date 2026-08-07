.class public final Lcom/tantan/library/svga/drawer/audio/SVGAAudioDrawer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0004\u0008\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\r\u0010\u0005\u001a\u00020\u0006H\u0000\u00a2\u0006\u0002\u0008\u0007J\u001d\u0010\u0008\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000cH\u0000\u00a2\u0006\u0002\u0008\rJ\r\u0010\u000e\u001a\u00020\u0006H\u0000\u00a2\u0006\u0002\u0008\u000fR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/tantan/library/svga/drawer/audio/SVGAAudioDrawer;",
        "",
        "videoItem",
        "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
        "(Lcom/tantan/library/svga/compose/SVGAVideoEntity;)V",
        "pause",
        "",
        "pause$svga_lib_release",
        "playAudio",
        "isVisible",
        "",
        "frameIndex",
        "",
        "playAudio$svga_lib_release",
        "resume",
        "resume$svga_lib_release",
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


# instance fields
.field private final videoItem:Lcom/tantan/library/svga/compose/SVGAVideoEntity;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantan/library/svga/compose/SVGAVideoEntity;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/compose/SVGAVideoEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/tantan/library/svga/drawer/audio/SVGAAudioDrawer;->videoItem:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final pause$svga_lib_release()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/drawer/audio/SVGAAudioDrawer;->videoItem:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getAudioMap$svga_lib_release()Ljava/util/HashMap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    check-cast p0, Ljava/lang/Iterable;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/tantan/library/svga/compose/entities/SVGAAudio;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/entities/SVGAAudio;->getPlayID()Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    sget-object v1, Lcom/tantan/library/svga/utils/SVGASoundManager;->INSTANCE:Lcom/tantan/library/svga/utils/SVGASoundManager;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/utils/SVGASoundManager;->pause$svga_lib_release(I)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    return-void
.end method

.method public final playAudio$svga_lib_release(ZI)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/drawer/audio/SVGAAudioDrawer;->videoItem:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getAudioMap$svga_lib_release()Ljava/util/HashMap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    check-cast p0, Ljava/lang/Iterable;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/tantan/library/svga/compose/entities/SVGAAudio;

    .line 31
    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/entities/SVGAAudio;->getStartFrame()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    add-int/lit8 v2, p2, -0x1

    .line 39
    .line 40
    if-ne v1, v2, :cond_1

    .line 41
    .line 42
    sget-object v1, Lcom/tantan/library/svga/utils/SVGASoundManager;->INSTANCE:Lcom/tantan/library/svga/utils/SVGASoundManager;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/entities/SVGAAudio;->getSoundID()Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/utils/SVGASoundManager;->play$svga_lib_release(Ljava/lang/Integer;)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/compose/entities/SVGAAudio;->setPlayID(Ljava/lang/Integer;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    if-eqz p1, :cond_2

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/entities/SVGAAudio;->getEndFrame()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    add-int/lit8 v2, p2, -0x1

    .line 67
    .line 68
    if-gt v1, v2, :cond_0

    .line 69
    .line 70
    :cond_2
    sget-object v1, Lcom/tantan/library/svga/utils/SVGASoundManager;->INSTANCE:Lcom/tantan/library/svga/utils/SVGASoundManager;

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/entities/SVGAAudio;->getPlayID()Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/utils/SVGASoundManager;->stop$svga_lib_release(Ljava/lang/Integer;)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    return-void
.end method

.method public final resume$svga_lib_release()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/drawer/audio/SVGAAudioDrawer;->videoItem:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getAudioMap$svga_lib_release()Ljava/util/HashMap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    check-cast p0, Ljava/lang/Iterable;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/tantan/library/svga/compose/entities/SVGAAudio;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/entities/SVGAAudio;->getPlayID()Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    sget-object v1, Lcom/tantan/library/svga/utils/SVGASoundManager;->INSTANCE:Lcom/tantan/library/svga/utils/SVGASoundManager;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/utils/SVGASoundManager;->resume$svga_lib_release(I)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    return-void
.end method
