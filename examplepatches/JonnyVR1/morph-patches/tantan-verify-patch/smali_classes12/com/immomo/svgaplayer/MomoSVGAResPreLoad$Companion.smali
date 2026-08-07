.class public final Lcom/immomo/svgaplayer/MomoSVGAResPreLoad$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\t\u001a\u00020\u0004R\u001e\u0010\u0003\u001a\u0004\u0018\u00010\u00048BX\u0082\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\"\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/MomoSVGAResPreLoad$Companion;",
        "",
        "()V",
        "instance",
        "Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;",
        "getInstance",
        "()Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;",
        "setInstance",
        "(Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;)V",
        "get",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/immomo/svgaplayer/MomoSVGAResPreLoad$Companion;-><init>()V

    return-void
.end method

.method private final getInstance()Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;->access$getInstance$cp()Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-direct {p0, v0}, Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;->access$setInstance$cp(Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {}, Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;->access$getInstance$cp()Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method private final setInstance(Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;->access$setInstance$cp(Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final get()Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/immomo/svgaplayer/MomoSVGAResPreLoad$Companion;->getInstance()Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-object p0
.end method
