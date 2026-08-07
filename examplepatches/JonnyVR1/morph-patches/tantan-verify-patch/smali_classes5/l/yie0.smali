.class public Ll/yie0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static c:Ll/yie0;


# instance fields
.field public a:Z

.field public b:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/yie0;->a:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/yie0;->b:Z

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/y20;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 2
    .line 3
    const-string v1, "matched"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->zc(Lcom/p1/mobile/putong/data/Relationship;)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void

    .line 37
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/member/R$string;->G:I

    .line 38
    .line 39
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static c()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/yie0;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;->groupA:Lcom/p1/mobile/putong/core/data/SeeMatchGroup;

    .line 18
    .line 19
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/SeeMatchGroup;->matchPageEnabled:Z

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    return v0

    .line 26
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 27
    return v0
.end method

.method public static d()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/yie0;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;->groupA:Lcom/p1/mobile/putong/core/data/SeeMatchGroup;

    .line 18
    .line 19
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/SeeMatchGroup;->seeListEnabled:Z

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    return v0

    .line 26
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 27
    return v0
.end method

.method public static e()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/yie0;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/yie0;->p()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/yie0;->k()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {}, Ll/yie0;->j()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-lt v0, v1, :cond_0

    .line 22
    .line 23
    invoke-static {}, Ll/yie0;->n()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    return v0

    .line 31
    :cond_0
    const/4 v0, 0x0

    .line 32
    return v0
.end method

.method public static f(I)Ljava/lang/String;
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const-string v2, "10+"

    .line 7
    .line 8
    const-string v3, "1"

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    int-to-double v4, p0

    .line 13
    invoke-static {v4, v5}, Ll/q8g0;->K(D)D

    .line 14
    .line 15
    .line 16
    move-result-wide v4

    .line 17
    double-to-int p0, v4

    .line 18
    if-gt p0, v1, :cond_0

    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 21
    .line 22
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->M0:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/16 v0, 0xa

    .line 30
    .line 31
    if-le p0, v0, :cond_1

    .line 32
    .line 33
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 34
    .line 35
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->L0:I

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    goto :goto_2

    .line 42
    :cond_1
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 47
    .line 48
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->L0:I

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    goto :goto_2

    .line 55
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 56
    .line 57
    sget v4, Lcom/p1/mobile/putong/core/member/R$string;->B0:I

    .line 58
    .line 59
    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const/16 v4, 0x3e8

    .line 64
    .line 65
    if-ge p0, v4, :cond_3

    .line 66
    .line 67
    move-object p0, v0

    .line 68
    :goto_0
    move-object v2, v3

    .line 69
    goto :goto_2

    .line 70
    :cond_3
    const/16 v3, 0x2710

    .line 71
    .line 72
    if-le p0, v3, :cond_4

    .line 73
    .line 74
    :goto_1
    move-object p0, v0

    .line 75
    goto :goto_2

    .line 76
    :cond_4
    div-int/2addr p0, v4

    .line 77
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    goto :goto_1

    .line 82
    :goto_2
    const/4 v0, 0x2

    .line 83
    new-array v0, v0, [Ljava/lang/CharSequence;

    .line 84
    .line 85
    const/4 v3, 0x0

    .line 86
    aput-object v2, v0, v3

    .line 87
    .line 88
    aput-object p0, v0, v1

    .line 89
    .line 90
    invoke-static {v0}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0
.end method

.method public static g(I)Ll/pf60;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "10+"

    .line 6
    .line 7
    const-string v2, "1"

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    int-to-double v3, p0

    .line 12
    invoke-static {v3, v4}, Ll/q8g0;->K(D)D

    .line 13
    .line 14
    .line 15
    move-result-wide v3

    .line 16
    double-to-int p0, v3

    .line 17
    const/4 v0, 0x1

    .line 18
    if-gt p0, v0, :cond_0

    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 21
    .line 22
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->M0:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/16 v0, 0xa

    .line 30
    .line 31
    if-le p0, v0, :cond_1

    .line 32
    .line 33
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 34
    .line 35
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->L0:I

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    goto :goto_2

    .line 42
    :cond_1
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 47
    .line 48
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->L0:I

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    goto :goto_2

    .line 55
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 56
    .line 57
    sget v3, Lcom/p1/mobile/putong/core/member/R$string;->B0:I

    .line 58
    .line 59
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const/16 v3, 0x3e8

    .line 64
    .line 65
    if-ge p0, v3, :cond_3

    .line 66
    .line 67
    move-object p0, v0

    .line 68
    :goto_0
    move-object v1, v2

    .line 69
    goto :goto_2

    .line 70
    :cond_3
    const/16 v2, 0x2710

    .line 71
    .line 72
    if-le p0, v2, :cond_4

    .line 73
    .line 74
    :goto_1
    move-object p0, v0

    .line 75
    goto :goto_2

    .line 76
    :cond_4
    div-int/2addr p0, v3

    .line 77
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    goto :goto_1

    .line 82
    :goto_2
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0
.end method

.method public static h()Ll/yie0;
    .locals 2

    .line 1
    sget-object v0, Ll/yie0;->c:Ll/yie0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/yie0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/yie0;->c:Ll/yie0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/yie0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/yie0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/yie0;->c:Ll/yie0;

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
    sget-object v0, Ll/yie0;->c:Ll/yie0;

    .line 27
    .line 28
    return-object v0
.end method

.method public static i(Lcom/p1/mobile/putong/data/User;Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->d1:I

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 9
    .line 10
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/16 v3, 0x1e

    .line 15
    .line 16
    if-le v2, v3, :cond_0

    .line 17
    .line 18
    const-string v2, "30+"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 22
    .line 23
    :goto_0
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string p1, ","

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 40
    .line 41
    iget p0, p0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 42
    .line 43
    invoke-static {p0}, Ll/yie0;->f(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public static j()I
    .locals 1

    .line 1
    invoke-static {}, Ll/yie0;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;->groupA:Lcom/p1/mobile/putong/core/data/SeeMatchGroup;

    .line 18
    .line 19
    iget v0, v0, Lcom/p1/mobile/putong/core/data/SeeMatchGroup;->seeNum:I

    .line 20
    .line 21
    return v0

    .line 22
    :cond_0
    const/4 v0, 0x2

    .line 23
    return v0
.end method

.method public static k()I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->t5()Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget v0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    return v0
.end method

.method public static l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public static m()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    return v0

    .line 15
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/jf00;->k()Lrx/c;

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    return v0
.end method

.method public static n()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    return v0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    return v0
.end method

.method public static p()Z
    .locals 6

    .line 1
    invoke-static {}, Ll/yie0;->v()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    return v0

    .line 9
    :cond_0
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 10
    .line 11
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    return v0

    .line 21
    :cond_1
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 22
    .line 23
    iget-object v1, v1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 24
    .line 25
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {}, Ll/pzi0;->o()J

    .line 30
    .line 31
    .line 32
    move-result-wide v2

    .line 33
    iget-wide v4, v1, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 34
    .line 35
    double-to-long v4, v4

    .line 36
    invoke-static {v2, v3, v4, v5, v0}, Ll/tzi0;->h(JJI)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    return v0
.end method

.method public static q(Lcom/p1/mobile/putong/data/User;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ll/pzi0;->o()J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    long-to-double v2, v2

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 16
    .line 17
    iget-wide v4, p0, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 18
    .line 19
    sub-double/2addr v2, v4

    .line 20
    const-wide v4, 0x41224f8000000000L    # 600000.0

    .line 21
    .line 22
    .line 23
    .line 24
    .line 25
    cmpg-double p0, v2, v4

    .line 26
    .line 27
    if-gtz p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    return v1
.end method

.method public static r()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Ll/yie0;->c:Ll/yie0;

    .line 3
    .line 4
    return-void
.end method

.method public static s(Landroid/text/SpannableString;Ljava/lang/String;Ljava/lang/String;IIII)V
    .locals 4

    .line 1
    sget v0, Ll/qa00;->g:I

    .line 2
    .line 3
    const-string v1, "#d59d24"

    .line 4
    .line 5
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    new-instance v2, Ll/smd0;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    add-int/2addr p3, p1

    .line 28
    invoke-interface {v3, p3, p4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Yf(II)Ll/smd0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 33
    .line 34
    .line 35
    move-result-object p4

    .line 36
    invoke-virtual {p4}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 37
    .line 38
    .line 39
    move-result-object p4

    .line 40
    const/4 v3, -0x1

    .line 41
    invoke-interface {p4, v3, p5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->za(II)Ll/smd0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p4

    .line 45
    filled-new-array {p3, p4}, [Ll/smd0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    invoke-direct {v2, v0, p6, v1, p3}, Ll/smd0;-><init>(III[Ll/smd0$a;)V

    .line 50
    .line 51
    .line 52
    const/4 p3, 0x0

    .line 53
    invoke-virtual {v2, p3}, Ll/smd0;->a(Z)Ll/smd0;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    const/high16 p4, 0x40000000    # 2.0f

    .line 58
    .line 59
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result p4

    .line 63
    invoke-virtual {p3, p4}, Ll/smd0;->d(I)V

    .line 64
    .line 65
    .line 66
    add-int/2addr p2, p1

    .line 67
    const/16 p4, 0x12

    .line 68
    .line 69
    invoke-virtual {p0, p3, p1, p2, p4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public static t(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    const-string v0, "fakeMatch"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 8
    .line 9
    .line 10
    move-result-object v7

    .line 11
    const/4 v2, 0x1

    .line 12
    const/4 v3, 0x0

    .line 13
    const/4 v4, 0x0

    .line 14
    const/4 v6, 0x0

    .line 15
    move-object v5, p1

    .line 16
    invoke-virtual/range {v1 .. v7}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->U7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/LikeExtraData;Lcom/p1/mobile/putong/data/LikeFrom;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p1, Ll/wie0;

    .line 25
    .line 26
    invoke-direct {p1, p2}, Ll/wie0;-><init>(Ll/y20;)V

    .line 27
    .line 28
    .line 29
    new-instance p2, Ll/xie0;

    .line 30
    .line 31
    invoke-direct {p2}, Ll/xie0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static v()I
    .locals 1

    .line 1
    invoke-static {}, Ll/yie0;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;->groupA:Lcom/p1/mobile/putong/core/data/SeeMatchGroup;

    .line 18
    .line 19
    iget v0, v0, Lcom/p1/mobile/putong/core/data/SeeMatchGroup;->signUpDays:I

    .line 20
    .line 21
    return v0

    .line 22
    :cond_0
    const/4 v0, 0x1

    .line 23
    return v0
.end method


# virtual methods
.method public o()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/yie0;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public u(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/yie0;->b:Z

    .line 2
    .line 3
    return-void
.end method
