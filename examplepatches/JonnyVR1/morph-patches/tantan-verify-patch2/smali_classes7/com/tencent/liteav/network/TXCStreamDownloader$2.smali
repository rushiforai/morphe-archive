.class Lcom/tencent/liteav/network/TXCStreamDownloader$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/network/g$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/network/TXCStreamDownloader;->start(Ljava/lang/String;ZIZZ)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Z

.field final synthetic c:Z

.field final synthetic d:Lcom/tencent/liteav/network/TXCStreamDownloader;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/network/TXCStreamDownloader;Ljava/lang/String;ZZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->d:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->b:Z

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->c:Z

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(ILjava/lang/String;Ljava/util/Vector;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/Vector<",
            "Lcom/tencent/liteav/network/e;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_5

    .line 2
    .line 3
    if-eqz p3, :cond_5

    .line 4
    .line 5
    invoke-virtual {p3}, Ljava/util/Vector;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_5

    .line 10
    .line 11
    iget-object p2, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->d:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 12
    .line 13
    invoke-static {p2}, Lcom/tencent/liteav/network/TXCStreamDownloader;->access$500(Lcom/tencent/liteav/network/TXCStreamDownloader;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    iget-object v0, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->d:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 18
    .line 19
    if-eqz p2, :cond_4

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tencent/liteav/network/TXCStreamDownloader;->access$600(Lcom/tencent/liteav/network/TXCStreamDownloader;)Lcom/tencent/liteav/network/TXIStreamDownloader;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    if-eqz p2, :cond_2

    .line 26
    .line 27
    invoke-virtual {p3}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    const/4 v0, 0x0

    .line 32
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lcom/tencent/liteav/network/e;

    .line 43
    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    iget-boolean v2, v1, Lcom/tencent/liteav/network/e;->b:Z

    .line 47
    .line 48
    if-eqz v2, :cond_0

    .line 49
    .line 50
    iget-object v1, v1, Lcom/tencent/liteav/network/e;->a:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-lez v1, :cond_0

    .line 59
    .line 60
    add-int/lit8 v0, v0, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    iget-object p2, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->d:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 64
    .line 65
    int-to-long v0, v0

    .line 66
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const/16 v1, 0x1bc9

    .line 71
    .line 72
    invoke-virtual {p2, v1, v0}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(ILjava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    iget-object p2, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->d:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 76
    .line 77
    const-wide/16 v0, 0x2

    .line 78
    .line 79
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    const/16 v1, 0x1bc8

    .line 84
    .line 85
    invoke-virtual {p2, v1, v0}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(ILjava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    iget-object p2, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->d:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 89
    .line 90
    invoke-static {p2}, Lcom/tencent/liteav/network/TXCStreamDownloader;->access$600(Lcom/tencent/liteav/network/TXCStreamDownloader;)Lcom/tencent/liteav/network/TXIStreamDownloader;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    iget-object v0, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->a:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {p2, v0}, Lcom/tencent/liteav/network/TXIStreamDownloader;->setOriginUrl(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget-object p2, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->d:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 100
    .line 101
    invoke-static {p2}, Lcom/tencent/liteav/network/TXCStreamDownloader;->access$600(Lcom/tencent/liteav/network/TXCStreamDownloader;)Lcom/tencent/liteav/network/TXIStreamDownloader;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget-boolean v4, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->b:Z

    .line 106
    .line 107
    iget-boolean v5, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->c:Z

    .line 108
    .line 109
    const/4 v2, 0x1

    .line 110
    const/4 v3, 0x1

    .line 111
    move-object v1, p3

    .line 112
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/liteav/network/TXIStreamDownloader;->startDownload(Ljava/util/Vector;ZZZZ)V

    .line 113
    .line 114
    .line 115
    :cond_2
    iget-object p2, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->d:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 116
    .line 117
    invoke-static {p2}, Lcom/tencent/liteav/network/TXCStreamDownloader;->access$700(Lcom/tencent/liteav/network/TXCStreamDownloader;)Landroid/os/Handler;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    if-eqz p2, :cond_3

    .line 122
    .line 123
    iget-object p2, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->d:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 124
    .line 125
    invoke-static {p2}, Lcom/tencent/liteav/network/TXCStreamDownloader;->access$700(Lcom/tencent/liteav/network/TXCStreamDownloader;)Landroid/os/Handler;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    iget-object p3, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->d:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 130
    .line 131
    invoke-static {p3}, Lcom/tencent/liteav/network/TXCStreamDownloader;->access$800(Lcom/tencent/liteav/network/TXCStreamDownloader;)Ljava/lang/Runnable;

    .line 132
    .line 133
    .line 134
    move-result-object p3

    .line 135
    const-wide/16 v0, 0x7d0

    .line 136
    .line 137
    invoke-virtual {p2, p3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 138
    .line 139
    .line 140
    :cond_3
    iget-object p2, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->d:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 141
    .line 142
    invoke-static {p2}, Lcom/tencent/liteav/network/TXCStreamDownloader;->access$900(Lcom/tencent/liteav/network/TXCStreamDownloader;)Lcom/tencent/liteav/network/g;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    invoke-virtual {p2}, Lcom/tencent/liteav/network/g;->b()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    iget-object p0, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->d:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 151
    .line 152
    invoke-static {p0}, Lcom/tencent/liteav/network/TXCStreamDownloader;->access$1000(Lcom/tencent/liteav/network/TXCStreamDownloader;)Landroid/content/Context;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    sget p3, Lcom/tencent/liteav/basic/datareport/a;->at:I

    .line 157
    .line 158
    invoke-static {p0, p3, p1, p2}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txReportDAU(Landroid/content/Context;IILjava/lang/String;)V

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :cond_4
    invoke-static {v0}, Lcom/tencent/liteav/network/TXCStreamDownloader;->access$1000(Lcom/tencent/liteav/network/TXCStreamDownloader;)Landroid/content/Context;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    sget p1, Lcom/tencent/liteav/basic/datareport/a;->at:I

    .line 167
    .line 168
    const/4 p2, -0x4

    .line 169
    const-string p3, "livePlayer have been stopped"

    .line 170
    .line 171
    invoke-static {p0, p1, p2, p3}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txReportDAU(Landroid/content/Context;IILjava/lang/String;)V

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :cond_5
    iget-object p3, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->d:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 176
    .line 177
    const/16 v0, -0x8fe

    .line 178
    .line 179
    const/4 v1, 0x0

    .line 180
    invoke-virtual {p3, v0, v1}, Lcom/tencent/liteav/network/TXCStreamDownloader;->onNotifyEvent(ILandroid/os/Bundle;)V

    .line 181
    .line 182
    .line 183
    iget-object p3, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->d:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 184
    .line 185
    invoke-static {p3}, Lcom/tencent/liteav/network/TXCStreamDownloader;->access$1000(Lcom/tencent/liteav/network/TXCStreamDownloader;)Landroid/content/Context;

    .line 186
    .line 187
    .line 188
    move-result-object p3

    .line 189
    sget v0, Lcom/tencent/liteav/basic/datareport/a;->at:I

    .line 190
    .line 191
    invoke-static {p3, v0, p1, p2}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txReportDAU(Landroid/content/Context;IILjava/lang/String;)V

    .line 192
    .line 193
    .line 194
    const-string p1, "TXCStreamDownloader"

    .line 195
    .line 196
    const-string p2, "getAccelerateStreamPlayUrl failed, play stream with raw url"

    .line 197
    .line 198
    invoke-static {p1, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->d:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 202
    .line 203
    invoke-static {p1}, Lcom/tencent/liteav/network/TXCStreamDownloader;->access$500(Lcom/tencent/liteav/network/TXCStreamDownloader;)Z

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    if-eqz p1, :cond_6

    .line 208
    .line 209
    iget-object p0, p0, Lcom/tencent/liteav/network/TXCStreamDownloader$2;->d:Lcom/tencent/liteav/network/TXCStreamDownloader;

    .line 210
    .line 211
    const/16 p1, -0x8fd

    .line 212
    .line 213
    invoke-virtual {p0, p1, v1}, Lcom/tencent/liteav/network/TXCStreamDownloader;->onNotifyEvent(ILandroid/os/Bundle;)V

    .line 214
    .line 215
    .line 216
    :cond_6
    return-void
.end method
