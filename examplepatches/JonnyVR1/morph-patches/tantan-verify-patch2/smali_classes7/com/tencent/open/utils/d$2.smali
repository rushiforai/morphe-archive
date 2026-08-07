.class Lcom/tencent/open/utils/d$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/open/utils/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/open/utils/d;


# direct methods
.method public constructor <init>(Lcom/tencent/open/utils/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/open/utils/d$2;->a:Lcom/tencent/open/utils/d;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    const-string v0, "saveFileRunnable:"

    .line 2
    .line 3
    const-string v1, "AsynLoadImg"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/tencent/open/log/SLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/open/utils/d$2;->a:Lcom/tencent/open/utils/d;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tencent/open/utils/d;->b(Lcom/tencent/open/utils/d;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Lcom/tencent/open/utils/n;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v3, "share_qq_"

    .line 21
    .line 22
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v0, ".jpg"

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v2, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Lcom/tencent/open/utils/d;->a()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    new-instance v3, Ljava/io/File;

    .line 57
    .line 58
    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object v4, p0, Lcom/tencent/open/utils/d$2;->a:Lcom/tencent/open/utils/d;

    .line 62
    .line 63
    invoke-static {v4}, Lcom/tencent/open/utils/d;->c(Lcom/tencent/open/utils/d;)Landroid/os/Handler;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-virtual {v4}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    const/4 v5, 0x0

    .line 76
    if-eqz v3, :cond_0

    .line 77
    .line 78
    iput v5, v4, Landroid/os/Message;->arg1:I

    .line 79
    .line 80
    iput-object v2, v4, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 81
    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string v2, "file exists: time:"

    .line 85
    .line 86
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 90
    .line 91
    .line 92
    move-result-wide v2

    .line 93
    iget-object v5, p0, Lcom/tencent/open/utils/d$2;->a:Lcom/tencent/open/utils/d;

    .line 94
    .line 95
    invoke-static {v5}, Lcom/tencent/open/utils/d;->d(Lcom/tencent/open/utils/d;)J

    .line 96
    .line 97
    .line 98
    move-result-wide v5

    .line 99
    sub-long/2addr v2, v5

    .line 100
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-static {v1, v0}, Lcom/tencent/open/log/SLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_0
    iget-object v3, p0, Lcom/tencent/open/utils/d$2;->a:Lcom/tencent/open/utils/d;

    .line 112
    .line 113
    invoke-static {v3}, Lcom/tencent/open/utils/d;->b(Lcom/tencent/open/utils/d;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    invoke-static {v3}, Lcom/tencent/open/utils/d;->a(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    if-eqz v3, :cond_1

    .line 122
    .line 123
    iget-object v6, p0, Lcom/tencent/open/utils/d$2;->a:Lcom/tencent/open/utils/d;

    .line 124
    .line 125
    invoke-virtual {v6, v3, v0}, Lcom/tencent/open/utils/d;->a(Landroid/graphics/Bitmap;Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    goto :goto_0

    .line 130
    :cond_1
    const-string v0, "saveFileRunnable:get bmp fail---"

    .line 131
    .line 132
    invoke-static {v1, v0}, Lcom/tencent/open/log/SLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    move v0, v5

    .line 136
    :goto_0
    if-eqz v0, :cond_2

    .line 137
    .line 138
    iput v5, v4, Landroid/os/Message;->arg1:I

    .line 139
    .line 140
    iput-object v2, v4, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_2
    const/4 v0, 0x1

    .line 144
    iput v0, v4, Landroid/os/Message;->arg1:I

    .line 145
    .line 146
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    const-string v2, "file not exists: download time:"

    .line 149
    .line 150
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 154
    .line 155
    .line 156
    move-result-wide v2

    .line 157
    iget-object v5, p0, Lcom/tencent/open/utils/d$2;->a:Lcom/tencent/open/utils/d;

    .line 158
    .line 159
    invoke-static {v5}, Lcom/tencent/open/utils/d;->d(Lcom/tencent/open/utils/d;)J

    .line 160
    .line 161
    .line 162
    move-result-wide v5

    .line 163
    sub-long/2addr v2, v5

    .line 164
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-static {v1, v0}, Lcom/tencent/open/log/SLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    :goto_2
    iget-object p0, p0, Lcom/tencent/open/utils/d$2;->a:Lcom/tencent/open/utils/d;

    .line 175
    .line 176
    invoke-static {p0}, Lcom/tencent/open/utils/d;->c(Lcom/tencent/open/utils/d;)Landroid/os/Handler;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-virtual {p0, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 181
    .line 182
    .line 183
    return-void
.end method
