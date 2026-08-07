.class public Ltech/sud/gip/core/SudLoadMGParamModel;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static FILE_TAG:Ljava/lang/String; = "SudLoadMGParamModel"

.field private static _TAG:Ljava/lang/String; = "SudLoadMgParamModel"


# instance fields
.field public activity:Landroid/app/Activity;

.field public authorizationSecret:Ljava/lang/String;

.field public code:Ljava/lang/String;

.field public language:Ljava/lang/String;

.field public loadMGMode:I

.field public mgId:J

.field public roomId:Ljava/lang/String;

.field public userId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ltech/sud/gip/core/SudLoadMGParamModel;->loadMGMode:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public check()Z
    .locals 6

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/SudLoadMGParamModel;->activity:Landroid/app/Activity;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    sget-object p0, Ltech/sud/gip/core/SudLoadMGParamModel;->_TAG:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "Please check activity invalid"

    .line 9
    .line 10
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Ltech/sud/gip/core/SudLoadMGParamModel;->FILE_TAG:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p0, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return v1

    .line 19
    :cond_0
    iget-object v0, p0, Ltech/sud/gip/core/SudLoadMGParamModel;->userId:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz v0, :cond_c

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    goto/16 :goto_2

    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, Ltech/sud/gip/core/SudLoadMGParamModel;->roomId:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz v0, :cond_b

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    goto/16 :goto_1

    .line 42
    .line 43
    :cond_2
    iget-object v0, p0, Ltech/sud/gip/core/SudLoadMGParamModel;->code:Ljava/lang/String;

    .line 44
    .line 45
    if-eqz v0, :cond_a

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    iget-wide v2, p0, Ltech/sud/gip/core/SudLoadMGParamModel;->mgId:J

    .line 55
    .line 56
    const-wide/16 v4, 0x0

    .line 57
    .line 58
    cmp-long v0, v2, v4

    .line 59
    .line 60
    if-gtz v0, :cond_4

    .line 61
    .line 62
    sget-object p0, Ltech/sud/gip/core/SudLoadMGParamModel;->_TAG:Ljava/lang/String;

    .line 63
    .line 64
    const-string v0, "Please check mgId invalid"

    .line 65
    .line 66
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    sget-object p0, Ltech/sud/gip/core/SudLoadMGParamModel;->FILE_TAG:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {p0, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    return v1

    .line 75
    :cond_4
    iget-object v0, p0, Ltech/sud/gip/core/SudLoadMGParamModel;->language:Ljava/lang/String;

    .line 76
    .line 77
    if-eqz v0, :cond_5

    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_6

    .line 84
    .line 85
    :cond_5
    sget-object v0, Ltech/sud/gip/core/SudLoadMGParamModel;->_TAG:Ljava/lang/String;

    .line 86
    .line 87
    const-string v2, "Please check language is null or empty"

    .line 88
    .line 89
    invoke-static {v0, v2}, Ltech/sud/gip/logger/SudLogger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    sget-object v0, Ltech/sud/gip/core/SudLoadMGParamModel;->FILE_TAG:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v0, v2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    :cond_6
    iget v0, p0, Ltech/sud/gip/core/SudLoadMGParamModel;->loadMGMode:I

    .line 98
    .line 99
    const/4 v2, 0x1

    .line 100
    if-eqz v0, :cond_9

    .line 101
    .line 102
    if-eq v0, v2, :cond_7

    .line 103
    .line 104
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    const-string v0, "Please check loadMgMode=%d invalid, not support this value"

    .line 113
    .line 114
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    sget-object v0, Ltech/sud/gip/core/SudLoadMGParamModel;->_TAG:Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {v0, p0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    sget-object v0, Ltech/sud/gip/core/SudLoadMGParamModel;->FILE_TAG:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v0, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    return v1

    .line 129
    :cond_7
    iget-object p0, p0, Ltech/sud/gip/core/SudLoadMGParamModel;->authorizationSecret:Ljava/lang/String;

    .line 130
    .line 131
    if-eqz p0, :cond_8

    .line 132
    .line 133
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 134
    .line 135
    .line 136
    move-result p0

    .line 137
    if-eqz p0, :cond_9

    .line 138
    .line 139
    :cond_8
    sget-object p0, Ltech/sud/gip/core/SudLoadMGParamModel;->_TAG:Ljava/lang/String;

    .line 140
    .line 141
    const-string v0, "Please check authorizationSecret invalid, loadMgMode=1"

    .line 142
    .line 143
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    sget-object p0, Ltech/sud/gip/core/SudLoadMGParamModel;->FILE_TAG:Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {p0, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    return v1

    .line 152
    :cond_9
    return v2

    .line 153
    :cond_a
    :goto_0
    sget-object p0, Ltech/sud/gip/core/SudLoadMGParamModel;->_TAG:Ljava/lang/String;

    .line 154
    .line 155
    const-string v0, "Please check code invalid"

    .line 156
    .line 157
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    sget-object p0, Ltech/sud/gip/core/SudLoadMGParamModel;->FILE_TAG:Ljava/lang/String;

    .line 161
    .line 162
    invoke-static {p0, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    return v1

    .line 166
    :cond_b
    :goto_1
    sget-object p0, Ltech/sud/gip/core/SudLoadMGParamModel;->_TAG:Ljava/lang/String;

    .line 167
    .line 168
    const-string v0, "Please check roomId invalid"

    .line 169
    .line 170
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    sget-object p0, Ltech/sud/gip/core/SudLoadMGParamModel;->FILE_TAG:Ljava/lang/String;

    .line 174
    .line 175
    invoke-static {p0, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    return v1

    .line 179
    :cond_c
    :goto_2
    sget-object p0, Ltech/sud/gip/core/SudLoadMGParamModel;->_TAG:Ljava/lang/String;

    .line 180
    .line 181
    const-string v0, "Please check userId invalid"

    .line 182
    .line 183
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    sget-object p0, Ltech/sud/gip/core/SudLoadMGParamModel;->FILE_TAG:Ljava/lang/String;

    .line 187
    .line 188
    invoke-static {p0, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 189
    .line 190
    .line 191
    return v1
.end method
