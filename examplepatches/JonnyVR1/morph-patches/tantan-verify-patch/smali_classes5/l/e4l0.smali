.class public Ll/e4l0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Ljava/lang/String;

.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:I

.field public h:Z

.field public i:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/e4l0;->a:Z

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    iput-object v0, p0, Ll/e4l0;->d:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, p0, Ll/e4l0;->c:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object p2, p0, Ll/e4l0;->b:Ljava/lang/String;

    .line 14
    .line 15
    iput-boolean p3, p0, Ll/e4l0;->h:Z

    .line 16
    .line 17
    iput-object p4, p0, Ll/e4l0;->e:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p5, p0, Ll/e4l0;->f:Ljava/lang/String;

    .line 20
    .line 21
    iput p6, p0, Ll/e4l0;->g:I

    .line 22
    .line 23
    invoke-static {}, Ll/y5l0;->c()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Ll/e4l0;->d:Ljava/lang/String;

    .line 28
    .line 29
    iput-object p7, p0, Ll/e4l0;->i:Ljava/lang/String;

    .line 30
    .line 31
    return-void
.end method

.method public static bridge synthetic a(Ll/e4l0;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e4l0;->c:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/e4l0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e4l0;->d:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/e4l0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e4l0;->b:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/e4l0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e4l0;->f:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/e4l0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/e4l0;->g:I

    return p0
.end method

.method public static bridge synthetic f(Ll/e4l0;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e4l0;->j(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public g()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e4l0;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/e4l0;->f:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget p0, p0, Ll/e4l0;->g:I

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    if-eq p0, v0, :cond_0

    .line 21
    .line 22
    return v0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public h(ZZ)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/e4l0;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x3

    .line 11
    const/4 v3, 0x2

    .line 12
    const-string v4, "fromAccountBackH5"

    .line 13
    .line 14
    const/4 v5, 0x1

    .line 15
    const/4 v6, -0x1

    .line 16
    sparse-switch v1, :sswitch_data_0

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :sswitch_0
    const-string v1, "fakeBatch"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 v6, 0x4

    .line 30
    goto :goto_0

    .line 31
    :sswitch_1
    const-string v1, "appeal"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    move v6, v2

    .line 41
    goto :goto_0

    .line 42
    :sswitch_2
    const-string v1, "fromNameVerificationDlg"

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    move v6, v3

    .line 52
    goto :goto_0

    .line 53
    :sswitch_3
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_3

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    move v6, v5

    .line 61
    goto :goto_0

    .line 62
    :sswitch_4
    const-string v1, "fromPicVerificationDlg"

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_4

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_4
    const/4 v6, 0x0

    .line 72
    :goto_0
    packed-switch v6, :pswitch_data_0

    .line 73
    .line 74
    .line 75
    const-string v0, "1"

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :pswitch_0
    const-string v0, "5"

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :pswitch_1
    const-string v0, "4"

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :pswitch_2
    const-string v0, "7"

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :pswitch_3
    const-string v0, "6"

    .line 88
    .line 89
    :goto_1
    iget-object v1, p0, Ll/e4l0;->c:Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    invoke-static {v1, v5}, Ll/ixf;->c(Landroid/content/Context;Z)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iget-object v6, p0, Ll/e4l0;->b:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {v6, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    if-eqz v4, :cond_5

    .line 102
    .line 103
    iget-object p0, p0, Ll/e4l0;->i:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v1, v0, p0}, Ll/y5l0;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    goto :goto_2

    .line 110
    :cond_5
    iget v4, p0, Ll/e4l0;->g:I

    .line 111
    .line 112
    if-ne v4, v3, :cond_6

    .line 113
    .line 114
    iget-object v2, p0, Ll/e4l0;->e:Ljava/lang/String;

    .line 115
    .line 116
    iget-object v3, p0, Ll/e4l0;->f:Ljava/lang/String;

    .line 117
    .line 118
    iget-boolean p0, p0, Ll/e4l0;->h:Z

    .line 119
    .line 120
    invoke-static {v2, v3, v1, p0, v0}, Ll/y5l0;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    goto :goto_2

    .line 125
    :cond_6
    if-ne v4, v5, :cond_7

    .line 126
    .line 127
    invoke-static {v1, v0}, Ll/y5l0;->f(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    goto :goto_2

    .line 132
    :cond_7
    if-ne v4, v2, :cond_8

    .line 133
    .line 134
    invoke-static {v1, v0}, Ll/y5l0;->b(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    goto :goto_2

    .line 139
    :cond_8
    const/4 p0, 0x0

    .line 140
    :goto_2
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-eqz v0, :cond_9

    .line 145
    .line 146
    iput-boolean p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->enableVolcEnginePro:Z

    .line 147
    .line 148
    iput-boolean p2, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->newProcess:Z

    .line 149
    .line 150
    :cond_9
    return-object p0

    .line 151
    :sswitch_data_0
    .sparse-switch
        -0x76f4c4dc -> :sswitch_4
        -0x6a09d2e9 -> :sswitch_3
        -0x62222151 -> :sswitch_2
        -0x541b3271 -> :sswitch_1
        0x3bfa5ce5 -> :sswitch_0
    .end sparse-switch

    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public i(Z)Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e4l0;->b:Ljava/lang/String;

    .line 2
    .line 3
    iget v1, p0, Ll/e4l0;->g:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/x5l0;->i(Ljava/lang/String;I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, p0, Ll/e4l0;->g:I

    .line 10
    .line 11
    invoke-static {v1}, Ll/x5l0;->h(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ll/e4l0$a;

    .line 16
    .line 17
    invoke-direct {v2, p0, v0, v1, p1}, Ll/e4l0$a;-><init>(Ll/e4l0;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 18
    .line 19
    .line 20
    return-object v2
.end method

.method public final j(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/Exception;

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    new-instance p0, Ljava/lang/Exception;

    .line 10
    .line 11
    invoke-direct {p0, p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    :goto_0
    const/16 p1, 0x32

    .line 15
    .line 16
    invoke-static {p0, p1}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
