.class public Lcom/p1/mobile/putong/core/ui/onlinematch/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/String; = "0"

.field public static b:J

.field public static c:J

.field public static d:I

.field public static final e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field public static f:Z

.field public static g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static h:Ll/r9r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/r9r<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static i:Ll/r9r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/r9r<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static j:Ll/r9r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/r9r<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    const/16 v1, 0x18

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->e:Ljava/util/Map;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    sput-boolean v0, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->f:Z

    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    sput-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->g:Ljava/util/List;

    .line 19
    .line 20
    new-instance v0, Ll/rs50;

    .line 21
    .line 22
    invoke-direct {v0}, Ll/rs50;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Ll/r9r;->c(Ll/pcj;)Ll/r9r;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->h:Ll/r9r;

    .line 30
    .line 31
    new-instance v0, Ll/ct50;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/ct50;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {v0}, Ll/r9r;->c(Ll/pcj;)Ll/r9r;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sput-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->i:Ll/r9r;

    .line 41
    .line 42
    new-instance v0, Ll/dt50;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/dt50;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v0}, Ll/r9r;->c(Ll/pcj;)Ll/r9r;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sput-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->j:Ll/r9r;

    .line 52
    .line 53
    return-void
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

.method public static A()Z
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->O0:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 27
    .line 28
    iget-object v0, v0, Ll/dkb;->P0:Ll/byd0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ljava/lang/Long;

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 37
    .line 38
    .line 39
    move-result-wide v2

    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->T()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    int-to-long v4, v0

    .line 45
    cmp-long v0, v2, v4

    .line 46
    .line 47
    if-ltz v0, :cond_0

    .line 48
    .line 49
    const/4 v0, 0x1

    .line 50
    return v0

    .line 51
    :cond_0
    return v1
.end method

.method public static B(J)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    const-string v1, "Mdd"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljava/util/Date;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const/16 p1, 0x79

    .line 22
    .line 23
    if-lt p0, p1, :cond_0

    .line 24
    .line 25
    const/16 p1, 0xdb

    .line 26
    .line 27
    if-gt p0, p1, :cond_0

    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 30
    .line 31
    sget p1, Lcom/p1/mobile/putong/core/R$string;->zt:I

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_0
    const/16 p1, 0xdc

    .line 39
    .line 40
    if-lt p0, p1, :cond_1

    .line 41
    .line 42
    const/16 p1, 0x140

    .line 43
    .line 44
    if-gt p0, p1, :cond_1

    .line 45
    .line 46
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 47
    .line 48
    sget p1, Lcom/p1/mobile/putong/core/R$string;->zt:I

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_1
    const/16 p1, 0x141

    .line 56
    .line 57
    if-lt p0, p1, :cond_2

    .line 58
    .line 59
    const/16 p1, 0x1a4

    .line 60
    .line 61
    if-gt p0, p1, :cond_2

    .line 62
    .line 63
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 64
    .line 65
    sget p1, Lcom/p1/mobile/putong/core/R$string;->At:I

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0

    .line 72
    :cond_2
    const/16 p1, 0x1a5

    .line 73
    .line 74
    if-lt p0, p1, :cond_3

    .line 75
    .line 76
    const/16 p1, 0x209

    .line 77
    .line 78
    if-gt p0, p1, :cond_3

    .line 79
    .line 80
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 81
    .line 82
    sget p1, Lcom/p1/mobile/putong/core/R$string;->It:I

    .line 83
    .line 84
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0

    .line 89
    :cond_3
    const/16 p1, 0x20a

    .line 90
    .line 91
    if-lt p0, p1, :cond_4

    .line 92
    .line 93
    const/16 p1, 0x26d

    .line 94
    .line 95
    if-gt p0, p1, :cond_4

    .line 96
    .line 97
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 98
    .line 99
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Dt:I

    .line 100
    .line 101
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    return-object p0

    .line 106
    :cond_4
    const/16 p1, 0x26e

    .line 107
    .line 108
    if-lt p0, p1, :cond_5

    .line 109
    .line 110
    const/16 p1, 0x2d2

    .line 111
    .line 112
    if-gt p0, p1, :cond_5

    .line 113
    .line 114
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 115
    .line 116
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Bt:I

    .line 117
    .line 118
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    return-object p0

    .line 123
    :cond_5
    const/16 p1, 0x2d3

    .line 124
    .line 125
    if-lt p0, p1, :cond_6

    .line 126
    .line 127
    const/16 p1, 0x337

    .line 128
    .line 129
    if-gt p0, p1, :cond_6

    .line 130
    .line 131
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 132
    .line 133
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Et:I

    .line 134
    .line 135
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    return-object p0

    .line 140
    :cond_6
    const/16 p1, 0x338

    .line 141
    .line 142
    if-lt p0, p1, :cond_7

    .line 143
    .line 144
    const/16 p1, 0x39b

    .line 145
    .line 146
    if-gt p0, p1, :cond_7

    .line 147
    .line 148
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 149
    .line 150
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Jt:I

    .line 151
    .line 152
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    return-object p0

    .line 157
    :cond_7
    const/16 p1, 0x39c

    .line 158
    .line 159
    if-lt p0, p1, :cond_8

    .line 160
    .line 161
    const/16 p1, 0x3ff

    .line 162
    .line 163
    if-gt p0, p1, :cond_8

    .line 164
    .line 165
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 166
    .line 167
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ft:I

    .line 168
    .line 169
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    return-object p0

    .line 174
    :cond_8
    const/16 p1, 0x400

    .line 175
    .line 176
    if-lt p0, p1, :cond_9

    .line 177
    .line 178
    const/16 p1, 0x462

    .line 179
    .line 180
    if-gt p0, p1, :cond_9

    .line 181
    .line 182
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 183
    .line 184
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ht:I

    .line 185
    .line 186
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    return-object p0

    .line 191
    :cond_9
    const/16 p1, 0x463

    .line 192
    .line 193
    if-lt p0, p1, :cond_a

    .line 194
    .line 195
    const/16 p1, 0x4c5

    .line 196
    .line 197
    if-gt p0, p1, :cond_a

    .line 198
    .line 199
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 200
    .line 201
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Gt:I

    .line 202
    .line 203
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    return-object p0

    .line 208
    :cond_a
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 209
    .line 210
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ct:I

    .line 211
    .line 212
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    return-object p0
.end method

.method public static C(ILjava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const/16 v0, 0x4e20

    .line 2
    .line 3
    if-le p0, v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_0

    .line 44
    .line 45
    return-object p1

    .line 46
    :cond_0
    const-string p0, ""

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_1
    const/16 p1, 0x3e8

    .line 50
    .line 51
    if-lt p0, p1, :cond_2

    .line 52
    .line 53
    new-instance p1, Ljava/text/DecimalFormat;

    .line 54
    .line 55
    const-string v0, "0.0"

    .line 56
    .line 57
    invoke-direct {p1, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    int-to-float p0, p0

    .line 61
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 62
    .line 63
    div-float/2addr p0, v0

    .line 64
    float-to-double v0, p0

    .line 65
    invoke-virtual {p1, v0, v1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const-string p1, "%skm"

    .line 74
    .line 75
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0

    .line 80
    :cond_2
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    const-string p1, "%sm"

    .line 89
    .line 90
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0
.end method

.method public static D(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLl/x20;ZLjava/lang/String;)V
    .locals 8

    .line 1
    const/4 v6, 0x1

    .line 2
    const/4 v7, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move v2, p2

    .line 6
    move-object v3, p3

    .line 7
    move v4, p4

    .line 8
    move-object v5, p5

    .line 9
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->E(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLl/x20;ZLjava/lang/String;ZLl/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static E(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLl/x20;ZLjava/lang/String;ZLl/y20;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;",
            "Z",
            "Ll/x20;",
            "Z",
            "Ljava/lang/String;",
            "Z",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p3}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isBell:Z

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    const-string v2, "privilege"

    .line 14
    .line 15
    const-string v3, "coin"

    .line 16
    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v4, v0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 22
    .line 23
    iget-object v5, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->tracker:Ljava/lang/String;

    .line 24
    .line 25
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isGreet:Z

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const-string v0, "answer"

    .line 30
    .line 31
    :goto_0
    move-object v6, v0

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    const-string v0, "greet"

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :goto_1
    if-eqz p2, :cond_2

    .line 37
    .line 38
    move-object v7, v3

    .line 39
    goto :goto_2

    .line 40
    :cond_2
    move-object v7, v2

    .line 41
    :goto_2
    iget-boolean v8, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isMaleQuickChatRing:Z

    .line 42
    .line 43
    iget-object v9, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual/range {v4 .. v9}, Lcom/p1/mobile/putong/core/api/v;->i4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    new-instance v0, Ll/ss50;

    .line 50
    .line 51
    invoke-direct {v0, p1}, Ll/ss50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    new-instance v0, Ll/ts50;

    .line 59
    .line 60
    invoke-direct {v0}, Ll/ts50;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    goto :goto_3

    .line 68
    :cond_3
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isSpeedMatch:Z

    .line 69
    .line 70
    if-eqz v0, :cond_5

    .line 71
    .line 72
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 75
    .line 76
    iget-object v4, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->tracker:Ljava/lang/String;

    .line 77
    .line 78
    if-eqz p2, :cond_4

    .line 79
    .line 80
    move-object v2, v3

    .line 81
    :cond_4
    invoke-virtual {v0, v4, v2}, Lcom/p1/mobile/putong/core/api/v;->k4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    goto :goto_3

    .line 86
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->secretKey:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-nez v0, :cond_6

    .line 93
    .line 94
    new-instance v0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 95
    .line 96
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;-><init>()V

    .line 97
    .line 98
    .line 99
    iget-object v2, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->secretKey:Ljava/lang/String;

    .line 100
    .line 101
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->secretKey:Ljava/lang/String;

    .line 102
    .line 103
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 104
    .line 105
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {p0, v0, p2, v1, p5}, Ll/a8d0;->q0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;ZZLjava/lang/String;)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 112
    .line 113
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 114
    .line 115
    iget-object v2, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->action:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v0, v2, p2}, Lcom/p1/mobile/putong/core/api/v;->g4(Ljava/lang/String;Z)Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    :goto_3
    new-instance v0, Ll/us50;

    .line 122
    .line 123
    invoke-direct {v0, p2, p1}, Ll/us50;-><init>(Lrx/c;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    invoke-virtual {p2, v1}, Lrx/c;->take(I)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    new-instance v2, Ll/vs50;

    .line 135
    .line 136
    move-object v7, p0

    .line 137
    move-object v3, p1

    .line 138
    move v6, p4

    .line 139
    move-object v8, p5

    .line 140
    move/from16 v5, p6

    .line 141
    .line 142
    move-object/from16 v4, p7

    .line 143
    .line 144
    invoke-direct/range {v2 .. v8}, Ll/vs50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ll/y20;ZZLcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    new-instance p0, Ll/ws50;

    .line 148
    .line 149
    invoke-direct {p0, v4}, Ll/ws50;-><init>(Ll/y20;)V

    .line 150
    .line 151
    .line 152
    invoke-static {v2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public static F(Ljava/util/Calendar;)Ljava/lang/String;
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    const/16 v2, 0x7d0

    .line 7
    .line 8
    if-lt v1, v2, :cond_0

    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 11
    .line 12
    sget v0, Lcom/p1/mobile/putong/core/R$string;->K2:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    const/16 v2, 0x7cb

    .line 20
    .line 21
    if-lt v1, v2, :cond_1

    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 24
    .line 25
    sget v0, Lcom/p1/mobile/putong/core/R$string;->O2:I

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_1
    const/16 v2, 0x7c6

    .line 33
    .line 34
    if-lt v1, v2, :cond_2

    .line 35
    .line 36
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 37
    .line 38
    sget v0, Lcom/p1/mobile/putong/core/R$string;->N2:I

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0

    .line 45
    :cond_2
    const/16 v2, 0x7bc

    .line 46
    .line 47
    if-lt v1, v2, :cond_3

    .line 48
    .line 49
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 50
    .line 51
    sget v0, Lcom/p1/mobile/putong/core/R$string;->M2:I

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0

    .line 58
    :cond_3
    const/16 v2, 0x7b2

    .line 59
    .line 60
    if-lt v1, v2, :cond_4

    .line 61
    .line 62
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 63
    .line 64
    sget v0, Lcom/p1/mobile/putong/core/R$string;->L2:I

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0

    .line 71
    :cond_4
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-static {}, Ll/pzi0;->o()J

    .line 76
    .line 77
    .line 78
    move-result-wide v3

    .line 79
    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v2, v0}, Ljava/util/Calendar;->get(I)I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    const/4 v4, 0x2

    .line 87
    invoke-virtual {v2, v4}, Ljava/util/Calendar;->get(I)I

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    const/4 v6, 0x5

    .line 92
    invoke-virtual {v2, v6}, Ljava/util/Calendar;->get(I)I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    invoke-virtual {p0, v4}, Ljava/util/Calendar;->get(I)I

    .line 97
    .line 98
    .line 99
    move-result v4

    .line 100
    invoke-virtual {p0, v6}, Ljava/util/Calendar;->get(I)I

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    sub-int/2addr v3, v1

    .line 105
    if-lt v5, v4, :cond_6

    .line 106
    .line 107
    if-ne v5, v4, :cond_5

    .line 108
    .line 109
    if-ge v2, p0, :cond_5

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_5
    const/4 v0, 0x0

    .line 113
    :cond_6
    :goto_0
    sub-int/2addr v3, v0

    .line 114
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 115
    .line 116
    sget v0, Lcom/p1/mobile/putong/core/R$string;->P2:I

    .line 117
    .line 118
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    return-object p0
.end method

.method public static G(I)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    neg-int p0, p0

    .line 7
    invoke-virtual {v0, v1, p0}, Ljava/util/Calendar;->add(II)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->F(Ljava/util/Calendar;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static H(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    sub-int/2addr v0, v1

    .line 24
    const/16 v1, 0x7d0

    .line 25
    .line 26
    if-lt v0, v1, :cond_0

    .line 27
    .line 28
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 29
    .line 30
    sget v0, Lcom/p1/mobile/putong/core/R$string;->K2:I

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_0
    const/16 v1, 0x7cb

    .line 38
    .line 39
    if-lt v0, v1, :cond_1

    .line 40
    .line 41
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 42
    .line 43
    sget v0, Lcom/p1/mobile/putong/core/R$string;->O2:I

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_1
    const/16 v1, 0x7c6

    .line 51
    .line 52
    if-lt v0, v1, :cond_2

    .line 53
    .line 54
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 55
    .line 56
    sget v0, Lcom/p1/mobile/putong/core/R$string;->N2:I

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0

    .line 63
    :cond_2
    const/16 v1, 0x7bc

    .line 64
    .line 65
    if-lt v0, v1, :cond_3

    .line 66
    .line 67
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 68
    .line 69
    sget v0, Lcom/p1/mobile/putong/core/R$string;->M2:I

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_3
    const/16 v1, 0x7b2

    .line 77
    .line 78
    if-lt v0, v1, :cond_4

    .line 79
    .line 80
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 81
    .line 82
    sget v0, Lcom/p1/mobile/putong/core/R$string;->L2:I

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0

    .line 89
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 90
    .line 91
    sget v1, Lcom/p1/mobile/putong/core/R$string;->P2:I

    .line 92
    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 94
    .line 95
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {v0, v1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    return-object p0
.end method

.method public static I()I
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->b0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/f49;->H3()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/2addr v0, v1

    .line 14
    return v0
.end method

.method public static J(D)Ljava/lang/String;
    .locals 8

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    long-to-double v0, v0

    .line 6
    sub-double/2addr p0, v0

    .line 7
    const-wide v0, 0x408f400000000000L    # 1000.0

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    div-double/2addr p0, v0

    .line 13
    double-to-long p0, p0

    .line 14
    const-wide/16 v0, 0xe10

    .line 15
    .line 16
    div-long v0, p0, v0

    .line 17
    .line 18
    const-wide/16 v2, 0x3c

    .line 19
    .line 20
    div-long v4, p0, v2

    .line 21
    .line 22
    rem-long/2addr v4, v2

    .line 23
    rem-long v6, p0, v2

    .line 24
    .line 25
    cmp-long p0, p0, v2

    .line 26
    .line 27
    if-ltz p0, :cond_0

    .line 28
    .line 29
    new-instance p0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/tzi0;->j(J)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string p1, ":"

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-static {v4, v5}, Ll/tzi0;->j(J)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0

    .line 58
    :cond_0
    const-wide/16 p0, 0x0

    .line 59
    .line 60
    cmp-long v0, v6, p0

    .line 61
    .line 62
    if-gez v0, :cond_1

    .line 63
    .line 64
    move-wide v6, p0

    .line 65
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-static {v6, v7}, Ll/tzi0;->j(J)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string p1, "s"

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0
.end method

.method public static K()J
    .locals 2

    .line 1
    sget-wide v0, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static L(Ljava/lang/String;)Z
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "MATCH_UNLOCK_LIMIT_TIPS_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "_"

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-direct {v0, p0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Ljava/lang/Boolean;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    return p0
.end method

.method public static M(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "MATCH_UNLOCK_25_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "_"

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v1, ""

    .line 34
    .line 35
    invoke-direct {v0, p0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Ljava/lang/String;

    .line 43
    .line 44
    return-object p0
.end method

.method public static N(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "MATCH_UNLOCK_50_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "_"

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v1, ""

    .line 34
    .line 35
    invoke-direct {v0, p0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Ljava/lang/String;

    .line 43
    .line 44
    return-object p0
.end method

.method public static O(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "MATCH_UNLOCK_75_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "_"

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v1, ""

    .line 34
    .line 35
    invoke-direct {v0, p0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Ljava/lang/String;

    .line 43
    .line 44
    return-object p0
.end method

.method public static P(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "ONLINE_MATCH_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "_"

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v1, ""

    .line 34
    .line 35
    invoke-direct {v0, p0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Ljava/lang/String;

    .line 43
    .line 44
    return-object p0
.end method

.method public static Q()I
    .locals 6

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 12
    .line 13
    .line 14
    const/16 v1, 0xb

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    new-instance v1, Ljava/util/Random;

    .line 21
    .line 22
    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    .line 23
    .line 24
    .line 25
    const/4 v2, 0x6

    .line 26
    const/4 v3, 0x1

    .line 27
    if-lt v0, v3, :cond_0

    .line 28
    .line 29
    if-ge v0, v2, :cond_0

    .line 30
    .line 31
    const/16 v0, 0x10

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ljava/util/Random;->nextInt(I)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/lit8 v0, v0, 0x5

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_0
    const/16 v4, 0x8

    .line 41
    .line 42
    if-lt v0, v2, :cond_1

    .line 43
    .line 44
    if-ge v0, v4, :cond_1

    .line 45
    .line 46
    const/16 v0, 0x24

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Ljava/util/Random;->nextInt(I)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    add-int/lit8 v0, v0, 0xf

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_1
    const/16 v2, 0xa

    .line 56
    .line 57
    if-lt v0, v4, :cond_2

    .line 58
    .line 59
    if-ge v0, v2, :cond_2

    .line 60
    .line 61
    const/16 v0, 0x3d

    .line 62
    .line 63
    invoke-virtual {v1, v0}, Ljava/util/Random;->nextInt(I)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/lit8 v0, v0, 0x14

    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_2
    const/16 v4, 0x12

    .line 71
    .line 72
    const/16 v5, 0x65

    .line 73
    .line 74
    if-lt v0, v2, :cond_3

    .line 75
    .line 76
    if-ge v0, v4, :cond_3

    .line 77
    .line 78
    invoke-virtual {v1, v5}, Ljava/util/Random;->nextInt(I)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    :goto_0
    add-int/lit8 v0, v0, 0x32

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    const/16 v2, 0x17

    .line 86
    .line 87
    if-lt v0, v4, :cond_4

    .line 88
    .line 89
    if-ge v0, v2, :cond_4

    .line 90
    .line 91
    invoke-virtual {v1, v5}, Ljava/util/Random;->nextInt(I)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    add-int/lit8 v0, v0, 0x64

    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_4
    if-ge v0, v2, :cond_6

    .line 99
    .line 100
    if-ge v0, v3, :cond_5

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_5
    const/4 v0, 0x0

    .line 104
    goto :goto_2

    .line 105
    :cond_6
    :goto_1
    invoke-virtual {v1, v5}, Ljava/util/Random;->nextInt(I)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    goto :goto_0

    .line 110
    :goto_2
    sput v0, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->d:I

    .line 111
    .line 112
    return v0
.end method

.method public static R(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "QUICKCHAT_BELL_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "_"

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v1, ""

    .line 34
    .line 35
    invoke-direct {v0, p0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Ljava/lang/String;

    .line 43
    .line 44
    return-object p0
.end method

.method public static S()I
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    const-string v1, "quickchatSpeedUpNum"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/joa;->x4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    return v0

    .line 23
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 24
    .line 25
    iget v0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->remaining:I

    .line 26
    .line 27
    return v0
.end method

.method public static T()I
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "showQuickChatCardSwipedCount"

    .line 6
    .line 7
    const/4 v2, 0x2

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->z(Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    return v0
.end method

.method public static U()Z
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    const-string v1, "quickchatMembership"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/joa;->x4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 22
    .line 23
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->expiredTime:J

    .line 24
    .line 25
    sget-object v2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 28
    .line 29
    .line 30
    move-result-wide v2

    .line 31
    cmp-long v0, v0, v2

    .line 32
    .line 33
    if-ltz v0, :cond_0

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    return v0

    .line 37
    :cond_0
    const/4 v0, 0x0

    .line 38
    return v0
.end method

.method public static V()Z
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->W()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 12
    .line 13
    const-string v2, "quickchatMembership"

    .line 14
    .line 15
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v0, v2}, Ll/joa;->x4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 26
    .line 27
    iget-wide v2, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->expiredTime:J

    .line 28
    .line 29
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 32
    .line 33
    .line 34
    move-result-wide v4

    .line 35
    cmp-long v0, v2, v4

    .line 36
    .line 37
    if-gez v0, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return v1

    .line 41
    :cond_2
    :goto_0
    const/4 v0, 0x1

    .line 42
    return v0
.end method

.method public static W()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 10
    .line 11
    const-string v1, "male"

    .line 12
    .line 13
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    return v0
.end method

.method public static X(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->P(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static Y(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->M(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static Z(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->N(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static synthetic a(Ll/jl80;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/jl80;->K()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "true"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "false"

    .line 11
    .line 12
    :goto_0
    const-string v0, "is_choose"

    .line 13
    .line 14
    invoke-static {v0, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "e_quickchat_nochat_popup_continue"

    .line 23
    .line 24
    const-string v1, "p_quickchat_nochat_popup"

    .line 25
    .line 26
    invoke-static {v0, v1, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static a0(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->O(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static synthetic b(Ll/jl80;Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/jl80;->K()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "true"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "false"

    .line 11
    .line 12
    :goto_0
    const-string v0, "is_choose"

    .line 13
    .line 14
    invoke-static {v0, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "e_quickchat_nochat_popup_quit"

    .line 23
    .line 24
    const-string v1, "p_quickchat_nochat_popup"

    .line 25
    .line 26
    invoke-static {v0, v1, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static b0()I
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    const-string v1, "quickchatNumber"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/joa;->x4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 30
    .line 31
    iget v0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->remaining:I

    .line 32
    .line 33
    return v0

    .line 34
    :cond_0
    const/4 v0, 0x0

    .line 35
    return v0
.end method

.method public static synthetic c(Lcom/google/common/base/Optional;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static c0(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "MATCH_UNLOCK_LIMIT_TIPS_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "_"

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-direct {v0, p0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 36
    .line 37
    .line 38
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic d(Ll/jl80;Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->o:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/jl80;->K()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p2, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static d0(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "MATCH_UNLOCK_SHOW_LIMIT_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "_"

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-direct {v0, p0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 36
    .line 37
    .line 38
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic e([ZLl/x20;Ll/ugy;)V
    .locals 1

    .line 1
    const/4 p2, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    aput-boolean v0, p0, p2

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static e0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "QUICKCHAT_BELL_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "_"

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v1, ""

    .line 34
    .line 35
    invoke-direct {v0, p0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/v;->Z:Lrx/subjects/a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public static f0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "MATCH_UNLOCK_25_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "_"

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v1, ""

    .line 34
    .line 35
    invoke-direct {v0, p0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/data/PurchaseType;[ZLl/x20;Ll/ugy;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/a5i0;->M1(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    aput-boolean p0, p1, p0

    .line 6
    .line 7
    invoke-interface {p2}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static g0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "MATCH_UNLOCK_50_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "_"

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v1, ""

    .line 34
    .line 35
    invoke-direct {v0, p0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Lcom/google/common/base/Optional;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuickChatBellData;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/QuickChatBellData;->greetTracker:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->e0(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static h0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "MATCH_UNLOCK_75_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "_"

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v1, ""

    .line 34
    .line 35
    invoke-direct {v0, p0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static i0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "ONLINE_MATCH_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "_"

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v1, ""

    .line 34
    .line 35
    invoke-direct {v0, p0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic j(Ll/y20;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->v(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    const-string p1, "\u8be5\u7528\u6237\u5df2\u63d0\u524d\u9000\u51fa\u95ea\u804a\uff0c\u8bf7\u91cd\u65b0\u53d1\u8d77\u5427~"

    .line 21
    .line 22
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string p1, "\u7f51\u7edc\u5f02\u5e38\uff0c\u8bf7\u7a0d\u540e\u518d\u91cd\u8bd5"

    .line 27
    .line 28
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public static j0(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    sput-wide p0, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->b:J

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/dkb;->t9(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static k0(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_quickchat_nochat_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/jl80$a;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    const-string v2, "\u7ed9\u597d\u53cb\u53d1\u53e5\u6d88\u606f\u5427"

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "\u53cc\u65b9\u90fd\u4e0d\u8bf4\u8bdd\uff0c\u4f1a\u8bdd\u5c06\u53ef\u80fd\u4f1a\u6d88\u5931\u54e6"

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "\u7ee7\u7eed\u804a\u5929"

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget v2, Lcom/p1/mobile/putong/core/R$string;->kp:I

    .line 37
    .line 38
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v1, v2}, Ll/jl80$a;->W(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-string v2, "\u4e0d\u518d\u63d0\u793a"

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ll/jl80$a;->k0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    sget v2, Ll/dbc0;->nj:I

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const/4 v2, 0x1

    .line 59
    invoke-virtual {v1, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1, v2}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1}, Ll/jl80$a;->O()Ll/jl80;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    new-instance v2, Ll/et50;

    .line 72
    .line 73
    invoke-direct {v2, v1, v0}, Ll/et50;-><init>(Ll/jl80;Ll/l4g0;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1, v2}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 77
    .line 78
    .line 79
    new-instance v2, Ll/ft50;

    .line 80
    .line 81
    invoke-direct {v2, v1}, Ll/ft50;-><init>(Ll/jl80;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ll/jl80;->W(Ljava/lang/Runnable;)V

    .line 85
    .line 86
    .line 87
    new-instance v2, Ll/gt50;

    .line 88
    .line 89
    invoke-direct {v2, v1, p0}, Ll/gt50;-><init>(Ll/jl80;Lcom/p1/mobile/android/app/Act;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, v2}, Ll/jl80;->V(Ljava/lang/Runnable;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1}, Ll/jl80;->show()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public static synthetic l()Ljava/util/List;
    .locals 13

    .line 1
    const-string v11, "\u53ea\u53d1\u8868\u60c5\uff0c\u4e0d\u662f\u597d\u7684\u5f00\u573a\u767d"

    .line 2
    .line 3
    const-string v12, "\u5206\u4eab\u4e00\u4e2a\u6709\u8da3\u7684\u4e8b\u60c5\u7ed9Ta\u5427"

    .line 4
    .line 5
    const-string v0, "\u4e3b\u52a8\u6253\u5f00\u8bdd\u9898\uff0c\u53d1\u53cb\u597d\u4fe1\u53f7"

    .line 6
    .line 7
    const-string v1, "\u70ed\u60c5\u7684hi\uff0c\u8ddf\u65b0\u8bdd\u9898\u66f4\u914d\u54e6"

    .line 8
    .line 9
    const-string v2, "\u804a\u8f7b\u677e\u7684\u8bdd\u9898\uff0c\u804a\u5929\u66f4\u6109\u5feb"

    .line 10
    .line 11
    const-string v3, "\u6536\u83b7\u597d\u611f\uff0c\u4ece\u4ecb\u7ecd\u81ea\u5df1\u5f00\u59cb"

    .line 12
    .line 13
    const-string v4, "\u7528\u8bed\u97f3\u6253\u62db\u547c\uff0c\u4f1a\u66f4\u6709\u8bda\u610f"

    .line 14
    .line 15
    const-string v5, "\u804a\u804a\u6700\u8fd1\u7684\u70ed\u641c\u8bdd\u9898\u5427"

    .line 16
    .line 17
    const-string v6, "\u804a\u804a\u4f60\u4eec\u7684\u5171\u540c\u70b9\u5427"

    .line 18
    .line 19
    const-string v7, "\u5c1d\u8bd5\u5bfb\u627e\u4f60\u4eec\u7684\u5171\u540c\u8bdd\u9898\u5427"

    .line 20
    .line 21
    const-string v8, "\u8bd5\u8bd5\u80fd\u804a\u8d77\u6765\u7684\u5f00\u653e\u5f0f\u95ee\u9898"

    .line 22
    .line 23
    const-string v9, "\u50cf\u8001\u670b\u53cb\u4e00\u6837\uff0c\u5f00\u59cb\u804a\u5929\u5427"

    .line 24
    .line 25
    const-string v10, "\u65b0\u5947\u7684\u62db\u547c\u8bed\uff0c\u66f4\u6613\u6709\u53cd\u9988"

    .line 26
    .line 27
    filled-new-array/range {v0 .. v12}, [Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    return-object v0
.end method

.method public static l0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/android/app/Dialog;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/bt50;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/bt50;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public static synthetic m()Ljava/util/List;
    .locals 18

    .line 1
    const-string v16, "\u5c11\u7528\u5957\u8def\uff0c\u591a\u70b9\u771f\u8bda"

    .line 2
    .line 3
    const-string v17, "\u4e00\u76f4\u8bf4\u548c\u4e00\u76f4\u4e0d\u8bf4\u90fd\u4e0d\u793c\u8c8c"

    .line 4
    .line 5
    const-string v1, "\u4e0d\u505c\u7684\u63d0\u95ee\uff0c\u4f1a\u964d\u4f4e\u597d\u611f\u54e6"

    .line 6
    .line 7
    const-string v2, "\u4e0d\u95ee\u9690\u79c1\uff0c\u4f1a\u663e\u5f97\u66f4\u6709\u793c\u8c8c"

    .line 8
    .line 9
    const-string v3, "\u5207\u5fcc\u5237\u5c4f\uff0c\u7528\u5fc3\u804a\u5929\u5427"

    .line 10
    .line 11
    const-string v4, "\u5c01\u95ed\u5f0f\u804a\u5929,\u4e0d\u6613\u6253\u5f00\u8bdd\u9898"

    .line 12
    .line 13
    const-string v5, "\u4e3b\u52a8\u4e00\u4e9b,\u4f1a\u8d62\u5f97\u66f4\u591a\u597d\u611f"

    .line 14
    .line 15
    const-string v6, "\u5206\u4eab\u4e00\u4e2a\u4f60\u6700\u8fd1\u7684\u8da3\u4e8b\u5427"

    .line 16
    .line 17
    const-string v7, "\u591a\u770b\u8d44\u6599,\u591a\u804a\u5171\u540c\u70b9"

    .line 18
    .line 19
    const-string v8, "\u5b8c\u5584\u8d44\u6599\u5361\uff0c\u6709\u52a9\u4e8e\u4ea4\u53cb\u54e6"

    .line 20
    .line 21
    const-string v9, "\u591a\u8d5e\u7f8e\uff0c\u804a\u5929\u6c14\u6c1b\u66f4\u548c\u8c10"

    .line 22
    .line 23
    const-string v10, "\u79d2\u56de\u80fd\u8ba9\u4f60\u6536\u83b7\u597d\u611f"

    .line 24
    .line 25
    const-string v11, "\u5206\u4eab\u4f60\u8d44\u6599\u91cc\u6ca1\u6709\u7684\u4fe1\u606f\u5427"

    .line 26
    .line 27
    const-string v12, "\u5927\u65b9\u8bf4\u51fa\u81ea\u5df1\u7684\u4f18\u70b9\u5427"

    .line 28
    .line 29
    const-string v13, "\u9633\u5149\u5f00\u6717\u7684\u7537\u5b69\u4eba\u8bbe\u4e0d\u4f1a\u9519"

    .line 30
    .line 31
    const-string v14, "\u70ed\u60c5\u56de\u590d\uff0c\u4f1a\u8ba9\u804a\u5929\u66f4\u6109\u54e6"

    .line 32
    .line 33
    const-string v15, "\u4e0d\u8981\u4e00\u5473\u8868\u8fbe\uff0c\u591a\u542cTa\u8bf4\u8bdd"

    .line 34
    .line 35
    filled-new-array/range {v1 .. v17}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    return-object v0
.end method

.method public static m0(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;)Lcom/p1/mobile/android/app/Dialog;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->Companion:Lcom/p1/mobile/putong/core/ui/onlinematch/c$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/c$a;->a()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->k()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 15
    .line 16
    new-instance v1, Ll/pf60;

    .line 17
    .line 18
    const-string v2, "match_success"

    .line 19
    .line 20
    invoke-direct {v1, v2, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ll/y20;ZZLcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V
    .locals 9

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isBell:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {p6}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p6}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p6}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    const-string p0, "\u5979"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const-string p0, "\u4ed6"

    .line 27
    .line 28
    :goto_0
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "%s\u5df2\u63d0\u524d\u9000\u51fa\u95ea\u804a"

    .line 33
    .line 34
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p6

    .line 46
    if-eqz p6, :cond_3

    .line 47
    .line 48
    sget-object p6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 49
    .line 50
    invoke-interface {p1, p6}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    :cond_3
    if-eqz p2, :cond_5

    .line 54
    .line 55
    if-eqz p3, :cond_4

    .line 56
    .line 57
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 60
    .line 61
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p1, p2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-static {p4, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->l0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/android/app/Dialog;

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 72
    .line 73
    const/4 v6, 0x0

    .line 74
    const/4 v7, 0x7

    .line 75
    const/4 v2, 0x0

    .line 76
    const/4 v3, 0x0

    .line 77
    const/4 v4, 0x0

    .line 78
    const/4 v5, 0x0

    .line 79
    move-object v0, p4

    .line 80
    move-object v8, p5

    .line 81
    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->q2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;ILjava/lang/String;)Landroid/content/Intent;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 86
    .line 87
    .line 88
    :cond_5
    :goto_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 91
    .line 92
    invoke-virtual {p1}, Ll/joa;->v4()Lrx/c;

    .line 93
    .line 94
    .line 95
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->a0(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public static n0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V
    .locals 6

    .line 1
    const-string v0, "get quick chat broadcase"

    .line 2
    .line 3
    invoke-static {v0}, Ll/t4j;->h(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-boolean v0, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->f:Z

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/a8d0;->x0()Ll/a8d0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, v1}, Ll/a8d0;->w0(I)Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :cond_0
    invoke-static {}, Ll/jxb0;->c()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-static {}, Ll/jxb0;->b()V

    .line 30
    .line 31
    .line 32
    :cond_1
    if-nez p1, :cond_2

    .line 33
    .line 34
    goto/16 :goto_0

    .line 35
    .line 36
    :cond_2
    instance-of v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    const-string v3, "notify_normal_state"

    .line 40
    .line 41
    const/4 v4, 0x1

    .line 42
    if-eqz v0, :cond_5

    .line 43
    .line 44
    iget-boolean v5, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isSquareDataWrapper:Z

    .line 45
    .line 46
    if-nez v5, :cond_5

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->A()Z

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    if-nez v5, :cond_3

    .line 53
    .line 54
    iget-boolean v5, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isMaleQuickChatRing:Z

    .line 55
    .line 56
    if-eqz v5, :cond_5

    .line 57
    .line 58
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I()Z

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-eqz v5, :cond_4

    .line 67
    .line 68
    iget-boolean v5, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isMaleQuickChatRing:Z

    .line 69
    .line 70
    if-eqz v5, :cond_5

    .line 71
    .line 72
    :cond_4
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 75
    .line 76
    invoke-virtual {v5}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 81
    .line 82
    .line 83
    move-result v5

    .line 84
    if-nez v5, :cond_5

    .line 85
    .line 86
    move-object v5, p0

    .line 87
    check-cast v5, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 88
    .line 89
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->h6()Z

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    if-nez v5, :cond_6

    .line 94
    .line 95
    :cond_5
    if-eqz v0, :cond_a

    .line 96
    .line 97
    iget-boolean v5, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isAudioBroadcast:Z

    .line 98
    .line 99
    if-eqz v5, :cond_a

    .line 100
    .line 101
    move-object v5, p0

    .line 102
    check-cast v5, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 103
    .line 104
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->h6()Z

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    if-eqz v5, :cond_a

    .line 109
    .line 110
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 111
    .line 112
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r6()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    if-eqz v0, :cond_7

    .line 119
    .line 120
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 121
    .line 122
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 123
    .line 124
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r6()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 129
    .line 130
    const-string v1, "VirtualCard"

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_7

    .line 137
    .line 138
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 139
    .line 140
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 141
    .line 142
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r6()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 147
    .line 148
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->UndoGuideCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 149
    .line 150
    if-eq v0, v1, :cond_10

    .line 151
    .line 152
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 153
    .line 154
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 155
    .line 156
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r6()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 161
    .line 162
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->SuperlikeGuideCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 163
    .line 164
    if-eq v0, v1, :cond_10

    .line 165
    .line 166
    :cond_7
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isAudioBroadcast:Z

    .line 167
    .line 168
    if-eqz v0, :cond_8

    .line 169
    .line 170
    invoke-static {}, Ll/wyb0;->O()Ll/wyb0;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {v0, v4}, Ll/wyb0;->U(Z)Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-nez v0, :cond_10

    .line 179
    .line 180
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L()Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    if-nez v0, :cond_10

    .line 189
    .line 190
    invoke-static {}, Ll/wyb0;->O()Ll/wyb0;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {v0}, Ll/wyb0;->Y()Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-eqz v0, :cond_8

    .line 199
    .line 200
    goto/16 :goto_0

    .line 201
    .line 202
    :cond_8
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 207
    .line 208
    new-instance v1, Ll/pf60;

    .line 209
    .line 210
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 214
    .line 215
    .line 216
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isAudioBroadcast:Z

    .line 217
    .line 218
    if-nez v0, :cond_9

    .line 219
    .line 220
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->G()V

    .line 225
    .line 226
    .line 227
    :cond_9
    invoke-static {}, Ll/a8d0;->x0()Ll/a8d0;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 232
    .line 233
    new-instance v1, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 234
    .line 235
    invoke-direct {v1, p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {v0, p0, v1}, Ll/a8d0;->B0(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)V

    .line 239
    .line 240
    .line 241
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isAudioBroadcast:Z

    .line 242
    .line 243
    if-eqz p0, :cond_10

    .line 244
    .line 245
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->w()V

    .line 250
    .line 251
    .line 252
    return-void

    .line 253
    :cond_a
    iget-boolean v5, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isAudioBroadcast:Z

    .line 254
    .line 255
    if-eqz v5, :cond_c

    .line 256
    .line 257
    invoke-static {}, Ll/wyb0;->O()Ll/wyb0;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    invoke-virtual {v1, v4}, Ll/wyb0;->U(Z)Z

    .line 262
    .line 263
    .line 264
    move-result v1

    .line 265
    if-nez v1, :cond_10

    .line 266
    .line 267
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L()Z

    .line 272
    .line 273
    .line 274
    move-result v1

    .line 275
    if-nez v1, :cond_10

    .line 276
    .line 277
    invoke-static {}, Ll/wyb0;->O()Ll/wyb0;

    .line 278
    .line 279
    .line 280
    move-result-object v1

    .line 281
    invoke-virtual {v1}, Ll/wyb0;->Y()Z

    .line 282
    .line 283
    .line 284
    move-result v1

    .line 285
    if-nez v1, :cond_10

    .line 286
    .line 287
    if-nez v0, :cond_b

    .line 288
    .line 289
    goto/16 :goto_0

    .line 290
    .line 291
    :cond_b
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 296
    .line 297
    new-instance v1, Ll/pf60;

    .line 298
    .line 299
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 303
    .line 304
    .line 305
    invoke-static {p0, v4, p1}, Ll/jxb0;->e(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V

    .line 306
    .line 307
    .line 308
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 309
    .line 310
    .line 311
    move-result-object p0

    .line 312
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->w()V

    .line 313
    .line 314
    .line 315
    return-void

    .line 316
    :cond_c
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isSquareDataWrapper:Z

    .line 317
    .line 318
    const-string v0, "tickets_broadcast"

    .line 319
    .line 320
    if-eqz p0, :cond_f

    .line 321
    .line 322
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 323
    .line 324
    .line 325
    move-result-object p0

    .line 326
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->t:Ll/byd0;

    .line 327
    .line 328
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    move-result-object p0

    .line 332
    check-cast p0, Ljava/lang/Long;

    .line 333
    .line 334
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 335
    .line 336
    .line 337
    move-result-wide v2

    .line 338
    invoke-static {v2, v3}, Ll/pzi0;->D(J)Z

    .line 339
    .line 340
    .line 341
    move-result p0

    .line 342
    if-nez p0, :cond_d

    .line 343
    .line 344
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 345
    .line 346
    .line 347
    move-result-object p0

    .line 348
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->s:Ll/vxd0;

    .line 349
    .line 350
    const/4 v2, 0x0

    .line 351
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 352
    .line 353
    .line 354
    move-result-object v2

    .line 355
    invoke-virtual {p0, v2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 356
    .line 357
    .line 358
    :cond_d
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 359
    .line 360
    .line 361
    move-result-object p0

    .line 362
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->s:Ll/vxd0;

    .line 363
    .line 364
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 365
    .line 366
    .line 367
    move-result-object p0

    .line 368
    check-cast p0, Ljava/lang/Integer;

    .line 369
    .line 370
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 371
    .line 372
    .line 373
    move-result p0

    .line 374
    if-le p0, v1, :cond_e

    .line 375
    .line 376
    goto :goto_0

    .line 377
    :cond_e
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 378
    .line 379
    .line 380
    move-result-object p0

    .line 381
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->t:Ll/byd0;

    .line 382
    .line 383
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    move-result-object p0

    .line 387
    check-cast p0, Ljava/lang/Long;

    .line 388
    .line 389
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 390
    .line 391
    .line 392
    move-result-wide v1

    .line 393
    invoke-static {v1, v2, v4}, Ll/pzi0;->w(JI)Z

    .line 394
    .line 395
    .line 396
    move-result p0

    .line 397
    if-eqz p0, :cond_10

    .line 398
    .line 399
    sget-object p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->Companion:Lcom/p1/mobile/putong/core/ui/onlinematch/c$a;

    .line 400
    .line 401
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/c$a;->a()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 402
    .line 403
    .line 404
    move-result-object p0

    .line 405
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->k()V

    .line 406
    .line 407
    .line 408
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 409
    .line 410
    .line 411
    move-result-object p0

    .line 412
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 413
    .line 414
    new-instance v1, Ll/pf60;

    .line 415
    .line 416
    invoke-direct {v1, v0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 417
    .line 418
    .line 419
    invoke-virtual {p0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 420
    .line 421
    .line 422
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 423
    .line 424
    .line 425
    move-result-object p0

    .line 426
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->w()V

    .line 427
    .line 428
    .line 429
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 430
    .line 431
    .line 432
    move-result-object p0

    .line 433
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->t:Ll/byd0;

    .line 434
    .line 435
    invoke-static {}, Ll/pzi0;->o()J

    .line 436
    .line 437
    .line 438
    move-result-wide v0

    .line 439
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 440
    .line 441
    .line 442
    move-result-object p1

    .line 443
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 444
    .line 445
    .line 446
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 447
    .line 448
    .line 449
    move-result-object p0

    .line 450
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->s:Ll/vxd0;

    .line 451
    .line 452
    invoke-virtual {p0, v4}, Ll/vxd0;->a(I)V

    .line 453
    .line 454
    .line 455
    return-void

    .line 456
    :cond_f
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 457
    .line 458
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 459
    .line 460
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/v;->T:Ll/jxd0;

    .line 461
    .line 462
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 463
    .line 464
    .line 465
    move-result-object p0

    .line 466
    check-cast p0, Ljava/lang/Boolean;

    .line 467
    .line 468
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 469
    .line 470
    .line 471
    move-result p0

    .line 472
    if-eqz p0, :cond_11

    .line 473
    .line 474
    :cond_10
    :goto_0
    return-void

    .line 475
    :cond_11
    sget-object p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->Companion:Lcom/p1/mobile/putong/core/ui/onlinematch/c$a;

    .line 476
    .line 477
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/c$a;->a()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 478
    .line 479
    .line 480
    move-result-object p0

    .line 481
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->k()V

    .line 482
    .line 483
    .line 484
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 485
    .line 486
    .line 487
    move-result-object p0

    .line 488
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 489
    .line 490
    new-instance v1, Ll/pf60;

    .line 491
    .line 492
    invoke-direct {v1, v0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 493
    .line 494
    .line 495
    invoke-virtual {p0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 496
    .line 497
    .line 498
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 499
    .line 500
    .line 501
    move-result-object p0

    .line 502
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->w()V

    .line 503
    .line 504
    .line 505
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isBell:Z

    .line 506
    .line 507
    if-eqz p0, :cond_12

    .line 508
    .line 509
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 510
    .line 511
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 512
    .line 513
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->tracker:Ljava/lang/String;

    .line 514
    .line 515
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/v;->N4(Ljava/lang/String;)Lrx/c;

    .line 516
    .line 517
    .line 518
    return-void

    .line 519
    :cond_12
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isSpeedMatch:Z

    .line 520
    .line 521
    if-eqz p0, :cond_13

    .line 522
    .line 523
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 524
    .line 525
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 526
    .line 527
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->tracker:Ljava/lang/String;

    .line 528
    .line 529
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/v;->O4(Ljava/lang/String;)Lrx/c;

    .line 530
    .line 531
    .line 532
    return-void

    .line 533
    :cond_13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 534
    .line 535
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 536
    .line 537
    const-string v0, ""

    .line 538
    .line 539
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 540
    .line 541
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/api/v;->P4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 542
    .line 543
    .line 544
    return-void
.end method

.method public static synthetic o(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/a5i0;->Q0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static o0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;)V
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/lqb;->f5()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    new-array v2, v1, [Z

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    aput-boolean v1, v2, v3

    .line 14
    .line 15
    invoke-static {p1}, Ll/a5i0;->N1(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/l4g0;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    new-instance v4, Ll/ugy$a;

    .line 20
    .line 21
    invoke-direct {v4, p0}, Ll/ugy$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/gra;->L1()Z

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    if-eqz v5, :cond_0

    .line 29
    .line 30
    invoke-static {}, Ll/qs50;->d()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Jk:I

    .line 36
    .line 37
    invoke-virtual {p0, v5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    :goto_0
    invoke-virtual {v4, v5}, Ll/ugy$a;->D(Ljava/lang/String;)Ll/ugy$a;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Wp:I

    .line 46
    .line 47
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 48
    .line 49
    .line 50
    move-result-object v6

    .line 51
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v7, " %d "

    .line 60
    .line 61
    invoke-static {v6, v7, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p0, v5, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const-string v5, "#FE7E1D"

    .line 74
    .line 75
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    const/4 v6, 0x2

    .line 80
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 81
    .line 82
    .line 83
    move-result-object v6

    .line 84
    invoke-static {v0, v5, v6}, Ll/q8g0;->N(Ljava/lang/String;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    const-string v5, "\r\n"

    .line 89
    .line 90
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-static {}, Ll/gra;->L1()Z

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    if-eqz v5, :cond_1

    .line 99
    .line 100
    const-string v5, "\u6b21\u6570\u7528\u5b8c\u4e86\uff0c\u53ef\u4ee5\u7528\u63a2\u63a2\u5e01\u8d2d\u4e70\u66f4\u591a"

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_1
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Y1:I

    .line 104
    .line 105
    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    :goto_1
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v4, v0}, Ll/ugy$a;->C(Ljava/lang/CharSequence;)Ll/ugy$a;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    const-string v4, "https://auto.tancdn.com/v1/raw/a55966de-3b5d-45e5-9c7f-3560d6843d0b10.pdf"

    .line 118
    .line 119
    invoke-virtual {v0, v4, v1}, Ll/ugy$a;->r(Ljava/lang/String;I)Ll/ugy$a;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    sget v1, Ll/dbc0;->lo:I

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ll/ugy$a;->s(I)Ll/ugy$a;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Xp:I

    .line 130
    .line 131
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    new-instance v4, Ll/ht50;

    .line 136
    .line 137
    invoke-direct {v4, p1, v2, p2}, Ll/ht50;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;[ZLl/x20;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, v1, v4}, Ll/ugy$a;->x(Ljava/lang/CharSequence;Ll/y20;)Ll/ugy$a;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    sget p2, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 145
    .line 146
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    new-instance p2, Ll/it50;

    .line 151
    .line 152
    invoke-direct {p2, v2, p3}, Ll/it50;-><init>([ZLl/x20;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p1, p0, p2}, Ll/ugy$a;->v(Ljava/lang/CharSequence;Ll/y20;)Ll/ugy$a;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-virtual {p1}, Ll/a5i0;->D0()Z

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    invoke-virtual {p0, p1}, Ll/ugy$a;->z(Z)Ll/ugy$a;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    sget p1, Lcom/p1/mobile/putong/core/R$string;->dm:I

    .line 172
    .line 173
    new-instance p2, Ll/jt50;

    .line 174
    .line 175
    invoke-direct {p2}, Ll/jt50;-><init>()V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p0, p1, p2}, Ll/ugy$a;->w(ILandroid/widget/CompoundButton$OnCheckedChangeListener;)Ll/ugy$a;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    new-instance p1, Ll/kt50;

    .line 183
    .line 184
    invoke-direct {p1, v2, p3}, Ll/kt50;-><init>([ZLl/x20;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p0, p1}, Ll/ugy$a;->B(Landroid/content/DialogInterface$OnDismissListener;)Ll/ugy$a;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-virtual {p0}, Ll/ugy$a;->t()Ll/ugy;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    invoke-virtual {p0, v3}, Ll/ugy;->m(Ll/l4g0;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p0}, Ll/ugy;->n()V

    .line 199
    .line 200
    .line 201
    return-void
.end method

.method public static synthetic p(Lrx/c;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/xs50;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/xs50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/ys50;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Ll/ys50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Ll/zs50;

    .line 20
    .line 21
    invoke-direct {v0, p1}, Ll/zs50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance v0, Ll/at50;

    .line 29
    .line 30
    invoke-direct {v0, p1}, Ll/at50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public static p0()Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->V()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_ONLINE_MATCH_TICKETS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_ONLINE_MATCH_TICKETS_EXTRA:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 11
    .line 12
    return-object v0
.end method

.method public static synthetic q([ZLl/x20;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    aget-boolean p0, p0, p2

    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-interface {p1}, Ll/x20;->call()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ydi;->r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s()Ljava/util/List;
    .locals 11

    .line 1
    const-string v9, "\u5c11\u7528\u5957\u8def\uff0c\u591a\u70b9\u771f\u8bda"

    .line 2
    .line 3
    const-string v10, "\u5b8c\u5584\u8d44\u6599\u5361\uff0c\u6709\u52a9\u4e8e\u4ea4\u53cb\u54e6"

    .line 4
    .line 5
    const-string v0, "\u79ef\u6781\u56de\u5e94\uff0c\u522b\u9519\u8fc7\u5bf9\u7684\u4eba\u54e6"

    .line 6
    .line 7
    const-string v1, "\u591a\u804a\u5929\uff0c\u953b\u70bc\u4f60\u7684\u793e\u4ea4\u529b\u5427"

    .line 8
    .line 9
    const-string v2, "\u771f\u8bda\u8868\u8fbe\uff0c\u4e0d\u505a\u804a\u5929\u7ec8\u7ed3\u8005"

    .line 10
    .line 11
    const-string v3, "\u5c3d\u91cf\u5c11\u7528\u51b7\u6f20\u7684\u5355\u5b57\u56de\u5e94\u54e6"

    .line 12
    .line 13
    const-string v4, "\u771f\u8bda\u7684\u804a\u5929\uff0c\u6bd4\u5916\u8868\u66f4\u91cd\u8981"

    .line 14
    .line 15
    const-string v5, "\u4eab\u53d7\u804a\u5929\uff0c\u6bcf\u4e2a\u4eba\u90fd\u5f88\u6709\u8da3"

    .line 16
    .line 17
    const-string v6, "\u4e3b\u52a8\u4e00\u4e9b\uff0c\u4f1a\u8d62\u5f97\u66f4\u591a\u597d\u611f"

    .line 18
    .line 19
    const-string v7, "\u4e00\u76f4\u8bf4\u548c\u4e00\u76f4\u4e0d\u8bf4\u90fd\u4e0d\u793c\u8c8c"

    .line 20
    .line 21
    const-string v8, "\u5927\u65b9\u8bf4\u51fa\u81ea\u5df1\u7684\u4f18\u70b9\u5427"

    .line 22
    .line 23
    filled-new-array/range {v0 .. v10}, [Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    return-object v0
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static u()I
    .locals 7

    .line 1
    const v0, 0x49b3f

    .line 2
    .line 3
    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const v1, 0x58f77

    .line 9
    .line 10
    .line 11
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget-object v2, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->e:Ljava/util/Map;

    .line 16
    .line 17
    invoke-interface {v2}, Ljava/util/Map;->size()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    const/16 v4, 0xb

    .line 22
    .line 23
    if-gtz v3, :cond_0

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    const v5, 0x3be5f

    .line 31
    .line 32
    .line 33
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    invoke-static {v5, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    const/4 v3, 0x1

    .line 45
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    const v5, 0x25cae

    .line 50
    .line 51
    .line 52
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    const v6, 0x42c10

    .line 57
    .line 58
    .line 59
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    invoke-static {v5, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    const/4 v3, 0x2

    .line 71
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    const v5, 0x17f03

    .line 76
    .line 77
    .line 78
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    const v6, 0x2a1e4

    .line 83
    .line 84
    .line 85
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    invoke-static {v5, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    const/4 v3, 0x3

    .line 97
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    const v5, 0x1076c

    .line 102
    .line 103
    .line 104
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    const v6, 0x1aada

    .line 109
    .line 110
    .line 111
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 112
    .line 113
    .line 114
    move-result-object v6

    .line 115
    invoke-static {v5, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    const/4 v3, 0x4

    .line 123
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    const v5, 0xec62

    .line 128
    .line 129
    .line 130
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 131
    .line 132
    .line 133
    move-result-object v5

    .line 134
    const v6, 0x12592

    .line 135
    .line 136
    .line 137
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 138
    .line 139
    .line 140
    move-result-object v6

    .line 141
    invoke-static {v5, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 142
    .line 143
    .line 144
    move-result-object v5

    .line 145
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    const/4 v3, 0x5

    .line 149
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    const v5, 0x15c96

    .line 154
    .line 155
    .line 156
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 157
    .line 158
    .line 159
    move-result-object v5

    .line 160
    const v6, 0x290c4

    .line 161
    .line 162
    .line 163
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 164
    .line 165
    .line 166
    move-result-object v6

    .line 167
    invoke-static {v5, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 168
    .line 169
    .line 170
    move-result-object v5

    .line 171
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    const/4 v3, 0x6

    .line 175
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    const v5, 0x24d50

    .line 180
    .line 181
    .line 182
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 183
    .line 184
    .line 185
    move-result-object v5

    .line 186
    const v6, 0x37245

    .line 187
    .line 188
    .line 189
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 190
    .line 191
    .line 192
    move-result-object v6

    .line 193
    invoke-static {v5, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 194
    .line 195
    .line 196
    move-result-object v5

    .line 197
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    const/4 v3, 0x7

    .line 201
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    const v5, 0x317a8

    .line 206
    .line 207
    .line 208
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 209
    .line 210
    .line 211
    move-result-object v5

    .line 212
    const v6, 0x44ff2

    .line 213
    .line 214
    .line 215
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 216
    .line 217
    .line 218
    move-result-object v6

    .line 219
    invoke-static {v5, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 220
    .line 221
    .line 222
    move-result-object v5

    .line 223
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    const/16 v3, 0x8

    .line 227
    .line 228
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 229
    .line 230
    .line 231
    move-result-object v3

    .line 232
    const v5, 0x390fe

    .line 233
    .line 234
    .line 235
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 236
    .line 237
    .line 238
    move-result-object v5

    .line 239
    const v6, 0x4cd32

    .line 240
    .line 241
    .line 242
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 243
    .line 244
    .line 245
    move-result-object v6

    .line 246
    invoke-static {v5, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 247
    .line 248
    .line 249
    move-result-object v5

    .line 250
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    .line 252
    .line 253
    const/16 v3, 0x9

    .line 254
    .line 255
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 256
    .line 257
    .line 258
    move-result-object v3

    .line 259
    const v5, 0x3f894

    .line 260
    .line 261
    .line 262
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 263
    .line 264
    .line 265
    move-result-object v5

    .line 266
    const v6, 0x534d4

    .line 267
    .line 268
    .line 269
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 270
    .line 271
    .line 272
    move-result-object v6

    .line 273
    invoke-static {v5, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 274
    .line 275
    .line 276
    move-result-object v5

    .line 277
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    const/16 v3, 0xa

    .line 281
    .line 282
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 283
    .line 284
    .line 285
    move-result-object v3

    .line 286
    const v5, 0x4c518

    .line 287
    .line 288
    .line 289
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 290
    .line 291
    .line 292
    move-result-object v5

    .line 293
    const v6, 0x54065

    .line 294
    .line 295
    .line 296
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 297
    .line 298
    .line 299
    move-result-object v6

    .line 300
    invoke-static {v5, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 301
    .line 302
    .line 303
    move-result-object v5

    .line 304
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 308
    .line 309
    .line 310
    move-result-object v3

    .line 311
    const v5, 0x4cfb1

    .line 312
    .line 313
    .line 314
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 315
    .line 316
    .line 317
    move-result-object v5

    .line 318
    const v6, 0x57c17

    .line 319
    .line 320
    .line 321
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 322
    .line 323
    .line 324
    move-result-object v6

    .line 325
    invoke-static {v5, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 326
    .line 327
    .line 328
    move-result-object v5

    .line 329
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 330
    .line 331
    .line 332
    const/16 v3, 0xc

    .line 333
    .line 334
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 335
    .line 336
    .line 337
    move-result-object v3

    .line 338
    const v5, 0x49317

    .line 339
    .line 340
    .line 341
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 342
    .line 343
    .line 344
    move-result-object v5

    .line 345
    const v6, 0x5522c

    .line 346
    .line 347
    .line 348
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 349
    .line 350
    .line 351
    move-result-object v6

    .line 352
    invoke-static {v5, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 353
    .line 354
    .line 355
    move-result-object v5

    .line 356
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    .line 358
    .line 359
    const/16 v3, 0xd

    .line 360
    .line 361
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 362
    .line 363
    .line 364
    move-result-object v3

    .line 365
    const v5, 0x4dffa

    .line 366
    .line 367
    .line 368
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 369
    .line 370
    .line 371
    move-result-object v5

    .line 372
    const v6, 0x5666a

    .line 373
    .line 374
    .line 375
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 376
    .line 377
    .line 378
    move-result-object v6

    .line 379
    invoke-static {v5, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 380
    .line 381
    .line 382
    move-result-object v5

    .line 383
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    const/16 v3, 0xe

    .line 387
    .line 388
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 389
    .line 390
    .line 391
    move-result-object v3

    .line 392
    const v5, 0x4e3c0

    .line 393
    .line 394
    .line 395
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 396
    .line 397
    .line 398
    move-result-object v5

    .line 399
    const v6, 0x57383

    .line 400
    .line 401
    .line 402
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 403
    .line 404
    .line 405
    move-result-object v6

    .line 406
    invoke-static {v5, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 407
    .line 408
    .line 409
    move-result-object v5

    .line 410
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 411
    .line 412
    .line 413
    const/16 v3, 0xf

    .line 414
    .line 415
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 416
    .line 417
    .line 418
    move-result-object v3

    .line 419
    const v5, 0x4c957

    .line 420
    .line 421
    .line 422
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 423
    .line 424
    .line 425
    move-result-object v5

    .line 426
    const v6, 0x55ee6

    .line 427
    .line 428
    .line 429
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 430
    .line 431
    .line 432
    move-result-object v6

    .line 433
    invoke-static {v5, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 434
    .line 435
    .line 436
    move-result-object v5

    .line 437
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 438
    .line 439
    .line 440
    const/16 v3, 0x10

    .line 441
    .line 442
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 443
    .line 444
    .line 445
    move-result-object v3

    .line 446
    const v5, 0x4eba3

    .line 447
    .line 448
    .line 449
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 450
    .line 451
    .line 452
    move-result-object v5

    .line 453
    const v6, 0x5847b

    .line 454
    .line 455
    .line 456
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 457
    .line 458
    .line 459
    move-result-object v6

    .line 460
    invoke-static {v5, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 461
    .line 462
    .line 463
    move-result-object v5

    .line 464
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 465
    .line 466
    .line 467
    const/16 v3, 0x11

    .line 468
    .line 469
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 470
    .line 471
    .line 472
    move-result-object v3

    .line 473
    const v5, 0x56608

    .line 474
    .line 475
    .line 476
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 477
    .line 478
    .line 479
    move-result-object v5

    .line 480
    invoke-static {v0, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 481
    .line 482
    .line 483
    move-result-object v5

    .line 484
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 485
    .line 486
    .line 487
    const/16 v3, 0x12

    .line 488
    .line 489
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 490
    .line 491
    .line 492
    move-result-object v3

    .line 493
    const v5, 0x54721

    .line 494
    .line 495
    .line 496
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 497
    .line 498
    .line 499
    move-result-object v5

    .line 500
    invoke-static {v0, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 501
    .line 502
    .line 503
    move-result-object v0

    .line 504
    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 505
    .line 506
    .line 507
    const/16 v0, 0x13

    .line 508
    .line 509
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 510
    .line 511
    .line 512
    move-result-object v0

    .line 513
    const v3, 0x4d5dc

    .line 514
    .line 515
    .line 516
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 517
    .line 518
    .line 519
    move-result-object v3

    .line 520
    const v5, 0x58eb7

    .line 521
    .line 522
    .line 523
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 524
    .line 525
    .line 526
    move-result-object v5

    .line 527
    invoke-static {v3, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 528
    .line 529
    .line 530
    move-result-object v3

    .line 531
    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 532
    .line 533
    .line 534
    const/16 v0, 0x14

    .line 535
    .line 536
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 537
    .line 538
    .line 539
    move-result-object v0

    .line 540
    const v3, 0x51772

    .line 541
    .line 542
    .line 543
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 544
    .line 545
    .line 546
    move-result-object v3

    .line 547
    const v5, 0x63d60

    .line 548
    .line 549
    .line 550
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 551
    .line 552
    .line 553
    move-result-object v5

    .line 554
    invoke-static {v3, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 555
    .line 556
    .line 557
    move-result-object v3

    .line 558
    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 559
    .line 560
    .line 561
    const/16 v0, 0x15

    .line 562
    .line 563
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 564
    .line 565
    .line 566
    move-result-object v0

    .line 567
    const v3, 0x5b777

    .line 568
    .line 569
    .line 570
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 571
    .line 572
    .line 573
    move-result-object v3

    .line 574
    const v5, 0x6b955

    .line 575
    .line 576
    .line 577
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 578
    .line 579
    .line 580
    move-result-object v5

    .line 581
    invoke-static {v3, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 582
    .line 583
    .line 584
    move-result-object v3

    .line 585
    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 586
    .line 587
    .line 588
    const/16 v0, 0x16

    .line 589
    .line 590
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 591
    .line 592
    .line 593
    move-result-object v0

    .line 594
    const v3, 0x61553

    .line 595
    .line 596
    .line 597
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 598
    .line 599
    .line 600
    move-result-object v3

    .line 601
    const v5, 0x6d58c

    .line 602
    .line 603
    .line 604
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 605
    .line 606
    .line 607
    move-result-object v5

    .line 608
    invoke-static {v3, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 609
    .line 610
    .line 611
    move-result-object v3

    .line 612
    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 613
    .line 614
    .line 615
    const/16 v0, 0x17

    .line 616
    .line 617
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 618
    .line 619
    .line 620
    move-result-object v0

    .line 621
    const v3, 0x5e49f

    .line 622
    .line 623
    .line 624
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 625
    .line 626
    .line 627
    move-result-object v3

    .line 628
    invoke-static {v3, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 629
    .line 630
    .line 631
    move-result-object v1

    .line 632
    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 633
    .line 634
    .line 635
    :cond_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 636
    .line 637
    .line 638
    move-result-object v0

    .line 639
    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    .line 640
    .line 641
    .line 642
    move-result v0

    .line 643
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 644
    .line 645
    .line 646
    move-result-object v0

    .line 647
    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 648
    .line 649
    .line 650
    move-result-object v0

    .line 651
    check-cast v0, Ll/pf60;

    .line 652
    .line 653
    iget-object v1, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 654
    .line 655
    check-cast v1, Ljava/lang/Integer;

    .line 656
    .line 657
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 658
    .line 659
    .line 660
    move-result v1

    .line 661
    iget-object v2, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 662
    .line 663
    check-cast v2, Ljava/lang/Integer;

    .line 664
    .line 665
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 666
    .line 667
    .line 668
    move-result v2

    .line 669
    sub-int/2addr v1, v2

    .line 670
    int-to-double v1, v1

    .line 671
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 672
    .line 673
    .line 674
    move-result-wide v3

    .line 675
    mul-double/2addr v1, v3

    .line 676
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 677
    .line 678
    check-cast v0, Ljava/lang/Integer;

    .line 679
    .line 680
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 681
    .line 682
    .line 683
    move-result v0

    .line 684
    int-to-double v3, v0

    .line 685
    add-double/2addr v1, v3

    .line 686
    double-to-int v0, v1

    .line 687
    return v0
.end method

.method public static v(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->subCode:I

    .line 2
    .line 3
    sparse-switch p0, :sswitch_data_0

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return p0

    .line 8
    :sswitch_0
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    nop

    .line 11
    :sswitch_data_0
    .sparse-switch
        0x92ff9 -> :sswitch_0
        0x92ffd -> :sswitch_0
        0x9318a -> :sswitch_0
        0x9350a -> :sswitch_0
    .end sparse-switch
.end method

.method public static w(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-static {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->y(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;IZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static x(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->y(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static y(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;IZ)V
    .locals 1

    .line 1
    const/16 p3, 0x64

    .line 2
    .line 3
    if-ne p2, p3, :cond_0

    .line 4
    .line 5
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 6
    .line 7
    invoke-virtual {p2, p0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->z(I)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iget-object p3, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p3, Ljava/lang/Integer;

    .line 18
    .line 19
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    if-lez p3, :cond_1

    .line 24
    .line 25
    iget-object p3, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast p3, Ljava/lang/Integer;

    .line 28
    .line 29
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    if-lez p3, :cond_1

    .line 34
    .line 35
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object v0, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v0, Ljava/lang/Integer;

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast p2, Ljava/lang/Integer;

    .line 52
    .line 53
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    invoke-virtual {p3, p0, p1, v0, p2}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 62
    .line 63
    invoke-virtual {p2, p0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public static z(I)Ll/pf60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    rsub-int/lit8 p0, p0, 0x64

    .line 8
    .line 9
    div-int/lit8 p0, p0, 0x3

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method
