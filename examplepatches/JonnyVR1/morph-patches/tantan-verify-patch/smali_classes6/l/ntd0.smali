.class public final synthetic Ll/ntd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;


# direct methods
.method public synthetic constructor <init>(Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ntd0;->a:Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ntd0;->a:Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    check-cast p2, Ljava/lang/Throwable;

    invoke-static {p0, p1, p2}, Ll/otd0;->a(Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V

    return-void
.end method
