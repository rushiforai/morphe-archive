.class public Ll/tyr;
.super Ll/mof0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mof0<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;",
        ">;"
    }
.end annotation


# static fields
.field public static k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static l:Ljava/lang/String;


# instance fields
.field public h:Ll/jxd0;

.field public i:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public j:Z


# direct methods
.method public constructor <init>()V
    .locals 6

    .line 1
    new-instance v1, Lcom/tantanapp/common/network/RunnerProxy;

    .line 2
    .line 3
    invoke-direct {v1}, Lcom/tantanapp/common/network/RunnerProxy;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v3, Ll/pkq;

    .line 7
    .line 8
    new-instance v0, Ll/vod;

    .line 9
    .line 10
    const-string v2, "V3"

    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    const-string v5, "LiveBeautyConfigApi"

    .line 14
    .line 15
    invoke-direct {v0, v5, v2, v4}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 19
    .line 20
    new-instance v4, Ll/jyr;

    .line 21
    .line 22
    invoke-direct {v4}, Ll/jyr;-><init>()V

    .line 23
    .line 24
    .line 25
    const/4 v5, -0x1

    .line 26
    invoke-direct {v3, v0, v5, v2, v4}, Ll/pkq;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/JsonAdapter;Ll/pcj;)V

    .line 27
    .line 28
    .line 29
    new-instance v4, Ll/kyr;

    .line 30
    .line 31
    invoke-direct {v4}, Ll/kyr;-><init>()V

    .line 32
    .line 33
    .line 34
    const/4 v5, 0x1

    .line 35
    const-string v2, "LiveBeautyConfigApi"

    .line 36
    .line 37
    move-object v0, p0

    .line 38
    invoke-direct/range {v0 .. v5}, Ll/mof0;-><init>(Lcom/tantanapp/common/network/RunnerProxy;Ljava/lang/String;Ll/dji;Ll/pcj;Z)V

    .line 39
    .line 40
    .line 41
    new-instance p0, Ll/jxd0;

    .line 42
    .line 43
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 44
    .line 45
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v1}, Ll/uyr;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-direct {p0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 56
    .line 57
    .line 58
    iput-object p0, v0, Ll/tyr;->h:Ll/jxd0;

    .line 59
    .line 60
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iput-object p0, v0, Ll/tyr;->i:Lrx/subjects/a;

    .line 65
    .line 66
    return-void
.end method

.method public static synthetic B()Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public static synthetic C(Ll/tyr;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tyr;->P(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic D(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "filter download error:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    const-string p0, "null"

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v0, "[live]beauty_filter"

    .line 25
    .line 26
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic E(Ll/tyr;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tyr;->O(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic F(Ll/tyr;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tyr;->Q(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic G(Ll/tyr;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tyr;->L(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic H()Lrx/c;
    .locals 2

    .line 1
    const-string v0, "/live-beauty-config?bundleID=com.tantantribe.tribe"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "load-live-beauty-config"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/vrv;->h(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/lyr;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/lyr;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    return-object v0
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveBeautyConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic J(Ll/tyr;Ll/uxj0;)Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tyr;->R(Ll/uxj0;)Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    move-result-object p0

    return-object p0
.end method

.method public static T(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Ll/tyr;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static U(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/tyr;->k:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    sget-object p0, Ll/tyr;->k:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public K()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->beautyConfig:Ljava/util/List;

    .line 12
    .line 13
    return-object p0
.end method

.method public final L(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x1

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/p6s;->F1()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->momoResourcesUrl:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->resourcesUrl:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    :goto_0
    move p0, v1

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move p0, v0

    .line 39
    :goto_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_2

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->licenseUrl:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-nez p1, :cond_2

    .line 52
    .line 53
    move p1, v1

    .line 54
    goto :goto_2

    .line 55
    :cond_2
    move p1, v0

    .line 56
    :goto_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    const-string v3, "check beauty data result: res "

    .line 59
    .line 60
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v3, ", lic "

    .line 67
    .line 68
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    const-string v3, "[live]beauty_filter"

    .line 79
    .line 80
    invoke-static {v3, v2}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    if-eqz p0, :cond_3

    .line 84
    .line 85
    if-eqz p1, :cond_3

    .line 86
    .line 87
    move v0, v1

    .line 88
    :cond_3
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method

.method public M()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/tyr;->j:Z

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
    iput-boolean v0, p0, Ll/tyr;->j:Z

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/mof0;->k()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ll/nyr;

    .line 14
    .line 15
    invoke-direct {v2, p0}, Ll/nyr;-><init>(Ll/tyr;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/oyr;

    .line 35
    .line 36
    invoke-direct {v1}, Ll/oyr;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/pyr;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/pyr;-><init>(Ll/tyr;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/qyr;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/qyr;-><init>(Ll/tyr;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/ryr;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/ryr;-><init>(Ll/tyr;)V

    .line 72
    .line 73
    .line 74
    new-instance v2, Ll/syr;

    .line 75
    .line 76
    invoke-direct {v2}, Ll/syr;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ll/mof0;->z()Lrx/c;

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public N()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tyr;->i:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->i()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic O(Ll/uxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/tyr;->j:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic P(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/tyr;->j:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Q(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tyr;->i:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic R(Ll/uxj0;)Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    .line 6
    .line 7
    return-object p0
.end method

.method public S()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/tyr;->N()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/zrv;->c:Ll/tyr;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/tyr;->M()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/tyr;->i:Lrx/subjects/a;

    .line 13
    .line 14
    new-instance v1, Ll/myr;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/myr;-><init>(Ll/tyr;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method
