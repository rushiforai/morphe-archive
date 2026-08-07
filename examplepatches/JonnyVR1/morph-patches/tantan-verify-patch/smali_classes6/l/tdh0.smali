.class public Ll/tdh0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile a:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()V
    .locals 3

    .line 1
    sget-boolean v0, Ll/tdh0;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    sput-boolean v0, Ll/tdh0;->a:Z

    .line 8
    .line 9
    new-instance v0, Ll/std0;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/std0;-><init>()V

    .line 12
    .line 13
    .line 14
    sget-object v1, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->Companion:Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;

    .line 15
    .line 16
    new-instance v2, Ll/otd0;

    .line 17
    .line 18
    invoke-direct {v2, v0}, Ll/otd0;-><init>(Ll/std0;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v2}, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;->setMSVGAResLoadAdapter(Lcom/immomo/svgaplayer/adapter/SVGAResLoadAdapter;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ll/rtd0;

    .line 25
    .line 26
    invoke-direct {v2, v0}, Ll/rtd0;-><init>(Ll/std0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v2}, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;->setMSVGAThreadAdapter(Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
