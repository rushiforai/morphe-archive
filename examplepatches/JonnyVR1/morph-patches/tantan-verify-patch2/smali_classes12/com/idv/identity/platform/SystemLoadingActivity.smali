.class public Lcom/idv/identity/platform/SystemLoadingActivity;
.super Lcom/idv/identity/platform/IntlFaceBaseActivity;
.source "SourceFile"


# static fields
.field private static e:[Ljava/lang/String;


# instance fields
.field private c:J

.field private d:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "android.permission.CAMERA"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/idv/identity/platform/SystemLoadingActivity;->e:[Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Lcom/idv/identity/platform/SystemLoadingActivity;->c:J

    .line 9
    .line 10
    new-instance v0, Landroid/os/Handler;

    .line 11
    .line 12
    new-instance v1, Lcom/idv/identity/platform/SystemLoadingActivity$a;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Lcom/idv/identity/platform/SystemLoadingActivity$a;-><init>(Lcom/idv/identity/platform/SystemLoadingActivity;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/idv/identity/platform/SystemLoadingActivity;->d:Landroid/os/Handler;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic L0(Lcom/idv/identity/platform/SystemLoadingActivity;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/platform/SystemLoadingActivity;->U0(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic N0(Lcom/idv/identity/platform/SystemLoadingActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/platform/SystemLoadingActivity;->V0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O0(Lcom/idv/identity/platform/SystemLoadingActivity;Lcom/idv/identity/platform/config/OSSConfig;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/idv/identity/platform/SystemLoadingActivity;->X0(Lcom/idv/identity/platform/config/OSSConfig;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic P0(Lcom/idv/identity/platform/SystemLoadingActivity;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/platform/SystemLoadingActivity;->W0(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Q0()Z
    .locals 7

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->i0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ll/ffm;->f:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v3, "code"

    .line 17
    .line 18
    const-string v4, "error"

    .line 19
    .line 20
    const-string v5, "status"

    .line 21
    .line 22
    const-string v6, "enviromentCheck"

    .line 23
    .line 24
    if-nez v1, :cond_3

    .line 25
    .line 26
    sget-object v1, Ll/ffm;->e:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    sget-object v1, Ll/ffm;->d:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-static {}, Lcom/idv/identity/platform/utils/EnvCheck;->b()Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sget-object v1, Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;->ENV_SUCCESS:Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 48
    .line 49
    if-eq v1, v0, :cond_7

    .line 50
    .line 51
    sget-object v1, Ll/dfm;->h:Ljava/lang/String;

    .line 52
    .line 53
    invoke-direct {p0, v1}, Lcom/idv/identity/platform/SystemLoadingActivity;->W0(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 61
    .line 62
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    filled-new-array {v5, v4, v3, v0}, [Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p0, v1, v6, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return v2

    .line 74
    :cond_1
    sget-object v1, Ll/ffm;->a:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-nez v1, :cond_2

    .line 81
    .line 82
    sget-object v1, Ll/ffm;->b:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-nez v1, :cond_2

    .line 89
    .line 90
    sget-object v1, Ll/ffm;->c:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-nez v1, :cond_2

    .line 97
    .line 98
    sget-object v1, Ll/ffm;->i:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-nez v1, :cond_2

    .line 105
    .line 106
    sget-object v1, Ll/ffm;->h:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_7

    .line 113
    .line 114
    :cond_2
    invoke-static {}, Lcom/idv/identity/platform/utils/EnvCheck;->c()Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    sget-object v1, Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;->ENV_SUCCESS:Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 119
    .line 120
    if-eq v1, v0, :cond_7

    .line 121
    .line 122
    sget-object v1, Ll/dfm;->g:Ljava/lang/String;

    .line 123
    .line 124
    invoke-direct {p0, v1}, Lcom/idv/identity/platform/SystemLoadingActivity;->W0(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 132
    .line 133
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    filled-new-array {v5, v4, v3, v0}, [Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {p0, v1, v6, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return v2

    .line 145
    :cond_3
    :goto_0
    invoke-static {}, Lcom/idv/identity/platform/utils/EnvCheck;->a()Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    sget-object v1, Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;->ENV_SUCCESS:Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 150
    .line 151
    if-eq v1, v0, :cond_7

    .line 152
    .line 153
    sget-object v1, Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;->ENV_ERROR_LOW_OS:Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 154
    .line 155
    if-ne v1, v0, :cond_4

    .line 156
    .line 157
    sget-object v1, Ll/dfm;->m:Ljava/lang/String;

    .line 158
    .line 159
    invoke-direct {p0, v1}, Lcom/idv/identity/platform/SystemLoadingActivity;->W0(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    goto :goto_1

    .line 163
    :cond_4
    sget-object v1, Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;->ENV_ERROR_NO_BACK_CAMERA:Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 164
    .line 165
    if-ne v1, v0, :cond_5

    .line 166
    .line 167
    sget-object v1, Ll/dfm;->h:Ljava/lang/String;

    .line 168
    .line 169
    invoke-direct {p0, v1}, Lcom/idv/identity/platform/SystemLoadingActivity;->W0(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    goto :goto_1

    .line 173
    :cond_5
    sget-object v1, Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;->ENV_ERROR_NO_FRONT_CAMERA:Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 174
    .line 175
    if-ne v1, v0, :cond_6

    .line 176
    .line 177
    sget-object v1, Ll/dfm;->g:Ljava/lang/String;

    .line 178
    .line 179
    invoke-direct {p0, v1}, Lcom/idv/identity/platform/SystemLoadingActivity;->W0(Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    :cond_6
    :goto_1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 187
    .line 188
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    filled-new-array {v5, v4, v3, v0}, [Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {p0, v1, v6, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    return v2

    .line 200
    :cond_7
    const/4 p0, 0x0

    .line 201
    return p0
.end method

.method private R0()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/idv/identity/platform/SystemLoadingActivity;->e:[Ljava/lang/String;

    .line 7
    .line 8
    array-length v2, v1

    .line 9
    const/4 v3, 0x0

    .line 10
    :goto_0
    if-ge v3, v2, :cond_1

    .line 11
    .line 12
    aget-object v4, v1, v3

    .line 13
    .line 14
    invoke-virtual {p0, v4}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    if-eqz v5, :cond_0

    .line 19
    .line 20
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return-object v0
.end method

.method private S0()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "LOADING"

    .line 2
    .line 3
    return-object p0
.end method

.method private U0(Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p1, Ll/dfm;->a:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    move-object v5, p1

    .line 10
    invoke-virtual {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->finish()V

    .line 11
    .line 12
    .line 13
    new-instance p1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    iget-wide v2, p0, Lcom/idv/identity/platform/SystemLoadingActivity;->c:J

    .line 23
    .line 24
    sub-long/2addr v0, v2

    .line 25
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p0, "ms"

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 42
    .line 43
    const-string v2, "LOADING_EXIT"

    .line 44
    .line 45
    const-string v3, "LOADING"

    .line 46
    .line 47
    invoke-virtual/range {v0 .. v5}, Lcom/idv/identity/platform/log/RecordService;->recordEventPage(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0, v5}, Ll/afm;->e(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private V0()V
    .locals 15

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->L()Lcom/idv/identity/platform/model/NfcConfigRes;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/afm;->j0()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ll/afm;->i0()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v8

    .line 25
    if-nez v8, :cond_0

    .line 26
    .line 27
    sget-object v0, Ll/dfm;->E:Ljava/lang/String;

    .line 28
    .line 29
    invoke-direct {p0, v0}, Lcom/idv/identity/platform/SystemLoadingActivity;->W0(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v3, "onInitSuccessproductCode "

    .line 36
    .line 37
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    const-string v3, "Identity"

    .line 48
    .line 49
    invoke-static {v3, v2}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v2}, Ll/afm;->h()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {v3}, Ll/afm;->i()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    const-string v4, ""

    .line 69
    .line 70
    if-eqz v2, :cond_2

    .line 71
    .line 72
    if-eqz v3, :cond_2

    .line 73
    .line 74
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-nez v2, :cond_2

    .line 79
    .line 80
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-nez v2, :cond_2

    .line 85
    .line 86
    invoke-static {p0}, Ll/lf20;->f(Landroid/content/Context;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    :cond_1
    :goto_0
    move-object v1, v4

    .line 91
    goto/16 :goto_2

    .line 92
    .line 93
    :cond_2
    sget-object v2, Ll/ffm;->i:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    const/4 v3, 0x1

    .line 100
    if-nez v2, :cond_c

    .line 101
    .line 102
    sget-object v2, Ll/ffm;->a:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    if-nez v2, :cond_c

    .line 109
    .line 110
    sget-object v2, Ll/ffm;->b:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-nez v2, :cond_c

    .line 117
    .line 118
    sget-object v2, Ll/ffm;->c:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    if-nez v2, :cond_c

    .line 125
    .line 126
    sget-object v2, Ll/ffm;->h:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    if-eqz v2, :cond_3

    .line 133
    .line 134
    goto/16 :goto_1

    .line 135
    .line 136
    :cond_3
    sget-object v2, Ll/ffm;->d:Ljava/lang/String;

    .line 137
    .line 138
    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    const-string v5, "1"

    .line 143
    .line 144
    if-eqz v2, :cond_4

    .line 145
    .line 146
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    invoke-static {v0, p0}, Ll/lf20;->e(ZLandroid/content/Context;)Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-nez v0, :cond_1

    .line 155
    .line 156
    sget-object v4, Ll/dfm;->w:Ljava/lang/String;

    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_4
    sget-object v2, Ll/ffm;->g:Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    const/4 v6, 0x0

    .line 166
    if-eqz v2, :cond_7

    .line 167
    .line 168
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    const-string v3, "android.hardware.nfc"

    .line 173
    .line 174
    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 175
    .line 176
    .line 177
    move-result v2

    .line 178
    if-nez v2, :cond_5

    .line 179
    .line 180
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 185
    .line 186
    sget-object v2, Ll/cfm;->a:Ljava/lang/String;

    .line 187
    .line 188
    const-string v3, "warning"

    .line 189
    .line 190
    sget-object v4, Ll/dfm;->y:Ljava/lang/String;

    .line 191
    .line 192
    const-string v5, "docType"

    .line 193
    .line 194
    filled-new-array {v5, v2, v3, v4}, [Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    const-string v3, "START_CKYC"

    .line 199
    .line 200
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    sget-object v4, Ll/dfm;->y:Ljava/lang/String;

    .line 204
    .line 205
    move-object v1, v4

    .line 206
    move v0, v6

    .line 207
    goto :goto_2

    .line 208
    :cond_5
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    if-eqz v1, :cond_6

    .line 213
    .line 214
    invoke-static {p0}, Ll/lf20;->f(Landroid/content/Context;)Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    if-nez v0, :cond_1

    .line 219
    .line 220
    sget-object v4, Ll/dfm;->w:Ljava/lang/String;

    .line 221
    .line 222
    goto/16 :goto_0

    .line 223
    .line 224
    :cond_6
    invoke-direct {p0, v0}, Lcom/idv/identity/platform/SystemLoadingActivity;->a1(Lcom/idv/identity/platform/model/NfcConfigRes;)Z

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    if-nez v0, :cond_1

    .line 229
    .line 230
    sget-object v4, Ll/dfm;->v:Ljava/lang/String;

    .line 231
    .line 232
    goto/16 :goto_0

    .line 233
    .line 234
    :cond_7
    sget-object v2, Ll/ffm;->e:Ljava/lang/String;

    .line 235
    .line 236
    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    move-result v2

    .line 240
    if-eqz v2, :cond_9

    .line 241
    .line 242
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result v1

    .line 246
    if-eqz v1, :cond_8

    .line 247
    .line 248
    invoke-static {p0}, Ll/lf20;->f(Landroid/content/Context;)Z

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    if-nez v0, :cond_1

    .line 253
    .line 254
    sget-object v4, Ll/dfm;->w:Ljava/lang/String;

    .line 255
    .line 256
    goto/16 :goto_0

    .line 257
    .line 258
    :cond_8
    invoke-direct {p0, v0}, Lcom/idv/identity/platform/SystemLoadingActivity;->Y0(Lcom/idv/identity/platform/model/NfcConfigRes;)Z

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    goto/16 :goto_0

    .line 263
    .line 264
    :cond_9
    sget-object v0, Ll/ffm;->f:Ljava/lang/String;

    .line 265
    .line 266
    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    if-eqz v0, :cond_b

    .line 271
    .line 272
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 273
    .line 274
    .line 275
    move-result v0

    .line 276
    if-eqz v0, :cond_a

    .line 277
    .line 278
    invoke-static {p0}, Ll/lf20;->f(Landroid/content/Context;)Z

    .line 279
    .line 280
    .line 281
    move-result v0

    .line 282
    goto/16 :goto_0

    .line 283
    .line 284
    :cond_a
    invoke-static {v6, p0}, Ll/lf20;->e(ZLandroid/content/Context;)Z

    .line 285
    .line 286
    .line 287
    move-result v0

    .line 288
    goto/16 :goto_0

    .line 289
    .line 290
    :cond_b
    move v0, v3

    .line 291
    goto/16 :goto_0

    .line 292
    .line 293
    :cond_c
    :goto_1
    invoke-static {p0, v3}, Ll/lf20;->b(Landroid/content/Context;Z)Z

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    if-nez v0, :cond_1

    .line 298
    .line 299
    sget-object v4, Ll/dfm;->x:Ljava/lang/String;

    .line 300
    .line 301
    goto/16 :goto_0

    .line 302
    .line 303
    :goto_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 304
    .line 305
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 306
    .line 307
    .line 308
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 309
    .line 310
    .line 311
    move-result-wide v3

    .line 312
    iget-wide v5, p0, Lcom/idv/identity/platform/SystemLoadingActivity;->c:J

    .line 313
    .line 314
    sub-long/2addr v3, v5

    .line 315
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 316
    .line 317
    .line 318
    const-string v3, "ms"

    .line 319
    .line 320
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 321
    .line 322
    .line 323
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v13

    .line 327
    const-string v2, "START_INIT"

    .line 328
    .line 329
    if-nez v0, :cond_d

    .line 330
    .line 331
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    sget-object v11, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 336
    .line 337
    const-string v9, "errMsg"

    .line 338
    .line 339
    sget-object v10, Ll/dfm;->u:Ljava/lang/String;

    .line 340
    .line 341
    const-string v3, "action"

    .line 342
    .line 343
    const-string v4, "initSDK"

    .line 344
    .line 345
    const-string v5, "status"

    .line 346
    .line 347
    const-string v6, "error"

    .line 348
    .line 349
    const-string v7, "productCode"

    .line 350
    .line 351
    filled-new-array/range {v3 .. v10}, [Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v3

    .line 355
    invoke-virtual {v0, v11, v2, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 356
    .line 357
    .line 358
    invoke-direct {p0, v1}, Lcom/idv/identity/platform/SystemLoadingActivity;->W0(Ljava/lang/String;)V

    .line 359
    .line 360
    .line 361
    goto :goto_3

    .line 362
    :cond_d
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    sget-object v10, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 367
    .line 368
    const-string v6, "success"

    .line 369
    .line 370
    const-string v7, "productCode"

    .line 371
    .line 372
    const-string v3, "action"

    .line 373
    .line 374
    const-string v4, "initSDK"

    .line 375
    .line 376
    const-string v5, "status"

    .line 377
    .line 378
    filled-new-array/range {v3 .. v8}, [Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object v1

    .line 382
    invoke-virtual {v0, v10, v2, v1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 383
    .line 384
    .line 385
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 386
    .line 387
    .line 388
    move-result-object v9

    .line 389
    const-string v12, "LOADING"

    .line 390
    .line 391
    const-string v14, "SUCCESS"

    .line 392
    .line 393
    const-string v11, "LOADING_EXIT"

    .line 394
    .line 395
    invoke-virtual/range {v9 .. v14}, Lcom/idv/identity/platform/log/RecordService;->recordEventPage(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 396
    .line 397
    .line 398
    :goto_3
    invoke-virtual {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->finish()V

    .line 399
    .line 400
    .line 401
    return-void
.end method

.method private W0(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x3e9

    .line 6
    .line 7
    iput v1, v0, Landroid/os/Message;->what:I

    .line 8
    .line 9
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/platform/SystemLoadingActivity;->d:Landroid/os/Handler;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private X0(Lcom/idv/identity/platform/config/OSSConfig;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 39

    .line 1
    move-object/from16 v3, p3

    .line 2
    .line 3
    invoke-direct/range {p0 .. p0}, Lcom/idv/identity/platform/SystemLoadingActivity;->Q0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const-class v0, Ljava/util/Map;

    .line 11
    .line 12
    invoke-static {v3, v0}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    move-object v4, v0

    .line 17
    check-cast v4, Ljava/util/Map;

    .line 18
    .line 19
    if-eqz v4, :cond_17

    .line 20
    .line 21
    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_17

    .line 26
    .line 27
    const-string v5, "docVideo"

    .line 28
    .line 29
    invoke-interface {v4, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    const-string v7, "model"

    .line 34
    .line 35
    invoke-interface {v4, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v8

    .line 39
    const-string v9, "faceLivenessFarNearOpen"

    .line 40
    .line 41
    invoke-interface {v4, v9}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v10

    .line 45
    const-string v11, "faceLivenessFarNearConfig"

    .line 46
    .line 47
    invoke-interface {v4, v11}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v12

    .line 51
    const-string v13, "appQualityCheck"

    .line 52
    .line 53
    invoke-interface {v4, v13}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v14

    .line 57
    const-string v15, "clientLivenessTimeout"

    .line 58
    .line 59
    invoke-interface {v4, v15}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v16

    .line 63
    move/from16 v17, v6

    .line 64
    .line 65
    const-string v6, "docPageConfig"

    .line 66
    .line 67
    invoke-interface {v4, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v18

    .line 71
    move/from16 v19, v8

    .line 72
    .line 73
    const-string v8, "docMode"

    .line 74
    .line 75
    invoke-interface {v4, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v20

    .line 79
    move/from16 v21, v10

    .line 80
    .line 81
    const-string v10, "showGuidePage"

    .line 82
    .line 83
    invoke-interface {v4, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v22

    .line 87
    move/from16 v23, v12

    .line 88
    .line 89
    const-string v12, "nfcConfig"

    .line 90
    .line 91
    invoke-interface {v4, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v24

    .line 95
    move/from16 v25, v14

    .line 96
    .line 97
    const-string v14, "useNFC"

    .line 98
    .line 99
    invoke-interface {v4, v14}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v26

    .line 103
    const-string v3, "chameleonFrameEnable"

    .line 104
    .line 105
    invoke-interface {v4, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v27

    .line 109
    const-string v2, "chameleon"

    .line 110
    .line 111
    invoke-interface {v4, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v28

    .line 115
    const-string v1, "useOssSdk"

    .line 116
    .line 117
    invoke-interface {v4, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v29

    .line 121
    const-string v0, "getOssSdkDegrade"

    .line 122
    .line 123
    invoke-interface {v4, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-object/from16 v30, v15

    .line 127
    .line 128
    const-string v15, "deviceCompressImageSwitch"

    .line 129
    .line 130
    invoke-interface {v4, v15}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v31

    .line 134
    const-string v0, "authUrls"

    .line 135
    .line 136
    invoke-interface {v4, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v32

    .line 140
    move-object/from16 v33, v13

    .line 141
    .line 142
    const-string v13, "authorizationAgreementLinkId"

    .line 143
    .line 144
    invoke-interface {v4, v13}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v34

    .line 148
    move-object/from16 v35, v11

    .line 149
    .line 150
    const-string v11, "authorizationAgreementLinkEn"

    .line 151
    .line 152
    invoke-interface {v4, v11}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result v36

    .line 156
    move-object/from16 v37, v9

    .line 157
    .line 158
    const-class v9, Ljava/lang/String;

    .line 159
    .line 160
    move-object/from16 v38, v7

    .line 161
    .line 162
    if-eqz v32, :cond_2

    .line 163
    .line 164
    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    :try_start_0
    invoke-static {v0}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-static {v0, v9}, Lcom/alibaba/fastjson/JSON;->parseArray(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-static {}, Ll/tj20;->b()Ll/tj20;

    .line 177
    .line 178
    .line 179
    move-result-object v7

    .line 180
    invoke-virtual {v7, v0}, Ll/tj20;->f(Ljava/util/List;)V

    .line 181
    .line 182
    .line 183
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 184
    .line 185
    .line 186
    move-result-object v7

    .line 187
    if-eqz p4, :cond_1

    .line 188
    .line 189
    if-eqz v0, :cond_1

    .line 190
    .line 191
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    if-nez v0, :cond_1

    .line 196
    .line 197
    const/4 v0, 0x1

    .line 198
    goto :goto_0

    .line 199
    :catch_0
    move-exception v0

    .line 200
    goto :goto_1

    .line 201
    :cond_1
    const/4 v0, 0x0

    .line 202
    :goto_0
    invoke-virtual {v7, v0}, Ll/afm;->O0(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    .line 204
    .line 205
    goto :goto_2

    .line 206
    :goto_1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 207
    .line 208
    .line 209
    move-result-object v7

    .line 210
    invoke-virtual {v7, v0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 211
    .line 212
    .line 213
    :cond_2
    :goto_2
    if-eqz v34, :cond_3

    .line 214
    .line 215
    invoke-interface {v4, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    instance-of v7, v0, Ljava/lang/String;

    .line 220
    .line 221
    if-eqz v7, :cond_3

    .line 222
    .line 223
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 224
    .line 225
    .line 226
    move-result-object v7

    .line 227
    check-cast v0, Ljava/lang/String;

    .line 228
    .line 229
    invoke-virtual {v7, v0}, Ll/afm;->G0(Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    :cond_3
    if-eqz v36, :cond_4

    .line 233
    .line 234
    invoke-interface {v4, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    instance-of v7, v0, Ljava/lang/String;

    .line 239
    .line 240
    if-eqz v7, :cond_4

    .line 241
    .line 242
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 243
    .line 244
    .line 245
    move-result-object v7

    .line 246
    check-cast v0, Ljava/lang/String;

    .line 247
    .line 248
    invoke-virtual {v7, v0}, Ll/afm;->F0(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    :cond_4
    const-string v0, "Y"

    .line 252
    .line 253
    const-string v7, "N"

    .line 254
    .line 255
    if-eqz v31, :cond_6

    .line 256
    .line 257
    invoke-interface {v4, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v11

    .line 261
    instance-of v13, v11, Ljava/lang/String;

    .line 262
    .line 263
    if-eqz v13, :cond_6

    .line 264
    .line 265
    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 266
    .line 267
    .line 268
    move-result v13

    .line 269
    if-eqz v13, :cond_5

    .line 270
    .line 271
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 272
    .line 273
    .line 274
    move-result-object v11

    .line 275
    const/4 v13, 0x0

    .line 276
    invoke-virtual {v11, v13}, Ll/afm;->P0(Z)V

    .line 277
    .line 278
    .line 279
    goto :goto_3

    .line 280
    :cond_5
    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    move-result v11

    .line 284
    if-eqz v11, :cond_6

    .line 285
    .line 286
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 287
    .line 288
    .line 289
    move-result-object v11

    .line 290
    const/4 v13, 0x1

    .line 291
    invoke-virtual {v11, v13}, Ll/afm;->P0(Z)V

    .line 292
    .line 293
    .line 294
    :cond_6
    :goto_3
    if-eqz v29, :cond_8

    .line 295
    .line 296
    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    .line 298
    .line 299
    move-result-object v1

    .line 300
    instance-of v11, v1, Ljava/lang/String;

    .line 301
    .line 302
    if-eqz v11, :cond_8

    .line 303
    .line 304
    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    move-result v7

    .line 308
    if-eqz v7, :cond_7

    .line 309
    .line 310
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 311
    .line 312
    .line 313
    move-result-object v0

    .line 314
    const/4 v13, 0x0

    .line 315
    invoke-virtual {v0, v13}, Ll/afm;->K1(Z)V

    .line 316
    .line 317
    .line 318
    goto :goto_4

    .line 319
    :cond_7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 320
    .line 321
    .line 322
    move-result v0

    .line 323
    if-eqz v0, :cond_8

    .line 324
    .line 325
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 326
    .line 327
    .line 328
    move-result-object v0

    .line 329
    const/4 v13, 0x1

    .line 330
    invoke-virtual {v0, v13}, Ll/afm;->K1(Z)V

    .line 331
    .line 332
    .line 333
    :cond_8
    :goto_4
    if-eqz v27, :cond_9

    .line 334
    .line 335
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    instance-of v1, v0, Ljava/lang/Boolean;

    .line 340
    .line 341
    if-eqz v1, :cond_9

    .line 342
    .line 343
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 344
    .line 345
    .line 346
    move-result-object v1

    .line 347
    check-cast v0, Ljava/lang/Boolean;

    .line 348
    .line 349
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 350
    .line 351
    .line 352
    move-result v0

    .line 353
    invoke-virtual {v1, v0}, Ll/afm;->M0(Z)V

    .line 354
    .line 355
    .line 356
    :cond_9
    if-eqz v28, :cond_a

    .line 357
    .line 358
    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    :try_start_1
    invoke-static {v0}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    const-class v1, Lcom/idv/identity/platform/config/Chameleon;

    .line 367
    .line 368
    invoke-static {v0, v1}, Ll/ac00;->g(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 369
    .line 370
    .line 371
    move-result-object v0

    .line 372
    check-cast v0, Lcom/idv/identity/platform/config/Chameleon;

    .line 373
    .line 374
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 375
    .line 376
    .line 377
    move-result-object v1

    .line 378
    invoke-virtual {v1, v0}, Ll/afm;->L0(Lcom/idv/identity/platform/config/Chameleon;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 379
    .line 380
    .line 381
    goto :goto_5

    .line 382
    :catch_1
    move-exception v0

    .line 383
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 384
    .line 385
    .line 386
    move-result-object v1

    .line 387
    invoke-virtual {v1, v0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 388
    .line 389
    .line 390
    :cond_a
    :goto_5
    if-eqz v26, :cond_b

    .line 391
    .line 392
    invoke-interface {v4, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    .line 394
    .line 395
    move-result-object v0

    .line 396
    instance-of v1, v0, Ljava/lang/String;

    .line 397
    .line 398
    if-eqz v1, :cond_b

    .line 399
    .line 400
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 401
    .line 402
    .line 403
    move-result-object v1

    .line 404
    check-cast v0, Ljava/lang/String;

    .line 405
    .line 406
    invoke-virtual {v1, v0}, Ll/afm;->R1(Ljava/lang/String;)V

    .line 407
    .line 408
    .line 409
    :cond_b
    if-eqz v24, :cond_c

    .line 410
    .line 411
    invoke-interface {v4, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 412
    .line 413
    .line 414
    move-result-object v0

    .line 415
    :try_start_2
    invoke-static {v0}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    .line 416
    .line 417
    .line 418
    move-result-object v0

    .line 419
    const-class v1, Lcom/idv/identity/platform/model/NfcConfigRes;

    .line 420
    .line 421
    invoke-static {v0, v1}, Ll/ac00;->g(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 422
    .line 423
    .line 424
    move-result-object v0

    .line 425
    check-cast v0, Lcom/idv/identity/platform/model/NfcConfigRes;

    .line 426
    .line 427
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 428
    .line 429
    .line 430
    move-result-object v1

    .line 431
    invoke-virtual {v1, v0}, Ll/afm;->l1(Lcom/idv/identity/platform/model/NfcConfigRes;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 432
    .line 433
    .line 434
    goto :goto_6

    .line 435
    :catch_2
    move-exception v0

    .line 436
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 437
    .line 438
    .line 439
    move-result-object v1

    .line 440
    invoke-virtual {v1, v0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 441
    .line 442
    .line 443
    :cond_c
    :goto_6
    if-eqz v20, :cond_d

    .line 444
    .line 445
    invoke-interface {v4, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 446
    .line 447
    .line 448
    move-result-object v0

    .line 449
    instance-of v1, v0, Ljava/lang/String;

    .line 450
    .line 451
    if-eqz v1, :cond_d

    .line 452
    .line 453
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 454
    .line 455
    .line 456
    move-result-object v1

    .line 457
    check-cast v0, Ljava/lang/String;

    .line 458
    .line 459
    invoke-virtual {v1, v0}, Ll/afm;->I1(Ljava/lang/String;)V

    .line 460
    .line 461
    .line 462
    :cond_d
    if-eqz v22, :cond_e

    .line 463
    .line 464
    invoke-interface {v4, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 465
    .line 466
    .line 467
    move-result-object v0

    .line 468
    instance-of v1, v0, Ljava/lang/String;

    .line 469
    .line 470
    if-eqz v1, :cond_e

    .line 471
    .line 472
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 473
    .line 474
    .line 475
    move-result-object v1

    .line 476
    check-cast v0, Ljava/lang/String;

    .line 477
    .line 478
    invoke-virtual {v1, v0}, Ll/afm;->P1(Ljava/lang/String;)V

    .line 479
    .line 480
    .line 481
    :cond_e
    if-eqz v18, :cond_f

    .line 482
    .line 483
    invoke-interface {v4, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 484
    .line 485
    .line 486
    move-result-object v0

    .line 487
    :try_start_3
    invoke-static {v0}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    .line 488
    .line 489
    .line 490
    move-result-object v0

    .line 491
    invoke-static {v0, v9}, Lcom/alibaba/fastjson/JSON;->parseArray(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;

    .line 492
    .line 493
    .line 494
    move-result-object v0

    .line 495
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 496
    .line 497
    .line 498
    move-result-object v1

    .line 499
    invoke-virtual {v1, v0}, Ll/afm;->R0(Ljava/util/List;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 500
    .line 501
    .line 502
    goto :goto_7

    .line 503
    :catch_3
    move-exception v0

    .line 504
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 505
    .line 506
    .line 507
    move-result-object v1

    .line 508
    invoke-virtual {v1, v0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 509
    .line 510
    .line 511
    :cond_f
    :goto_7
    if-eqz v17, :cond_10

    .line 512
    .line 513
    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 514
    .line 515
    .line 516
    move-result-object v0

    .line 517
    instance-of v1, v0, Ljava/lang/String;

    .line 518
    .line 519
    if-eqz v1, :cond_10

    .line 520
    .line 521
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 522
    .line 523
    .line 524
    move-result-object v1

    .line 525
    check-cast v0, Ljava/lang/String;

    .line 526
    .line 527
    invoke-virtual {v1, v0}, Ll/afm;->U0(Ljava/lang/String;)V

    .line 528
    .line 529
    .line 530
    :cond_10
    if-eqz v19, :cond_12

    .line 531
    .line 532
    move-object/from16 v1, v38

    .line 533
    .line 534
    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 535
    .line 536
    .line 537
    move-result-object v0

    .line 538
    instance-of v1, v0, Ljava/lang/String;

    .line 539
    .line 540
    if-eqz v1, :cond_12

    .line 541
    .line 542
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 543
    .line 544
    .line 545
    move-result-object v1

    .line 546
    invoke-virtual {v1}, Ll/afm;->k0()Ljava/lang/String;

    .line 547
    .line 548
    .line 549
    move-result-object v1

    .line 550
    if-eqz v1, :cond_11

    .line 551
    .line 552
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 553
    .line 554
    .line 555
    move-result v2

    .line 556
    if-nez v2, :cond_11

    .line 557
    .line 558
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 559
    .line 560
    .line 561
    move-result-object v0

    .line 562
    invoke-virtual {v0, v1}, Ll/afm;->h1(Ljava/lang/String;)V

    .line 563
    .line 564
    .line 565
    goto :goto_8

    .line 566
    :cond_11
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 567
    .line 568
    .line 569
    move-result-object v1

    .line 570
    check-cast v0, Ljava/lang/String;

    .line 571
    .line 572
    invoke-virtual {v1, v0}, Ll/afm;->h1(Ljava/lang/String;)V

    .line 573
    .line 574
    .line 575
    :cond_12
    :goto_8
    if-eqz v21, :cond_13

    .line 576
    .line 577
    move-object/from16 v1, v37

    .line 578
    .line 579
    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 580
    .line 581
    .line 582
    move-result-object v0

    .line 583
    instance-of v1, v0, Ljava/lang/String;

    .line 584
    .line 585
    if-eqz v1, :cond_13

    .line 586
    .line 587
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 588
    .line 589
    .line 590
    move-result-object v1

    .line 591
    check-cast v0, Ljava/lang/String;

    .line 592
    .line 593
    invoke-virtual {v1, v0}, Ll/afm;->Z0(Ljava/lang/String;)V

    .line 594
    .line 595
    .line 596
    :cond_13
    if-eqz v23, :cond_15

    .line 597
    .line 598
    move-object/from16 v1, v35

    .line 599
    .line 600
    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 601
    .line 602
    .line 603
    move-result-object v0

    .line 604
    invoke-static {v0}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    .line 605
    .line 606
    .line 607
    move-result-object v0

    .line 608
    const-class v1, Lcom/idv/identity/platform/config/IdentityFarNearConfig;

    .line 609
    .line 610
    invoke-static {v0, v1}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 611
    .line 612
    .line 613
    move-result-object v0

    .line 614
    check-cast v0, Lcom/idv/identity/platform/config/IdentityFarNearConfig;

    .line 615
    .line 616
    if-eqz v0, :cond_14

    .line 617
    .line 618
    invoke-virtual {v0}, Lcom/idv/identity/platform/config/IdentityFarNearConfig;->toString()Ljava/lang/String;

    .line 619
    .line 620
    .line 621
    :cond_14
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 622
    .line 623
    .line 624
    move-result-object v1

    .line 625
    invoke-virtual {v1, v0}, Ll/afm;->d1(Lcom/idv/identity/platform/config/IdentityFarNearConfig;)V

    .line 626
    .line 627
    .line 628
    :cond_15
    if-eqz v25, :cond_16

    .line 629
    .line 630
    move-object/from16 v1, v33

    .line 631
    .line 632
    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 633
    .line 634
    .line 635
    move-result-object v0

    .line 636
    instance-of v1, v0, Ljava/lang/String;

    .line 637
    .line 638
    if-eqz v1, :cond_16

    .line 639
    .line 640
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 641
    .line 642
    .line 643
    move-result-object v1

    .line 644
    check-cast v0, Ljava/lang/String;

    .line 645
    .line 646
    invoke-virtual {v1, v0}, Ll/afm;->E0(Ljava/lang/String;)V

    .line 647
    .line 648
    .line 649
    :cond_16
    if-eqz v16, :cond_17

    .line 650
    .line 651
    move-object/from16 v1, v30

    .line 652
    .line 653
    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 654
    .line 655
    .line 656
    move-result-object v0

    .line 657
    new-instance v1, Ljava/lang/StringBuilder;

    .line 658
    .line 659
    const-string v2, "clientLivenessTimeout:"

    .line 660
    .line 661
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 662
    .line 663
    .line 664
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 665
    .line 666
    .line 667
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 668
    .line 669
    .line 670
    move-result-object v1

    .line 671
    const-string v3, "TAG"

    .line 672
    .line 673
    invoke-static {v3, v1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 674
    .line 675
    .line 676
    if-eqz v0, :cond_17

    .line 677
    .line 678
    :try_start_4
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 679
    .line 680
    .line 681
    move-result-object v1

    .line 682
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 683
    .line 684
    .line 685
    move-result-object v0

    .line 686
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 687
    .line 688
    .line 689
    move-result v0

    .line 690
    invoke-virtual {v1, v0}, Ll/afm;->N0(F)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 691
    .line 692
    .line 693
    goto :goto_9

    .line 694
    :catch_4
    move-exception v0

    .line 695
    new-instance v1, Ljava/lang/StringBuilder;

    .line 696
    .line 697
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 698
    .line 699
    .line 700
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 701
    .line 702
    .line 703
    move-result-object v2

    .line 704
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 705
    .line 706
    .line 707
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 708
    .line 709
    .line 710
    move-result-object v1

    .line 711
    invoke-static {v3, v1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 712
    .line 713
    .line 714
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 715
    .line 716
    .line 717
    move-result-object v1

    .line 718
    invoke-virtual {v1, v0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 719
    .line 720
    .line 721
    :cond_17
    :goto_9
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 722
    .line 723
    .line 724
    move-result-object v0

    .line 725
    invoke-virtual {v0}, Ll/afm;->i0()Ljava/lang/String;

    .line 726
    .line 727
    .line 728
    move-result-object v0

    .line 729
    sget-object v1, Ll/ffm;->g:Ljava/lang/String;

    .line 730
    .line 731
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 732
    .line 733
    .line 734
    move-result v0

    .line 735
    if-eqz v0, :cond_18

    .line 736
    .line 737
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 738
    .line 739
    .line 740
    move-result-object v0

    .line 741
    invoke-virtual {v0}, Ll/afm;->L()Lcom/idv/identity/platform/model/NfcConfigRes;

    .line 742
    .line 743
    .line 744
    move-result-object v0

    .line 745
    if-eqz v0, :cond_19

    .line 746
    .line 747
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/NfcConfigRes;->getNfcMode()Ljava/lang/String;

    .line 748
    .line 749
    .line 750
    move-result-object v1

    .line 751
    if-eqz v1, :cond_19

    .line 752
    .line 753
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/NfcConfigRes;->getNfcMode()Ljava/lang/String;

    .line 754
    .line 755
    .line 756
    move-result-object v0

    .line 757
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 758
    .line 759
    .line 760
    move-result v0

    .line 761
    if-eqz v0, :cond_18

    .line 762
    .line 763
    goto :goto_a

    .line 764
    :cond_18
    move-object/from16 v1, p0

    .line 765
    .line 766
    goto :goto_b

    .line 767
    :cond_19
    :goto_a
    sget-object v0, Ll/dfm;->z:Ljava/lang/String;

    .line 768
    .line 769
    move-object/from16 v1, p0

    .line 770
    .line 771
    invoke-direct {v1, v0}, Lcom/idv/identity/platform/SystemLoadingActivity;->W0(Ljava/lang/String;)V

    .line 772
    .line 773
    .line 774
    return-void

    .line 775
    :goto_b
    if-eqz p1, :cond_1b

    .line 776
    .line 777
    move-object/from16 v2, p1

    .line 778
    .line 779
    iget-object v0, v2, Lcom/idv/identity/platform/config/OSSConfig;->FileNamePrefix:Ljava/lang/String;

    .line 780
    .line 781
    if-eqz v0, :cond_1b

    .line 782
    .line 783
    iget-object v0, v2, Lcom/idv/identity/platform/config/OSSConfig;->OssEndPoint:Ljava/lang/String;

    .line 784
    .line 785
    if-eqz v0, :cond_1b

    .line 786
    .line 787
    iget-object v0, v2, Lcom/idv/identity/platform/config/OSSConfig;->AccessKeyId:Ljava/lang/String;

    .line 788
    .line 789
    if-eqz v0, :cond_1b

    .line 790
    .line 791
    iget-object v0, v2, Lcom/idv/identity/platform/config/OSSConfig;->AccessKeySecret:Ljava/lang/String;

    .line 792
    .line 793
    if-nez v0, :cond_1a

    .line 794
    .line 795
    goto :goto_c

    .line 796
    :cond_1a
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 797
    .line 798
    .line 799
    move-result-object v0

    .line 800
    invoke-virtual {v0, v2}, Ll/afm;->J1(Lcom/idv/identity/platform/config/OSSConfig;)V

    .line 801
    .line 802
    .line 803
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 804
    .line 805
    .line 806
    move-result-object v0

    .line 807
    move-object/from16 v2, p2

    .line 808
    .line 809
    invoke-virtual {v0, v2}, Ll/afm;->n1(Ljava/lang/String;)V

    .line 810
    .line 811
    .line 812
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 813
    .line 814
    .line 815
    move-result-object v0

    .line 816
    move-object/from16 v3, p3

    .line 817
    .line 818
    invoke-virtual {v0, v3}, Ll/afm;->V0(Ljava/lang/String;)V

    .line 819
    .line 820
    .line 821
    sget v0, Ll/t0g0$a;->a:I

    .line 822
    .line 823
    const/4 v2, 0x0

    .line 824
    invoke-static {v0, v2}, Ll/t0g0;->e(ILjava/lang/String;)V

    .line 825
    .line 826
    .line 827
    iget-object v0, v1, Lcom/idv/identity/platform/SystemLoadingActivity;->d:Landroid/os/Handler;

    .line 828
    .line 829
    const/16 v1, 0x3ea

    .line 830
    .line 831
    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 832
    .line 833
    .line 834
    return-void

    .line 835
    :cond_1b
    :goto_c
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 836
    .line 837
    .line 838
    move-result-object v0

    .line 839
    sget-object v2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 840
    .line 841
    const-string v7, "errorMsg"

    .line 842
    .line 843
    const-string v8, "parseResult notValid"

    .line 844
    .line 845
    const-string v3, "action"

    .line 846
    .line 847
    const-string v4, "initSmartDeviceRes"

    .line 848
    .line 849
    const-string v5, "status"

    .line 850
    .line 851
    const-string v6, "fail"

    .line 852
    .line 853
    filled-new-array/range {v3 .. v8}, [Ljava/lang/String;

    .line 854
    .line 855
    .line 856
    move-result-object v3

    .line 857
    const-string v4, "START_INIT_REQUEST"

    .line 858
    .line 859
    invoke-virtual {v0, v2, v4, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 860
    .line 861
    .line 862
    sget-object v0, Ll/dfm;->b:Ljava/lang/String;

    .line 863
    .line 864
    invoke-direct {v1, v0}, Lcom/idv/identity/platform/SystemLoadingActivity;->W0(Ljava/lang/String;)V

    .line 865
    .line 866
    .line 867
    return-void
.end method

.method private Y0(Lcom/idv/identity/platform/model/NfcConfigRes;)Z
    .locals 9

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->v()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget-object v2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 14
    .line 15
    const-string v3, "docType"

    .line 16
    .line 17
    filled-new-array {v3, v0}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    const-string v5, "START_CKYC"

    .line 22
    .line 23
    invoke-virtual {v1, v2, v5, v4}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sget-object v1, Ll/cfm;->a:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const-string v4, "1"

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v6, "android.hardware.nfc"

    .line 43
    .line 44
    invoke-virtual {v1, v6}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    const-string v7, "FEATURE_NFC"

    .line 53
    .line 54
    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v8

    .line 58
    filled-new-array {v3, v0, v7, v8}, [Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v6, v2, v5, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    if-nez v1, :cond_0

    .line 66
    .line 67
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1}, Ll/afm;->j0()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    invoke-static {p1, p0}, Ll/lf20;->e(ZLandroid/content/Context;)Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    return p0

    .line 84
    :cond_0
    invoke-direct {p0, p1}, Lcom/idv/identity/platform/SystemLoadingActivity;->a1(Lcom/idv/identity/platform/model/NfcConfigRes;)Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    return p0

    .line 89
    :cond_1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Ll/afm;->j0()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    invoke-static {p1, p0}, Ll/lf20;->e(ZLandroid/content/Context;)Z

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    return p0
.end method

.method private a1(Lcom/idv/identity/platform/model/NfcConfigRes;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    goto :goto_0

    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/idv/identity/platform/model/NfcConfigRes;->getNfcMode()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz v1, :cond_3

    .line 10
    .line 11
    const-string v1, "0"

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/idv/identity/platform/model/NfcConfigRes;->getNfcMode()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-static {p0}, Ll/lf20;->c(Landroid/content/Context;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_1
    const-string v1, "1"

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/idv/identity/platform/model/NfcConfigRes;->getNfcMode()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    invoke-static {v0, p0}, Ll/lf20;->e(ZLandroid/content/Context;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_2
    const-string v1, "2"

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/idv/identity/platform/model/NfcConfigRes;->getNfcMode()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/idv/identity/platform/model/NfcConfigRes;->getDocumentNumber()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p1}, Lcom/idv/identity/platform/model/NfcConfigRes;->getDateOfBirth()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {p1}, Lcom/idv/identity/platform/model/NfcConfigRes;->getDateOfExpiry()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-static {p0, v0, v1, p1}, Ll/lf20;->d(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    return p0

    .line 74
    :cond_3
    :goto_0
    return v0
.end method

.method private init()V
    .locals 6

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->n()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/idv/identity/platform/utils/EnvCheck;->d()Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget-object v2, Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;->ENV_SUCCESS:Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 14
    .line 15
    const-string v3, "status"

    .line 16
    .line 17
    const-string v4, "enviromentCheck"

    .line 18
    .line 19
    if-eq v2, v1, :cond_1

    .line 20
    .line 21
    sget-object v0, Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;->ENV_ERROR_LOW_OS:Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 22
    .line 23
    if-ne v0, v1, :cond_0

    .line 24
    .line 25
    sget-object v0, Ll/dfm;->m:Ljava/lang/String;

    .line 26
    .line 27
    invoke-direct {p0, v0}, Lcom/idv/identity/platform/SystemLoadingActivity;->W0(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 35
    .line 36
    const-string v2, "code"

    .line 37
    .line 38
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v5, "error"

    .line 43
    .line 44
    filled-new-array {v3, v5, v2, v1}, [Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {p0, v0, v4, v1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    sget-object v1, Ll/hfm;->a:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v1, :cond_2

    .line 55
    .line 56
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-nez v1, :cond_2

    .line 61
    .line 62
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_2

    .line 67
    .line 68
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    sget-object v2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 73
    .line 74
    sget-object v3, Ll/hfm;->a:Ljava/lang/String;

    .line 75
    .line 76
    const-string v4, "certifyId"

    .line 77
    .line 78
    const-string v5, "protocol"

    .line 79
    .line 80
    filled-new-array {v5, v3, v4, v0}, [Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    const-string v4, "init"

    .line 85
    .line 86
    invoke-virtual {v1, v2, v4, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    new-instance v1, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    const-string v2, "protocol:"

    .line 92
    .line 93
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    sget-object v2, Ll/hfm;->a:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v2, " certifyId:"

    .line 102
    .line 103
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    const-string v2, "SystemLoadingActivity"

    .line 114
    .line 115
    invoke-static {v2, v1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    sget-object v1, Ll/hfm;->a:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-static {v1, v0}, Lcom/idv/identity/util/IdentityUtils;->sd([BLjava/lang/String;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    const-class v1, Lcom/idv/identity/platform/model/ZimInitContent;

    .line 129
    .line 130
    invoke-static {v0, v1}, Ll/ac00;->g(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    check-cast v0, Lcom/idv/identity/platform/model/ZimInitContent;

    .line 135
    .line 136
    invoke-static {v0}, Ll/qk20;->d(Lcom/idv/identity/platform/model/ZimInitContent;)Lcom/idv/identity/platform/config/OSSConfig;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    iget-object v2, v0, Lcom/idv/identity/platform/model/ZimInitContent;->NowDate:Ljava/lang/String;

    .line 141
    .line 142
    iget-object v0, v0, Lcom/idv/identity/platform/model/ZimInitContent;->ExtProtocol:Ljava/lang/String;

    .line 143
    .line 144
    const/4 v3, 0x1

    .line 145
    invoke-direct {p0, v1, v2, v0, v3}, Lcom/idv/identity/platform/SystemLoadingActivity;->X0(Lcom/idv/identity/platform/config/OSSConfig;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_2
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    sget-object v2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 154
    .line 155
    const-string v5, "success"

    .line 156
    .line 157
    filled-new-array {v3, v5}, [Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-virtual {v1, v2, v4, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    if-eqz v1, :cond_3

    .line 169
    .line 170
    const-string v2, "toyger_meta_info"

    .line 171
    .line 172
    invoke-virtual {v1, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 173
    .line 174
    .line 175
    move-result v3

    .line 176
    if-eqz v3, :cond_3

    .line 177
    .line 178
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    goto :goto_0

    .line 183
    :cond_3
    const-string v1, ""

    .line 184
    .line 185
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 186
    .line 187
    .line 188
    move-result-wide v2

    .line 189
    new-instance v4, Lcom/idv/identity/platform/SystemLoadingActivity$b;

    .line 190
    .line 191
    invoke-direct {v4, p0, v2, v3}, Lcom/idv/identity/platform/SystemLoadingActivity$b;-><init>(Lcom/idv/identity/platform/SystemLoadingActivity;J)V

    .line 192
    .line 193
    .line 194
    const/4 p0, 0x0

    .line 195
    invoke-static {v0, v1, p0, v4}, Ll/qk20;->f(Ljava/lang/String;Ljava/lang/String;ZLl/kpq0;)V

    .line 196
    .line 197
    .line 198
    return-void
.end method


# virtual methods
.method public T0()V
    .locals 6

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/platform/SystemLoadingActivity;->R0()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-lez v1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget-object v2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 16
    .line 17
    const-string v3, "permissionAlertAppear"

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/idv/identity/platform/SystemLoadingActivity;->S0()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    const-string v5, "PAGER_BEHAVIOR"

    .line 24
    .line 25
    invoke-virtual {v1, v2, v5, v3, v4}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    new-array v1, v1, [Ljava/lang/String;

    .line 30
    .line 31
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, [Ljava/lang/String;

    .line 36
    .line 37
    const/16 v1, 0x400

    .line 38
    .line 39
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-direct {p0}, Lcom/idv/identity/platform/SystemLoadingActivity;->init()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    sget p1, Ll/eec0;->f:I

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroidx/activity/ComponentActivity;->setContentView(I)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iput-wide v0, p0, Lcom/idv/identity/platform/SystemLoadingActivity;->c:J

    .line 14
    .line 15
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 20
    .line 21
    const-string v1, "LOADING_ENTER"

    .line 22
    .line 23
    const-string v2, "LOADING"

    .line 24
    .line 25
    invoke-virtual {p1, v0, v1, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEventPage(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    sget p1, Ll/scc0;->p:I

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Landroid/widget/TextView;

    .line 35
    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    const/16 v0, 0x8

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    :cond_0
    invoke-virtual {p0}, Lcom/idv/identity/platform/SystemLoadingActivity;->T0()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onDestroy()V
    .locals 5

    .line 1
    invoke-super {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onDestroy()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    iget-wide v3, p0, Lcom/idv/identity/platform/SystemLoadingActivity;->c:J

    .line 14
    .line 15
    sub-long/2addr v1, v3

    .line 16
    long-to-double v1, v1

    .line 17
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 18
    .line 19
    .line 20
    .line 21
    .line 22
    div-double/2addr v1, v3

    .line 23
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p0, "s"

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 44
    .line 45
    const-string v2, "destroySystemLoadingActivity"

    .line 46
    .line 47
    const-string v3, "timeCost"

    .line 48
    .line 49
    const-string v4, "action"

    .line 50
    .line 51
    filled-new-array {v4, v2, v3, p0}, [Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string v2, "START_INIT"

    .line 56
    .line 57
    invoke-virtual {v0, v1, v2, p0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Lcom/idv/identity/platform/log/RecordService;->flush()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 3
    .param p2    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/activity/ComponentActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    sget-object p3, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 9
    .line 10
    const-string v0, "permissionAlertClose"

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/idv/identity/platform/SystemLoadingActivity;->S0()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "PAGER_BEHAVIOR"

    .line 17
    .line 18
    invoke-virtual {p2, p3, v2, v0, v1}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Lcom/idv/identity/platform/SystemLoadingActivity;->R0()Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    const/16 v0, 0x400

    .line 26
    .line 27
    if-ne p1, v0, :cond_0

    .line 28
    .line 29
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-gtz p1, :cond_0

    .line 34
    .line 35
    invoke-direct {p0}, Lcom/idv/identity/platform/SystemLoadingActivity;->init()V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string p2, "permissionAgreeBtn"

    .line 43
    .line 44
    invoke-direct {p0}, Lcom/idv/identity/platform/SystemLoadingActivity;->S0()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, p3, v2, p2, p0}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-eqz p2, :cond_1

    .line 61
    .line 62
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    check-cast p2, Ljava/lang/String;

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    sget-object p2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 74
    .line 75
    const-string p3, "permissionRefuseBtn"

    .line 76
    .line 77
    invoke-direct {p0}, Lcom/idv/identity/platform/SystemLoadingActivity;->S0()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {p1, p2, v2, p3, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    sget-object p1, Ll/dfm;->k:Ljava/lang/String;

    .line 85
    .line 86
    invoke-direct {p0, p1}, Lcom/idv/identity/platform/SystemLoadingActivity;->W0(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method
