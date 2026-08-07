.class Ll/w350;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/w350$a;
    }
.end annotation


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Ll/pul;

.field private final c:Ll/w350$a;


# direct methods
.method private constructor <init>(Landroid/content/Context;Ll/pul;Ll/w350$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Landroid/app/Application;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iput-object p1, p0, Ll/w350;->a:Landroid/content/Context;

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/w350;->a:Landroid/content/Context;

    .line 16
    .line 17
    :goto_0
    iput-object p2, p0, Ll/w350;->b:Ll/pul;

    .line 18
    .line 19
    iput-object p3, p0, Ll/w350;->c:Ll/w350$a;

    .line 20
    .line 21
    return-void
.end method

.method public static a(Landroid/content/Context;Landroid/content/Intent;Ll/pul;Ll/w350$a;)V
    .locals 1

    .line 1
    new-instance v0, Ll/w350;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p3}, Ll/w350;-><init>(Landroid/content/Context;Ll/pul;Ll/w350$a;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/w350;->b(Landroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private b(Landroid/content/Intent;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/w350;->a:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, p1, p0, v1}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const/16 v1, 0x18

    .line 16
    .line 17
    new-array v1, v1, [B

    .line 18
    .line 19
    fill-array-data v1, :array_0

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p1}, Ll/jmw;->a(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :catch_0
    move-exception p1

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    new-instance p1, Lcom/immomo/momosec/device/oaid/OAIDException;

    .line 43
    .line 44
    const/16 v0, 0x16

    .line 45
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
    invoke-direct {p1, v0}, Lcom/immomo/momosec/device/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    :goto_0
    iget-object p0, p0, Ll/w350;->b:Ll/pul;

    .line 60
    .line 61
    invoke-interface {p0, p1}, Ll/pul;->b(Ljava/lang/Exception;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :array_0
    .array-data 1
        0x63t
        0x3t
        0x43t
        0x41t
        0x8t
        0x5t
        0x55t
        0x46t
        0x59t
        0x56t
        0x12t
        0x46t
        0x52t
        0x3t
        0x54t
        0x59t
        0x41t
        0x4t
        0x5ft
        0x13t
        0x5ft
        0x53t
        0x5bt
        0x46t
    .end array-data

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    :array_1
    .array-data 1
        0x63t
        0x3t
        0x43t
        0x41t
        0x8t
        0x5t
        0x55t
        0x46t
        0x53t
        0x5et
        0xft
        0x2t
        0x59t
        0x8t
        0x56t
        0x17t
        0x7t
        0x7t
        0x59t
        0xat
        0x54t
        0x53t
    .end array-data
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x1c

    .line 7
    .line 8
    new-array v1, v1, [B

    .line 9
    .line 10
    fill-array-data v1, :array_0

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Ll/jmw;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :try_start_0
    iget-object v0, p0, Ll/w350;->c:Ll/w350$a;

    .line 35
    .line 36
    invoke-interface {v0, p2}, Ll/w350$a;->a(Landroid/os/IBinder;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    if-eqz p2, :cond_0

    .line 41
    .line 42
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    iget-object v0, p0, Ll/w350;->b:Ll/pul;

    .line 49
    .line 50
    invoke-interface {v0, p2}, Ll/pul;->a(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    .line 53
    :try_start_1
    iget-object p2, p0, Ll/w350;->a:Landroid/content/Context;

    .line 54
    .line 55
    invoke-virtual {p2, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :catchall_0
    move-exception p2

    .line 60
    goto :goto_0

    .line 61
    :cond_0
    :try_start_2
    new-instance p2, Lcom/immomo/momosec/device/oaid/OAIDException;

    .line 62
    .line 63
    const/16 v0, 0x18

    .line 64
    .line 65
    new-array v0, v0, [B

    .line 66
    .line 67
    fill-array-data v0, :array_1

    .line 68
    .line 69
    .line 70
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-direct {p2, v0}, Lcom/immomo/momosec/device/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    throw p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 78
    :goto_0
    :try_start_3
    iget-object v0, p0, Ll/w350;->a:Landroid/content/Context;

    .line 79
    .line 80
    invoke-virtual {v0, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 81
    .line 82
    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    const/16 v1, 0x1a

    .line 89
    .line 90
    new-array v1, v1, [B

    .line 91
    .line 92
    fill-array-data v1, :array_2

    .line 93
    .line 94
    .line 95
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {v0}, Ll/jmw;->a(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 114
    .line 115
    .line 116
    :catch_0
    :try_start_4
    throw p2
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 117
    :catch_1
    move-exception p2

    .line 118
    iget-object v0, p0, Ll/w350;->b:Ll/pul;

    .line 119
    .line 120
    invoke-interface {v0, p2}, Ll/pul;->b(Ljava/lang/Exception;)V

    .line 121
    .line 122
    .line 123
    :try_start_5
    iget-object p2, p0, Ll/w350;->a:Landroid/content/Context;

    .line 124
    .line 125
    invoke-virtual {p2, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 126
    .line 127
    .line 128
    new-instance p0, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 131
    .line 132
    .line 133
    const/16 p2, 0x1a

    .line 134
    .line 135
    new-array p2, p2, [B

    .line 136
    .line 137
    fill-array-data p2, :array_3

    .line 138
    .line 139
    .line 140
    invoke-static {p2}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-static {p0}, Ll/jmw;->a(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 159
    .line 160
    .line 161
    :catch_2
    :goto_1
    return-void

    .line 162
    nop

    .line 163
    :array_0
    .array-data 1
        0x63t
        0x3t
        0x43t
        0x41t
        0x8t
        0x5t
        0x55t
        0x46t
        0x59t
        0x56t
        0x12t
        0x46t
        0x52t
        0x3t
        0x54t
        0x59t
        0x41t
        0x5t
        0x5ft
        0x8t
        0x5ft
        0x52t
        0x2t
        0x12t
        0x55t
        0x2t
        0xbt
        0x17t
    .end array-data

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
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    :array_1
    .array-data 1
        0x7ft
        0x27t
        0x78t
        0x73t
        0x4et
        0x27t
        0x71t
        0x2ft
        0x75t
        0x17t
        0x0t
        0x5t
        0x41t
        0x13t
        0x58t
        0x45t
        0x4t
        0x46t
        0x56t
        0x7t
        0x58t
        0x5bt
        0x4t
        0x2t
    .end array-data

    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    :array_2
    .array-data 1
        0x63t
        0x3t
        0x43t
        0x41t
        0x8t
        0x5t
        0x55t
        0x46t
        0x59t
        0x56t
        0x12t
        0x46t
        0x52t
        0x3t
        0x54t
        0x59t
        0x41t
        0x13t
        0x5et
        0x4t
        0x5et
        0x42t
        0xft
        0x2t
        0xat
        0x46t
    .end array-data

    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    nop

    .line 215
    :array_3
    .array-data 1
        0x63t
        0x3t
        0x43t
        0x41t
        0x8t
        0x5t
        0x55t
        0x46t
        0x59t
        0x56t
        0x12t
        0x46t
        0x52t
        0x3t
        0x54t
        0x59t
        0x41t
        0x13t
        0x5et
        0x4t
        0x5et
        0x42t
        0xft
        0x2t
        0xat
        0x46t
    .end array-data
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v0, 0x1f

    .line 7
    .line 8
    new-array v0, v0, [B

    .line 9
    .line 10
    fill-array-data v0, :array_0

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/jmw;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :array_0
    .array-data 1
        0x63t
        0x3t
        0x43t
        0x41t
        0x8t
        0x5t
        0x55t
        0x46t
        0x59t
        0x56t
        0x12t
        0x46t
        0x52t
        0x3t
        0x54t
        0x59t
        0x41t
        0x2t
        0x59t
        0x15t
        0x52t
        0x58t
        0xft
        0x8t
        0x55t
        0x5t
        0x45t
        0x52t
        0x5t
        0x5ct
        0x10t
    .end array-data
.end method
