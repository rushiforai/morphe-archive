.class public final Ll/dng0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final i:Ljava/lang/String;


# instance fields
.field public final a:J

.field public final b:Ljava/util/ArrayList;

.field public c:Z

.field public final d:Ll/glg0;

.field public final e:Ll/cmg0;

.field public f:J

.field public g:J

.field public h:Ll/qxg0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Ll/dng0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "SudGIP "

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/dng0;->i:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(J)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/dng0;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/dng0;->c:Z

    .line 13
    .line 14
    iput-wide p1, p0, Ll/dng0;->a:J

    .line 15
    .line 16
    sget-object p1, Ll/dlg0;->c:Ll/dlg0;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p2, p1, Ll/dlg0;->b:Ll/glg0;

    .line 21
    .line 22
    iput-object p2, p0, Ll/dng0;->d:Ll/glg0;

    .line 23
    .line 24
    iget-object p1, p1, Ll/dlg0;->a:Ll/cmg0;

    .line 25
    .line 26
    iput-object p1, p0, Ll/dng0;->e:Ll/cmg0;

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const-string p0, "SudGameRuntime hasn\'t been initialized"

    .line 30
    .line 31
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    throw p0
.end method


# virtual methods
.method public final a(ILjava/lang/String;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/dng0;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    move v3, v2

    .line 9
    :goto_0
    if-ge v3, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    add-int/lit8 v3, v3, 0x1

    .line 16
    .line 17
    check-cast v4, Ltech/sud/gip/core/ISudListenerPreloadMGPkg;

    .line 18
    .line 19
    iget-wide v5, p0, Ll/dng0;->a:J

    .line 20
    .line 21
    invoke-interface {v4, v5, v6, p1, p2}, Ltech/sud/gip/core/ISudListenerPreloadMGPkg;->onPreloadFailure(JILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iput-boolean v2, p0, Ll/dng0;->c:Z

    .line 26
    .line 27
    iget-object p1, p0, Ll/dng0;->b:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/dng0;->h:Ll/qxg0;

    .line 33
    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-wide v0, p0, Ll/dng0;->a:J

    .line 37
    .line 38
    iget-object p0, p1, Ll/qxg0;->a:Ll/wxg0;

    .line 39
    .line 40
    iget-object p0, p0, Ll/wxg0;->a:Ljava/util/HashMap;

    .line 41
    .line 42
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public final b(Ltech/sud/gip/core/GameInfo;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/dng0;->e:Ll/cmg0;

    .line 2
    .line 3
    iget v2, p1, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 4
    .line 5
    iget-wide v3, p1, Ltech/sud/gip/core/GameInfo;->mgId:J

    .line 6
    .line 7
    iget-object v5, p1, Ltech/sud/gip/core/GameInfo;->version:Ljava/lang/String;

    .line 8
    .line 9
    new-instance v6, Ll/bng0;

    .line 10
    .line 11
    invoke-direct {v6, p0, p1}, Ll/bng0;-><init>(Ll/dng0;Ltech/sud/gip/core/GameInfo;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    if-ne p0, v2, :cond_0

    .line 16
    .line 17
    iget-object v1, v0, Ll/cmg0;->a:Ll/nsg0;

    .line 18
    .line 19
    invoke-virtual/range {v1 .. v6}, Ll/vog0;->d(IJLjava/lang/String;Ll/uog0;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/4 p0, 0x5

    .line 24
    if-ne p0, v2, :cond_1

    .line 25
    .line 26
    iget-object v1, v0, Ll/cmg0;->b:Ll/osg0;

    .line 27
    .line 28
    invoke-virtual/range {v1 .. v6}, Ll/vog0;->d(IJLjava/lang/String;Ll/uog0;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final c(Ltech/sud/gip/core/GameInfo;ZLjava/lang/String;Z)V
    .locals 3

    .line 1
    iget-boolean p3, p0, Ll/dng0;->c:Z

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    goto/16 :goto_2

    .line 6
    .line 7
    :cond_0
    sget-object p3, Ll/dng0;->i:Ljava/lang/String;

    .line 8
    .line 9
    new-instance p4, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v0, "preload isGameInstalled isInstalled="

    .line 12
    .line 13
    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    invoke-static {p3, p4}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    if-eqz p2, :cond_2

    .line 27
    .line 28
    const-string p1, "SudGamePkgPreloadTask"

    .line 29
    .line 30
    const-string p2, "preload gamepackage is installed"

    .line 31
    .line 32
    invoke-static {p1, p2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p3, p2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/dng0;->b:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    const/4 p3, 0x0

    .line 45
    move p4, p3

    .line 46
    :goto_0
    if-ge p4, p2, :cond_1

    .line 47
    .line 48
    invoke-virtual {p1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    add-int/lit8 p4, p4, 0x1

    .line 53
    .line 54
    check-cast v0, Ltech/sud/gip/core/ISudListenerPreloadMGPkg;

    .line 55
    .line 56
    iget-wide v1, p0, Ll/dng0;->a:J

    .line 57
    .line 58
    invoke-interface {v0, v1, v2}, Ltech/sud/gip/core/ISudListenerPreloadMGPkg;->onPreloadSuccess(J)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iput-boolean p3, p0, Ll/dng0;->c:Z

    .line 63
    .line 64
    iget-object p1, p0, Ll/dng0;->b:Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Ll/dng0;->h:Ll/qxg0;

    .line 70
    .line 71
    if-eqz p1, :cond_6

    .line 72
    .line 73
    iget-wide p2, p0, Ll/dng0;->a:J

    .line 74
    .line 75
    iget-object p0, p1, Ll/qxg0;->a:Ll/wxg0;

    .line 76
    .line 77
    iget-object p0, p0, Ll/wxg0;->a:Ljava/util/HashMap;

    .line 78
    .line 79
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    iget p2, p1, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 88
    .line 89
    const/4 p3, 0x1

    .line 90
    if-ne p3, p2, :cond_3

    .line 91
    .line 92
    iget-object p2, p1, Ltech/sud/gip/core/GameInfo;->eUrl:Ljava/lang/String;

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_3
    const-string p2, ""

    .line 96
    .line 97
    :goto_1
    if-eqz p2, :cond_7

    .line 98
    .line 99
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 100
    .line 101
    .line 102
    move-result p4

    .line 103
    if-eqz p4, :cond_4

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_4
    new-instance p4, Ll/oqg0;

    .line 107
    .line 108
    invoke-direct {p4}, Ll/oqg0;-><init>()V

    .line 109
    .line 110
    .line 111
    iget v0, p1, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 112
    .line 113
    iput v0, p4, Ll/oqg0;->a:I

    .line 114
    .line 115
    sget-object v0, LSudabstract/Sudfor;->Sudint:LSudabstract/Sudfor;

    .line 116
    .line 117
    iput-object v0, p4, Ll/oqg0;->b:LSudabstract/Sudfor;

    .line 118
    .line 119
    iget-wide v0, p1, Ltech/sud/gip/core/GameInfo;->mgId:J

    .line 120
    .line 121
    iput-wide v0, p4, Ll/oqg0;->c:J

    .line 122
    .line 123
    iput-object p2, p4, Ll/oqg0;->d:Ljava/lang/String;

    .line 124
    .line 125
    iget-object p2, p1, Ltech/sud/gip/core/GameInfo;->version:Ljava/lang/String;

    .line 126
    .line 127
    iput-object p2, p4, Ll/oqg0;->e:Ljava/lang/String;

    .line 128
    .line 129
    iget-object p2, p1, Ltech/sud/gip/core/GameInfo;->hash:Ljava/lang/String;

    .line 130
    .line 131
    iput-object p2, p4, Ll/oqg0;->f:Ljava/lang/String;

    .line 132
    .line 133
    new-instance p2, Ll/ukg0;

    .line 134
    .line 135
    const-string v0, "checkoutGamePkg"

    .line 136
    .line 137
    invoke-direct {p2, v0}, Ll/ukg0;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    iget v0, p1, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 141
    .line 142
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iget-object v1, p2, Ll/ukg0;->j:Ljava/util/HashMap;

    .line 147
    .line 148
    const-string v2, "engine"

    .line 149
    .line 150
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    const/4 v0, 0x4

    .line 154
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    iget-object v1, p2, Ll/ukg0;->j:Ljava/util/HashMap;

    .line 159
    .line 160
    const-string v2, "package_type"

    .line 161
    .line 162
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    iget-wide v0, p1, Ltech/sud/gip/core/GameInfo;->mgId:J

    .line 166
    .line 167
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    iput-object p1, p2, Ll/ukg0;->g:Ljava/lang/String;

    .line 172
    .line 173
    iget-object p1, p0, Ll/dng0;->e:Ll/cmg0;

    .line 174
    .line 175
    new-instance v0, Ll/vmg0;

    .line 176
    .line 177
    invoke-direct {v0, p0, p2}, Ll/vmg0;-><init>(Ll/dng0;Ll/ukg0;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 181
    .line 182
    .line 183
    iget p0, p4, Ll/oqg0;->a:I

    .line 184
    .line 185
    if-ne p3, p0, :cond_5

    .line 186
    .line 187
    iget-object p0, p1, Ll/cmg0;->a:Ll/nsg0;

    .line 188
    .line 189
    invoke-virtual {p0, p4, v0}, Ll/vog0;->a(Ll/oqg0;Ll/klg0;)J

    .line 190
    .line 191
    .line 192
    return-void

    .line 193
    :cond_5
    const/4 p2, 0x5

    .line 194
    if-ne p2, p0, :cond_6

    .line 195
    .line 196
    iget-object p0, p1, Ll/cmg0;->b:Ll/osg0;

    .line 197
    .line 198
    invoke-virtual {p0, p4, v0}, Ll/vog0;->a(Ll/oqg0;Ll/klg0;)J

    .line 199
    .line 200
    .line 201
    :cond_6
    :goto_2
    return-void

    .line 202
    :cond_7
    :goto_3
    const/4 p1, -0x1

    .line 203
    const-string p2, "null == gameInfo.eUrl || gameInfo.eUrl.isEmpty()"

    .line 204
    .line 205
    invoke-virtual {p0, p1, p2}, Ll/dng0;->a(ILjava/lang/String;)V

    .line 206
    .line 207
    .line 208
    return-void
.end method
