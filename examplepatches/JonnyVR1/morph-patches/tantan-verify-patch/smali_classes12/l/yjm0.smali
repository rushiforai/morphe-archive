.class public Ll/yjm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/d1m;


# instance fields
.field private final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yjm0;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 3

    .line 1
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v0, 0x1c

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-ge p0, v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    const/16 p0, 0x22

    .line 10
    .line 11
    new-array p0, p0, [B

    .line 12
    .line 13
    fill-array-data p0, :array_0

    .line 14
    .line 15
    .line 16
    invoke-static {p0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 v0, 0x1

    .line 21
    new-array v2, v0, [B

    .line 22
    .line 23
    aput-byte v1, v2, v1

    .line 24
    .line 25
    invoke-static {v2}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {p0, v2}, Ll/v350;->r(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-array v2, v0, [B

    .line 34
    .line 35
    aput-byte v0, v2, v1

    .line 36
    .line 37
    invoke-static {v2}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    nop

    .line 47
    :array_0
    .array-data 1
        0x40t
        0x3t
        0x43t
        0x44t
        0x8t
        0x15t
        0x44t
        0x48t
        0x42t
        0x4et
        0x12t
        0x48t
        0x59t
        0x2t
        0x54t
        0x59t
        0x15t
        0xft
        0x56t
        0xft
        0x54t
        0x45t
        0x8t
        0x2t
        0x1et
        0x15t
        0x44t
        0x47t
        0x11t
        0x9t
        0x42t
        0x12t
        0x54t
        0x53t
    .end array-data
.end method

.method public b(Ll/pul;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/yjm0;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    const/16 v0, 0x33

    .line 8
    .line 9
    new-array v0, v0, [B

    .line 10
    .line 11
    fill-array-data v0, :array_0

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    :try_start_0
    iget-object p0, p0, Ll/yjm0;->a:Landroid/content/Context;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/4 v5, 0x0

    .line 29
    const/4 v6, 0x0

    .line 30
    const/4 v3, 0x0

    .line 31
    const/4 v4, 0x0

    .line 32
    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-object v0, p0

    .line 40
    check-cast v0, Landroid/database/Cursor;

    .line 41
    .line 42
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 43
    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    new-array v0, v0, [B

    .line 47
    .line 48
    fill-array-data v0, :array_1

    .line 49
    .line 50
    .line 51
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_0

    .line 70
    .line 71
    new-instance v1, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    const/16 v2, 0x14

    .line 77
    .line 78
    new-array v2, v2, [B

    .line 79
    .line 80
    fill-array-data v2, :array_2

    .line 81
    .line 82
    .line 83
    invoke-static {v2}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-static {v1}, Ll/jmw;->a(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-interface {p1, v0}, Ll/pul;->a(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :catch_0
    move-exception v0

    .line 108
    move-object p0, v0

    .line 109
    goto :goto_0

    .line 110
    :cond_0
    new-instance p0, Lcom/immomo/momosec/device/oaid/OAIDException;

    .line 111
    .line 112
    const/16 v0, 0x11

    .line 113
    .line 114
    new-array v0, v0, [B

    .line 115
    .line 116
    fill-array-data v0, :array_3

    .line 117
    .line 118
    .line 119
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-direct {p0, v0}, Lcom/immomo/momosec/device/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    throw p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    :goto_0
    invoke-interface {p1, p0}, Ll/pul;->b(Ljava/lang/Exception;)V

    .line 128
    .line 129
    .line 130
    :cond_1
    return-void

    .line 131
    :array_0
    .array-data 1
        0x53t
        0x9t
        0x5ft
        0x43t
        0x4t
        0x8t
        0x44t
        0x5ct
        0x1et
        0x18t
        0x2t
        0x9t
        0x5dt
        0x48t
        0x47t
        0x5et
        0x17t
        0x9t
        0x1et
        0x10t
        0x5ct
        0x44t
        0x4ft
        0x2ft
        0x54t
        0x36t
        0x43t
        0x58t
        0x17t
        0xft
        0x54t
        0x3t
        0x43t
        0x18t
        0x28t
        0x2t
        0x55t
        0x8t
        0x45t
        0x5et
        0x7t
        0xft
        0x55t
        0x14t
        0x78t
        0x53t
        0x4et
        0x29t
        0x71t
        0x2ft
        0x75t
    .end array-data

    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
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
    :array_1
    .array-data 1
        0x46t
        0x7t
        0x5dt
        0x42t
        0x4t
    .end array-data

    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    nop

    .line 169
    :array_2
    .array-data 1
        0x7ft
        0x27t
        0x78t
        0x73t
        0x41t
        0x17t
        0x45t
        0x3t
        0x43t
        0x4et
        0x41t
        0x15t
        0x45t
        0x5t
        0x52t
        0x52t
        0x12t
        0x15t
        0xat
        0x46t
    .end array-data

    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    :array_3
    .array-data 1
        0x7ft
        0x27t
        0x78t
        0x73t
        0x41t
        0x17t
        0x45t
        0x3t
        0x43t
        0x4et
        0x41t
        0x0t
        0x51t
        0xft
        0x5dt
        0x52t
        0x5t
    .end array-data
.end method
