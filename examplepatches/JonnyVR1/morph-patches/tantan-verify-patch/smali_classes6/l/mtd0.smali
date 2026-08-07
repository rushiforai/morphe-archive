.class public final synthetic Ll/mtd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ljava/io/File;

.field public final synthetic b:Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;


# direct methods
.method public synthetic constructor <init>(Ljava/io/File;Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mtd0;->a:Ljava/io/File;

    iput-object p2, p0, Ll/mtd0;->b:Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mtd0;->a:Ljava/io/File;

    iget-object p0, p0, Ll/mtd0;->b:Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    check-cast p2, Ljava/io/File;

    invoke-static {v0, p0, p1, p2}, Ll/otd0;->b(Ljava/io/File;Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method
