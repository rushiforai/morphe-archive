.class public final Ll/gmg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bkg0;


# static fields
.field public static final g:Ljava/lang/String;


# instance fields
.field public final a:Ll/mrg0;

.field public final b:Landroid/content/Context;

.field public final c:Ll/cmg0;

.field public d:Ltech/sud/gip/core/GameInfo;

.field public e:Z

.field public final f:Ltech/sud/gip/core/SudLoadMGParamModel;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Ll/gmg0;

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
    sput-object v0, Ll/gmg0;->g:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ltech/sud/gip/core/SudLoadMGParamModel;Ll/dlg0;Ll/mrg0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/gmg0;->e:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/gmg0;->b:Landroid/content/Context;

    .line 8
    .line 9
    iput-object p2, p0, Ll/gmg0;->f:Ltech/sud/gip/core/SudLoadMGParamModel;

    .line 10
    .line 11
    iput-object p4, p0, Ll/gmg0;->a:Ll/mrg0;

    .line 12
    .line 13
    iget-object p1, p3, Ll/dlg0;->a:Ll/cmg0;

    .line 14
    .line 15
    iput-object p1, p0, Ll/gmg0;->c:Ll/cmg0;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final a(Ltech/sud/gip/core/GameInfo;ILjava/lang/String;)V
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/gmg0;->e:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/gmg0;->a:Ll/mrg0;

    .line 5
    .line 6
    iget-object v1, p0, Ll/gmg0;->b:Landroid/content/Context;

    .line 7
    .line 8
    sget v2, Ltech/sud/gip/R$string;->fsm_mgp_game_loading_stage_get_mginfo:I

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ll/mrg0;->c(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-wide v4, p1, Ltech/sud/gip/core/GameInfo;->mgId:J

    .line 18
    .line 19
    new-instance v9, Ll/fhg0;

    .line 20
    .line 21
    invoke-direct {v9, p0}, Ll/fhg0;-><init>(Ll/gmg0;)V

    .line 22
    .line 23
    .line 24
    const-string p1, "Please call on UI or Main thread"

    .line 25
    .line 26
    const/4 v0, -0x1

    .line 27
    const-string v1, "Please call initSDK first successfully"

    .line 28
    .line 29
    const/16 v2, -0x2777

    .line 30
    .line 31
    if-nez p2, :cond_3

    .line 32
    .line 33
    iget-object p0, p0, Ll/gmg0;->f:Ltech/sud/gip/core/SudLoadMGParamModel;

    .line 34
    .line 35
    iget-object p0, p0, Ltech/sud/gip/core/SudLoadMGParamModel;->roomId:Ljava/lang/String;

    .line 36
    .line 37
    sget-object p2, Ll/utg0;->a:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    if-ne p2, p3, :cond_2

    .line 48
    .line 49
    sget-object v3, Ll/utg0;->b:Ll/uyg0;

    .line 50
    .line 51
    iget-boolean p1, v3, Ll/uyg0;->a:Z

    .line 52
    .line 53
    if-nez p1, :cond_0

    .line 54
    .line 55
    invoke-virtual {v9, v2, v1}, Ll/fhg0;->onFailure(ILjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    iget-object p1, v3, Ll/uyg0;->o:Ljava/util/HashMap;

    .line 60
    .line 61
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Ltech/sud/gip/core/GameInfo;

    .line 70
    .line 71
    if-eqz p1, :cond_1

    .line 72
    .line 73
    iget-wide p1, p1, Ltech/sud/gip/core/GameInfo;->clientVersion:J

    .line 74
    .line 75
    :goto_0
    move-wide v7, p1

    .line 76
    goto :goto_1

    .line 77
    :cond_1
    const-wide/16 p1, 0x0

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :goto_1
    iget-object v6, v3, Ll/uyg0;->i:Ljava/lang/String;

    .line 81
    .line 82
    new-instance v2, Ll/hhg0;

    .line 83
    .line 84
    move-object v10, v9

    .line 85
    move-object v9, p0

    .line 86
    invoke-direct/range {v2 .. v10}, Ll/hhg0;-><init>(Ll/uyg0;JLjava/lang/String;JLjava/lang/String;Ltech/sud/gip/core/ISudListenerGetMGInfo;)V

    .line 87
    .line 88
    .line 89
    sget-object p0, Ll/tsg0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 90
    .line 91
    invoke-virtual {p0, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_2
    invoke-virtual {v9, v0, p1}, Ll/fhg0;->onFailure(ILjava/lang/String;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_3
    const/4 v3, 0x1

    .line 100
    if-ne v3, p2, :cond_6

    .line 101
    .line 102
    iget-object p0, p0, Ll/gmg0;->f:Ltech/sud/gip/core/SudLoadMGParamModel;

    .line 103
    .line 104
    iget-object v8, p0, Ltech/sud/gip/core/SudLoadMGParamModel;->roomId:Ljava/lang/String;

    .line 105
    .line 106
    sget-object p0, Ll/utg0;->a:Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    if-ne p0, p2, :cond_5

    .line 117
    .line 118
    sget-object v3, Ll/utg0;->b:Ll/uyg0;

    .line 119
    .line 120
    iget-boolean p0, v3, Ll/uyg0;->a:Z

    .line 121
    .line 122
    if-nez p0, :cond_4

    .line 123
    .line 124
    invoke-virtual {v9, v2, v1}, Ll/fhg0;->onFailure(ILjava/lang/String;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_4
    iget-object v6, v3, Ll/uyg0;->i:Ljava/lang/String;

    .line 129
    .line 130
    new-instance v2, Ll/lpg0;

    .line 131
    .line 132
    move-object v7, p3

    .line 133
    invoke-direct/range {v2 .. v9}, Ll/lpg0;-><init>(Ll/uyg0;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/fhg0;)V

    .line 134
    .line 135
    .line 136
    sget-object p0, Ll/tsg0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 137
    .line 138
    invoke-virtual {p0, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_5
    invoke-virtual {v9, v0, p1}, Ll/fhg0;->onFailure(ILjava/lang/String;)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    const-string p1, "getMGInfo not support loadMgMode="

    .line 149
    .line 150
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    const-string p3, "SudGameLoadingStageGetMGInfo"

    .line 161
    .line 162
    invoke-static {p3, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    sget-object p0, Ll/gmg0;->g:Ljava/lang/String;

    .line 166
    .line 167
    new-instance p3, Ljava/lang/StringBuilder;

    .line 168
    .line 169
    invoke-direct {p3, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    invoke-static {p0, p1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    return-void
.end method

.method public final cancel()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/gmg0;->e:Z

    .line 3
    .line 4
    return-void
.end method
