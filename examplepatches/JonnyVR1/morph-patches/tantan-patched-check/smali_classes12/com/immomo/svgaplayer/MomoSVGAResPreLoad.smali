.class public final Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/svgaplayer/MomoSVGAResPreLoad$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u0000 \t2\u00020\u0001:\u0001\tB\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0018\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0008\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;",
        "",
        "()V",
        "loadRes",
        "",
        "resUrl",
        "",
        "callback",
        "Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;",
        "Companion",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# static fields
.field public static final Companion:Lcom/immomo/svgaplayer/MomoSVGAResPreLoad$Companion;

.field private static instance:Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/immomo/svgaplayer/MomoSVGAResPreLoad$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/immomo/svgaplayer/MomoSVGAResPreLoad$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;->Companion:Lcom/immomo/svgaplayer/MomoSVGAResPreLoad$Companion;

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

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;-><init>()V

    return-void
.end method

.method public static final synthetic access$getInstance$cp()Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;->instance:Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$setInstance$cp(Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;)V
    .locals 0
    .param p0    # Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sput-object p0, Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;->instance:Lcom/immomo/svgaplayer/MomoSVGAResPreLoad;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final loadRes(Ljava/lang/String;Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    sget-object p0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->Companion:Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;->getMSVGAResLoadAdapter()Lcom/immomo/svgaplayer/adapter/SVGAResLoadAdapter;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-interface {p0, v0, p1, p2}, Lcom/immomo/svgaplayer/adapter/SVGAResLoadAdapter;->loadSVGARes(ZLjava/lang/String;Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method
