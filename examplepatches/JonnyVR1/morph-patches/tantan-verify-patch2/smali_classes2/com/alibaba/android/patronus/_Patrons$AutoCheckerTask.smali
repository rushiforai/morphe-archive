.class public Lcom/alibaba/android/patronus/_Patrons$AutoCheckerTask;
.super Ljava/util/TimerTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alibaba/android/patronus/_Patrons;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AutoCheckerTask"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$000()Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x1

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$000()Ljava/util/concurrent/atomic/AtomicInteger;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const/4 v1, 0x5

    .line 21
    if-le p0, v1, :cond_0

    .line 22
    .line 23
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$000()Ljava/util/concurrent/atomic/AtomicInteger;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$100()Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    iget p0, p0, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->periodOfCheck:I

    .line 36
    .line 37
    invoke-static {p0}, Lcom/alibaba/android/patronus/_Patrons;->access$200(I)V

    .line 38
    .line 39
    .line 40
    :cond_0
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->readVssSize()J

    .line 41
    .line 42
    .line 43
    move-result-wide v1

    .line 44
    long-to-float p0, v1

    .line 45
    const/high16 v1, 0x4f800000

    .line 46
    .line 47
    div-float/2addr p0, v1

    .line 48
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$300()J

    .line 49
    .line 50
    .line 51
    move-result-wide v1

    .line 52
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$100()Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    iget v3, v3, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->shrinkStep:I

    .line 57
    .line 58
    int-to-long v3, v3

    .line 59
    sub-long/2addr v1, v3

    .line 60
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$100()Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    iget v3, v3, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->lowerLimit:I

    .line 65
    .line 66
    int-to-long v3, v3

    .line 67
    cmp-long v1, v1, v3

    .line 68
    .line 69
    const-string v2, "Patrons"

    .line 70
    .line 71
    if-gez v1, :cond_1

    .line 72
    .line 73
    new-instance p0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    const-string v0, "vss has no space to resize, stop watching. current space = "

    .line 76
    .line 77
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$300()J

    .line 81
    .line 82
    .line 83
    move-result-wide v0

    .line 84
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$400()V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_1
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$100()Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iget v1, v1, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->periodOfShrink:F

    .line 103
    .line 104
    cmpl-float p0, p0, v1

    .line 105
    .line 106
    if-lez p0, :cond_3

    .line 107
    .line 108
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$300()J

    .line 109
    .line 110
    .line 111
    move-result-wide v3

    .line 112
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$100()Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    iget p0, p0, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->shrinkStep:I

    .line 117
    .line 118
    int-to-long v5, p0

    .line 119
    sub-long/2addr v3, v5

    .line 120
    invoke-static {v3, v4}, Lcom/alibaba/android/patronus/_Patrons;->access$302(J)J

    .line 121
    .line 122
    .line 123
    move-result-wide v3

    .line 124
    long-to-int p0, v3

    .line 125
    invoke-static {p0}, Lcom/alibaba/android/patronus/_Patrons;->shrinkRegionSpace(I)Z

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    if-nez p0, :cond_2

    .line 130
    .line 131
    const-string p0, "vss resize failed, stop watching."

    .line 132
    .line 133
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$400()V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :cond_2
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->readVssSize()J

    .line 141
    .line 142
    .line 143
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$100()Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    iget p0, p0, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->shrinkStep:I

    .line 148
    .line 149
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$000()Ljava/util/concurrent/atomic/AtomicInteger;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 154
    .line 155
    .line 156
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$100()Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    iget p0, p0, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->periodOfCheck:I

    .line 161
    .line 162
    div-int/lit8 p0, p0, 0x2

    .line 163
    .line 164
    invoke-static {p0}, Lcom/alibaba/android/patronus/_Patrons;->access$200(I)V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_3
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->getCurrentRegionSpaceSize()J

    .line 169
    .line 170
    .line 171
    move-result-wide v0

    .line 172
    const-wide/32 v3, 0x100000

    .line 173
    .line 174
    .line 175
    div-long/2addr v0, v3

    .line 176
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$100()Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    iget p0, p0, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->lowerLimit:I

    .line 181
    .line 182
    int-to-long v5, p0

    .line 183
    cmp-long p0, v0, v5

    .line 184
    .line 185
    if-gez p0, :cond_4

    .line 186
    .line 187
    new-instance p0, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    const-string v0, "current heap size ("

    .line 190
    .line 191
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->getCurrentRegionSpaceSize()J

    .line 195
    .line 196
    .line 197
    move-result-wide v0

    .line 198
    div-long/2addr v0, v3

    .line 199
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    const-string v0, ") less than lower limit ("

    .line 203
    .line 204
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$100()Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    iget v0, v0, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->lowerLimit:I

    .line 212
    .line 213
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    const-string v0, ") stop watching."

    .line 217
    .line 218
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    .line 227
    .line 228
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$400()V

    .line 229
    .line 230
    .line 231
    return-void

    .line 232
    :cond_4
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$100()Lcom/alibaba/android/patronus/Patrons$PatronsConfig;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    iget-boolean p0, p0, Lcom/alibaba/android/patronus/Patrons$PatronsConfig;->debuggable:Z

    .line 237
    .line 238
    if-eqz p0, :cond_5

    .line 239
    .line 240
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->access$000()Ljava/util/concurrent/atomic/AtomicInteger;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 245
    .line 246
    .line 247
    invoke-static {}, Lcom/alibaba/android/patronus/_Patrons;->getCurrentRegionSpaceSize()J

    .line 248
    .line 249
    .line 250
    :cond_5
    return-void
.end method
