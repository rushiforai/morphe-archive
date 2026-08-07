.class public final Lcom/appsflyer/internal/AFf1bSDK;
.super Lcom/appsflyer/internal/AFf1gSDK;
.source "SourceFile"


# static fields
.field private static $10:I = 0x0

.field private static $11:I = 0x1

.field private static AFInAppEventParameterName:C = '\u71dd'

.field private static AFInAppEventType:I = -0x68d0268f

.field private static AFKeystoreWrapper:I = 0x0

.field private static d:I = 0x1

.field private static valueOf:J = 0x9aa7521972fd971L


# instance fields
.field private final copydefault:Lcom/appsflyer/internal/AFd1pSDK;

.field private final equals:Lcom/appsflyer/internal/AFd1kSDK;

.field private final hashCode:Ljava/lang/String;

.field private final values:Lcom/appsflyer/internal/AFg1fSDK;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/appsflyer/internal/AFd1fSDK;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/appsflyer/internal/AFd1fSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Lcom/appsflyer/internal/AFg1iSDK;

    .line 2
    .line 3
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->valueOf()Lcom/appsflyer/internal/AFd1kSDK;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v1, v1, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Lcom/appsflyer/internal/AFg1iSDK;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, v0, p2, p1}, Lcom/appsflyer/internal/AFf1gSDK;-><init>(Lcom/appsflyer/internal/AFa1mSDK;Lcom/appsflyer/internal/AFd1fSDK;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->getMediationNetwork()Lcom/appsflyer/internal/AFd1pSDK;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/appsflyer/internal/AFf1bSDK;->copydefault:Lcom/appsflyer/internal/AFd1pSDK;

    .line 20
    .line 21
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->valueOf()Lcom/appsflyer/internal/AFd1kSDK;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/appsflyer/internal/AFf1bSDK;->equals:Lcom/appsflyer/internal/AFd1kSDK;

    .line 26
    .line 27
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1bSDK;->hashCode:Ljava/lang/String;

    .line 28
    .line 29
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->component3()Lcom/appsflyer/internal/AFg1fSDK;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1bSDK;->values:Lcom/appsflyer/internal/AFg1fSDK;

    .line 34
    .line 35
    return-void
.end method

.method public static synthetic AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;
    .locals 0

    .line 16
    invoke-static {p0}, Lcom/appsflyer/internal/AFf1bSDK;->getCurrencyIso4217Code([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static a(CLjava/lang/String;ILjava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 16

    .line 1
    sget v0, Lcom/appsflyer/internal/AFf1bSDK;->$10:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x53

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFf1bSDK;->$11:I

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    rem-int/2addr v0, v1

    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v0, :cond_5

    .line 13
    .line 14
    if-eqz p4, :cond_0

    .line 15
    .line 16
    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->toCharArray()[C

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move-object/from16 v0, p4

    .line 22
    .line 23
    :goto_0
    check-cast v0, [C

    .line 24
    .line 25
    if-eqz p3, :cond_1

    .line 26
    .line 27
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->toCharArray()[C

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    sget v4, Lcom/appsflyer/internal/AFf1bSDK;->$11:I

    .line 32
    .line 33
    add-int/lit8 v4, v4, 0x9

    .line 34
    .line 35
    rem-int/lit16 v4, v4, 0x80

    .line 36
    .line 37
    sput v4, Lcom/appsflyer/internal/AFf1bSDK;->$10:I

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    move-object/from16 v3, p3

    .line 41
    .line 42
    :goto_1
    check-cast v3, [C

    .line 43
    .line 44
    if-eqz p1, :cond_3

    .line 45
    .line 46
    sget v4, Lcom/appsflyer/internal/AFf1bSDK;->$10:I

    .line 47
    .line 48
    add-int/lit8 v4, v4, 0x31

    .line 49
    .line 50
    rem-int/lit16 v5, v4, 0x80

    .line 51
    .line 52
    sput v5, Lcom/appsflyer/internal/AFf1bSDK;->$11:I

    .line 53
    .line 54
    rem-int/2addr v4, v1

    .line 55
    if-eqz v4, :cond_2

    .line 56
    .line 57
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->toCharArray()[C

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    goto :goto_2

    .line 62
    :cond_2
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->toCharArray()[C

    .line 63
    .line 64
    .line 65
    throw v2

    .line 66
    :cond_3
    move-object/from16 v2, p1

    .line 67
    .line 68
    :goto_2
    check-cast v2, [C

    .line 69
    .line 70
    new-instance v4, Lcom/appsflyer/internal/AFj1eSDK;

    .line 71
    .line 72
    invoke-direct {v4}, Lcom/appsflyer/internal/AFj1eSDK;-><init>()V

    .line 73
    .line 74
    .line 75
    array-length v5, v0

    .line 76
    new-array v6, v5, [C

    .line 77
    .line 78
    array-length v7, v3

    .line 79
    new-array v8, v7, [C

    .line 80
    .line 81
    const/4 v9, 0x0

    .line 82
    invoke-static {v0, v9, v6, v9, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 83
    .line 84
    .line 85
    invoke-static {v3, v9, v8, v9, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 86
    .line 87
    .line 88
    aget-char v0, v6, v9

    .line 89
    .line 90
    xor-int v0, v0, p0

    .line 91
    .line 92
    int-to-char v0, v0

    .line 93
    aput-char v0, v6, v9

    .line 94
    .line 95
    aget-char v0, v8, v1

    .line 96
    .line 97
    move/from16 v3, p2

    .line 98
    .line 99
    int-to-char v3, v3

    .line 100
    add-int/2addr v0, v3

    .line 101
    int-to-char v0, v0

    .line 102
    aput-char v0, v8, v1

    .line 103
    .line 104
    array-length v0, v2

    .line 105
    new-array v1, v0, [C

    .line 106
    .line 107
    iput v9, v4, Lcom/appsflyer/internal/AFj1eSDK;->getMediationNetwork:I

    .line 108
    .line 109
    :goto_3
    iget v3, v4, Lcom/appsflyer/internal/AFj1eSDK;->getMediationNetwork:I

    .line 110
    .line 111
    if-ge v3, v0, :cond_4

    .line 112
    .line 113
    sget v5, Lcom/appsflyer/internal/AFf1bSDK;->$11:I

    .line 114
    .line 115
    add-int/lit8 v5, v5, 0x3d

    .line 116
    .line 117
    rem-int/lit16 v5, v5, 0x80

    .line 118
    .line 119
    sput v5, Lcom/appsflyer/internal/AFf1bSDK;->$10:I

    .line 120
    .line 121
    add-int/lit8 v5, v3, 0x2

    .line 122
    .line 123
    rem-int/lit8 v5, v5, 0x4

    .line 124
    .line 125
    add-int/lit8 v7, v3, 0x3

    .line 126
    .line 127
    rem-int/lit8 v7, v7, 0x4

    .line 128
    .line 129
    rem-int/lit8 v10, v3, 0x4

    .line 130
    .line 131
    aget-char v10, v6, v10

    .line 132
    .line 133
    mul-int/lit16 v10, v10, 0x7fce

    .line 134
    .line 135
    aget-char v5, v8, v5

    .line 136
    .line 137
    add-int/2addr v10, v5

    .line 138
    const v11, 0xffff

    .line 139
    .line 140
    .line 141
    rem-int/2addr v10, v11

    .line 142
    int-to-char v10, v10

    .line 143
    iput-char v10, v4, Lcom/appsflyer/internal/AFj1eSDK;->getMonetizationNetwork:C

    .line 144
    .line 145
    aget-char v12, v6, v7

    .line 146
    .line 147
    mul-int/lit16 v12, v12, 0x7fce

    .line 148
    .line 149
    add-int/2addr v12, v5

    .line 150
    div-int/2addr v12, v11

    .line 151
    int-to-char v5, v12

    .line 152
    aput-char v5, v8, v7

    .line 153
    .line 154
    aput-char v10, v6, v7

    .line 155
    .line 156
    aget-char v5, v2, v3

    .line 157
    .line 158
    xor-int/2addr v5, v10

    .line 159
    int-to-long v10, v5

    .line 160
    sget-wide v12, Lcom/appsflyer/internal/AFf1bSDK;->valueOf:J

    .line 161
    .line 162
    const-wide v14, 0x9aa7521972fd971L

    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    xor-long/2addr v12, v14

    .line 168
    xor-long/2addr v10, v12

    .line 169
    sget v5, Lcom/appsflyer/internal/AFf1bSDK;->AFInAppEventType:I

    .line 170
    .line 171
    int-to-long v12, v5

    .line 172
    xor-long/2addr v12, v14

    .line 173
    long-to-int v5, v12

    .line 174
    int-to-long v12, v5

    .line 175
    xor-long/2addr v10, v12

    .line 176
    sget-char v5, Lcom/appsflyer/internal/AFf1bSDK;->AFInAppEventParameterName:C

    .line 177
    .line 178
    int-to-long v12, v5

    .line 179
    xor-long/2addr v12, v14

    .line 180
    long-to-int v5, v12

    .line 181
    int-to-char v5, v5

    .line 182
    int-to-long v12, v5

    .line 183
    xor-long/2addr v10, v12

    .line 184
    long-to-int v5, v10

    .line 185
    int-to-char v5, v5

    .line 186
    aput-char v5, v1, v3

    .line 187
    .line 188
    add-int/lit8 v3, v3, 0x1

    .line 189
    .line 190
    iput v3, v4, Lcom/appsflyer/internal/AFj1eSDK;->getMediationNetwork:I

    .line 191
    .line 192
    goto :goto_3

    .line 193
    :cond_4
    new-instance v0, Ljava/lang/String;

    .line 194
    .line 195
    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    .line 196
    .line 197
    .line 198
    aput-object v0, p5, v9

    .line 199
    .line 200
    return-void

    .line 201
    :cond_5
    throw v2
.end method

.method private copydefault()V
    .locals 2

    .line 1
    sget v0, Lcom/appsflyer/internal/AFf1bSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x4f

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFf1bSDK;->d:I

    .line 8
    .line 9
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1gSDK;->toString:Lcom/appsflyer/internal/AFd1rSDK;

    .line 10
    .line 11
    const-string v0, "sentRegisterRequestToAF"

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-interface {p0, v0, v1}, Lcom/appsflyer/internal/AFd1rSDK;->AFAdRevenueData(Ljava/lang/String;Z)V

    .line 15
    .line 16
    .line 17
    const-string p0, "[register] Successfully registered for Uninstall Tracking"

    .line 18
    .line 19
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sget p0, Lcom/appsflyer/internal/AFf1bSDK;->AFKeystoreWrapper:I

    .line 23
    .line 24
    add-int/lit8 p0, p0, 0x49

    .line 25
    .line 26
    rem-int/lit16 p0, p0, 0x80

    .line 27
    .line 28
    sput p0, Lcom/appsflyer/internal/AFf1bSDK;->d:I

    .line 29
    .line 30
    return-void
.end method

.method private static synthetic getCurrencyIso4217Code([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    const/4 v0, 0x0

    aget-object v0, p0, v0

    check-cast v0, Lcom/appsflyer/internal/AFf1bSDK;

    const/4 v0, 0x1

    aget-object p0, p0, v0

    check-cast p0, Lcom/appsflyer/internal/AFa1mSDK;

    .line 62
    sget p0, Lcom/appsflyer/internal/AFf1bSDK;->AFKeystoreWrapper:I

    add-int/lit8 p0, p0, 0x43

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/AFf1bSDK;->d:I

    rem-int/lit8 p0, p0, 0x2

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    return-object v0

    :cond_0
    throw v0
.end method


# virtual methods
.method public final AFAdRevenueData(Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 0

    .line 1
    sget p0, Lcom/appsflyer/internal/AFf1bSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 p0, p0, 0x69

    .line 4
    .line 5
    rem-int/lit16 p1, p0, 0x80

    .line 6
    .line 7
    sput p1, Lcom/appsflyer/internal/AFf1bSDK;->d:I

    .line 8
    .line 9
    rem-int/lit8 p0, p0, 0x2

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    throw p0
.end method

.method public final equals()Z
    .locals 2

    .line 1
    sget p0, Lcom/appsflyer/internal/AFf1bSDK;->AFKeystoreWrapper:I

    .line 2
    .line 3
    add-int/lit8 v0, p0, 0x45

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFf1bSDK;->d:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    add-int/lit8 p0, p0, 0x31

    .line 17
    .line 18
    rem-int/lit16 p0, p0, 0x80

    .line 19
    .line 20
    sput p0, Lcom/appsflyer/internal/AFf1bSDK;->d:I

    .line 21
    .line 22
    return v0
.end method

.method public final getCurrencyIso4217Code()V
    .locals 3

    .line 1
    sget v0, Lcom/appsflyer/internal/AFf1bSDK;->d:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x33

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFf1bSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    invoke-super {p0}, Lcom/appsflyer/internal/AFf1oSDK;->getCurrencyIso4217Code()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1oSDK;->component1:Lcom/appsflyer/internal/AFe1kSDK;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    sget v1, Lcom/appsflyer/internal/AFf1bSDK;->d:I

    .line 17
    .line 18
    add-int/lit8 v1, v1, 0x57

    .line 19
    .line 20
    rem-int/lit16 v2, v1, 0x80

    .line 21
    .line 22
    sput v2, Lcom/appsflyer/internal/AFf1bSDK;->AFKeystoreWrapper:I

    .line 23
    .line 24
    rem-int/lit8 v1, v1, 0x2

    .line 25
    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFe1kSDK;->isSuccessful()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v1, 0x5

    .line 33
    div-int/lit8 v1, v1, 0x0

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFe1kSDK;->isSuccessful()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    :goto_0
    invoke-direct {p0}, Lcom/appsflyer/internal/AFf1bSDK;->copydefault()V

    .line 45
    .line 46
    .line 47
    :cond_1
    sget p0, Lcom/appsflyer/internal/AFf1bSDK;->AFKeystoreWrapper:I

    .line 48
    .line 49
    add-int/lit8 p0, p0, 0x7d

    .line 50
    .line 51
    rem-int/lit16 p0, p0, 0x80

    .line 52
    .line 53
    sput p0, Lcom/appsflyer/internal/AFf1bSDK;->d:I

    .line 54
    .line 55
    return-void
.end method

.method public final getCurrencyIso4217Code(Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 2

    .line 56
    sget v0, Lcom/appsflyer/internal/AFf1bSDK;->AFKeystoreWrapper:I

    add-int/lit8 v0, v0, 0x3b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFf1bSDK;->d:I

    rem-int/lit8 v0, v0, 0x2

    .line 57
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1bSDK;->copydefault:Lcom/appsflyer/internal/AFd1pSDK;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/appsflyer/internal/AFd1pSDK;->getMonetizationNetwork()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 58
    const-string v0, "advertiserId"

    invoke-virtual {p1, v0, p0}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 59
    sget p0, Lcom/appsflyer/internal/AFf1bSDK;->d:I

    add-int/lit8 p0, p0, 0x2b

    rem-int/lit16 p0, p0, 0x80

    sput p0, Lcom/appsflyer/internal/AFf1bSDK;->AFKeystoreWrapper:I

    :cond_0
    return-void

    .line 60
    :cond_1
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFd1pSDK;->getMonetizationNetwork()Ljava/lang/String;

    const/4 p0, 0x0

    .line 61
    throw p0
.end method

.method public final getMediationNetwork(Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 2

    .line 1
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const v0, -0x2315d482

    .line 10
    .line 11
    .line 12
    const v1, 0x2315d482

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0, v1, p0}, Lcom/appsflyer/internal/AFf1bSDK;->AFAdRevenueData([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final getMonetizationNetwork(Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 0

    .line 1
    sget p0, Lcom/appsflyer/internal/AFf1bSDK;->d:I

    .line 2
    .line 3
    add-int/lit8 p0, p0, 0x5

    .line 4
    .line 5
    rem-int/lit16 p0, p0, 0x80

    .line 6
    .line 7
    sput p0, Lcom/appsflyer/internal/AFf1bSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    return-void
.end method

.method public final getRevenue(Lcom/appsflyer/internal/AFa1mSDK;)V
    .locals 11

    .line 1
    sget v0, Lcom/appsflyer/internal/AFf1bSDK;->d:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x57

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/appsflyer/internal/AFf1bSDK;->AFKeystoreWrapper:I

    .line 8
    .line 9
    invoke-super {p0, p1}, Lcom/appsflyer/internal/AFf1gSDK;->getRevenue(Lcom/appsflyer/internal/AFa1mSDK;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1bSDK;->equals:Lcom/appsflyer/internal/AFd1kSDK;

    .line 13
    .line 14
    iget-object v1, v0, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 15
    .line 16
    invoke-static {}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFb1tSDK;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v1, :cond_6

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v2, 0x1

    .line 27
    if-nez v0, :cond_5

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    const/4 v4, 0x0

    .line 38
    :try_start_0
    invoke-virtual {v0, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const-string v5, "app_version_code"

    .line 43
    .line 44
    iget v6, v3, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 45
    .line 46
    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    invoke-virtual {p1, v5, v6}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 51
    .line 52
    .line 53
    const-string v5, "app_version_name"

    .line 54
    .line 55
    iget-object v6, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p1, v5, v6}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 58
    .line 59
    .line 60
    iget-object v5, v3, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 61
    .line 62
    invoke-virtual {v0, v5}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v5, "app_name"

    .line 71
    .line 72
    invoke-virtual {p1, v5, v0}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 73
    .line 74
    .line 75
    iget-wide v5, v3, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    .line 76
    .line 77
    const-string v0, "yyyy-MM-dd_HHmmssZ"

    .line 78
    .line 79
    new-instance v3, Ljava/text/SimpleDateFormat;

    .line 80
    .line 81
    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 82
    .line 83
    invoke-direct {v3, v0, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 84
    .line 85
    .line 86
    const-string v0, "installDate"

    .line 87
    .line 88
    invoke-static {v3, v5, v6}, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork(Ljava/text/SimpleDateFormat;J)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-virtual {p1, v0, v3}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    .line 94
    .line 95
    sget v0, Lcom/appsflyer/internal/AFf1bSDK;->AFKeystoreWrapper:I

    .line 96
    .line 97
    add-int/lit8 v0, v0, 0x1b

    .line 98
    .line 99
    rem-int/lit16 v0, v0, 0x80

    .line 100
    .line 101
    sput v0, Lcom/appsflyer/internal/AFf1bSDK;->d:I

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :catchall_0
    move-exception v0

    .line 105
    const-string v3, "Exception while collecting application version info."

    .line 106
    .line 107
    invoke-static {v3, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 108
    .line 109
    .line 110
    :goto_0
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1bSDK;->values:Lcom/appsflyer/internal/AFg1fSDK;

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-interface {v0, v3}, Lcom/appsflyer/internal/AFg1fSDK;->AFAdRevenueData(Ljava/util/Map;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue()Ljava/util/Map;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    const-string v3, "ivc"

    .line 124
    .line 125
    invoke-interface {v0, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    invoke-static {}, Lcom/appsflyer/internal/AFb1tSDK;->getMediationNetwork()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    if-eqz v0, :cond_1

    .line 133
    .line 134
    sget v3, Lcom/appsflyer/internal/AFf1bSDK;->d:I

    .line 135
    .line 136
    add-int/lit8 v3, v3, 0x33

    .line 137
    .line 138
    rem-int/lit16 v5, v3, 0x80

    .line 139
    .line 140
    sput v5, Lcom/appsflyer/internal/AFf1bSDK;->AFKeystoreWrapper:I

    .line 141
    .line 142
    rem-int/lit8 v3, v3, 0x2

    .line 143
    .line 144
    const-string v5, "appUserId"

    .line 145
    .line 146
    if-nez v3, :cond_0

    .line 147
    .line 148
    invoke-virtual {p1, v5, v0}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 149
    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_0
    invoke-virtual {p1, v5, v0}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 153
    .line 154
    .line 155
    const/4 p0, 0x0

    .line 156
    throw p0

    .line 157
    :cond_1
    :goto_1
    :try_start_1
    const-string v0, "model"

    .line 158
    .line 159
    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {p1, v0, v3}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 162
    .line 163
    .line 164
    invoke-static {}, Landroid/view/KeyEvent;->getMaxKeyCode()I

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    shr-int/lit8 v0, v0, 0x10

    .line 169
    .line 170
    const v3, 0xbecf

    .line 171
    .line 172
    .line 173
    add-int/2addr v0, v3

    .line 174
    int-to-char v5, v0

    .line 175
    const-string v6, "\u4ba9\ub280\uebe7\u2475\ue6f2"

    .line 176
    .line 177
    invoke-static {v4, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    const v3, 0x2a0aa01a

    .line 182
    .line 183
    .line 184
    sub-int v7, v3, v0

    .line 185
    .line 186
    const-string v8, "\u0000\u0000\u0000\u0000"

    .line 187
    .line 188
    const-string v9, "\u1aed\u0aa0\ucf2a\u50be"

    .line 189
    .line 190
    new-array v10, v2, [Ljava/lang/Object;

    .line 191
    .line 192
    invoke-static/range {v5 .. v10}, Lcom/appsflyer/internal/AFf1bSDK;->a(CLjava/lang/String;ILjava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 193
    .line 194
    .line 195
    aget-object v0, v10, v4

    .line 196
    .line 197
    check-cast v0, Ljava/lang/String;

    .line 198
    .line 199
    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    sget-object v2, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 204
    .line 205
    invoke-virtual {p1, v0, v2}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 206
    .line 207
    .line 208
    goto :goto_2

    .line 209
    :catchall_1
    move-exception v0

    .line 210
    const-string v2, "Exception while collecting device brand and model."

    .line 211
    .line 212
    invoke-static {v2, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 213
    .line 214
    .line 215
    :goto_2
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    const-string v2, "deviceTrackingDisabled"

    .line 220
    .line 221
    invoke-virtual {v0, v2, v4}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-eqz v0, :cond_2

    .line 226
    .line 227
    const-string v0, "true"

    .line 228
    .line 229
    invoke-virtual {p1, v2, v0}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 230
    .line 231
    .line 232
    :cond_2
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    invoke-static {v0}, Lcom/appsflyer/internal/AFb1rSDK;->b_(Landroid/content/ContentResolver;)Lcom/appsflyer/internal/AFb1ySDK;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    if-eqz v0, :cond_3

    .line 241
    .line 242
    const-string v1, "amazon_aid"

    .line 243
    .line 244
    iget-object v2, v0, Lcom/appsflyer/internal/AFb1ySDK;->AFAdRevenueData:Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {p1, v1, v2}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 247
    .line 248
    .line 249
    iget-object v0, v0, Lcom/appsflyer/internal/AFb1ySDK;->getMediationNetwork:Ljava/lang/Boolean;

    .line 250
    .line 251
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    const-string v1, "amazon_aid_limit"

    .line 256
    .line 257
    invoke-virtual {p1, v1, v0}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 258
    .line 259
    .line 260
    :cond_3
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1oSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFg1rSDK;

    .line 261
    .line 262
    iget-object v0, v0, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    .line 263
    .line 264
    const-string v1, "devkey"

    .line 265
    .line 266
    invoke-virtual {p1, v1, v0}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 267
    .line 268
    .line 269
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1bSDK;->equals:Lcom/appsflyer/internal/AFd1kSDK;

    .line 270
    .line 271
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1gSDK;->toString:Lcom/appsflyer/internal/AFd1rSDK;

    .line 272
    .line 273
    invoke-static {v0, v1}, Lcom/appsflyer/internal/AFb1lSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFd1kSDK;Lcom/appsflyer/internal/AFd1rSDK;)Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    const-string v1, "uid"

    .line 278
    .line 279
    invoke-virtual {p1, v1, v0}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 280
    .line 281
    .line 282
    const-string v0, "af_gcm_token"

    .line 283
    .line 284
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1bSDK;->hashCode:Ljava/lang/String;

    .line 285
    .line 286
    invoke-virtual {p1, v0, v1}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 287
    .line 288
    .line 289
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1gSDK;->toString:Lcom/appsflyer/internal/AFd1rSDK;

    .line 290
    .line 291
    const-string v1, "appsFlyerCount"

    .line 292
    .line 293
    invoke-interface {v0, v1, v4}, Lcom/appsflyer/internal/AFd1rSDK;->getMonetizationNetwork(Ljava/lang/String;I)I

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    const-string v1, "launch_counter"

    .line 298
    .line 299
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-virtual {p1, v1, v0}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 304
    .line 305
    .line 306
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 307
    .line 308
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    const-string v1, "sdk"

    .line 313
    .line 314
    invoke-virtual {p1, v1, v0}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 315
    .line 316
    .line 317
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1bSDK;->copydefault:Lcom/appsflyer/internal/AFd1pSDK;

    .line 318
    .line 319
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFd1pSDK;->component4()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object p0

    .line 323
    if-eqz p0, :cond_4

    .line 324
    .line 325
    const-string v0, "channel"

    .line 326
    .line 327
    invoke-virtual {p1, v0, p0}, Lcom/appsflyer/internal/AFa1mSDK;->getMonetizationNetwork(Ljava/lang/String;Ljava/lang/Object;)Lcom/appsflyer/internal/AFa1mSDK;

    .line 328
    .line 329
    .line 330
    sget p0, Lcom/appsflyer/internal/AFf1bSDK;->d:I

    .line 331
    .line 332
    add-int/lit8 p0, p0, 0x57

    .line 333
    .line 334
    rem-int/lit16 p0, p0, 0x80

    .line 335
    .line 336
    sput p0, Lcom/appsflyer/internal/AFf1bSDK;->AFKeystoreWrapper:I

    .line 337
    .line 338
    :cond_4
    return-void

    .line 339
    :cond_5
    const-string p0, "CustomerUserId not set, Tracking is disabled"

    .line 340
    .line 341
    invoke-static {p0, v2}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;Z)V

    .line 342
    .line 343
    .line 344
    const-string p0, "CustomerUserId not set, register is not sent"

    .line 345
    .line 346
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 347
    .line 348
    .line 349
    return-void

    .line 350
    :cond_6
    const-string p0, "Context is not provided, can\'t send register request"

    .line 351
    .line 352
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 353
    .line 354
    .line 355
    return-void
.end method
