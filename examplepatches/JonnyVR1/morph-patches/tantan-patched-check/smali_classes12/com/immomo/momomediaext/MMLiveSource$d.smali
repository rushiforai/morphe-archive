.class Lcom/immomo/momomediaext/MMLiveSource$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/pub/MomoPipelineModuleRegister$a;


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
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource$d;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(IILl/c4m;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(IILl/c4m;)V
    .locals 1

    .line 1
    iget-object p3, p0, Lcom/immomo/momomediaext/MMLiveSource$d;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ll/lg60;->a(II)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p3, v0}, Lcom/immomo/momomediaext/MMLiveSource;->h(Lcom/immomo/momomediaext/MMLiveSource;I)I

    .line 8
    .line 9
    .line 10
    iget-object p3, p0, Lcom/immomo/momomediaext/MMLiveSource$d;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 11
    .line 12
    invoke-static {p3}, Lcom/immomo/momomediaext/MMLiveSource;->i(Lcom/immomo/momomediaext/MMLiveSource;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    if-eqz p3, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveSource$d;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 19
    .line 20
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveSource;->i(Lcom/immomo/momomediaext/MMLiveSource;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/4 p3, 0x0

    .line 25
    invoke-interface {p0, p3, p1, p2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
