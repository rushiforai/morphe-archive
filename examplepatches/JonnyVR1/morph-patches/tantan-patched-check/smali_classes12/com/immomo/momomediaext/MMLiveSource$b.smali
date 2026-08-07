.class Lcom/immomo/momomediaext/MMLiveSource$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/j410$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveSource;->v(Ll/brx;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/momomediaext/MMLiveSource;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveSource;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource$b;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource$b;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveSource;->e(Lcom/immomo/momomediaext/MMLiveSource;)Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource$b;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveSource;->e(Lcom/immomo/momomediaext/MMLiveSource;)Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
