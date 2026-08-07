.class public Ll/vcu;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/cdu;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I

.field public final c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vcu;->c:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/vcu;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput p3, p0, Ll/vcu;->b:I

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic e0(Ll/vcu;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vcu;->g0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic g0(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    iget p1, p0, Ll/vcu;->b:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_3

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eq p1, v1, :cond_2

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    if-eq p1, v1, :cond_1

    .line 11
    .line 12
    const/4 v1, 0x4

    .line 13
    if-eq p1, v1, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    move-object v1, p1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object p1, Ll/tbs;->a:Landroid/app/Application;

    .line 19
    .line 20
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->B0:I

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 27
    .line 28
    sget v2, Lcom/p1/mobile/putong/live/base/R$string;->C0:I

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    sget-object p1, Ll/tbs;->a:Landroid/app/Application;

    .line 36
    .line 37
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->B0:I

    .line 38
    .line 39
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 44
    .line 45
    sget v2, Lcom/p1/mobile/putong/live/base/R$string;->T:I

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    goto :goto_0

    .line 52
    :cond_2
    sget-object p1, Ll/tbs;->a:Landroid/app/Application;

    .line 53
    .line 54
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->B0:I

    .line 55
    .line 56
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 61
    .line 62
    sget v2, Lcom/p1/mobile/putong/live/base/R$string;->D0:I

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    goto :goto_0

    .line 69
    :cond_3
    sget-object p1, Ll/tbs;->a:Landroid/app/Application;

    .line 70
    .line 71
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->E0:I

    .line 72
    .line 73
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 78
    .line 79
    sget v2, Lcom/p1/mobile/putong/live/base/R$string;->C0:I

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    :goto_0
    iget v2, p0, Ll/vcu;->b:I

    .line 86
    .line 87
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 88
    .line 89
    if-ne v2, v0, :cond_4

    .line 90
    .line 91
    check-cast v3, Ll/cdu;

    .line 92
    .line 93
    iget-object p0, p0, Ll/vcu;->a:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v3, p0}, Ll/cdu;->s(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_4
    check-cast v3, Ll/cdu;

    .line 100
    .line 101
    iget-object p0, p0, Ll/vcu;->a:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v3, p0, p1, v1}, Ll/cdu;->u(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/ucu;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ucu;-><init>(Ll/vcu;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f0()Z
    .locals 2

    .line 1
    iget p0, p0, Ll/vcu;->b:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/4 v1, 0x4

    .line 7
    if-ne p0, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    return v0
.end method

.method public h0()V
    .locals 3

    .line 1
    iget v0, p0, Ll/vcu;->b:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    const/4 v2, 0x3

    .line 7
    if-eq v0, v2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object p0, p0, Ll/vcu;->c:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-virtual {v0, p0, v1}, Ll/ppi0;->z(Lcom/p1/mobile/android/app/Act;I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p0, p0, Ll/vcu;->c:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {v0, p0, v1}, Ll/ppi0;->z(Lcom/p1/mobile/android/app/Act;I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public i0()V
    .locals 2

    .line 1
    iget v0, p0, Ll/vcu;->b:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_3

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eq v0, v1, :cond_2

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    if-eq v0, v1, :cond_1

    .line 11
    .line 12
    const/4 v1, 0x4

    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object p0, p0, Ll/vcu;->c:Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ll/ppi0;->A(Lcom/p1/mobile/android/app/Act;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object p0, p0, Ll/vcu;->c:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ll/ppi0;->A(Lcom/p1/mobile/android/app/Act;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object p0, p0, Ll/vcu;->c:Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ll/ppi0;->A(Lcom/p1/mobile/android/app/Act;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_3
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object p0, p0, Ll/vcu;->c:Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ll/ppi0;->B(Lcom/p1/mobile/android/app/Act;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
