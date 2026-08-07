.class public Ll/n46;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile e:Ll/n46;

.field public static final f:[Ljava/lang/String;


# instance fields
.field public a:Ll/wyd0;

.field public b:Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;

.field public c:Lcom/p1/mobile/putong/core/data/ReSwipeConfig;

.field public d:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    const-string v10, "[\u5728\u5417]"

    .line 2
    .line 3
    const-string v11, "[doge]"

    .line 4
    .line 5
    const-string v0, "[\u5fae\u7b11]"

    .line 6
    .line 7
    const-string v1, "[\u5077\u7b11]"

    .line 8
    .line 9
    const-string v2, "[\u661f\u661f\u773c]"

    .line 10
    .line 11
    const-string v3, "[\u5f97\u610f]"

    .line 12
    .line 13
    const-string v4, "[\u563f\u54c8]"

    .line 14
    .line 15
    const-string v5, "[\u6697\u4e2d\u89c2\u5bdf]"

    .line 16
    .line 17
    const-string v6, "[\u62e5\u62b1]"

    .line 18
    .line 19
    const-string v7, "[\u634f\u8138]"

    .line 20
    .line 21
    const-string v8, "[\u5077\u770b]"

    .line 22
    .line 23
    const-string v9, "[\u6478\u9526\u9ca4]"

    .line 24
    .line 25
    filled-new-array/range {v0 .. v11}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Ll/n46;->f:[Ljava/lang/String;

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/n46;->d:Lrx/subjects/b;

    .line 9
    .line 10
    new-instance v0, Ll/wyd0;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "conv_label_last_show_"

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "{}"

    .line 35
    .line 36
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/n46;->a:Ll/wyd0;

    .line 40
    .line 41
    iget-object v0, p0, Ll/n46;->b:Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;

    .line 42
    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;->new_()Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Ll/n46;->b:Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;

    .line 50
    .line 51
    iget-object v1, p0, Ll/n46;->a:Ll/wyd0;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;->toJson()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const-string v1, "reswipe_config"

    .line 65
    .line 66
    sget-object v2, Lcom/p1/mobile/putong/core/data/ReSwipeConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 67
    .line 68
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/p1/mobile/putong/core/data/ReSwipeConfig;

    .line 73
    .line 74
    iput-object v0, p0, Ll/n46;->c:Lcom/p1/mobile/putong/core/data/ReSwipeConfig;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    :catch_0
    iget-object v0, p0, Ll/n46;->c:Lcom/p1/mobile/putong/core/data/ReSwipeConfig;

    .line 77
    .line 78
    if-nez v0, :cond_1

    .line 79
    .line 80
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ReSwipeConfig;->new_()Lcom/p1/mobile/putong/core/data/ReSwipeConfig;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, p0, Ll/n46;->c:Lcom/p1/mobile/putong/core/data/ReSwipeConfig;

    .line 85
    .line 86
    const/4 p0, 0x0

    .line 87
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/ReSwipeConfig;->enable:Z

    .line 88
    .line 89
    const-string p0, "emoji"

    .line 90
    .line 91
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ReSwipeConfig;->expType:Ljava/lang/String;

    .line 92
    .line 93
    const/4 p0, 0x2

    .line 94
    iput p0, v0, Lcom/p1/mobile/putong/core/data/ReSwipeConfig;->maxLabelCount:I

    .line 95
    .line 96
    const/16 p0, 0x18

    .line 97
    .line 98
    iput p0, v0, Lcom/p1/mobile/putong/core/data/ReSwipeConfig;->showHours:I

    .line 99
    .line 100
    :cond_1
    return-void
.end method

.method public static synthetic a(Landroid/util/Pair;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Landroid/util/Pair;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/String;Landroid/util/Pair;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/CharSequence;

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static g()Ll/n46;
    .locals 2

    .line 1
    sget-object v0, Ll/n46;->e:Ll/n46;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/n46;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/n46;->e:Ll/n46;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/n46;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/n46;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/n46;->e:Ll/n46;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/n46;->e:Ll/n46;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public final d(Ljava/lang/String;J)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;->new_()Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;->uid:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, p0, Ll/n46;->c:Lcom/p1/mobile/putong/core/data/ReSwipeConfig;

    .line 8
    .line 9
    iget v1, v1, Lcom/p1/mobile/putong/core/data/ReSwipeConfig;->showHours:I

    .line 10
    .line 11
    int-to-long v1, v1

    .line 12
    const-wide/32 v3, 0x36ee80

    .line 13
    .line 14
    .line 15
    mul-long/2addr v1, v3

    .line 16
    add-long/2addr p2, v1

    .line 17
    iput-wide p2, v0, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;->expired:J

    .line 18
    .line 19
    iget-object p2, p0, Ll/n46;->b:Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;

    .line 20
    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;->labelList:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Ll/n46;->a:Ll/wyd0;

    .line 27
    .line 28
    iget-object p3, p0, Ll/n46;->b:Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;

    .line 29
    .line 30
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;->toJson()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    invoke-virtual {p2, p3}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/n46;->d:Lrx/subjects/b;

    .line 38
    .line 39
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public e()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/n46;->b:Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;->labelList:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;

    .line 26
    .line 27
    iget-wide v2, v1, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;->expired:J

    .line 28
    .line 29
    invoke-static {}, Ll/pzi0;->o()J

    .line 30
    .line 31
    .line 32
    move-result-wide v4

    .line 33
    cmp-long v2, v2, v4

    .line 34
    .line 35
    if-gez v2, :cond_0

    .line 36
    .line 37
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;->uid:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/n46;->f(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/n46;->e()V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/n46;->b:Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;->labelList:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;

    .line 26
    .line 27
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;->uid:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    invoke-interface {v0, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 v2, 0x0

    .line 40
    :goto_0
    if-eqz v2, :cond_2

    .line 41
    .line 42
    iget-object p1, p0, Ll/n46;->a:Ll/wyd0;

    .line 43
    .line 44
    iget-object v0, p0, Ll/n46;->b:Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;->toJson()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ll/n46;->d:Lrx/subjects/b;

    .line 54
    .line 55
    iget-object p1, v2, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;->uid:Ljava/lang/String;

    .line 56
    .line 57
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 58
    .line 59
    invoke-static {p1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    return-void
.end method

.method public h()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/n46;->d:Lrx/subjects/b;

    .line 2
    .line 3
    new-instance v0, Ll/k46;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/k46;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public i(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/n46;->d:Lrx/subjects/b;

    .line 2
    .line 3
    new-instance v0, Ll/l46;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/l46;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance p1, Ll/m46;

    .line 13
    .line 14
    invoke-direct {p1}, Ll/m46;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public j(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/n46;->b:Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;->labelList:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_3

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;

    .line 26
    .line 27
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;->uid:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    iget-wide p0, v0, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;->expired:J

    .line 36
    .line 37
    const-wide/16 v0, 0x3e8

    .line 38
    .line 39
    div-long/2addr p0, v0

    .line 40
    sget-object p2, Ll/n46;->f:[Ljava/lang/String;

    .line 41
    .line 42
    array-length v0, p2

    .line 43
    int-to-long v0, v0

    .line 44
    rem-long/2addr p0, v0

    .line 45
    long-to-int p0, p0

    .line 46
    if-ltz p0, :cond_1

    .line 47
    .line 48
    array-length p1, p2

    .line 49
    if-lt p0, p1, :cond_2

    .line 50
    .line 51
    :cond_1
    const/4 p0, 0x0

    .line 52
    :cond_2
    aget-object p0, p2, p0

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_3
    if-eqz p2, :cond_4

    .line 56
    .line 57
    const-string p0, ""

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_4
    const-string p0, "[\u5fae\u7b11]"

    .line 61
    .line 62
    return-object p0
.end method

.method public k()I
    .locals 6

    .line 1
    iget-object p0, p0, Ll/n46;->b:Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;->labelList:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;

    .line 27
    .line 28
    invoke-static {}, Ll/pzi0;->o()J

    .line 29
    .line 30
    .line 31
    move-result-wide v2

    .line 32
    iget-wide v4, v0, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;->expired:J

    .line 33
    .line 34
    cmp-long v0, v2, v4

    .line 35
    .line 36
    if-gez v0, :cond_0

    .line 37
    .line 38
    add-int/lit8 v1, v1, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return v1
.end method

.method public l()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/n46;->c:Lcom/p1/mobile/putong/core/data/ReSwipeConfig;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ReSwipeConfig;->enable:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ReSwipeConfig;->expType:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "emoji"

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n46;->c:Lcom/p1/mobile/putong/core/data/ReSwipeConfig;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ReSwipeConfig;->enable:Z

    .line 4
    .line 5
    return p0
.end method

.method public n()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/n46;->c:Lcom/p1/mobile/putong/core/data/ReSwipeConfig;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ReSwipeConfig;->enable:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ReSwipeConfig;->expType:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "redDot"

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public o(Ljava/lang/String;)Z
    .locals 5

    .line 1
    iget-object p0, p0, Ll/n46;->b:Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;->labelList:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;

    .line 26
    .line 27
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;->uid:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-static {}, Ll/pzi0;->o()J

    .line 36
    .line 37
    .line 38
    move-result-wide v1

    .line 39
    iget-wide v3, v0, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;->expired:J

    .line 40
    .line 41
    cmp-long v0, v1, v3

    .line 42
    .line 43
    if-gez v0, :cond_0

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_1
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public p(Ljava/lang/String;J)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/n46;->b:Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabels;->labelList:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Ll/n46;->c:Lcom/p1/mobile/putong/core/data/ReSwipeConfig;

    .line 10
    .line 11
    iget v2, v2, Lcom/p1/mobile/putong/core/data/ReSwipeConfig;->maxLabelCount:I

    .line 12
    .line 13
    if-ge v1, v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2, p3}, Ll/n46;->d(Ljava/lang/String;J)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_4

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;

    .line 31
    .line 32
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;->expired:J

    .line 33
    .line 34
    const/4 v4, 0x1

    .line 35
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    if-ge v4, v5, :cond_2

    .line 40
    .line 41
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    check-cast v5, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;

    .line 46
    .line 47
    iget-wide v5, v5, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;->expired:J

    .line 48
    .line 49
    cmp-long v5, v5, v2

    .line 50
    .line 51
    if-gez v5, :cond_1

    .line 52
    .line 53
    move v1, v4

    .line 54
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-ge v1, v2, :cond_3

    .line 62
    .line 63
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    check-cast v2, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;

    .line 68
    .line 69
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/n46;->d:Lrx/subjects/b;

    .line 73
    .line 74
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/ReSwipeConvLabelItem;->uid:Ljava/lang/String;

    .line 75
    .line 76
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 77
    .line 78
    invoke-static {v1, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    :cond_3
    invoke-virtual {p0, p1, p2, p3}, Ll/n46;->d(Ljava/lang/String;J)V

    .line 86
    .line 87
    .line 88
    :cond_4
    return-void
.end method
