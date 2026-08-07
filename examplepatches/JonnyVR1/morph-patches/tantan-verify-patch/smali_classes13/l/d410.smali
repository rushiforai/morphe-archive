.class public Ll/d410;
.super Ll/f410;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/f410;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static h(Landroid/content/Context;Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/g510;Ll/q210$a;Ll/uow;)Lcom/momo/pipline/MomoInterface/MomoCodec;
    .locals 0

    .line 1
    new-instance p1, Ll/tc0;

    .line 2
    .line 3
    invoke-direct {p1, p0, p2, p3, p4}, Ll/tc0;-><init>(Landroid/content/Context;Ll/g510;Ll/q210$a;Ll/uow;)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method

.method public static i(Landroid/content/Context;Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/g510;Ll/q210$a;Ll/uow;Ljava/lang/String;)Lcom/momo/pipline/MomoInterface/MomoCodec;
    .locals 0

    .line 1
    move-object p1, p0

    .line 2
    new-instance p0, Ll/tc0;

    .line 3
    .line 4
    invoke-direct/range {p0 .. p5}, Ll/tc0;-><init>(Landroid/content/Context;Ll/g510;Ll/q210$a;Ll/uow;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public static j(Landroid/content/Context;Ljava/lang/String;Ll/q210$a;IZLl/brx;)Ll/eh0;
    .locals 7
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0xe
    .end annotation

    .line 1
    new-instance v0, Ll/eh0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    move-object v6, p5

    .line 9
    invoke-direct/range {v0 .. v6}, Ll/eh0;-><init>(Landroid/content/Context;Ljava/lang/String;Ll/q210$a;IZLl/brx;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static k(Landroid/content/Context;Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/g510;Ll/q210$a;Ll/uow;)Lcom/momo/pipline/MomoInterface/MomoCodec;
    .locals 0

    .line 1
    new-instance p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-direct {p1, p0, p2, p3, p4}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;-><init>(Landroid/content/Context;Ll/g510;Ll/q210$a;Ll/uow;)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method

.method public static l(Landroid/content/Context;Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/g510;Ll/q210$a;Ll/uow;Ljava/lang/String;)Lcom/momo/pipline/MomoInterface/MomoCodec;
    .locals 0

    .line 1
    move-object p1, p0

    .line 2
    new-instance p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 3
    .line 4
    invoke-direct/range {p0 .. p5}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;-><init>(Landroid/content/Context;Ll/g510;Ll/q210$a;Ll/uow;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public static m(Landroid/app/Activity;Ll/brx;)Lcom/momo/pub/MomoPipelineModuleRegister;
    .locals 1

    .line 1
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p1}, Ll/arx;->k(Landroid/content/Context;Ll/brx;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/h410;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Ll/h410;-><init>(Landroid/app/Activity;)V

    .line 11
    .line 12
    .line 13
    return-object p1
.end method

.method public static n(Landroid/content/Context;Ll/brx;)Lcom/momo/pub/MomoPipelineModuleRegister;
    .locals 1

    .line 1
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p1}, Ll/arx;->k(Landroid/content/Context;Ll/brx;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/h410;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Ll/h410;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    return-object p1
.end method

.method public static o(Ll/uow;)Ll/c410;
    .locals 1
    .param p0    # Ll/uow;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/e410;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/e410;-><init>(Ll/uow;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static p(Landroid/content/Context;Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/g510;Ll/q210$a;Ll/uow;)Lcom/momo/pipline/MomoInterface/MomoCodec;
    .locals 0

    .line 1
    new-instance p1, Ll/xmp0;

    .line 2
    .line 3
    invoke-direct {p1, p0, p2, p3, p4}, Ll/xmp0;-><init>(Landroid/content/Context;Ll/g510;Ll/q210$a;Ll/uow;)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method

.method public static q(Landroid/content/Context;Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/g510;Ll/q210$a;Ll/uow;Ljava/lang/String;)Lcom/momo/pipline/MomoInterface/MomoCodec;
    .locals 0

    .line 1
    move-object p1, p0

    .line 2
    new-instance p0, Ll/xmp0;

    .line 3
    .line 4
    invoke-direct/range {p0 .. p5}, Ll/xmp0;-><init>(Landroid/content/Context;Ll/g510;Ll/q210$a;Ll/uow;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method
