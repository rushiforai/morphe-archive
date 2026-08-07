.class public final Lcom/tantan/library/svga/compose/entities/SVGAAudio;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u000e\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u001e\u0010\t\u001a\u0004\u0018\u00010\u0006X\u0086\u000e\u00a2\u0006\u0010\n\u0002\u0010\u000e\u001a\u0004\u0008\n\u0010\u000b\"\u0004\u0008\u000c\u0010\rR\u001e\u0010\u000f\u001a\u0004\u0018\u00010\u0006X\u0086\u000e\u00a2\u0006\u0010\n\u0002\u0010\u000e\u001a\u0004\u0008\u0010\u0010\u000b\"\u0004\u0008\u0011\u0010\rR\u0011\u0010\u0012\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0008\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/tantan/library/svga/compose/entities/SVGAAudio;",
        "",
        "obj",
        "Lcom/tantan/library/svga/compose/proto/AudioEntity;",
        "(Lcom/tantan/library/svga/compose/proto/AudioEntity;)V",
        "endFrame",
        "",
        "getEndFrame",
        "()I",
        "playID",
        "getPlayID",
        "()Ljava/lang/Integer;",
        "setPlayID",
        "(Ljava/lang/Integer;)V",
        "Ljava/lang/Integer;",
        "soundID",
        "getSoundID",
        "setSoundID",
        "startFrame",
        "getStartFrame",
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


# instance fields
.field private final endFrame:I

.field private playID:Ljava/lang/Integer;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private soundID:Ljava/lang/Integer;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final startFrame:I


# direct methods
.method public constructor <init>(Lcom/tantan/library/svga/compose/proto/AudioEntity;)V
    .locals 2
    .param p1    # Lcom/tantan/library/svga/compose/proto/AudioEntity;
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
    iget-object v0, p1, Lcom/tantan/library/svga/compose/proto/AudioEntity;->startFrame:Ljava/lang/Integer;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    move v0, v1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    :goto_0
    iput v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAAudio;->startFrame:I

    .line 19
    .line 20
    iget-object p1, p1, Lcom/tantan/library/svga/compose/proto/AudioEntity;->endFrame:Ljava/lang/Integer;

    .line 21
    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    :goto_1
    iput v1, p0, Lcom/tantan/library/svga/compose/entities/SVGAAudio;->endFrame:I

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public final getEndFrame()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/compose/entities/SVGAAudio;->endFrame:I

    .line 2
    .line 3
    return p0
.end method

.method public final getPlayID()Ljava/lang/Integer;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/compose/entities/SVGAAudio;->playID:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getSoundID()Ljava/lang/Integer;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/compose/entities/SVGAAudio;->soundID:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getStartFrame()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/compose/entities/SVGAAudio;->startFrame:I

    .line 2
    .line 3
    return p0
.end method

.method public final setPlayID(Ljava/lang/Integer;)V
    .locals 0
    .param p1    # Ljava/lang/Integer;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/entities/SVGAAudio;->playID:Ljava/lang/Integer;

    .line 2
    .line 3
    return-void
.end method

.method public final setSoundID(Ljava/lang/Integer;)V
    .locals 0
    .param p1    # Ljava/lang/Integer;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/entities/SVGAAudio;->soundID:Ljava/lang/Integer;

    .line 2
    .line 3
    return-void
.end method
