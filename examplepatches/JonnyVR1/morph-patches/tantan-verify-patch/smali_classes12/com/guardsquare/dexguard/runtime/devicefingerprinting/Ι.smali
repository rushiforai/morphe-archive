.class final Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;,
        Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ɩ;
    }
.end annotation


# static fields
.field private static ˊ:I = 0x0

.field private static ˋ:I = 0x0

.field private static final ˏ:[B

.field private static ॱ:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x83

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ˏ:[B

    const/16 v0, 0x82

    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ˊ:I

    return-void

    :array_0
    .array-data 1
        0x2at
        0x61t
        -0x37t
        0x58t
        -0xct
        0xbt
        -0xdt
        0x4t
        0x7t
        0x6t
        0x37t
        -0x34t
        -0xbt
        0x2t
        -0x5t
        0x10t
        -0x8t
        -0x5t
        0x47t
        -0x14t
        -0x2bt
        0x2t
        -0x5t
        0x10t
        -0x12t
        0x5t
        -0xbt
        0x3t
        0x40t
        -0x38t
        -0x7t
        0x1t
        0x9t
        -0x4t
        0x8t
        0x38t
        -0x32t
        -0xct
        0xbt
        -0xdt
        0x4t
        0x7t
        0x6t
        0x37t
        -0x38t
        -0x5t
        -0x5t
        -0xbt
        0x3t
        0x40t
        -0x38t
        -0x7t
        0x1t
        0x9t
        -0x4t
        0x8t
        0x38t
        -0x32t
        -0xct
        0xbt
        -0xdt
        0x4t
        0x7t
        0x6t
        0x37t
        -0x38t
        -0x5t
        -0x5t
        0x46t
        -0x32t
        -0x2t
        -0xet
        0x46t
        -0x3at
        0x6t
        0x0t
        -0x8t
        -0x5t
        0xct
        0x4t
        -0x2t
        0x5t
        -0xct
        0x45t
        -0x44t
        0xft
        -0xct
        -0x3t
        0xet
        0x7t
        -0x1t
        0x38t
        -0x24t
        0x0t
        0x14t
        -0x10t
        -0x1t
        -0xbt
        0x3t
        0x40t
        -0x32t
        -0xct
        0xbt
        -0xdt
        0x4t
        0x7t
        0x6t
        0x37t
        -0x47t
        0x12t
        -0x8t
        0xbt
        -0x4t
        -0x4t
        0x8t
        0x3t
        -0xet
        0x25t
        -0x10t
        -0x1t
        -0x7t
        0xbt
        -0x5t
        0x3t
        0x19t
        -0x13t
        -0xct
        0xet
        -0x5t
        0x3t
        -0xct
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static ˎ(Landroid/content/Context;)Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;,
            Ljava/lang/InterruptedException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ˋ:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x21

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ॱ:I

    .line 8
    .line 9
    :try_start_0
    sget-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ˏ:[B

    .line 10
    .line 11
    const/16 v1, 0x4b

    .line 12
    .line 13
    aget-byte v2, v0, v1

    .line 14
    .line 15
    int-to-byte v2, v2

    .line 16
    const/16 v3, 0x1c

    .line 17
    .line 18
    const/16 v4, 0x6f

    .line 19
    .line 20
    invoke-static {v3, v4, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ॱ(SSS)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    aget-byte v3, v0, v1

    .line 29
    .line 30
    int-to-byte v3, v3

    .line 31
    const/16 v4, 0x1b

    .line 32
    .line 33
    aget-byte v4, v0, v4

    .line 34
    .line 35
    int-to-byte v4, v4

    .line 36
    const/16 v5, 0x22

    .line 37
    .line 38
    invoke-static {v5, v3, v4}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ॱ(SSS)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const/4 v4, 0x0

    .line 43
    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v2, p0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Landroid/content/pm/PackageManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 52
    .line 53
    sget v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ˊ:I

    .line 54
    .line 55
    ushr-int/lit8 v3, v3, 0x2

    .line 56
    .line 57
    int-to-byte v3, v3

    .line 58
    const/16 v5, 0x6d

    .line 59
    .line 60
    aget-byte v5, v0, v5

    .line 61
    .line 62
    int-to-byte v5, v5

    .line 63
    const/16 v6, 0x1f

    .line 64
    .line 65
    aget-byte v7, v0, v6

    .line 66
    .line 67
    int-to-byte v7, v7

    .line 68
    invoke-static {v3, v5, v7}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ॱ(SSS)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    const/4 v5, 0x0

    .line 73
    invoke-virtual {v2, v3, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 74
    .line 75
    .line 76
    new-instance v2, Landroid/content/Intent;

    .line 77
    .line 78
    aget-byte v3, v0, v1

    .line 79
    .line 80
    int-to-byte v3, v3

    .line 81
    const/16 v7, 0x54

    .line 82
    .line 83
    aget-byte v7, v0, v7

    .line 84
    .line 85
    neg-int v7, v7

    .line 86
    int-to-byte v7, v7

    .line 87
    aget-byte v8, v0, v6

    .line 88
    .line 89
    int-to-byte v8, v8

    .line 90
    invoke-static {v3, v7, v8}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ॱ(SSS)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    const/4 v3, 0x3

    .line 98
    aget-byte v3, v0, v3

    .line 99
    .line 100
    xor-int/lit8 v7, v3, 0x1

    .line 101
    .line 102
    const/4 v8, 0x1

    .line 103
    and-int/2addr v3, v8

    .line 104
    shl-int/2addr v3, v8

    .line 105
    add-int/2addr v7, v3

    .line 106
    int-to-byte v3, v7

    .line 107
    aget-byte v0, v0, v6

    .line 108
    .line 109
    int-to-byte v0, v0

    .line 110
    const/16 v6, 0x1d

    .line 111
    .line 112
    invoke-static {v6, v3, v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ॱ(SSS)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 117
    .line 118
    .line 119
    new-instance v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ɩ;

    .line 120
    .line 121
    invoke-direct {v0, v5}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ɩ;-><init>(B)V

    .line 122
    .line 123
    .line 124
    :try_start_1
    invoke-virtual {p0, v2, v0, v8}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-eqz v2, :cond_0

    .line 129
    .line 130
    new-instance v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;

    .line 131
    .line 132
    invoke-virtual {v0}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ɩ;->ˋ()Landroid/os/IBinder;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-direct {v1, v2}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;-><init>(Landroid/os/IBinder;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v1}, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ˏ()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 143
    invoke-virtual {p0, v0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 144
    .line 145
    .line 146
    sget p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ॱ:I

    .line 147
    .line 148
    add-int/lit8 p0, p0, 0x5d

    .line 149
    .line 150
    rem-int/lit16 p0, p0, 0x80

    .line 151
    .line 152
    sput p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ˋ:I

    .line 153
    .line 154
    return-object v1

    .line 155
    :catchall_0
    move-exception v1

    .line 156
    goto :goto_0

    .line 157
    :cond_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 158
    .line 159
    .line 160
    sget p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ˋ:I

    .line 161
    .line 162
    add-int/lit8 p0, p0, 0xb

    .line 163
    .line 164
    rem-int/lit16 p0, p0, 0x80

    .line 165
    .line 166
    sput p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ॱ:I

    .line 167
    .line 168
    add-int/lit8 p0, p0, 0x63

    .line 169
    .line 170
    rem-int/lit16 v0, p0, 0x80

    .line 171
    .line 172
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ˋ:I

    .line 173
    .line 174
    rem-int/lit8 p0, p0, 0x2

    .line 175
    .line 176
    if-eqz p0, :cond_1

    .line 177
    .line 178
    div-int/2addr v1, v5

    .line 179
    :cond_1
    return-object v4

    .line 180
    :goto_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 181
    .line 182
    .line 183
    throw v1

    .line 184
    :catchall_1
    move-exception p0

    .line 185
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    if-eqz v0, :cond_2

    .line 190
    .line 191
    throw v0

    .line 192
    :cond_2
    throw p0
.end method

.method private static ॱ(SSS)Ljava/lang/String;
    .locals 6

    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ˋ:I

    add-int/lit8 v1, v0, 0x77

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ॱ:I

    rem-int/lit8 v1, v1, 0x2

    const/4 v2, 0x0

    if-nez v1, :cond_1

    const/16 v1, 0x14

    rem-int/2addr v1, p0

    const/16 p0, 0x28

    shl-int/2addr p0, p1

    sget-object p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ˏ:[B

    const/4 v3, 0x3

    rem-int/2addr v3, p2

    add-int/lit8 v3, v3, 0x6a

    new-array p2, v1, [B

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    move v0, v2

    goto :goto_1

    :cond_1
    rsub-int/lit8 v1, p0, 0x33

    rsub-int/lit8 p0, p1, 0x72

    sget-object p1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ˏ:[B

    mul-int/lit8 p2, p2, 0x2

    add-int/lit8 v3, p2, 0x61

    new-array p2, v1, [B

    if-nez p1, :cond_0

    :goto_0
    add-int/lit8 v0, v0, 0x1b

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;->ॱ:I

    move-object v0, p2

    move v3, v1

    move v4, v3

    move v1, v2

    move-object p2, p1

    move p1, p0

    goto :goto_2

    :goto_1
    int-to-byte v4, v3

    aput-byte v4, p2, v0

    add-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_2

    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, p2, v2}, Ljava/lang/String;-><init>([BI)V

    invoke-virtual {p0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    add-int/lit8 p0, p0, 0x1

    aget-byte v4, p1, p0

    move-object v5, p1

    move p1, p0

    move p0, v4

    move v4, v1

    move v1, v0

    move-object v0, p2

    move-object p2, v5

    :goto_2
    sub-int/2addr v3, p0

    add-int/lit8 v3, v3, 0x1

    move p0, p1

    move-object p1, p2

    move-object p2, v0

    move v0, v1

    move v1, v4

    goto :goto_1
.end method
