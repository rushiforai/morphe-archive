.class public Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Ljava/lang/String;

.field public c:Z

.field public d:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:Z

.field public j:Z

.field public k:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->b:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->h:I

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->j:Z

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->j()V

    .line 14
    .line 15
    .line 16
    sget-object v0, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/lhl;->p(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->g(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static a(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    goto :goto_0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :goto_0
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    move-object p2, p0

    .line 15
    :goto_1
    :try_start_1
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result p0
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 19
    return p0

    .line 20
    :catch_1
    const-string p0, "24"

    .line 21
    .line 22
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public static b()I
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/bnl0;->y0()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    div-int/lit8 v0, v0, 0x2

    .line 12
    .line 13
    const/16 v1, 0x438

    .line 14
    .line 15
    if-le v0, v1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/bnl0;->y0()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    div-int/lit8 v0, v0, 0x2

    .line 22
    .line 23
    return v0

    .line 24
    :cond_0
    return v1

    .line 25
    :cond_1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    return v0
.end method

.method public static c(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    goto :goto_0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :goto_0
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    move-object p2, p0

    .line 15
    :goto_1
    return-object p2
.end method

.method public static d(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "widthRatio"

    .line 2
    .line 3
    invoke-static {p0, v0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->c(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "heightRatio"

    .line 8
    .line 9
    invoke-static {p0, v0, p2}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->c(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p2, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 30
    .line 31
    .line 32
    move-result-wide p0

    .line 33
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    return-object p2
.end method

.method public static e()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x438

    .line 6
    .line 7
    if-le v0, v1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/bnl0;->y0()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    int-to-float v0, v0

    .line 14
    const/high16 v1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    mul-float/2addr v0, v1

    .line 17
    invoke-static {}, Ll/bnl0;->w0()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    int-to-float v1, v1

    .line 22
    div-float/2addr v0, v1

    .line 23
    const v1, 0x3f333333    # 0.7f

    .line 24
    .line 25
    .line 26
    cmpl-float v0, v0, v1

    .line 27
    .line 28
    if-lez v0, :cond_0

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    return v0

    .line 32
    :cond_0
    const/4 v0, 0x0

    .line 33
    return v0
.end method

.method public static f(Ljava/lang/String;)I
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return p0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0
.end method


# virtual methods
.method public final g(Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;

    .line 6
    .line 7
    .line 8
    const-string p1, "needCloseBtn"

    .line 9
    .line 10
    const-string v1, "1"

    .line 11
    .line 12
    invoke-static {v0, p1, v1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->c(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;

    .line 17
    .line 18
    .line 19
    const-string p1, "transparent"

    .line 20
    .line 21
    const-string v2, "0"

    .line 22
    .line 23
    invoke-static {v0, p1, v2}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->c(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    sget-object p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->TRAN_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->DEFAULT_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 37
    .line 38
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->h(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;

    .line 39
    .line 40
    .line 41
    const-string p1, "cornerRadius"

    .line 42
    .line 43
    const-string v3, "24"

    .line 44
    .line 45
    invoke-static {v0, p1, v3}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->a(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->i(I)Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;

    .line 50
    .line 51
    .line 52
    const-string p1, "gravity"

    .line 53
    .line 54
    invoke-static {v0, p1, v2}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->c(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    const-string v3, "0.75"

    .line 63
    .line 64
    if-eqz v1, :cond_1

    .line 65
    .line 66
    const-string v1, "1.0"

    .line 67
    .line 68
    invoke-static {v0, v1, v3}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->d(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    goto :goto_1

    .line 73
    :cond_1
    const-string v1, "0.86"

    .line 74
    .line 75
    invoke-static {v0, v1, v3}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->d(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    :goto_1
    const/4 v3, 0x0

    .line 80
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    check-cast v3, Ljava/lang/Double;

    .line 85
    .line 86
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 87
    .line 88
    .line 89
    move-result-wide v3

    .line 90
    const/4 v5, 0x1

    .line 91
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    check-cast v1, Ljava/lang/Double;

    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    .line 98
    .line 99
    .line 100
    move-result-wide v5

    .line 101
    invoke-virtual {p0, v3, v4, v5, v6}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->n(DD)Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->k(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;

    .line 105
    .line 106
    .line 107
    const-string p1, "needFullScreenMarginTop"

    .line 108
    .line 109
    invoke-static {v0, p1, v2}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->c(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->d:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(I)Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->h:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final j()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const v1, 0x3f5c28f6    # 0.86f

    .line 7
    .line 8
    .line 9
    mul-float/2addr v0, v1

    .line 10
    float-to-int v0, v0

    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->f:I

    .line 12
    .line 13
    invoke-static {}, Ll/bnl0;->w0()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    int-to-float v0, v0

    .line 18
    const/high16 v1, 0x3f400000    # 0.75f

    .line 19
    .line 20
    mul-float/2addr v0, v1

    .line 21
    float-to-int v0, v0

    .line 22
    iput v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->g:I

    .line 23
    .line 24
    const/16 v0, 0x11

    .line 25
    .line 26
    iput v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->e:I

    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->DEFAULT_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->d:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 31
    .line 32
    return-void
.end method

.method public k(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;
    .locals 1

    .line 1
    const-string v0, "1"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/16 v0, 0x50

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    move p1, v0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/16 p1, 0x11

    .line 14
    .line 15
    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->e:I

    .line 16
    .line 17
    if-ne p1, v0, :cond_2

    .line 18
    .line 19
    iget p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->f:I

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->g:I

    .line 24
    .line 25
    if-nez p1, :cond_2

    .line 26
    .line 27
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->b()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iput p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->f:I

    .line 32
    .line 33
    invoke-static {}, Ll/bnl0;->w0()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    int-to-float p1, p1

    .line 38
    const/high16 v0, 0x3f400000    # 0.75f

    .line 39
    .line 40
    mul-float/2addr p1, v0

    .line 41
    float-to-int p1, p1

    .line 42
    iput p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->g:I

    .line 43
    .line 44
    :cond_2
    return-object p0
.end method

.method public l(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->f(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    iput-boolean v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->c:Z

    .line 11
    .line 12
    return-object p0
.end method

.method public m(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;
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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->a:Z

    .line 8
    .line 9
    return-object p0
.end method

.method public n(DD)Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-double v0, v0

    .line 6
    mul-double/2addr v0, p1

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    .line 8
    .line 9
    .line 10
    move-result-wide p1

    .line 11
    long-to-int p1, p1

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->f:I

    .line 13
    .line 14
    invoke-static {}, Ll/bnl0;->w0()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-static {}, Ll/bnl0;->F0()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    add-int/2addr p1, p2

    .line 23
    int-to-double p1, p1

    .line 24
    mul-double/2addr p1, p3

    .line 25
    invoke-static {p1, p2}, Ljava/lang/Math;->round(D)J

    .line 26
    .line 27
    .line 28
    move-result-wide p1

    .line 29
    long-to-int p1, p1

    .line 30
    iput p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->g:I

    .line 31
    .line 32
    const-wide/high16 p1, 0x3ff0000000000000L    # 1.0

    .line 33
    .line 34
    cmpl-double p1, p3, p1

    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 p1, 0x0

    .line 41
    :goto_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->j:Z

    .line 42
    .line 43
    return-object p0
.end method

.method public o(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->b:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    return-object p0
.end method
