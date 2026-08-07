.class public Ll/e4l0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/e4l0;->i(Z)Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Ll/e4l0;


# direct methods
.method public constructor <init>(Ll/e4l0;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/e4l0$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/e4l0$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-boolean p4, p0, Ll/e4l0$a;->c:Z

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/putong/facertification/RxFacertification$PreDetectException;)V
    .locals 6

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/facertification/RxFacertification$PreDetectException;->prepareResult:Ll/jxf;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->getProviderNameForTracker()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p2, Ll/jxf;->c:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v2, p0, Ll/e4l0$a;->a:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v3, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 12
    .line 13
    invoke-static {v3}, Ll/e4l0;->c(Ll/e4l0;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-static {v0, v1, v2, v3}, Ll/d3l0;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 21
    .line 22
    new-instance v3, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v4, "prepareCallback failed:"

    .line 25
    .line 26
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v4, ";"

    .line 33
    .line 34
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget-object v5, p2, Ll/jxf;->f:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-object p2, p2, Ll/jxf;->e:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string p2, ";userId:"

    .line 51
    .line 52
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-interface {p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    const/4 v3, 0x0

    .line 71
    invoke-static {v2, p2, v3}, Ll/e4l0;->f(Ll/e4l0;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    iget-object p2, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 75
    .line 76
    invoke-virtual {p2}, Ll/e4l0;->g()Z

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    if-eqz p2, :cond_0

    .line 81
    .line 82
    iget-object p2, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 83
    .line 84
    invoke-static {p2}, Ll/e4l0;->e(Ll/e4l0;)I

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    const/4 v2, 0x2

    .line 89
    if-ne p2, v2, :cond_0

    .line 90
    .line 91
    iget-object p2, p0, Ll/e4l0$a;->b:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v1, v0, p2}, Ll/d3l0;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_0
    iget-object p2, p0, Ll/e4l0$a;->b:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v1, v0, p2}, Ll/d3l0;->p(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentProvider()Z

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    if-eqz p2, :cond_1

    .line 107
    .line 108
    iget-object p1, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 109
    .line 110
    invoke-static {p1}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    iget-object p2, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 115
    .line 116
    invoke-static {p2}, Ll/e4l0;->c(Ll/e4l0;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    iget-object v0, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 121
    .line 122
    invoke-static {v0}, Ll/e4l0;->e(Ll/e4l0;)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    invoke-static {p1, v1, p2, v0}, Ll/hxf;->k(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;I)Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    if-nez p1, :cond_4

    .line 131
    .line 132
    iget-object p0, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 133
    .line 134
    invoke-static {p0}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-static {p0, v1}, Ll/q5l0;->P(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentIntlProvider()Z

    .line 143
    .line 144
    .line 145
    move-result p2

    .line 146
    if-nez p2, :cond_2

    .line 147
    .line 148
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentIntlProviderV2()Z

    .line 149
    .line 150
    .line 151
    move-result p2

    .line 152
    if-eqz p2, :cond_3

    .line 153
    .line 154
    :cond_2
    iget-object p2, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 155
    .line 156
    invoke-static {p2}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 157
    .line 158
    .line 159
    move-result-object p2

    .line 160
    iget-object v0, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 161
    .line 162
    invoke-static {v0}, Ll/e4l0;->e(Ll/e4l0;)I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    invoke-static {p2, v1, v0}, Ll/q5l0;->O(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V

    .line 167
    .line 168
    .line 169
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->isMoMoProvider()Z

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    if-eqz p1, :cond_4

    .line 174
    .line 175
    iget-object p1, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 176
    .line 177
    invoke-static {p1}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    iget-object p0, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 182
    .line 183
    invoke-static {p0}, Ll/e4l0;->e(Ll/e4l0;)I

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    invoke-static {p1, v1, p0}, Ll/q5l0;->M(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V

    .line 188
    .line 189
    .line 190
    :cond_4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/VerificationToken;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->getProviderNameForTracker()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/e4l0$a;->a:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v2, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 8
    .line 9
    invoke-static {v2}, Ll/e4l0;->c(Ll/e4l0;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-static {v0, v1, v2}, Ll/d3l0;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->isMoMoProvider()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-static {}, Ll/cwh0;->a()Ll/ltl;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {p1}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->o(Lcom/p1/mobile/putong/data/VerificationToken;)Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p0, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 31
    .line 32
    invoke-static {p0}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget v1, Lcom/p1/mobile/putong/core/R$string;->g0:I

    .line 37
    .line 38
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {v0, p1, p0}, Ll/ltl;->c(Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/data/VerificationToken;Ll/jxf;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->getProviderNameForTracker()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object v0, p0, Ll/e4l0$a;->a:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 8
    .line 9
    invoke-static {v1}, Ll/e4l0;->c(Ll/e4l0;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Ll/e4l0$a;->b:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p2, v0, v1, v2}, Ll/d3l0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentIntlProvider()Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-nez p2, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentIntlProviderV2()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 31
    .line 32
    invoke-static {p1}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    iget-object p1, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 39
    .line 40
    invoke-static {p1}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_1

    .line 49
    .line 50
    iget-object p1, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 51
    .line 52
    invoke-static {p1}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-nez p1, :cond_1

    .line 61
    .line 62
    iget-object p0, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 63
    .line 64
    invoke-static {p0}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 69
    .line 70
    .line 71
    :cond_1
    return-void
.end method

.method public d(Ljava/lang/Throwable;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/e4l0;->g()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 16
    .line 17
    invoke-static {v1}, Ll/e4l0;->d(Ll/e4l0;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 22
    .line 23
    invoke-static {v2}, Ll/e4l0;->b(Ll/e4l0;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget-object v3, p0, Ll/e4l0$a;->a:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0, p1, v1, v2, v3}, Ll/xc20;->s(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    goto/16 :goto_1

    .line 33
    .line 34
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 35
    .line 36
    if-eqz v0, :cond_4

    .line 37
    .line 38
    iget-object v0, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 39
    .line 40
    invoke-static {v0}, Ll/e4l0;->b(Ll/e4l0;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 45
    .line 46
    iget v1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 47
    .line 48
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget-object v2, p0, Ll/e4l0$a;->a:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v3, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 55
    .line 56
    invoke-static {v3}, Ll/e4l0;->c(Ll/e4l0;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-static {v0, v1, v2, v3}, Ll/d3l0;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 64
    .line 65
    const v1, 0x9c41

    .line 66
    .line 67
    .line 68
    if-eq v0, v1, :cond_3

    .line 69
    .line 70
    const v1, 0x9c45

    .line 71
    .line 72
    .line 73
    if-eq v0, v1, :cond_2

    .line 74
    .line 75
    iget-object v0, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 76
    .line 77
    invoke-static {v0}, Ll/e4l0;->e(Ll/e4l0;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iget-object v1, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 82
    .line 83
    const/4 v2, 0x3

    .line 84
    if-ne v0, v2, :cond_1

    .line 85
    .line 86
    invoke-static {v1}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 91
    .line 92
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-static {v0, p1}, Ll/q5l0;->J(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 100
    .line 101
    invoke-static {p1}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 106
    .line 107
    if-eqz p1, :cond_5

    .line 108
    .line 109
    iget-object p0, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 110
    .line 111
    invoke-static {p0}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_1
    invoke-static {v1}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 124
    .line 125
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-static {v0, p1}, Ll/q5l0;->P(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_2
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ym:I

    .line 134
    .line 135
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 139
    .line 140
    invoke-static {p1}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 145
    .line 146
    if-eqz p1, :cond_5

    .line 147
    .line 148
    iget-object p0, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 149
    .line 150
    invoke-static {p0}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :cond_3
    const-string p1, "\u5ba1\u6838\u4e2d"

    .line 159
    .line 160
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    iget-object p1, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 164
    .line 165
    invoke-static {p1}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 170
    .line 171
    if-eqz p1, :cond_5

    .line 172
    .line 173
    iget-object p0, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 174
    .line 175
    invoke-static {p0}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :cond_4
    :goto_0
    iget-object p1, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 184
    .line 185
    invoke-static {p1}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-static {p1}, Ll/q5l0;->K(Lcom/p1/mobile/android/app/Act;)V

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 193
    .line 194
    invoke-static {p1}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 199
    .line 200
    .line 201
    :goto_1
    iget-object p1, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 202
    .line 203
    invoke-static {p1}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    .line 208
    .line 209
    if-eqz p1, :cond_5

    .line 210
    .line 211
    iget-object p0, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 212
    .line 213
    invoke-static {p0}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 218
    .line 219
    .line 220
    :cond_5
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/data/VerificationToken;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->getProviderNameForTracker()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/e4l0$a;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, v0}, Ll/d3l0;->q(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/e4l0;->g()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_3

    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isIdCardVerified()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/d0;->U:Ll/jxd0;

    .line 43
    .line 44
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/d0;->R:Ll/jxd0;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/d0;->p4(Ljava/lang/String;)Lrx/c;

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 74
    .line 75
    invoke-static {p1}, Ll/e4l0;->c(Ll/e4l0;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const-string v0, "fromNameVerificationDlg"

    .line 80
    .line 81
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-nez p1, :cond_1

    .line 86
    .line 87
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 88
    .line 89
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 90
    .line 91
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/d0;->T:Ll/jxd0;

    .line 92
    .line 93
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    :cond_1
    iget-boolean p1, p0, Ll/e4l0$a;->c:Z

    .line 99
    .line 100
    iget-object v0, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 101
    .line 102
    if-eqz p1, :cond_2

    .line 103
    .line 104
    invoke-static {v0}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iget-object v0, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 109
    .line 110
    invoke-static {v0}, Ll/e4l0;->e(Ll/e4l0;)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/verification/remind/result/AvatarResultAct;->g2(Lcom/p1/mobile/android/app/Act;I)V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 118
    .line 119
    invoke-static {p0}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_2
    invoke-static {v0}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    const/4 v0, -0x1

    .line 132
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setResult(I)V

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Ll/e4l0$a;->d:Ll/e4l0;

    .line 136
    .line 137
    invoke-static {p0}, Ll/e4l0;->a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 142
    .line 143
    .line 144
    :cond_3
    return-void
.end method
