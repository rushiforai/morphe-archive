.class public final Ll/mqs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


# instance fields
.field public final a:Ll/w9s0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:Ll/xwu0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Ll/vcw0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final d:Ll/hct0;

.field public final e:Ll/m0t0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final f:Ll/fbv0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final g:Ll/dut0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:Ll/v4z0;

.field public final i:Ll/xvw0;


# direct methods
.method public constructor <init>(Ll/w9s0;Ll/m0t0;Ll/fbv0;Ll/xwu0;Ll/vcw0;Ll/dut0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/mqs0;->h:Ll/v4z0;

    .line 6
    .line 7
    sget-object v1, Ll/oct0;->f:Ll/xvw0;

    .line 8
    .line 9
    iput-object v1, p0, Ll/mqs0;->i:Ll/xvw0;

    .line 10
    .line 11
    iput-object p1, p0, Ll/mqs0;->a:Ll/w9s0;

    .line 12
    .line 13
    iput-object p2, p0, Ll/mqs0;->e:Ll/m0t0;

    .line 14
    .line 15
    iput-object p3, p0, Ll/mqs0;->f:Ll/fbv0;

    .line 16
    .line 17
    iput-object p4, p0, Ll/mqs0;->b:Ll/xwu0;

    .line 18
    .line 19
    iput-object p5, p0, Ll/mqs0;->c:Ll/vcw0;

    .line 20
    .line 21
    new-instance p1, Ll/hct0;

    .line 22
    .line 23
    invoke-direct {p1, v0}, Ll/hct0;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Ll/mqs0;->d:Ll/hct0;

    .line 27
    .line 28
    iput-object p6, p0, Ll/mqs0;->g:Ll/dut0;

    .line 29
    .line 30
    return-void
.end method

.method public static b(Ljava/util/Map;)I
    .locals 1

    .line 1
    const-string v0, "o"

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    if-eqz p0, :cond_2

    .line 10
    .line 11
    const-string v0, "p"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x7

    .line 20
    return p0

    .line 21
    :cond_0
    const-string v0, "l"

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x6

    .line 30
    return p0

    .line 31
    :cond_1
    const-string v0, "c"

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    const/16 p0, 0xe

    .line 40
    .line 41
    return p0

    .line 42
    :cond_2
    const/4 p0, -0x1

    .line 43
    return p0
.end method

.method public static c(Landroid/content/Context;Ll/v2s0;Landroid/net/Uri;Landroid/view/View;Landroid/app/Activity;Ll/s7w0;)Landroid/net/Uri;
    .locals 2
    .param p4    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ll/s7w0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    :try_start_0
    sget-object v0, Ll/sgs0;->rb:Ll/dgs0;

    .line 5
    .line 6
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    if-eqz p5, :cond_1

    .line 23
    .line 24
    invoke-virtual {p1, p2}, Ll/v2s0;->e(Landroid/net/Uri;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    invoke-virtual {p5, p2, p0, p3, p4}, Ll/s7w0;->a(Landroid/net/Uri;Landroid/content/Context;Landroid/view/View;Landroid/app/Activity;)Landroid/net/Uri;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :catch_0
    move-exception p0

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {p1, p2}, Ll/v2s0;->e(Landroid/net/Uri;)Z

    .line 38
    .line 39
    .line 40
    move-result p5

    .line 41
    if-eqz p5, :cond_2

    .line 42
    .line 43
    invoke-virtual {p1, p2, p0, p3, p4}, Ll/v2s0;->a(Landroid/net/Uri;Landroid/content/Context;Landroid/view/View;Landroid/app/Activity;)Landroid/net/Uri;

    .line 44
    .line 45
    .line 46
    move-result-object p0
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzavj; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    return-object p0

    .line 48
    :goto_0
    const-string p1, "OpenGmsgHandler.maybeAddClickSignalsToUri"

    .line 49
    .line 50
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    invoke-virtual {p3, p0, p1}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :catch_1
    :cond_2
    :goto_1
    return-object p2
.end method

.method public static d(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 3
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    :try_start_0
    const-string v0, "aclk_ms"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "aclk_upms"

    .line 22
    .line 23
    invoke-virtual {v1, v2, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 28
    .line 29
    .line 30
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    return-object p0

    .line 32
    :catch_0
    move-exception v0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-object p0

    .line 35
    :goto_0
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v2, "Error adding click uptime parameter to url: "

    .line 44
    .line 45
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v1, v0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 50
    .line 51
    .line 52
    return-object p0
.end method

.method public static bridge synthetic e(Ll/mqs0;Ljava/lang/String;Ll/har0;Ljava/util/Map;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/mqs0;->h(Ljava/lang/String;Ll/har0;Ljava/util/Map;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static f(Ljava/util/Map;)Z
    .locals 2

    .line 1
    const-string v0, "1"

    .line 2
    .line 3
    const-string v1, "custom_close"

    .line 4
    .line 5
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static bridge synthetic g(Ll/mqs0;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mqs0;->m(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 4

    .line 1
    check-cast p1, Ll/har0;

    .line 2
    .line 3
    const-string v0, "u"

    .line 4
    .line 5
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/String;

    .line 10
    .line 11
    move-object v1, p1

    .line 12
    check-cast v1, Ll/wit0;

    .line 13
    .line 14
    invoke-interface {v1}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-static {v0, v1, v2}, Ll/u9t0;->c(Ljava/lang/String;Landroid/content/Context;Z)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "a"

    .line 24
    .line 25
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/lang/String;

    .line 30
    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    const-string p0, "Action missing from an open GMSG."

    .line 34
    .line 35
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    iget-object v2, p0, Ll/mqs0;->a:Ll/w9s0;

    .line 40
    .line 41
    if-eqz v2, :cond_2

    .line 42
    .line 43
    invoke-virtual {v2}, Ll/w9s0;->c()Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-virtual {v2, v0}, Ll/w9s0;->b(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    :goto_0
    sget-object v2, Ll/sgs0;->L9:Ll/dgs0;

    .line 55
    .line 56
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v3, v2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, Ljava/lang/Boolean;

    .line 65
    .line 66
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_3

    .line 71
    .line 72
    iget-object v2, p0, Ll/mqs0;->g:Ll/dut0;

    .line 73
    .line 74
    if-eqz v2, :cond_3

    .line 75
    .line 76
    invoke-static {v0}, Ll/dut0;->h(Ljava/lang/String;)Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-eqz v2, :cond_3

    .line 81
    .line 82
    iget-object v2, p0, Ll/mqs0;->g:Ll/dut0;

    .line 83
    .line 84
    invoke-static {}, Ll/k6s0;->e()Ljava/util/Random;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {v2, v0, v3}, Ll/dut0;->b(Ljava/lang/String;Ljava/util/Random;)Ll/hpr;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    goto :goto_1

    .line 93
    :cond_3
    invoke-static {v0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    :goto_1
    new-instance v2, Ll/iqs0;

    .line 98
    .line 99
    invoke-direct {v2, p0, p1, p2, v1}, Ll/iqs0;-><init>(Ll/mqs0;Ll/har0;Ljava/util/Map;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Ll/mqs0;->i:Ll/xvw0;

    .line 103
    .line 104
    invoke-static {v0, v2, p0}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final h(Ljava/lang/String;Ll/har0;Ljava/util/Map;Ljava/lang/String;)V
    .locals 24

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p2

    .line 4
    .line 5
    move-object/from16 v3, p3

    .line 6
    .line 7
    move-object/from16 v7, p4

    .line 8
    .line 9
    move-object v8, v2

    .line 10
    check-cast v8, Ll/wit0;

    .line 11
    .line 12
    invoke-interface {v8}, Ll/wit0;->c()Ll/q6w0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v8}, Ll/wit0;->h()Ll/t6w0;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    const/4 v9, 0x0

    .line 21
    const-string v5, ""

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    if-eqz v4, :cond_0

    .line 26
    .line 27
    iget-object v5, v4, Ll/t6w0;->b:Ljava/lang/String;

    .line 28
    .line 29
    iget-boolean v0, v0, Ll/q6w0;->j0:Z

    .line 30
    .line 31
    move v4, v0

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move v4, v9

    .line 34
    :goto_0
    sget-object v0, Ll/sgs0;->ka:Ll/dgs0;

    .line 35
    .line 36
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 37
    .line 38
    .line 39
    move-result-object v6

    .line 40
    invoke-virtual {v6, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Ljava/lang/Boolean;

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    const/4 v10, 0x1

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    const-string v0, "sc"

    .line 54
    .line 55
    invoke-interface {v3, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v6

    .line 59
    if-eqz v6, :cond_1

    .line 60
    .line 61
    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ljava/lang/String;

    .line 66
    .line 67
    const-string v6, "0"

    .line 68
    .line 69
    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_1

    .line 74
    .line 75
    move v6, v9

    .line 76
    goto :goto_1

    .line 77
    :cond_1
    move v6, v10

    .line 78
    :goto_1
    const-string v0, "expand"

    .line 79
    .line 80
    invoke-virtual {v0, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_3

    .line 85
    .line 86
    invoke-interface {v8}, Ll/wit0;->a0()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    const-string v0, "Cannot expand WebView that is already expanded."

    .line 93
    .line 94
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_2
    invoke-virtual {v1, v9}, Ll/mqs0;->k(Z)V

    .line 99
    .line 100
    .line 101
    move-object v0, v2

    .line 102
    check-cast v0, Ll/fkt0;

    .line 103
    .line 104
    invoke-static {v3}, Ll/mqs0;->f(Ljava/util/Map;)Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    invoke-static {v3}, Ll/mqs0;->b(Ljava/util/Map;)I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    invoke-interface {v0, v1, v2, v6}, Ll/fkt0;->v0(ZIZ)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_3
    const-string v0, "webapp"

    .line 117
    .line 118
    invoke-virtual {v0, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_6

    .line 123
    .line 124
    invoke-virtual {v1, v9}, Ll/mqs0;->k(Z)V

    .line 125
    .line 126
    .line 127
    sget-object v0, Ll/sgs0;->mb:Ll/dgs0;

    .line 128
    .line 129
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Ljava/lang/Boolean;

    .line 138
    .line 139
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_4

    .line 144
    .line 145
    const-string v0, "is_allowed_for_lock_screen"

    .line 146
    .line 147
    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    const-string v1, "1"

    .line 152
    .line 153
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-eqz v0, :cond_4

    .line 158
    .line 159
    move/from16 v16, v10

    .line 160
    .line 161
    goto :goto_2

    .line 162
    :cond_4
    move/from16 v16, v9

    .line 163
    .line 164
    :goto_2
    if-eqz p1, :cond_5

    .line 165
    .line 166
    move-object v11, v2

    .line 167
    check-cast v11, Ll/fkt0;

    .line 168
    .line 169
    invoke-static {v3}, Ll/mqs0;->f(Ljava/util/Map;)Z

    .line 170
    .line 171
    .line 172
    move-result v12

    .line 173
    invoke-static {v3}, Ll/mqs0;->b(Ljava/util/Map;)I

    .line 174
    .line 175
    .line 176
    move-result v13

    .line 177
    move-object/from16 v14, p1

    .line 178
    .line 179
    move v15, v6

    .line 180
    invoke-interface/range {v11 .. v16}, Ll/fkt0;->R(ZILjava/lang/String;ZZ)V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :cond_5
    move-object v11, v2

    .line 185
    check-cast v11, Ll/fkt0;

    .line 186
    .line 187
    invoke-static {v3}, Ll/mqs0;->f(Ljava/util/Map;)Z

    .line 188
    .line 189
    .line 190
    move-result v12

    .line 191
    invoke-static {v3}, Ll/mqs0;->b(Ljava/util/Map;)I

    .line 192
    .line 193
    .line 194
    move-result v13

    .line 195
    const-string v0, "html"

    .line 196
    .line 197
    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    move-object v14, v0

    .line 202
    check-cast v14, Ljava/lang/String;

    .line 203
    .line 204
    const-string v0, "baseurl"

    .line 205
    .line 206
    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    move-object v15, v0

    .line 211
    check-cast v15, Ljava/lang/String;

    .line 212
    .line 213
    move/from16 v16, v6

    .line 214
    .line 215
    invoke-interface/range {v11 .. v16}, Ll/fkt0;->w0(ZILjava/lang/String;Ljava/lang/String;Z)V

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :cond_6
    const-string v0, "chrome_custom_tab"

    .line 220
    .line 221
    invoke-virtual {v0, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    const-string v11, "true"

    .line 226
    .line 227
    if-eqz v0, :cond_d

    .line 228
    .line 229
    invoke-interface {v8}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 230
    .line 231
    .line 232
    sget-object v0, Ll/sgs0;->w4:Ll/dgs0;

    .line 233
    .line 234
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 235
    .line 236
    .line 237
    move-result-object v7

    .line 238
    invoke-virtual {v7, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    check-cast v0, Ljava/lang/Boolean;

    .line 243
    .line 244
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    if-nez v0, :cond_7

    .line 249
    .line 250
    goto :goto_3

    .line 251
    :cond_7
    sget-object v0, Ll/sgs0;->A4:Ll/dgs0;

    .line 252
    .line 253
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 254
    .line 255
    .line 256
    move-result-object v7

    .line 257
    invoke-virtual {v7, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    check-cast v0, Ljava/lang/Boolean;

    .line 262
    .line 263
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 264
    .line 265
    .line 266
    move-result v0

    .line 267
    if-eqz v0, :cond_8

    .line 268
    .line 269
    const-string v0, "User opt out chrome custom tab."

    .line 270
    .line 271
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    goto :goto_3

    .line 275
    :cond_8
    move v9, v10

    .line 276
    :goto_3
    invoke-interface {v8}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    invoke-static {v0}, Ll/bis0;->g(Landroid/content/Context;)Z

    .line 281
    .line 282
    .line 283
    move-result v0

    .line 284
    if-eqz v9, :cond_c

    .line 285
    .line 286
    if-nez v0, :cond_9

    .line 287
    .line 288
    const/4 v0, 0x4

    .line 289
    invoke-virtual {v1, v0}, Ll/mqs0;->m(I)V

    .line 290
    .line 291
    .line 292
    goto :goto_4

    .line 293
    :cond_9
    invoke-virtual {v1, v10}, Ll/mqs0;->k(Z)V

    .line 294
    .line 295
    .line 296
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 297
    .line 298
    .line 299
    move-result v0

    .line 300
    if-eqz v0, :cond_a

    .line 301
    .line 302
    const-string v0, "Cannot open browser with null or empty url"

    .line 303
    .line 304
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    const/4 v0, 0x7

    .line 308
    invoke-virtual {v1, v0}, Ll/mqs0;->m(I)V

    .line 309
    .line 310
    .line 311
    return-void

    .line 312
    :cond_a
    invoke-static/range {p1 .. p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 313
    .line 314
    .line 315
    move-result-object v11

    .line 316
    invoke-interface {v8}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 317
    .line 318
    .line 319
    move-result-object v9

    .line 320
    invoke-interface {v8}, Ll/wit0;->p()Ll/v2s0;

    .line 321
    .line 322
    .line 323
    move-result-object v10

    .line 324
    invoke-interface {v8}, Ll/wit0;->zzF()Landroid/view/View;

    .line 325
    .line 326
    .line 327
    move-result-object v12

    .line 328
    invoke-interface {v8}, Ll/wit0;->zzi()Landroid/app/Activity;

    .line 329
    .line 330
    .line 331
    move-result-object v13

    .line 332
    invoke-interface {v8}, Ll/wit0;->f()Ll/s7w0;

    .line 333
    .line 334
    .line 335
    move-result-object v14

    .line 336
    invoke-static/range {v9 .. v14}, Ll/mqs0;->c(Landroid/content/Context;Ll/v2s0;Landroid/net/Uri;Landroid/view/View;Landroid/app/Activity;Ll/s7w0;)Landroid/net/Uri;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    invoke-static {v0}, Ll/mqs0;->d(Landroid/net/Uri;)Landroid/net/Uri;

    .line 341
    .line 342
    .line 343
    move-result-object v0

    .line 344
    if-eqz v4, :cond_b

    .line 345
    .line 346
    iget-object v3, v1, Ll/mqs0;->f:Ll/fbv0;

    .line 347
    .line 348
    if-eqz v3, :cond_b

    .line 349
    .line 350
    invoke-interface {v8}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 351
    .line 352
    .line 353
    move-result-object v3

    .line 354
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object v4

    .line 358
    invoke-virtual {v1, v2, v3, v4, v5}, Ll/mqs0;->l(Ll/har0;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    .line 359
    .line 360
    .line 361
    move-result v3

    .line 362
    if-eqz v3, :cond_b

    .line 363
    .line 364
    goto/16 :goto_c

    .line 365
    .line 366
    :cond_b
    new-instance v3, Ll/jqs0;

    .line 367
    .line 368
    invoke-direct {v3, v1}, Ll/jqs0;-><init>(Ll/mqs0;)V

    .line 369
    .line 370
    .line 371
    iput-object v3, v1, Ll/mqs0;->h:Ll/v4z0;

    .line 372
    .line 373
    check-cast v2, Ll/fkt0;

    .line 374
    .line 375
    new-instance v7, Lcom/google/android/gms/ads/internal/overlay/zzc;

    .line 376
    .line 377
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 378
    .line 379
    .line 380
    move-result-object v9

    .line 381
    iget-object v0, v1, Ll/mqs0;->h:Ll/v4z0;

    .line 382
    .line 383
    invoke-static {v0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 384
    .line 385
    .line 386
    move-result-object v0

    .line 387
    invoke-interface {v0}, Landroid/os/IInterface;->asBinder()Landroid/os/IBinder;

    .line 388
    .line 389
    .line 390
    move-result-object v16

    .line 391
    const/16 v17, 0x1

    .line 392
    .line 393
    const/4 v8, 0x0

    .line 394
    const/4 v10, 0x0

    .line 395
    const/4 v11, 0x0

    .line 396
    const/4 v12, 0x0

    .line 397
    const/4 v13, 0x0

    .line 398
    const/4 v14, 0x0

    .line 399
    const/4 v15, 0x0

    .line 400
    invoke-direct/range {v7 .. v17}, Lcom/google/android/gms/ads/internal/overlay/zzc;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;Landroid/os/IBinder;Z)V

    .line 401
    .line 402
    .line 403
    invoke-interface {v2, v7, v6}, Ll/fkt0;->S(Lcom/google/android/gms/ads/internal/overlay/zzc;Z)V

    .line 404
    .line 405
    .line 406
    return-void

    .line 407
    :cond_c
    :goto_4
    const-string v0, "use_first_package"

    .line 408
    .line 409
    invoke-interface {v3, v0, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    .line 411
    .line 412
    const-string v0, "use_running_process"

    .line 413
    .line 414
    invoke-interface {v3, v0, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 415
    .line 416
    .line 417
    invoke-virtual/range {v1 .. v6}, Ll/mqs0;->j(Ll/har0;Ljava/util/Map;ZLjava/lang/String;Z)V

    .line 418
    .line 419
    .line 420
    return-void

    .line 421
    :cond_d
    const-string v0, "app"

    .line 422
    .line 423
    invoke-virtual {v0, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 424
    .line 425
    .line 426
    move-result v0

    .line 427
    if-eqz v0, :cond_e

    .line 428
    .line 429
    const-string v0, "system_browser"

    .line 430
    .line 431
    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 432
    .line 433
    .line 434
    move-result-object v0

    .line 435
    check-cast v0, Ljava/lang/String;

    .line 436
    .line 437
    invoke-virtual {v11, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 438
    .line 439
    .line 440
    move-result v0

    .line 441
    if-nez v0, :cond_f

    .line 442
    .line 443
    :cond_e
    move-object/from16 v1, p0

    .line 444
    .line 445
    move-object/from16 v2, p2

    .line 446
    .line 447
    move-object v11, v5

    .line 448
    move v15, v6

    .line 449
    move v6, v4

    .line 450
    goto :goto_5

    .line 451
    :cond_f
    move-object/from16 v1, p0

    .line 452
    .line 453
    move-object/from16 v2, p2

    .line 454
    .line 455
    invoke-virtual/range {v1 .. v6}, Ll/mqs0;->j(Ll/har0;Ljava/util/Map;ZLjava/lang/String;Z)V

    .line 456
    .line 457
    .line 458
    return-void

    .line 459
    :goto_5
    const-string v0, "open_app"

    .line 460
    .line 461
    invoke-virtual {v0, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 462
    .line 463
    .line 464
    move-result v0

    .line 465
    const-string v12, "p"

    .line 466
    .line 467
    if-eqz v0, :cond_13

    .line 468
    .line 469
    sget-object v0, Ll/sgs0;->d8:Ll/dgs0;

    .line 470
    .line 471
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 472
    .line 473
    .line 474
    move-result-object v4

    .line 475
    invoke-virtual {v4, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 476
    .line 477
    .line 478
    move-result-object v0

    .line 479
    check-cast v0, Ljava/lang/Boolean;

    .line 480
    .line 481
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 482
    .line 483
    .line 484
    move-result v0

    .line 485
    if-eqz v0, :cond_1c

    .line 486
    .line 487
    invoke-virtual {v1, v10}, Ll/mqs0;->k(Z)V

    .line 488
    .line 489
    .line 490
    invoke-interface {v3, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 491
    .line 492
    .line 493
    move-result-object v0

    .line 494
    check-cast v0, Ljava/lang/String;

    .line 495
    .line 496
    if-nez v0, :cond_10

    .line 497
    .line 498
    const-string v0, "Package name missing from open app action."

    .line 499
    .line 500
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 501
    .line 502
    .line 503
    return-void

    .line 504
    :cond_10
    if-eqz v6, :cond_11

    .line 505
    .line 506
    iget-object v3, v1, Ll/mqs0;->f:Ll/fbv0;

    .line 507
    .line 508
    if-eqz v3, :cond_11

    .line 509
    .line 510
    invoke-interface {v8}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 511
    .line 512
    .line 513
    move-result-object v3

    .line 514
    invoke-virtual {v1, v2, v3, v0, v11}, Ll/mqs0;->l(Ll/har0;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    .line 515
    .line 516
    .line 517
    move-result v3

    .line 518
    if-nez v3, :cond_1c

    .line 519
    .line 520
    :cond_11
    invoke-interface {v8}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 521
    .line 522
    .line 523
    move-result-object v3

    .line 524
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 525
    .line 526
    .line 527
    move-result-object v3

    .line 528
    if-nez v3, :cond_12

    .line 529
    .line 530
    const-string v0, "Cannot get package manager from open app action."

    .line 531
    .line 532
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 533
    .line 534
    .line 535
    return-void

    .line 536
    :cond_12
    invoke-virtual {v3, v0}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 537
    .line 538
    .line 539
    move-result-object v0

    .line 540
    if-eqz v0, :cond_1c

    .line 541
    .line 542
    check-cast v2, Ll/fkt0;

    .line 543
    .line 544
    new-instance v3, Lcom/google/android/gms/ads/internal/overlay/zzc;

    .line 545
    .line 546
    iget-object v1, v1, Ll/mqs0;->h:Ll/v4z0;

    .line 547
    .line 548
    invoke-direct {v3, v0, v1}, Lcom/google/android/gms/ads/internal/overlay/zzc;-><init>(Landroid/content/Intent;Ll/v4z0;)V

    .line 549
    .line 550
    .line 551
    invoke-interface {v2, v3, v15}, Ll/fkt0;->S(Lcom/google/android/gms/ads/internal/overlay/zzc;Z)V

    .line 552
    .line 553
    .line 554
    return-void

    .line 555
    :cond_13
    invoke-virtual {v1, v10}, Ll/mqs0;->k(Z)V

    .line 556
    .line 557
    .line 558
    const-string v0, "intent_url"

    .line 559
    .line 560
    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 561
    .line 562
    .line 563
    move-result-object v0

    .line 564
    move-object v4, v0

    .line 565
    check-cast v4, Ljava/lang/String;

    .line 566
    .line 567
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 568
    .line 569
    .line 570
    move-result v0

    .line 571
    const/4 v5, 0x0

    .line 572
    if-nez v0, :cond_14

    .line 573
    .line 574
    :try_start_0
    invoke-static {v4, v9}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 575
    .line 576
    .line 577
    move-result-object v5
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 578
    :cond_14
    :goto_6
    move-object v13, v5

    .line 579
    goto :goto_7

    .line 580
    :catch_0
    move-exception v0

    .line 581
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 582
    .line 583
    .line 584
    move-result-object v4

    .line 585
    const-string v13, "Error parsing the url: "

    .line 586
    .line 587
    invoke-virtual {v13, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 588
    .line 589
    .line 590
    move-result-object v4

    .line 591
    invoke-static {v4, v0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 592
    .line 593
    .line 594
    goto :goto_6

    .line 595
    :goto_7
    if-eqz v13, :cond_16

    .line 596
    .line 597
    invoke-virtual {v13}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 598
    .line 599
    .line 600
    move-result-object v0

    .line 601
    if-eqz v0, :cond_16

    .line 602
    .line 603
    invoke-virtual {v13}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 604
    .line 605
    .line 606
    move-result-object v0

    .line 607
    sget-object v4, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 608
    .line 609
    invoke-virtual {v4, v0}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    .line 610
    .line 611
    .line 612
    move-result v4

    .line 613
    if-nez v4, :cond_16

    .line 614
    .line 615
    invoke-interface {v8}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 616
    .line 617
    .line 618
    move-result-object v16

    .line 619
    invoke-interface {v8}, Ll/wit0;->p()Ll/v2s0;

    .line 620
    .line 621
    .line 622
    move-result-object v17

    .line 623
    invoke-interface {v8}, Ll/wit0;->zzF()Landroid/view/View;

    .line 624
    .line 625
    .line 626
    move-result-object v19

    .line 627
    invoke-interface {v8}, Ll/wit0;->zzi()Landroid/app/Activity;

    .line 628
    .line 629
    .line 630
    move-result-object v20

    .line 631
    invoke-interface {v8}, Ll/wit0;->f()Ll/s7w0;

    .line 632
    .line 633
    .line 634
    move-result-object v21

    .line 635
    move-object/from16 v18, v0

    .line 636
    .line 637
    invoke-static/range {v16 .. v21}, Ll/mqs0;->c(Landroid/content/Context;Ll/v2s0;Landroid/net/Uri;Landroid/view/View;Landroid/app/Activity;Ll/s7w0;)Landroid/net/Uri;

    .line 638
    .line 639
    .line 640
    move-result-object v0

    .line 641
    invoke-static {v0}, Ll/mqs0;->d(Landroid/net/Uri;)Landroid/net/Uri;

    .line 642
    .line 643
    .line 644
    move-result-object v0

    .line 645
    invoke-virtual {v13}, Landroid/content/Intent;->getType()Ljava/lang/String;

    .line 646
    .line 647
    .line 648
    move-result-object v4

    .line 649
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 650
    .line 651
    .line 652
    move-result v4

    .line 653
    if-nez v4, :cond_15

    .line 654
    .line 655
    sget-object v4, Ll/sgs0;->e8:Ll/dgs0;

    .line 656
    .line 657
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 658
    .line 659
    .line 660
    move-result-object v5

    .line 661
    invoke-virtual {v5, v4}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 662
    .line 663
    .line 664
    move-result-object v4

    .line 665
    check-cast v4, Ljava/lang/Boolean;

    .line 666
    .line 667
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 668
    .line 669
    .line 670
    move-result v4

    .line 671
    if-eqz v4, :cond_15

    .line 672
    .line 673
    invoke-virtual {v13}, Landroid/content/Intent;->getType()Ljava/lang/String;

    .line 674
    .line 675
    .line 676
    move-result-object v4

    .line 677
    invoke-virtual {v13, v0, v4}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 678
    .line 679
    .line 680
    goto :goto_8

    .line 681
    :cond_15
    invoke-virtual {v13, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 682
    .line 683
    .line 684
    :cond_16
    :goto_8
    sget-object v0, Ll/sgs0;->v8:Ll/dgs0;

    .line 685
    .line 686
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 687
    .line 688
    .line 689
    move-result-object v4

    .line 690
    invoke-virtual {v4, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 691
    .line 692
    .line 693
    move-result-object v0

    .line 694
    check-cast v0, Ljava/lang/Boolean;

    .line 695
    .line 696
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 697
    .line 698
    .line 699
    move-result v0

    .line 700
    const-string v14, "event_id"

    .line 701
    .line 702
    if-eqz v0, :cond_17

    .line 703
    .line 704
    const-string v0, "intent_async"

    .line 705
    .line 706
    invoke-virtual {v0, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 707
    .line 708
    .line 709
    move-result v0

    .line 710
    if-eqz v0, :cond_17

    .line 711
    .line 712
    invoke-interface {v3, v14}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 713
    .line 714
    .line 715
    move-result v0

    .line 716
    if-eqz v0, :cond_17

    .line 717
    .line 718
    goto :goto_9

    .line 719
    :cond_17
    move v10, v9

    .line 720
    :goto_9
    new-instance v4, Ljava/util/HashMap;

    .line 721
    .line 722
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 723
    .line 724
    .line 725
    if-eqz v10, :cond_18

    .line 726
    .line 727
    new-instance v0, Ll/kqs0;

    .line 728
    .line 729
    move-object v5, v3

    .line 730
    move-object v3, v2

    .line 731
    move v2, v15

    .line 732
    invoke-direct/range {v0 .. v5}, Ll/kqs0;-><init>(Ll/mqs0;ZLl/har0;Ljava/util/Map;Ljava/util/Map;)V

    .line 733
    .line 734
    .line 735
    move-object v2, v3

    .line 736
    move-object v3, v5

    .line 737
    iput-object v0, v1, Ll/mqs0;->h:Ll/v4z0;

    .line 738
    .line 739
    goto :goto_a

    .line 740
    :cond_18
    move v9, v15

    .line 741
    :goto_a
    const-string v0, "openIntentAsync"

    .line 742
    .line 743
    if-eqz v13, :cond_1a

    .line 744
    .line 745
    if-eqz v6, :cond_19

    .line 746
    .line 747
    iget-object v5, v1, Ll/mqs0;->f:Ll/fbv0;

    .line 748
    .line 749
    if-eqz v5, :cond_19

    .line 750
    .line 751
    invoke-interface {v8}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 752
    .line 753
    .line 754
    move-result-object v5

    .line 755
    invoke-virtual {v13}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 756
    .line 757
    .line 758
    move-result-object v6

    .line 759
    invoke-virtual {v6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 760
    .line 761
    .line 762
    move-result-object v6

    .line 763
    invoke-virtual {v1, v2, v5, v6, v11}, Ll/mqs0;->l(Ll/har0;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    .line 764
    .line 765
    .line 766
    move-result v5

    .line 767
    if-eqz v5, :cond_19

    .line 768
    .line 769
    if-eqz v10, :cond_1c

    .line 770
    .line 771
    invoke-interface {v3, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 772
    .line 773
    .line 774
    move-result-object v1

    .line 775
    check-cast v1, Ljava/lang/String;

    .line 776
    .line 777
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 778
    .line 779
    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 780
    .line 781
    .line 782
    move-object v1, v2

    .line 783
    check-cast v1, Ll/kts0;

    .line 784
    .line 785
    invoke-interface {v1, v0, v4}, Ll/kts0;->Z(Ljava/lang/String;Ljava/util/Map;)V

    .line 786
    .line 787
    .line 788
    return-void

    .line 789
    :cond_19
    move-object v0, v2

    .line 790
    check-cast v0, Ll/fkt0;

    .line 791
    .line 792
    new-instance v2, Lcom/google/android/gms/ads/internal/overlay/zzc;

    .line 793
    .line 794
    iget-object v1, v1, Ll/mqs0;->h:Ll/v4z0;

    .line 795
    .line 796
    invoke-direct {v2, v13, v1}, Lcom/google/android/gms/ads/internal/overlay/zzc;-><init>(Landroid/content/Intent;Ll/v4z0;)V

    .line 797
    .line 798
    .line 799
    invoke-interface {v0, v2, v9}, Ll/fkt0;->S(Lcom/google/android/gms/ads/internal/overlay/zzc;Z)V

    .line 800
    .line 801
    .line 802
    return-void

    .line 803
    :cond_1a
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 804
    .line 805
    .line 806
    move-result v5

    .line 807
    if-nez v5, :cond_1b

    .line 808
    .line 809
    invoke-static/range {p1 .. p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 810
    .line 811
    .line 812
    move-result-object v17

    .line 813
    invoke-interface {v8}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 814
    .line 815
    .line 816
    move-result-object v15

    .line 817
    invoke-interface {v8}, Ll/wit0;->p()Ll/v2s0;

    .line 818
    .line 819
    .line 820
    move-result-object v16

    .line 821
    invoke-interface {v8}, Ll/wit0;->zzF()Landroid/view/View;

    .line 822
    .line 823
    .line 824
    move-result-object v18

    .line 825
    invoke-interface {v8}, Ll/wit0;->zzi()Landroid/app/Activity;

    .line 826
    .line 827
    .line 828
    move-result-object v19

    .line 829
    invoke-interface {v8}, Ll/wit0;->f()Ll/s7w0;

    .line 830
    .line 831
    .line 832
    move-result-object v20

    .line 833
    invoke-static/range {v15 .. v20}, Ll/mqs0;->c(Landroid/content/Context;Ll/v2s0;Landroid/net/Uri;Landroid/view/View;Landroid/app/Activity;Ll/s7w0;)Landroid/net/Uri;

    .line 834
    .line 835
    .line 836
    move-result-object v5

    .line 837
    invoke-static {v5}, Ll/mqs0;->d(Landroid/net/Uri;)Landroid/net/Uri;

    .line 838
    .line 839
    .line 840
    move-result-object v5

    .line 841
    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 842
    .line 843
    .line 844
    move-result-object v5

    .line 845
    goto :goto_b

    .line 846
    :cond_1b
    move-object/from16 v5, p1

    .line 847
    .line 848
    :goto_b
    if-eqz v6, :cond_1d

    .line 849
    .line 850
    iget-object v6, v1, Ll/mqs0;->f:Ll/fbv0;

    .line 851
    .line 852
    if-eqz v6, :cond_1d

    .line 853
    .line 854
    invoke-interface {v8}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 855
    .line 856
    .line 857
    move-result-object v6

    .line 858
    invoke-virtual {v1, v2, v6, v5, v11}, Ll/mqs0;->l(Ll/har0;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    .line 859
    .line 860
    .line 861
    move-result v6

    .line 862
    if-eqz v6, :cond_1d

    .line 863
    .line 864
    if-eqz v10, :cond_1c

    .line 865
    .line 866
    invoke-interface {v3, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 867
    .line 868
    .line 869
    move-result-object v1

    .line 870
    check-cast v1, Ljava/lang/String;

    .line 871
    .line 872
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 873
    .line 874
    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 875
    .line 876
    .line 877
    move-object v1, v2

    .line 878
    check-cast v1, Ll/kts0;

    .line 879
    .line 880
    invoke-interface {v1, v0, v4}, Ll/kts0;->Z(Ljava/lang/String;Ljava/util/Map;)V

    .line 881
    .line 882
    .line 883
    :cond_1c
    :goto_c
    return-void

    .line 884
    :cond_1d
    move-object v0, v2

    .line 885
    check-cast v0, Ll/fkt0;

    .line 886
    .line 887
    new-instance v15, Lcom/google/android/gms/ads/internal/overlay/zzc;

    .line 888
    .line 889
    const-string v2, "i"

    .line 890
    .line 891
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 892
    .line 893
    .line 894
    move-result-object v2

    .line 895
    move-object/from16 v16, v2

    .line 896
    .line 897
    check-cast v16, Ljava/lang/String;

    .line 898
    .line 899
    const-string v2, "m"

    .line 900
    .line 901
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 902
    .line 903
    .line 904
    move-result-object v2

    .line 905
    move-object/from16 v18, v2

    .line 906
    .line 907
    check-cast v18, Ljava/lang/String;

    .line 908
    .line 909
    invoke-interface {v3, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 910
    .line 911
    .line 912
    move-result-object v2

    .line 913
    move-object/from16 v19, v2

    .line 914
    .line 915
    check-cast v19, Ljava/lang/String;

    .line 916
    .line 917
    const-string v2, "c"

    .line 918
    .line 919
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 920
    .line 921
    .line 922
    move-result-object v2

    .line 923
    move-object/from16 v20, v2

    .line 924
    .line 925
    check-cast v20, Ljava/lang/String;

    .line 926
    .line 927
    const-string v2, "f"

    .line 928
    .line 929
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 930
    .line 931
    .line 932
    move-result-object v2

    .line 933
    move-object/from16 v21, v2

    .line 934
    .line 935
    check-cast v21, Ljava/lang/String;

    .line 936
    .line 937
    const-string v2, "e"

    .line 938
    .line 939
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 940
    .line 941
    .line 942
    move-result-object v2

    .line 943
    move-object/from16 v22, v2

    .line 944
    .line 945
    check-cast v22, Ljava/lang/String;

    .line 946
    .line 947
    iget-object v1, v1, Ll/mqs0;->h:Ll/v4z0;

    .line 948
    .line 949
    move-object/from16 v23, v1

    .line 950
    .line 951
    move-object/from16 v17, v5

    .line 952
    .line 953
    invoke-direct/range {v15 .. v23}, Lcom/google/android/gms/ads/internal/overlay/zzc;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/v4z0;)V

    .line 954
    .line 955
    .line 956
    invoke-interface {v0, v15, v9}, Ll/fkt0;->S(Lcom/google/android/gms/ads/internal/overlay/zzc;Z)V

    .line 957
    .line 958
    .line 959
    return-void
.end method

.method public final i(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/mqs0;->f:Ll/fbv0;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ll/fbv0;->e(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v2, p0, Ll/mqs0;->b:Ll/xwu0;

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    iget-object v3, p0, Ll/mqs0;->c:Ll/vcw0;

    .line 11
    .line 12
    iget-object v4, p0, Ll/mqs0;->f:Ll/fbv0;

    .line 13
    .line 14
    const-string p0, "dialog_not_shown_reason"

    .line 15
    .line 16
    invoke-static {p0, p3}, Lcom/google/android/gms/internal/ads/zzgad;->zze(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgad;

    .line 17
    .line 18
    .line 19
    move-result-object v7

    .line 20
    const-string v6, "dialog_not_shown"

    .line 21
    .line 22
    move-object v1, p1

    .line 23
    move-object v5, p2

    .line 24
    invoke-static/range {v1 .. v7}, Ll/qbv0;->p8(Landroid/content/Context;Ll/xwu0;Ll/vcw0;Ll/fbv0;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final j(Ll/har0;Ljava/util/Map;ZLjava/lang/String;Z)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    invoke-virtual {v0, v3}, Ll/mqs0;->k(Z)V

    .line 9
    .line 10
    .line 11
    move-object v4, v1

    .line 12
    check-cast v4, Ll/wit0;

    .line 13
    .line 14
    invoke-interface {v4}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v7

    .line 18
    invoke-interface {v4}, Ll/wit0;->p()Ll/v2s0;

    .line 19
    .line 20
    .line 21
    move-result-object v8

    .line 22
    invoke-interface {v4}, Ll/wit0;->zzF()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v9

    .line 26
    invoke-interface {v4}, Ll/wit0;->f()Ll/s7w0;

    .line 27
    .line 28
    .line 29
    move-result-object v10

    .line 30
    const-string v5, "activity"

    .line 31
    .line 32
    invoke-virtual {v7, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    move-object v11, v5

    .line 37
    check-cast v11, Landroid/app/ActivityManager;

    .line 38
    .line 39
    const-string v5, "u"

    .line 40
    .line 41
    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    check-cast v5, Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    if-eqz v6, :cond_0

    .line 52
    .line 53
    const/4 v12, 0x0

    .line 54
    goto/16 :goto_5

    .line 55
    .line 56
    :cond_0
    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    move-object v6, v8

    .line 61
    move-object v8, v9

    .line 62
    const/4 v9, 0x0

    .line 63
    move-object/from16 v18, v7

    .line 64
    .line 65
    move-object v7, v5

    .line 66
    move-object/from16 v5, v18

    .line 67
    .line 68
    invoke-static/range {v5 .. v10}, Ll/mqs0;->c(Landroid/content/Context;Ll/v2s0;Landroid/net/Uri;Landroid/view/View;Landroid/app/Activity;Ll/s7w0;)Landroid/net/Uri;

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    move-object v9, v8

    .line 73
    move-object v8, v6

    .line 74
    invoke-static {v7}, Ll/mqs0;->d(Landroid/net/Uri;)Landroid/net/Uri;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    const-string v7, "use_first_package"

    .line 79
    .line 80
    invoke-interface {v2, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v7

    .line 84
    check-cast v7, Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {v7}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 87
    .line 88
    .line 89
    move-result v13

    .line 90
    const-string v7, "use_running_process"

    .line 91
    .line 92
    invoke-interface {v2, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v7

    .line 96
    check-cast v7, Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {v7}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 99
    .line 100
    .line 101
    move-result v14

    .line 102
    const-string v7, "use_custom_tabs"

    .line 103
    .line 104
    invoke-interface {v2, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    check-cast v2, Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {v2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-nez v2, :cond_2

    .line 115
    .line 116
    sget-object v2, Ll/sgs0;->u4:Ll/dgs0;

    .line 117
    .line 118
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 119
    .line 120
    .line 121
    move-result-object v7

    .line 122
    invoke-virtual {v7, v2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    check-cast v2, Ljava/lang/Boolean;

    .line 127
    .line 128
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    if-eqz v2, :cond_1

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_1
    const/4 v3, 0x0

    .line 136
    :cond_2
    :goto_0
    invoke-virtual {v6}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    const-string v7, "http"

    .line 141
    .line 142
    invoke-virtual {v7, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    const-string v12, "https"

    .line 147
    .line 148
    if-eqz v2, :cond_3

    .line 149
    .line 150
    invoke-virtual {v6}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {v2, v12}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 159
    .line 160
    .line 161
    move-result-object v12

    .line 162
    goto :goto_1

    .line 163
    :cond_3
    invoke-virtual {v6}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    invoke-virtual {v12, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    if-eqz v2, :cond_4

    .line 172
    .line 173
    invoke-virtual {v6}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    invoke-virtual {v2, v7}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 182
    .line 183
    .line 184
    move-result-object v12

    .line 185
    goto :goto_1

    .line 186
    :cond_4
    const/4 v12, 0x0

    .line 187
    :goto_1
    new-instance v2, Ljava/util/ArrayList;

    .line 188
    .line 189
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 190
    .line 191
    .line 192
    invoke-static {v6, v5, v8, v9, v10}, Ll/lqs0;->a(Landroid/net/Uri;Landroid/content/Context;Ll/v2s0;Landroid/view/View;Ll/s7w0;)Landroid/content/Intent;

    .line 193
    .line 194
    .line 195
    move-result-object v6

    .line 196
    invoke-static {v12, v5, v8, v9, v10}, Ll/lqs0;->a(Landroid/net/Uri;Landroid/content/Context;Ll/v2s0;Landroid/view/View;Ll/s7w0;)Landroid/content/Intent;

    .line 197
    .line 198
    .line 199
    move-result-object v12

    .line 200
    if-eqz v3, :cond_5

    .line 201
    .line 202
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 203
    .line 204
    .line 205
    invoke-static {v5, v6}, Lcom/google/android/gms/ads/internal/util/b;->Q(Landroid/content/Context;Landroid/content/Intent;)V

    .line 206
    .line 207
    .line 208
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 209
    .line 210
    .line 211
    invoke-static {v5, v12}, Lcom/google/android/gms/ads/internal/util/b;->Q(Landroid/content/Context;Landroid/content/Intent;)V

    .line 212
    .line 213
    .line 214
    :cond_5
    move-object v7, v5

    .line 215
    move-object v5, v6

    .line 216
    move-object v6, v2

    .line 217
    invoke-static/range {v5 .. v10}, Ll/lqs0;->d(Landroid/content/Intent;Ljava/util/ArrayList;Landroid/content/Context;Ll/v2s0;Landroid/view/View;Ll/s7w0;)Landroid/content/pm/ResolveInfo;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    move-object v3, v6

    .line 222
    if-eqz v2, :cond_6

    .line 223
    .line 224
    move-object v6, v2

    .line 225
    invoke-static/range {v5 .. v10}, Ll/lqs0;->b(Landroid/content/Intent;Landroid/content/pm/ResolveInfo;Landroid/content/Context;Ll/v2s0;Landroid/view/View;Ll/s7w0;)Landroid/content/Intent;

    .line 226
    .line 227
    .line 228
    move-result-object v12

    .line 229
    goto/16 :goto_5

    .line 230
    .line 231
    :cond_6
    if-eqz v12, :cond_7

    .line 232
    .line 233
    invoke-static {v12, v7, v8, v9, v10}, Ll/lqs0;->c(Landroid/content/Intent;Landroid/content/Context;Ll/v2s0;Landroid/view/View;Ll/s7w0;)Landroid/content/pm/ResolveInfo;

    .line 234
    .line 235
    .line 236
    move-result-object v6

    .line 237
    if-eqz v6, :cond_7

    .line 238
    .line 239
    invoke-static/range {v5 .. v10}, Ll/lqs0;->b(Landroid/content/Intent;Landroid/content/pm/ResolveInfo;Landroid/content/Context;Ll/v2s0;Landroid/view/View;Ll/s7w0;)Landroid/content/Intent;

    .line 240
    .line 241
    .line 242
    move-result-object v12

    .line 243
    invoke-static {v12, v7, v8, v9, v10}, Ll/lqs0;->c(Landroid/content/Intent;Landroid/content/Context;Ll/v2s0;Landroid/view/View;Ll/s7w0;)Landroid/content/pm/ResolveInfo;

    .line 244
    .line 245
    .line 246
    move-result-object v2

    .line 247
    if-nez v2, :cond_d

    .line 248
    .line 249
    :cond_7
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 250
    .line 251
    .line 252
    move-result v2

    .line 253
    if-eqz v2, :cond_8

    .line 254
    .line 255
    goto :goto_4

    .line 256
    :cond_8
    if-eqz v14, :cond_b

    .line 257
    .line 258
    if-eqz v11, :cond_b

    .line 259
    .line 260
    invoke-virtual {v11}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    .line 261
    .line 262
    .line 263
    move-result-object v2

    .line 264
    if-eqz v2, :cond_b

    .line 265
    .line 266
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 267
    .line 268
    .line 269
    move-result v11

    .line 270
    const/4 v12, 0x0

    .line 271
    :goto_2
    if-ge v12, v11, :cond_b

    .line 272
    .line 273
    invoke-interface {v3, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object v6

    .line 277
    check-cast v6, Landroid/content/pm/ResolveInfo;

    .line 278
    .line 279
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 280
    .line 281
    .line 282
    move-result-object v14

    .line 283
    :goto_3
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    .line 284
    .line 285
    .line 286
    move-result v16

    .line 287
    add-int/lit8 v17, v12, 0x1

    .line 288
    .line 289
    if-eqz v16, :cond_a

    .line 290
    .line 291
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    move-result-object v16

    .line 295
    move-object/from16 v15, v16

    .line 296
    .line 297
    check-cast v15, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 298
    .line 299
    iget-object v15, v15, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    .line 300
    .line 301
    move-object/from16 v16, v2

    .line 302
    .line 303
    iget-object v2, v6, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 304
    .line 305
    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 306
    .line 307
    invoke-virtual {v15, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    move-result v2

    .line 311
    if-eqz v2, :cond_9

    .line 312
    .line 313
    invoke-static/range {v5 .. v10}, Ll/lqs0;->b(Landroid/content/Intent;Landroid/content/pm/ResolveInfo;Landroid/content/Context;Ll/v2s0;Landroid/view/View;Ll/s7w0;)Landroid/content/Intent;

    .line 314
    .line 315
    .line 316
    move-result-object v12

    .line 317
    goto :goto_5

    .line 318
    :cond_9
    move-object/from16 v2, v16

    .line 319
    .line 320
    goto :goto_3

    .line 321
    :cond_a
    move/from16 v12, v17

    .line 322
    .line 323
    goto :goto_2

    .line 324
    :cond_b
    if-eqz v13, :cond_c

    .line 325
    .line 326
    const/4 v2, 0x0

    .line 327
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object v2

    .line 331
    move-object v6, v2

    .line 332
    check-cast v6, Landroid/content/pm/ResolveInfo;

    .line 333
    .line 334
    invoke-static/range {v5 .. v10}, Ll/lqs0;->b(Landroid/content/Intent;Landroid/content/pm/ResolveInfo;Landroid/content/Context;Ll/v2s0;Landroid/view/View;Ll/s7w0;)Landroid/content/Intent;

    .line 335
    .line 336
    .line 337
    move-result-object v12

    .line 338
    goto :goto_5

    .line 339
    :cond_c
    :goto_4
    move-object v12, v5

    .line 340
    :cond_d
    :goto_5
    if-eqz p3, :cond_f

    .line 341
    .line 342
    iget-object v2, v0, Ll/mqs0;->f:Ll/fbv0;

    .line 343
    .line 344
    if-eqz v2, :cond_f

    .line 345
    .line 346
    if-eqz v12, :cond_f

    .line 347
    .line 348
    invoke-interface {v4}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 349
    .line 350
    .line 351
    move-result-object v2

    .line 352
    invoke-virtual {v12}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 353
    .line 354
    .line 355
    move-result-object v3

    .line 356
    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    move-result-object v3

    .line 360
    move-object/from16 v4, p4

    .line 361
    .line 362
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/mqs0;->l(Ll/har0;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    .line 363
    .line 364
    .line 365
    move-result v2

    .line 366
    if-nez v2, :cond_e

    .line 367
    .line 368
    goto :goto_6

    .line 369
    :cond_e
    return-void

    .line 370
    :cond_f
    :goto_6
    :try_start_0
    check-cast v1, Ll/fkt0;

    .line 371
    .line 372
    new-instance v2, Lcom/google/android/gms/ads/internal/overlay/zzc;

    .line 373
    .line 374
    iget-object v0, v0, Ll/mqs0;->h:Ll/v4z0;

    .line 375
    .line 376
    invoke-direct {v2, v12, v0}, Lcom/google/android/gms/ads/internal/overlay/zzc;-><init>(Landroid/content/Intent;Ll/v4z0;)V

    .line 377
    .line 378
    .line 379
    move/from16 v0, p5

    .line 380
    .line 381
    invoke-interface {v1, v2, v0}, Ll/fkt0;->S(Lcom/google/android/gms/ads/internal/overlay/zzc;Z)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 382
    .line 383
    .line 384
    return-void

    .line 385
    :catch_0
    move-exception v0

    .line 386
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 391
    .line 392
    .line 393
    return-void
.end method

.method public final k(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mqs0;->e:Ll/m0t0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/m0t0;->h(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final l(Ll/har0;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 8

    .line 1
    iget-object v2, p0, Ll/mqs0;->b:Ll/xwu0;

    .line 2
    .line 3
    if-eqz v2, :cond_0

    .line 4
    .line 5
    iget-object v3, p0, Ll/mqs0;->c:Ll/vcw0;

    .line 6
    .line 7
    iget-object v4, p0, Ll/mqs0;->f:Ll/fbv0;

    .line 8
    .line 9
    new-instance v7, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v6, "offline_open"

    .line 15
    .line 16
    move-object v1, p2

    .line 17
    move-object v5, p4

    .line 18
    invoke-static/range {v1 .. v7}, Ll/qbv0;->p8(Landroid/content/Context;Ll/xwu0;Ll/vcw0;Ll/fbv0;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move-object v1, p2

    .line 23
    move-object v5, p4

    .line 24
    :goto_0
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2, v1}, Ll/ebt0;->z(Landroid/content/Context;)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    const/4 p4, 0x0

    .line 33
    if-eqz p2, :cond_1

    .line 34
    .line 35
    iget-object p1, p0, Ll/mqs0;->f:Ll/fbv0;

    .line 36
    .line 37
    iget-object p0, p0, Ll/mqs0;->d:Ll/hct0;

    .line 38
    .line 39
    invoke-virtual {p1, p0, v5}, Ll/fbv0;->k(Ll/hct0;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return p4

    .line 43
    :cond_1
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/b;->a0(Landroid/content/Context;)Ll/zws0;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Ll/c050;->e(Landroid/content/Context;)Ll/c050;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Ll/c050;->a()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    const-string v2, "offline_notification_channel"

    .line 62
    .line 63
    invoke-static {}, Ll/bxy0;->s()Ll/ccr0;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {v3, v1, v2}, Ll/ccr0;->g(Landroid/content/Context;Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    move-object v3, p1

    .line 72
    check-cast v3, Ll/wit0;

    .line 73
    .line 74
    invoke-interface {v3}, Ll/wit0;->zzO()Ll/xkt0;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    invoke-virtual {v4}, Ll/xkt0;->i()Z

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    const/4 v6, 0x1

    .line 83
    if-eqz v4, :cond_2

    .line 84
    .line 85
    invoke-interface {v3}, Ll/wit0;->zzi()Landroid/app/Activity;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    if-nez v4, :cond_2

    .line 90
    .line 91
    move v4, v6

    .line 92
    goto :goto_1

    .line 93
    :cond_2
    move v4, p4

    .line 94
    :goto_1
    if-nez v0, :cond_6

    .line 95
    .line 96
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 97
    .line 98
    .line 99
    invoke-static {v1}, Ll/c050;->e(Landroid/content/Context;)Ll/c050;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Ll/c050;->a()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_3

    .line 108
    .line 109
    goto :goto_3

    .line 110
    :cond_3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 111
    .line 112
    const/16 v7, 0x21

    .line 113
    .line 114
    if-ge v0, v7, :cond_4

    .line 115
    .line 116
    sget-object v0, Ll/sgs0;->o8:Ll/dgs0;

    .line 117
    .line 118
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 119
    .line 120
    .line 121
    move-result-object v7

    .line 122
    invoke-virtual {v7, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    check-cast v0, Ljava/lang/Boolean;

    .line 127
    .line 128
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    goto :goto_2

    .line 133
    :cond_4
    sget-object v0, Ll/sgs0;->n8:Ll/dgs0;

    .line 134
    .line 135
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 136
    .line 137
    .line 138
    move-result-object v7

    .line 139
    invoke-virtual {v7, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    check-cast v0, Ljava/lang/Boolean;

    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    :goto_2
    if-eqz v0, :cond_5

    .line 150
    .line 151
    goto :goto_4

    .line 152
    :cond_5
    :goto_3
    const-string p1, "notifications_disabled"

    .line 153
    .line 154
    invoke-virtual {p0, v1, v5, p1}, Ll/mqs0;->i(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    return p4

    .line 158
    :cond_6
    :goto_4
    if-eqz v2, :cond_7

    .line 159
    .line 160
    const-string p1, "notification_channel_disabled"

    .line 161
    .line 162
    invoke-virtual {p0, v1, v5, p1}, Ll/mqs0;->i(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    return p4

    .line 166
    :cond_7
    if-nez p2, :cond_8

    .line 167
    .line 168
    const-string p1, "work_manager_unavailable"

    .line 169
    .line 170
    invoke-virtual {p0, v1, v5, p1}, Ll/mqs0;->i(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    return p4

    .line 174
    :cond_8
    if-eqz v4, :cond_9

    .line 175
    .line 176
    const-string p1, "ad_no_activity"

    .line 177
    .line 178
    invoke-virtual {p0, v1, v5, p1}, Ll/mqs0;->i(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    return p4

    .line 182
    :cond_9
    sget-object p2, Ll/sgs0;->l8:Ll/dgs0;

    .line 183
    .line 184
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {v0, p2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object p2

    .line 192
    check-cast p2, Ljava/lang/Boolean;

    .line 193
    .line 194
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 195
    .line 196
    .line 197
    move-result p2

    .line 198
    if-nez p2, :cond_a

    .line 199
    .line 200
    const-string p1, "notification_flow_disabled"

    .line 201
    .line 202
    invoke-virtual {p0, v1, v5, p1}, Ll/mqs0;->i(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    return p4

    .line 206
    :cond_a
    invoke-interface {v3}, Ll/wit0;->zzL()Lcom/google/android/gms/ads/internal/overlay/b;

    .line 207
    .line 208
    .line 209
    move-result-object p2

    .line 210
    if-eqz p2, :cond_b

    .line 211
    .line 212
    invoke-interface {v3}, Ll/wit0;->zzi()Landroid/app/Activity;

    .line 213
    .line 214
    .line 215
    move-result-object p2

    .line 216
    if-eqz p2, :cond_b

    .line 217
    .line 218
    invoke-static {}, Ll/sbv0;->e()Ll/rbv0;

    .line 219
    .line 220
    .line 221
    move-result-object p2

    .line 222
    invoke-interface {v3}, Ll/wit0;->zzi()Landroid/app/Activity;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-virtual {p2, v0}, Ll/rbv0;->a(Landroid/app/Activity;)Ll/rbv0;

    .line 227
    .line 228
    .line 229
    const/4 v0, 0x0

    .line 230
    invoke-virtual {p2, v0}, Ll/rbv0;->b(Lcom/google/android/gms/ads/internal/overlay/b;)Ll/rbv0;

    .line 231
    .line 232
    .line 233
    invoke-virtual {p2, v5}, Ll/rbv0;->c(Ljava/lang/String;)Ll/rbv0;

    .line 234
    .line 235
    .line 236
    invoke-virtual {p2, p3}, Ll/rbv0;->d(Ljava/lang/String;)Ll/rbv0;

    .line 237
    .line 238
    .line 239
    invoke-virtual {p2}, Ll/rbv0;->e()Ll/sbv0;

    .line 240
    .line 241
    .line 242
    move-result-object p2

    .line 243
    :try_start_0
    invoke-interface {v3}, Ll/wit0;->zzL()Lcom/google/android/gms/ads/internal/overlay/b;

    .line 244
    .line 245
    .line 246
    move-result-object p3

    .line 247
    invoke-virtual {p3, p2}, Lcom/google/android/gms/ads/internal/overlay/b;->w8(Ll/sbv0;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 248
    .line 249
    .line 250
    goto :goto_5

    .line 251
    :catch_0
    move-exception v0

    .line 252
    move-object p1, v0

    .line 253
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    invoke-virtual {p0, v1, v5, p1}, Ll/mqs0;->i(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    return p4

    .line 261
    :cond_b
    move-object p0, p1

    .line 262
    check-cast p0, Ll/fkt0;

    .line 263
    .line 264
    const/16 p2, 0xe

    .line 265
    .line 266
    invoke-interface {p0, v5, p3, p2}, Ll/fkt0;->z(Ljava/lang/String;Ljava/lang/String;I)V

    .line 267
    .line 268
    .line 269
    :goto_5
    invoke-interface {p1}, Ll/har0;->onAdClicked()V

    .line 270
    .line 271
    .line 272
    return v6
.end method

.method public final m(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mqs0;->b:Ll/xwu0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v0, Ll/sgs0;->z8:Ll/dgs0;

    .line 7
    .line 8
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const-string v1, "cct_open_status"

    .line 23
    .line 24
    const-string v2, "cct_action"

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Ll/mqs0;->c:Ll/vcw0;

    .line 29
    .line 30
    invoke-static {p1}, Ll/ais0;->a(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {v2}, Ll/ucw0;->b(Ljava/lang/String;)Ll/ucw0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0, v1, p1}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 39
    .line 40
    .line 41
    invoke-interface {p0, v0}, Ll/vcw0;->a(Ll/ucw0;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    iget-object p0, p0, Ll/mqs0;->b:Ll/xwu0;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/xwu0;->a()Ll/wwu0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v0, "action"

    .line 52
    .line 53
    invoke-virtual {p0, v0, v2}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 54
    .line 55
    .line 56
    invoke-static {p1}, Ll/ais0;->a(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p0, v1, p1}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ll/wwu0;->g()V

    .line 64
    .line 65
    .line 66
    return-void
.end method
