.class public Ll/x5o;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveFrameData;)Lcom/p1/mobile/putong/live/base/data/BLiveFrameData;
    .locals 2

    .line 1
    invoke-static {}, Ll/ahn;->a()Ll/ahn;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    iput-boolean v1, v0, Ll/ahn;->b:Z

    .line 7
    .line 8
    sget-object v0, Ll/itd0;->e:Ll/itd0;

    .line 9
    .line 10
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ll/fm3;

    .line 15
    .line 16
    iget-object v0, v0, Ll/fm3;->h:Ll/wbp;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;)Lrx/c;
    .locals 3

    .line 1
    sget-object v0, Ll/itd0;->e:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ll/fm3;

    .line 8
    .line 9
    iget-object v1, v1, Ll/fm3;->g:Ll/vbp;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;

    .line 16
    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;->version:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;->version:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/fm3;

    .line 35
    .line 36
    iget-object v0, v0, Ll/fm3;->h:Ll/wbp;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveFrameData;

    .line 43
    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    invoke-static {p0}, Ll/x5o;->i(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_1
    new-instance v1, Landroid/util/Pair;

    .line 52
    .line 53
    invoke-direct {v1, v0, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_2
    :goto_0
    invoke-static {p0}, Ll/x5o;->i(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method public static synthetic c(Landroid/util/Pair;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/ahn;->a()Ll/ahn;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    iput-boolean v1, v0, Ll/ahn;->b:Z

    .line 7
    .line 8
    invoke-static {p0}, Ll/x5o;->h(Landroid/util/Pair;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 12
    .line 13
    const-string v0, "intl_frame_cdn"

    .line 14
    .line 15
    const-string v1, "intl_pull_cdn_frame_end"

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlLiveFramesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;Lcom/p1/mobile/putong/live/base/data/BLiveFrameData;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Landroid/util/Pair;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/ahn;->a()Ll/ahn;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/ahn;->b:Z

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/vrv;->c:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;->url:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static h(Landroid/util/Pair;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFrameData;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/ahn;->a()Ll/ahn;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFrameData;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFrameData;->intlLiveFrameData:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/ahn;->d(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static i(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;",
            ")",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFrameData;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/itd0;->e:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/fm3;

    .line 8
    .line 9
    iget-object v0, v0, Ll/fm3;->g:Ll/vbp;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 15
    .line 16
    const-string v1, "intl_frame_cdn"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/t5o;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/t5o;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;)V

    .line 24
    .line 25
    .line 26
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveFrameData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/u5o;

    .line 33
    .line 34
    invoke-direct {v1}, Ll/u5o;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/v5o;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/v5o;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/w5o;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/w5o;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public static j()V
    .locals 3

    .line 1
    invoke-static {}, Ll/ahn;->a()Ll/ahn;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    iput-boolean v1, v0, Ll/ahn;->b:Z

    .line 7
    .line 8
    const-string v0, "/intlLiveFramesMetadata"

    .line 9
    .line 10
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/rnl;->p()Ll/rnl$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/rnl$a;->d()Ll/rnl;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "intlLiveFramesMetadata"

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/vrv;->h(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/o5o;

    .line 41
    .line 42
    invoke-direct {v1}, Ll/o5o;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/p5o;

    .line 50
    .line 51
    invoke-direct {v1}, Ll/p5o;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/q5o;

    .line 59
    .line 60
    invoke-direct {v1}, Ll/q5o;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/r5o;

    .line 68
    .line 69
    invoke-direct {v1}, Ll/r5o;-><init>()V

    .line 70
    .line 71
    .line 72
    new-instance v2, Ll/s5o;

    .line 73
    .line 74
    invoke-direct {v2}, Ll/s5o;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 82
    .line 83
    .line 84
    return-void
.end method
