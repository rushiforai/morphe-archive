.class public Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->g0(Ljava/util/List;)Lrx/c$d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/c$d<",
        "TT;TT;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/List;


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$b;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ljava/util/List;Lrx/Notification;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lrx/Notification;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lrx/Notification;->k()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    :cond_0
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-lez p1, :cond_1

    .line 20
    .line 21
    invoke-static {p0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->K(Ljava/util/List;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->J(Ljava/lang/String;)Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 35
    .line 36
    invoke-static {p1}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->e(Lcom/tantanapp/common/network/NetworkTrackInfo;)Ljava/util/ArrayList;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Media;->netReqTimeParams:Ljava/util/ArrayList;

    .line 41
    .line 42
    :cond_1
    return-void
.end method


# virtual methods
.method public b(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$b;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/nfj0;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/nfj0;-><init>(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lrx/c;->doOnEach(Ll/y20;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lrx/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$b;->b(Lrx/c;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
