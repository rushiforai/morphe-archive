.class public Ll/xse0;
.super Ll/qr2;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation


# instance fields
.field private a:J

.field private b:I

.field private c:J

.field private final d:Ll/bu9;

.field private final e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field private final f:Ll/duv;

.field private final g:Ll/i0l0;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/bu9;Ll/i0l0;Ll/duv;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/qr2;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/xse0;->a:J

    .line 7
    .line 8
    iput-object p1, p0, Ll/xse0;->e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 9
    .line 10
    iput-object p2, p0, Ll/xse0;->d:Ll/bu9;

    .line 11
    .line 12
    iput-object p3, p0, Ll/xse0;->g:Ll/i0l0;

    .line 13
    .line 14
    iput-object p4, p0, Ll/xse0;->f:Ll/duv;

    .line 15
    .line 16
    return-void
.end method

.method private b(Landroid/content/Context;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/xse0;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/xse0;->d:Ll/bu9;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ll/bu9;->S(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/xse0;->e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/xse0;->e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    new-instance v2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v3, "Session created with ID: "

    .line 25
    .line 26
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v3, p0, Ll/xse0;->d:Ll/bu9;

    .line 30
    .line 31
    invoke-virtual {v3}, Ll/bu9;->k()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/xse0;->e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v1, "lastSessionId"

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    invoke-static {p1, v0, v1, v2}, Ll/v5g0;->d(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iget-object v3, p0, Ll/xse0;->e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 59
    .line 60
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    const-string v4, "sexe"

    .line 65
    .line 66
    invoke-static {p1, v3, v4, v2}, Ll/v5g0;->d(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-lez v2, :cond_0

    .line 71
    .line 72
    iget-object v3, p0, Ll/xse0;->d:Ll/bu9;

    .line 73
    .line 74
    sub-int/2addr v2, v0

    .line 75
    invoke-virtual {v3, v2}, Ll/bu9;->c0(I)V

    .line 76
    .line 77
    .line 78
    :cond_0
    iget-object v2, p0, Ll/xse0;->e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 79
    .line 80
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    iget-object v3, p0, Ll/xse0;->e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 85
    .line 86
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    new-instance v4, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    const-string v5, "Last session length: "

    .line 93
    .line 94
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    iget-object v5, p0, Ll/xse0;->d:Ll/bu9;

    .line 98
    .line 99
    invoke-virtual {v5}, Ll/bu9;->o()I

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string v5, " seconds"

    .line 107
    .line 108
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    invoke-virtual {v2, v3, v4}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    if-nez v0, :cond_1

    .line 119
    .line 120
    iget-object v0, p0, Ll/xse0;->d:Ll/bu9;

    .line 121
    .line 122
    const/4 v2, 0x1

    .line 123
    invoke-virtual {v0, v2}, Ll/bu9;->X(Z)V

    .line 124
    .line 125
    .line 126
    :cond_1
    iget-object v0, p0, Ll/xse0;->e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 127
    .line 128
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iget-object p0, p0, Ll/xse0;->d:Ll/bu9;

    .line 133
    .line 134
    invoke-virtual {p0}, Ll/bu9;->k()I

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    invoke-static {p1, v0, v1, p0}, Ll/v5g0;->r(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V

    .line 139
    .line 140
    .line 141
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/xse0;->a:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    iget-wide v2, p0, Ll/xse0;->a:J

    .line 15
    .line 16
    sub-long/2addr v0, v2

    .line 17
    const-wide/32 v2, 0x124f80

    .line 18
    .line 19
    .line 20
    cmp-long v0, v0, v2

    .line 21
    .line 22
    if-lez v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/xse0;->e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Ll/xse0;->e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-string v2, "Session Timed Out"

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xse0;->c()V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    return-void
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xse0;->d:Ll/bu9;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ll/bu9;->S(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/xse0;->d:Ll/bu9;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/bu9;->i0(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/xse0;->d:Ll/bu9;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/bu9;->O(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/xse0;->d:Ll/bu9;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/bu9;->C()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/xse0;->d:Ll/bu9;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/bu9;->X(Z)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Ll/xse0;->e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p0, Ll/xse0;->e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "Session destroyed; Session ID is now 0"

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/xse0;->d:Ll/bu9;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/bu9;->c()V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/xse0;->d:Ll/bu9;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/bu9;->b()V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/xse0;->d:Ll/bu9;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/bu9;->a()V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/xse0;->d:Ll/bu9;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/bu9;->d()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public d()I
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3e8

    .line 6
    .line 7
    div-long/2addr v0, v2

    .line 8
    long-to-int p0, v0

    .line 9
    return p0
.end method

.method public e(Landroid/content/Context;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xse0;->d:Ll/bu9;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/bu9;->v()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/xse0;->d:Ll/bu9;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, v1}, Ll/bu9;->W(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/xse0;->g:Ll/i0l0;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1}, Ll/i0l0;->s(Ljava/util/Set;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-direct {p0, p1}, Ll/xse0;->b(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public f(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/xse0;->a:J

    .line 2
    .line 3
    return-void
.end method

.method public g()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xse0;->f:Ll/duv;

    .line 2
    .line 3
    const-string v1, "App Launched"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/duv;->p(Ljava/lang/String;)Ll/i4f;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Ll/xse0;->b:I

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {v0}, Ll/i4f;->a()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Ll/xse0;->b:I

    .line 20
    .line 21
    return-void
.end method

.method public h()V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/xse0;->f:Ll/duv;

    .line 2
    .line 3
    const-string v1, "App Launched"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/duv;->H(Ljava/lang/String;)Ll/fek0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/fek0;->a()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-wide/16 v0, -0x1

    .line 17
    .line 18
    :goto_0
    iput-wide v0, p0, Ll/xse0;->c:J

    .line 19
    .line 20
    return-void
.end method
