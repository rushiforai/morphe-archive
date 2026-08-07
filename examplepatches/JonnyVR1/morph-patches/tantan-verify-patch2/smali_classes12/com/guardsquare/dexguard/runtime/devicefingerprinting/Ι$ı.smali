.class final Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "\u0131"
.end annotation


# static fields
.field private static ˋ:I = 0x0

.field private static final ˎ:[B

.field private static ॱ:I = 0x1


# instance fields
.field private ˏ:Landroid/os/IBinder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x47

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ˎ:[B

    return-void

    :array_0
    .array-data 1
        0x1et
        0x35t
        -0x52t
        0x34t
        -0x11t
        -0x3t
        0x3at
        -0x3et
        -0xdt
        -0x5t
        0x3t
        -0xat
        0x2t
        0x32t
        -0x38t
        -0x12t
        0x5t
        -0x13t
        -0x2t
        0x1t
        0x0t
        0x31t
        -0x3et
        -0xbt
        -0xbt
        0x40t
        -0x38t
        -0x8t
        -0x14t
        0x40t
        -0x40t
        0x0t
        -0x6t
        -0xet
        -0xbt
        0x6t
        -0x2t
        -0x8t
        -0x1t
        -0x12t
        0x3ft
        -0x40t
        -0xat
        -0xbt
        0xat
        -0x12t
        -0x1t
        0x8t
        -0x10t
        0x39t
        -0x20t
        0x3t
        -0x28t
        -0x17t
        0xct
        -0x12t
        -0x7t
        0x6t
        -0xft
        0x5t
        -0xat
        0x2t
        0x19t
        -0x20t
        0xct
        -0x17t
        -0x12t
        -0x9t
        0x8t
        0x1t
        -0x7t
    .end array-data
.end method

.method public constructor <init>(Landroid/os/IBinder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ˏ:Landroid/os/IBinder;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final asBinder()Landroid/os/IBinder;
    .locals 2

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ˋ:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x6f

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ॱ:I

    .line 8
    .line 9
    iget-object p0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ˏ:Landroid/os/IBinder;

    .line 10
    .line 11
    and-int/lit8 v1, v0, 0x29

    .line 12
    .line 13
    or-int/lit8 v0, v0, 0x29

    .line 14
    .line 15
    add-int/2addr v1, v0

    .line 16
    rem-int/lit16 v1, v1, 0x80

    .line 17
    .line 18
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ˋ:I

    .line 19
    .line 20
    return-object p0
.end method

.method public final ˏ()Ljava/lang/String;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ॱ:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x33

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ˋ:I

    .line 8
    .line 9
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    :try_start_0
    sget-object v2, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ˎ:[B

    .line 18
    .line 19
    const/16 v3, 0x14

    .line 20
    .line 21
    aget-byte v3, v2, v3

    .line 22
    .line 23
    int-to-byte v3, v3

    .line 24
    int-to-byte v4, v3

    .line 25
    int-to-byte v5, v4

    .line 26
    mul-int/lit8 v4, v4, 0x3

    .line 27
    .line 28
    rsub-int/lit8 v4, v4, 0x63

    .line 29
    .line 30
    mul-int/lit8 v5, v5, 0x3

    .line 31
    .line 32
    or-int/lit8 v6, v5, -0x21

    .line 33
    .line 34
    const/4 v7, 0x1

    .line 35
    shl-int/2addr v6, v7

    .line 36
    xor-int/lit8 v5, v5, -0x21

    .line 37
    .line 38
    sub-int/2addr v6, v5

    .line 39
    or-int/lit8 v5, v6, 0x25

    .line 40
    .line 41
    shl-int/2addr v5, v7

    .line 42
    xor-int/lit8 v6, v6, 0x25

    .line 43
    .line 44
    sub-int/2addr v5, v6

    .line 45
    mul-int/lit8 v3, v3, 0x3

    .line 46
    .line 47
    or-int/lit8 v6, v3, 0x44

    .line 48
    .line 49
    shl-int/2addr v6, v7

    .line 50
    xor-int/lit8 v3, v3, 0x44

    .line 51
    .line 52
    sub-int/2addr v6, v3

    .line 53
    new-array v3, v6, [B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    .line 55
    add-int/lit8 v6, v6, -0x1

    .line 56
    .line 57
    const/4 v8, 0x0

    .line 58
    if-nez v2, :cond_0

    .line 59
    .line 60
    sget v4, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ॱ:I

    .line 61
    .line 62
    and-int/lit8 v9, v4, 0x29

    .line 63
    .line 64
    or-int/lit8 v4, v4, 0x29

    .line 65
    .line 66
    add-int/2addr v9, v4

    .line 67
    rem-int/lit16 v9, v9, 0x80

    .line 68
    .line 69
    sput v9, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ˋ:I

    .line 70
    .line 71
    move v9, v5

    .line 72
    move v4, v6

    .line 73
    move v11, v8

    .line 74
    goto :goto_2

    .line 75
    :cond_0
    move v9, v8

    .line 76
    :goto_0
    int-to-byte v10, v4

    .line 77
    :try_start_1
    aput-byte v10, v3, v9

    .line 78
    .line 79
    if-ne v9, v6, :cond_2

    .line 80
    .line 81
    new-instance v2, Ljava/lang/String;

    .line 82
    .line 83
    invoke-direct {v2, v3, v8}, Ljava/lang/String;-><init>([BI)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 84
    .line 85
    .line 86
    sget v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ॱ:I

    .line 87
    .line 88
    xor-int/lit8 v4, v3, 0x2b

    .line 89
    .line 90
    and-int/lit8 v3, v3, 0x2b

    .line 91
    .line 92
    shl-int/2addr v3, v7

    .line 93
    add-int/2addr v4, v3

    .line 94
    rem-int/lit16 v3, v4, 0x80

    .line 95
    .line 96
    sput v3, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ˋ:I

    .line 97
    .line 98
    rem-int/lit8 v4, v4, 0x2

    .line 99
    .line 100
    if-eqz v4, :cond_1

    .line 101
    .line 102
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ˏ:Landroid/os/IBinder;

    .line 110
    .line 111
    invoke-interface {p0, v7, v0, v1, v7}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 115
    .line 116
    .line 117
    :goto_1
    invoke-virtual {v1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 121
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 125
    .line 126
    .line 127
    return-object p0

    .line 128
    :catchall_0
    move-exception p0

    .line 129
    goto :goto_3

    .line 130
    :cond_1
    :try_start_3
    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    iget-object p0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ˏ:Landroid/os/IBinder;

    .line 138
    .line 139
    invoke-interface {p0, v7, v0, v1, v8}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 140
    .line 141
    .line 142
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 143
    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_2
    aget-byte v10, v2, v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 147
    .line 148
    xor-int/lit8 v11, v9, -0x6d

    .line 149
    .line 150
    and-int/lit8 v9, v9, -0x6d

    .line 151
    .line 152
    shl-int/2addr v9, v7

    .line 153
    add-int/2addr v11, v9

    .line 154
    add-int/lit8 v11, v11, 0x6e

    .line 155
    .line 156
    sget v9, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ˋ:I

    .line 157
    .line 158
    or-int/lit8 v12, v9, 0x5

    .line 159
    .line 160
    shl-int/2addr v12, v7

    .line 161
    xor-int/lit8 v9, v9, 0x5

    .line 162
    .line 163
    sub-int/2addr v12, v9

    .line 164
    rem-int/lit16 v12, v12, 0x80

    .line 165
    .line 166
    sput v12, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ॱ:I

    .line 167
    .line 168
    move v9, v5

    .line 169
    move v5, v10

    .line 170
    :goto_2
    neg-int v5, v5

    .line 171
    and-int v10, v4, v5

    .line 172
    .line 173
    or-int/2addr v4, v5

    .line 174
    add-int/2addr v10, v4

    .line 175
    add-int/lit8 v4, v10, -0x5

    .line 176
    .line 177
    or-int/lit8 v5, v9, -0x78

    .line 178
    .line 179
    shl-int/2addr v5, v7

    .line 180
    xor-int/lit8 v9, v9, -0x78

    .line 181
    .line 182
    sub-int/2addr v5, v9

    .line 183
    and-int/lit8 v9, v5, 0x79

    .line 184
    .line 185
    or-int/lit8 v5, v5, 0x79

    .line 186
    .line 187
    add-int/2addr v5, v9

    .line 188
    sget v9, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ॱ:I

    .line 189
    .line 190
    add-int/lit8 v9, v9, 0x3b

    .line 191
    .line 192
    rem-int/lit16 v9, v9, 0x80

    .line 193
    .line 194
    sput v9, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Ι$ı;->ˋ:I

    .line 195
    .line 196
    move v9, v11

    .line 197
    goto :goto_0

    .line 198
    :goto_3
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 202
    .line 203
    .line 204
    throw p0
.end method
