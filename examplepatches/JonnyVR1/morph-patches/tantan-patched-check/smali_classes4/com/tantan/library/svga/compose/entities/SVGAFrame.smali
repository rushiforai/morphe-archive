.class public final Lcom/tantan/library/svga/compose/entities/SVGAFrame;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0007\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u001a\u0010\u0005\u001a\u00020\u0006X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008\"\u0004\u0008\t\u0010\nR\u001a\u0010\u000b\u001a\u00020\u000cX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\r\u0010\u000e\"\u0004\u0008\u000f\u0010\u0010R\u001c\u0010\u0011\u001a\u0004\u0018\u00010\u0012X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0013\u0010\u0014\"\u0004\u0008\u0015\u0010\u0016R\u001a\u0010\u0017\u001a\u00020\u0018X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0019\u0010\u001a\"\u0004\u0008\u001b\u0010\u001cR \u0010\u001d\u001a\u0008\u0012\u0004\u0012\u00020\u001f0\u001eX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008 \u0010!\"\u0004\u0008\"\u0010#\u00a8\u0006$"
    }
    d2 = {
        "Lcom/tantan/library/svga/compose/entities/SVGAFrame;",
        "",
        "obj",
        "Lcom/tantan/library/svga/compose/proto/FrameEntity;",
        "(Lcom/tantan/library/svga/compose/proto/FrameEntity;)V",
        "alpha",
        "",
        "getAlpha",
        "()F",
        "setAlpha",
        "(F)V",
        "layout",
        "Lcom/tantan/library/svga/utils/FRect;",
        "getLayout",
        "()Lcom/tantan/library/svga/utils/FRect;",
        "setLayout",
        "(Lcom/tantan/library/svga/utils/FRect;)V",
        "maskPath",
        "Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;",
        "getMaskPath",
        "()Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;",
        "setMaskPath",
        "(Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;)V",
        "matrix",
        "Lcom/tantan/library/svga/utils/FMatrix;",
        "getMatrix",
        "()Lcom/tantan/library/svga/utils/FMatrix;",
        "setMatrix",
        "(Lcom/tantan/library/svga/utils/FMatrix;)V",
        "shapes",
        "",
        "Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;",
        "getShapes",
        "()Ljava/util/List;",
        "setShapes",
        "(Ljava/util/List;)V",
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
.field private alpha:F

.field private layout:Lcom/tantan/library/svga/utils/FRect;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private maskPath:Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private matrix:Lcom/tantan/library/svga/utils/FMatrix;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private shapes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantan/library/svga/compose/proto/FrameEntity;)V
    .locals 3
    .param p1    # Lcom/tantan/library/svga/compose/proto/FrameEntity;
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
    iget-object v0, p1, Lcom/tantan/library/svga/compose/proto/FrameEntity;->alpha:Ljava/lang/Float;

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
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    :goto_0
    iput v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->alpha:F

    .line 19
    .line 20
    new-instance v0, Lcom/tantan/library/svga/utils/FRect;

    .line 21
    .line 22
    const/high16 v2, 0x3f800000    # 1.0f

    .line 23
    .line 24
    invoke-direct {v0, v1, v1, v2, v2}, Lcom/tantan/library/svga/utils/FRect;-><init>(FFFF)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->layout:Lcom/tantan/library/svga/utils/FRect;

    .line 28
    .line 29
    new-instance v0, Lcom/tantan/library/svga/utils/FMatrix;

    .line 30
    .line 31
    invoke-direct {v0}, Lcom/tantan/library/svga/utils/FMatrix;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->matrix:Lcom/tantan/library/svga/utils/FMatrix;

    .line 35
    .line 36
    iget-object v0, p1, Lcom/tantan/library/svga/compose/proto/FrameEntity;->layout:Lcom/tantan/library/svga/compose/proto/Layout;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v1, p0, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->layout:Lcom/tantan/library/svga/utils/FRect;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/utils/FRect;->transform$svga_lib_release(Lcom/tantan/library/svga/compose/proto/Layout;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object v0, p1, Lcom/tantan/library/svga/compose/proto/FrameEntity;->transform:Lcom/tantan/library/svga/compose/proto/Transform;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    iget-object v1, p0, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->matrix:Lcom/tantan/library/svga/utils/FMatrix;

    .line 50
    .line 51
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/utils/FMatrix;->transform$svga_lib_release(Lcom/tantan/library/svga/compose/proto/Transform;)V

    .line 52
    .line 53
    .line 54
    :cond_2
    iget-object v0, p1, Lcom/tantan/library/svga/compose/proto/FrameEntity;->clipPath:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz v0, :cond_4

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-lez v1, :cond_3

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_3
    const/4 v0, 0x0

    .line 66
    :goto_1
    if-eqz v0, :cond_4

    .line 67
    .line 68
    new-instance v1, Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;

    .line 69
    .line 70
    invoke-direct {v1, v0}, Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iput-object v1, p0, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->maskPath:Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;

    .line 74
    .line 75
    :cond_4
    iget-object p1, p1, Lcom/tantan/library/svga/compose/proto/FrameEntity;->shapes:Ljava/util/List;

    .line 76
    .line 77
    if-eqz p1, :cond_5

    .line 78
    .line 79
    check-cast p1, Ljava/lang/Iterable;

    .line 80
    .line 81
    new-instance v0, Ljava/util/ArrayList;

    .line 82
    .line 83
    const/16 v1, 0xa

    .line 84
    .line 85
    invoke-static {p1, v1}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 90
    .line 91
    .line 92
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-eqz v1, :cond_6

    .line 101
    .line 102
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    check-cast v1, Lcom/tantan/library/svga/compose/proto/ShapeEntity;

    .line 107
    .line 108
    new-instance v2, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;

    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 111
    .line 112
    .line 113
    invoke-direct {v2, v1}, Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;-><init>(Lcom/tantan/library/svga/compose/proto/ShapeEntity;)V

    .line 114
    .line 115
    .line 116
    invoke-interface {v0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    goto :goto_2

    .line 120
    :cond_5
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    :cond_6
    iput-object v0, p0, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->shapes:Ljava/util/List;

    .line 125
    .line 126
    return-void
.end method


# virtual methods
.method public final getAlpha()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->alpha:F

    .line 2
    .line 3
    return p0
.end method

.method public final getLayout()Lcom/tantan/library/svga/utils/FRect;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->layout:Lcom/tantan/library/svga/utils/FRect;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMaskPath()Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->maskPath:Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMatrix()Lcom/tantan/library/svga/utils/FMatrix;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->matrix:Lcom/tantan/library/svga/utils/FMatrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getShapes()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->shapes:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final setAlpha(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->alpha:F

    .line 2
    .line 3
    return-void
.end method

.method public final setLayout(Lcom/tantan/library/svga/utils/FRect;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/utils/FRect;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->layout:Lcom/tantan/library/svga/utils/FRect;

    .line 5
    .line 6
    return-void
.end method

.method public final setMaskPath(Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->maskPath:Lcom/tantan/library/svga/compose/entities/SVGAPathEntity;

    .line 2
    .line 3
    return-void
.end method

.method public final setMatrix(Lcom/tantan/library/svga/utils/FMatrix;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/utils/FMatrix;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->matrix:Lcom/tantan/library/svga/utils/FMatrix;

    .line 5
    .line 6
    return-void
.end method

.method public final setShapes(Ljava/util/List;)V
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tantan/library/svga/compose/entities/SVGAVideoShapeEntity;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantan/library/svga/compose/entities/SVGAFrame;->shapes:Ljava/util/List;

    .line 5
    .line 6
    return-void
.end method
