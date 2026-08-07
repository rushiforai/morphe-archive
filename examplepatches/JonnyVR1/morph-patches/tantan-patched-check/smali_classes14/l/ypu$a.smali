.class public Ll/ypu$a;
.super Ll/gk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ypu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public c:I

.field public d:Ljava/lang/String;

.field public e:Z

.field public f:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

.field public g:I

.field public h:[I

.field public i:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/x20;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:I

.field public n:Z

.field public o:Z


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
    iput-object v0, p0, Ll/ypu$a;->d:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    new-array v0, v0, [I

    .line 10
    .line 11
    iput-object v0, p0, Ll/ypu$a;->h:[I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput v1, p0, Ll/ypu$a;->m:I

    .line 15
    .line 16
    iput-boolean v1, p0, Ll/ypu$a;->o:Z

    .line 17
    .line 18
    iput p1, p0, Ll/ypu$a;->c:I

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
    iget-object p1, p0, Ll/ypu$a;->h:[I

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
    iput p1, p0, Ll/ypu$a;->g:I

    .line 49
    .line 50
    sget-object p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->DEFAULT_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 51
    .line 52
    iput-object p1, p0, Ll/ypu$a;->f:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 53
    .line 54
    return-void
.end method

.method public static bridge synthetic a(Ll/ypu$a;)Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypu$a;->f:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/ypu$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypu$a;->k:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/ypu$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ypu$a;->m:I

    return p0
.end method

.method public static bridge synthetic d(Ll/ypu$a;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypu$a;->j:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/ypu$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ypu$a;->c:I

    return p0
.end method

.method public static bridge synthetic f(Ll/ypu$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ypu$a;->g:I

    return p0
.end method

.method public static bridge synthetic g(Ll/ypu$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypu$a;->l:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic h(Ll/ypu$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ypu$a;->o:Z

    return p0
.end method

.method public static bridge synthetic i(Ll/ypu$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ypu$a;->n:Z

    return p0
.end method

.method public static bridge synthetic j(Ll/ypu$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ypu$a;->e:Z

    return p0
.end method

.method public static bridge synthetic k(Ll/ypu$a;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypu$a;->i:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/ypu$a;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypu$a;->h:[I

    return-object p0
.end method

.method public static bridge synthetic m(Ll/ypu$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypu$a;->d:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public n(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)Ll/ypu$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ypu$a;->f:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Ll/ypu;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ypu$a;->d:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/ypu;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/ypu;-><init>(Ll/ypu$a;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public p(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)Ll/ypu$a;
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailUrl:Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p0, Ll/ypu$a;->d:Ljava/lang/String;

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
    invoke-virtual {p0, v0, v1, v4, v5}, Ll/ypu$a;->t(DD)Ll/ypu$a;

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
    iput v0, p0, Ll/ypu$a;->g:I

    .line 44
    .line 45
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->webBgType:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/ypu$a;->n(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)Ll/ypu$a;

    .line 48
    .line 49
    .line 50
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->campaignType:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v0, p0, Ll/ypu$a;->k:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->id:Ljava/lang/String;

    .line 55
    .line 56
    iput-object v0, p0, Ll/ypu$a;->l:Ljava/lang/String;

    .line 57
    .line 58
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->isNeedCloseBtn:Z

    .line 59
    .line 60
    iput-boolean p1, p0, Ll/ypu$a;->e:Z

    .line 61
    .line 62
    return-object p0
.end method

.method public q(I)Ll/ypu$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/ypu$a;->m:I

    .line 2
    .line 3
    return-object p0
.end method

.method public r(I)Ll/ypu$a;
    .locals 3

    .line 1
    iput p1, p0, Ll/ypu$a;->g:I

    .line 2
    .line 3
    const/16 v0, 0x50

    .line 4
    .line 5
    if-ne p1, v0, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Ll/ypu$a;->h:[I

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
    iget-object p1, p0, Ll/ypu$a;->h:[I

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

.method public s()Ll/ypu$a;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ypu$a;->e:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public t(DD)Ll/ypu$a;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ypu$a;->h:[I

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
    iget-object p1, p0, Ll/ypu$a;->h:[I

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
    iput-boolean p2, p0, Ll/ypu$a;->o:Z

    .line 46
    .line 47
    return-object p0
.end method

.method public u(Ljava/lang/String;)Ll/ypu$a;
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
    iput-object p1, p0, Ll/ypu$a;->d:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    return-object p0
.end method
