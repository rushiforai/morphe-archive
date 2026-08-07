.class public Ll/ggn;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final REQUEST_JSCODE_PICKER:I = 0x315


# instance fields
.field private final act:Lcom/p1/mobile/putong/app/PutongAct;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private callback:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private lastUploadLogTimeSp:Ll/byd0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/app/PutongAct;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/byd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "lastUploadLogTime_"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/mbs;->e()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-wide/16 v2, 0x0

    .line 29
    .line 30
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/ggn;->lastUploadLogTimeSp:Ll/byd0;

    .line 38
    .line 39
    iput-object p1, p0, Ll/ggn;->act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic a(Ll/ggn;Lcom/p1/mobile/putong/live/base/data/BLiveIntlMlnMedia;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ggn;->m(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMlnMedia;)V

    return-void
.end method

.method public static synthetic b(Ll/ggn;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ggn;->l()V

    return-void
.end method

.method public static synthetic c(Ll/ggn;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ggn;->j()V

    return-void
.end method

.method public static synthetic d(Ll/ggn;Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ggn;->k(Ljava/util/List;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ljava/util/List;)Lcom/p1/mobile/putong/live/base/data/BLiveIntlMlnMedia;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMlnMedia;

    .line 7
    .line 8
    return-object p0
.end method

.method public static synthetic f(Ll/ggn;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ggn;->n()V

    return-void
.end method

.method public static synthetic g(Ll/ggn;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ggn;->o(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public h(Ll/x20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ggn;->act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public i()Z
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Ll/ggn;->lastUploadLogTimeSp:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    sub-long v2, v0, v2

    .line 18
    .line 19
    sget-object v4, Ll/tbs;->b:Ll/vwt;

    .line 20
    .line 21
    invoke-virtual {v4}, Ll/vwt;->E5()J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    cmp-long v2, v2, v4

    .line 26
    .line 27
    if-lez v2, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Ll/ggn;->lastUploadLogTimeSp:Ll/byd0;

    .line 30
    .line 31
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method public final synthetic j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ggn;->act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic k(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    new-instance v0, Ll/dgn;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dgn;-><init>(Ll/ggn;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ggn;->h(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    xor-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic l()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ggn;->act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMlnMedia;)V
    .locals 1

    .line 1
    new-instance v0, Ll/egn;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/egn;-><init>(Ll/ggn;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ggn;->h(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/ggn;->callback:Ll/y20;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMlnMedia;->url:Ljava/lang/String;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic n()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ggn;->act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic o(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    new-instance v0, Ll/fgn;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/fgn;-><init>(Ll/ggn;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ggn;->h(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->a:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public p(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    new-instance p1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, -0x1

    .line 7
    if-ne p2, v0, :cond_0

    .line 8
    .line 9
    sget-object p1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ljava/util/ArrayList;

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/ggn;->q(Ljava/util/List;I)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public q(Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)V"
        }
    .end annotation

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    if-lez p2, :cond_0

    .line 9
    .line 10
    const/4 p2, 0x0

    .line 11
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    instance-of p2, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 18
    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 22
    .line 23
    const-string p2, "preprocessed"

    .line 24
    .line 25
    invoke-static {p2}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    iput-object p2, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 30
    .line 31
    new-instance p2, Ll/sim;

    .line 32
    .line 33
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-direct {p2, v0}, Ll/sim;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p2, Ll/sim;->c:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 45
    .line 46
    new-instance v0, Lcom/p1/mobile/putong/data/Dimension;

    .line 47
    .line 48
    iget-object p2, p2, Ll/sim;->d:[I

    .line 49
    .line 50
    invoke-direct {v0, p2}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 51
    .line 52
    .line 53
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ll/ggn;->t(Lcom/p1/mobile/putong/data/Picture;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public r(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ggn;->callback:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public s()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ggn;->i()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p0, Ljava/util/Date;

    .line 9
    .line 10
    invoke-direct {p0}, Ljava/util/Date;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x5

    .line 21
    const/4 v2, -0x1

    .line 22
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->add(II)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/xd00;->d()Ll/xd00;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string v0, "intl_feedback"

    .line 45
    .line 46
    invoke-virtual {p0, v1, v0}, Ll/xd00;->e(Ljava/util/List;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final t(Lcom/p1/mobile/putong/data/Picture;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Ll/ggn;->u(Lcom/p1/mobile/putong/data/Picture;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->L:I

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Ll/ggn;->act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    sget v1, Lcom/p1/mobile/putong/live/external/R$string;->c:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/ggn;->act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 23
    .line 24
    const-string v1, "report"

    .line 25
    .line 26
    invoke-static {v1}, Lcom/p1/mobile/putong/data/UploadSource;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UploadSource;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "/live/upload/image?source=intlfeedback"

    .line 31
    .line 32
    invoke-static {v2}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {p1, v1, v2}, Ll/wd00;->B(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/UploadSource;Ljava/lang/String;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance v1, Ll/zfn;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/zfn;-><init>(Ll/ggn;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    new-instance v1, Ll/agn;

    .line 50
    .line 51
    invoke-direct {v1}, Ll/agn;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    new-instance v0, Ll/bgn;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/bgn;-><init>(Ll/ggn;)V

    .line 65
    .line 66
    .line 67
    new-instance v1, Ll/cgn;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/cgn;-><init>(Ll/ggn;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    :cond_1
    return-void
.end method

.method public final u(Lcom/p1/mobile/putong/data/Picture;)Z
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    new-instance p1, Ljava/io/File;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/io/File;->length()J

    .line 29
    .line 30
    .line 31
    move-result-wide p0

    .line 32
    const-wide/16 v0, 0x400

    .line 33
    .line 34
    div-long/2addr p0, v0

    .line 35
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/vwt;->D5()J

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    cmp-long p0, p0, v0

    .line 42
    .line 43
    if-lez p0, :cond_0

    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    return p0

    .line 47
    :cond_0
    const/4 p0, 0x1

    .line 48
    return p0
.end method
