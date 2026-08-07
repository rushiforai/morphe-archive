.class public Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->f0(Ljava/lang/String;Ljava/util/List;Ll/qcj;)Lrx/c$d;
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

.field public final synthetic b:Ll/qcj;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/util/List;Ll/qcj;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$a;->a:Ljava/util/List;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$a;->b:Ll/qcj;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$a;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Ljava/util/List;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p1, v0, p2}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->h(Ljava/lang/String;Ljava/util/List;ZLjava/lang/Throwable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic b(Ll/qcj;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-static {p2, p0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->g(Ljava/lang/Object;Ll/qcj;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p2, p0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->d(Ljava/lang/Object;Ll/qcj;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->i(Ljava/lang/String;Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p2, p0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->d(Ljava/lang/Object;Ll/qcj;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 p2, 0x0

    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-static {p1, p0, p2, v0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->h(Ljava/lang/String;Ljava/util/List;ZLjava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method


# virtual methods
.method public c(Lrx/c;)Lrx/c;
    .locals 3
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
    iget-object v0, p0, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->f(Ljava/util/List;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-object p1

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$a;->b:Ll/qcj;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$a;->c:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v2, Ll/lfj0;

    .line 15
    .line 16
    invoke-direct {v2, v0, v1}, Ll/lfj0;-><init>(Ll/qcj;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$a;->c:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$a;->a:Ljava/util/List;

    .line 26
    .line 27
    new-instance v1, Ll/mfj0;

    .line 28
    .line 29
    invoke-direct {v1, v0, p0}, Ll/mfj0;-><init>(Ljava/lang/String;Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v1}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lrx/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$a;->c(Lrx/c;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
