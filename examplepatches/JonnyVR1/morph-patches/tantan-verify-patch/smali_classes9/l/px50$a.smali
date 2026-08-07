.class public Ll/px50$a;
.super Ll/gk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/px50;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public c:Z

.field public d:I

.field public e:Ljava/lang/String;

.field public f:Z

.field public g:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

.field public h:I

.field public i:[I

.field public j:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ll/x20;

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:I

.field public o:Z

.field public p:Z

.field public q:Z


# direct methods
.method public constructor <init>(I)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/gk2;-><init>(I)V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/px50$a;->e:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    new-array v0, v0, [I

    .line 10
    .line 11
    iput-object v0, p0, Ll/px50$a;->i:[I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput v1, p0, Ll/px50$a;->n:I

    .line 15
    .line 16
    iput-boolean v1, p0, Ll/px50$a;->p:Z

    .line 17
    .line 18
    iput p1, p0, Ll/px50$a;->d:I

    .line 19
    .line 20
    invoke-static {}, Ll/ynp0;->p()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    int-to-float p1, p1

    .line 25
    const v2, 0x3f5c28f6    # 0.86f

    .line 26
    .line 27
    .line 28
    mul-float/2addr p1, v2

    .line 29
    float-to-int p1, p1

    .line 30
    aput p1, v0, v1

    .line 31
    .line 32
    iget-object p1, p0, Ll/px50$a;->i:[I

    .line 33
    .line 34
    invoke-static {}, Ll/bnl0;->w0()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    int-to-float v0, v0

    .line 39
    const/high16 v1, 0x3f400000    # 0.75f

    .line 40
    .line 41
    mul-float/2addr v0, v1

    .line 42
    float-to-int v0, v0

    .line 43
    const/4 v1, 0x1

    .line 44
    aput v0, p1, v1

    .line 45
    .line 46
    const/16 p1, 0x11

    .line 47
    .line 48
    iput p1, p0, Ll/px50$a;->h:I

    .line 49
    .line 50
    sget-object p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->DEFAULT_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 51
    .line 52
    iput-object p1, p0, Ll/px50$a;->g:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 53
    .line 54
    return-void
.end method

.method public static bridge synthetic a(Ll/px50$a;)Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/px50$a;->g:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/px50$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/px50$a;->l:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/px50$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/px50$a;->n:I

    return p0
.end method

.method public static bridge synthetic d(Ll/px50$a;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/px50$a;->k:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/px50$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/px50$a;->d:I

    return p0
.end method

.method public static bridge synthetic f(Ll/px50$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/px50$a;->h:I

    return p0
.end method

.method public static bridge synthetic g(Ll/px50$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/px50$a;->m:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic h(Ll/px50$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/px50$a;->p:Z

    return p0
.end method

.method public static bridge synthetic i(Ll/px50$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/px50$a;->q:Z

    return p0
.end method

.method public static bridge synthetic j(Ll/px50$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/px50$a;->o:Z

    return p0
.end method

.method public static bridge synthetic k(Ll/px50$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/px50$a;->f:Z

    return p0
.end method

.method public static bridge synthetic l(Ll/px50$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/px50$a;->c:Z

    return p0
.end method

.method public static bridge synthetic m(Ll/px50$a;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/px50$a;->j:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic n(Ll/px50$a;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/px50$a;->i:[I

    return-object p0
.end method

.method public static bridge synthetic o(Ll/px50$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/px50$a;->e:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public A(II)Ll/px50$a;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/px50$a;->i:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aput p1, v0, v1

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    aput p2, v0, p1

    .line 8
    .line 9
    return-object p0
.end method

.method public B(Ljava/lang/String;)Ll/px50$a;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Ll/px50$a;->e:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    return-object p0
.end method

.method public p(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)Ll/px50$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/px50$a;->g:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()Ll/px50;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/px50$a;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/px50;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/px50;-><init>(Ll/px50$a;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public r(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)Ll/px50$a;
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailUrl:Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p0, Ll/px50$a;->e:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailInset:Ljava/util/List;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/lang/Double;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailInset:Ljava/util/List;

    .line 19
    .line 20
    const/4 v3, 0x1

    .line 21
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Ljava/lang/Double;

    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    .line 28
    .line 29
    .line 30
    move-result-wide v4

    .line 31
    invoke-virtual {p0, v0, v1, v4, v5}, Ll/px50$a;->z(DD)Ll/px50$a;

    .line 32
    .line 33
    .line 34
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailGravity:I

    .line 35
    .line 36
    if-ne v0, v3, :cond_0

    .line 37
    .line 38
    const/16 v0, 0x50

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/16 v0, 0x11

    .line 42
    .line 43
    :goto_0
    iput v0, p0, Ll/px50$a;->h:I

    .line 44
    .line 45
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->webBgType:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/px50$a;->p(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)Ll/px50$a;

    .line 48
    .line 49
    .line 50
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->campaignType:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v0, p0, Ll/px50$a;->l:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->id:Ljava/lang/String;

    .line 55
    .line 56
    iput-object v0, p0, Ll/px50$a;->m:Ljava/lang/String;

    .line 57
    .line 58
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->isNeedCloseBtn:Z

    .line 59
    .line 60
    iput-boolean p1, p0, Ll/px50$a;->f:Z

    .line 61
    .line 62
    return-object p0
.end method

.method public s(I)Ll/px50$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/px50$a;->n:I

    .line 2
    .line 3
    return-object p0
.end method

.method public t(I)Ll/px50$a;
    .locals 3

    .line 1
    iput p1, p0, Ll/px50$a;->h:I

    .line 2
    .line 3
    const/16 v0, 0x50

    .line 4
    .line 5
    if-ne p1, v0, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Ll/px50$a;->i:[I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    aget v1, p1, v0

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    aget v1, p1, v2

    .line 16
    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    :cond_0
    invoke-static {}, Ll/ynp0;->p()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    aput v1, p1, v0

    .line 24
    .line 25
    iget-object p1, p0, Ll/px50$a;->i:[I

    .line 26
    .line 27
    invoke-static {}, Ll/bnl0;->w0()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    int-to-float v0, v0

    .line 32
    const/high16 v1, 0x3f400000    # 0.75f

    .line 33
    .line 34
    mul-float/2addr v0, v1

    .line 35
    float-to-int v0, v0

    .line 36
    aput v0, p1, v2

    .line 37
    .line 38
    :cond_1
    return-object p0
.end method

.method public u(Z)Ll/px50$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/px50$a;->q:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public v()Ll/px50$a;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/px50$a;->o:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public w(Ljava/lang/String;)Ll/px50$a;
    .locals 1

    .line 1
    const-string v0, "1"

    .line 2
    .line 3
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput-boolean p1, p0, Ll/px50$a;->c:Z

    .line 8
    .line 9
    return-object p0
.end method

.method public x()Ll/px50$a;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/px50$a;->f:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public y(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;)Ll/px50$a;
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;->detailUrl:Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p0, Ll/px50$a;->e:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;->detailInset:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;->detailInset:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v2, 0x2

    .line 21
    if-lt v0, v2, :cond_0

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;->detailInset:Ljava/util/List;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ljava/lang/Integer;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    int-to-double v2, v0

    .line 37
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;->detailInset:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ljava/lang/Integer;

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    int-to-double v4, v0

    .line 50
    invoke-virtual {p0, v2, v3, v4, v5}, Ll/px50$a;->z(DD)Ll/px50$a;

    .line 51
    .line 52
    .line 53
    :cond_0
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;->detailGravity:I

    .line 54
    .line 55
    if-ne v0, v1, :cond_1

    .line 56
    .line 57
    const/16 v0, 0x50

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    const/16 v0, 0x11

    .line 61
    .line 62
    :goto_0
    iput v0, p0, Ll/px50$a;->h:I

    .line 63
    .line 64
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;->webBgType:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Ll/px50$a;->p(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)Ll/px50$a;

    .line 67
    .line 68
    .line 69
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;->campaignType:Ljava/lang/String;

    .line 70
    .line 71
    iput-object v0, p0, Ll/px50$a;->l:Ljava/lang/String;

    .line 72
    .line 73
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;->id:Ljava/lang/String;

    .line 74
    .line 75
    iput-object v0, p0, Ll/px50$a;->m:Ljava/lang/String;

    .line 76
    .line 77
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;->isNeedCloseBtn:Z

    .line 78
    .line 79
    iput-boolean p1, p0, Ll/px50$a;->f:Z

    .line 80
    .line 81
    return-object p0
.end method

.method public z(DD)Ll/px50$a;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/px50$a;->i:[I

    .line 2
    .line 3
    invoke-static {}, Ll/ynp0;->p()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-double v1, v1

    .line 8
    mul-double/2addr v1, p1

    .line 9
    invoke-static {v1, v2}, Ljava/lang/Math;->round(D)J

    .line 10
    .line 11
    .line 12
    move-result-wide p1

    .line 13
    long-to-int p1, p1

    .line 14
    const/4 p2, 0x0

    .line 15
    aput p1, v0, p2

    .line 16
    .line 17
    iget-object p1, p0, Ll/px50$a;->i:[I

    .line 18
    .line 19
    invoke-static {}, Ll/bnl0;->w0()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {}, Ll/bnl0;->F0()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    add-int/2addr v0, v1

    .line 28
    int-to-double v0, v0

    .line 29
    mul-double/2addr v0, p3

    .line 30
    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    long-to-int v0, v0

    .line 35
    const/4 v1, 0x1

    .line 36
    aput v0, p1, v1

    .line 37
    .line 38
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 39
    .line 40
    cmpl-double p1, p3, v2

    .line 41
    .line 42
    if-nez p1, :cond_0

    .line 43
    .line 44
    move p2, v1

    .line 45
    :cond_0
    iput-boolean p2, p0, Ll/px50$a;->p:Z

    .line 46
    .line 47
    return-object p0
.end method
