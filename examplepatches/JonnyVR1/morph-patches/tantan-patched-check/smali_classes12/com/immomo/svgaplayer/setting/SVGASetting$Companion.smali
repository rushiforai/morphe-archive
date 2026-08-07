.class public final Lcom/immomo/svgaplayer/setting/SVGASetting$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/svgaplayer/setting/SVGASetting;
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
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\u0003\u001a\u00020\u0004J\u000e\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008J\u000e\u0010\t\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/setting/SVGASetting$Companion;",
        "",
        "()V",
        "init",
        "Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;",
        "setCacheMaxSize",
        "",
        "maxSize",
        "",
        "switchSVGADevTag",
        "isShow",
        "",
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
    invoke-direct {p0}, Lcom/immomo/svgaplayer/setting/SVGASetting$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final init()Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->Companion:Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;->get()Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final setCacheMaxSize(I)V
    .locals 0

    .line 1
    sget-object p0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->Companion:Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;->get()Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->setSVGAMaxSize(I)Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final switchSVGADevTag(Z)V
    .locals 0

    .line 1
    sget-object p0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->Companion:Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;->get()Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->setSVGATagShow(Z)Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;

    .line 8
    .line 9
    .line 10
    return-void
.end method
