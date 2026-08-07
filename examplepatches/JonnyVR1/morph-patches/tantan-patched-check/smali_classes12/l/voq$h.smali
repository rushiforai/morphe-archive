.class Ll/voq$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/voq;->k2(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/voq;


# direct methods
.method public constructor <init>(Ll/voq;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/voq$h;->a:Ll/voq;

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
    .locals 5

    .line 1
    iget-object v0, p0, Ll/voq$h;->a:Ll/voq;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/voq;->Q1(Ll/voq;Z)Z

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v3, "engine init callback currentBeautyType === "

    .line 14
    .line 15
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v3, p0, Ll/voq$h;->a:Ll/voq;

    .line 19
    .line 20
    invoke-static {v3}, Ll/voq;->R1(Ll/voq;)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const-string v3, "JniEngineAdjustFilter"

    .line 32
    .line 33
    filled-new-array {v3, v2}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v0, v2}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/voq$h;->a:Ll/voq;

    .line 41
    .line 42
    invoke-static {v0}, Ll/voq;->Y1(Ll/voq;)Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getXEDirector()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {v0}, Lcom/momo/xeengine/IXEngine;->getLogger()Lcom/momo/xeengine/XELogger;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/XELogger;->setLogEnable(Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/voq$h;->a:Ll/voq;

    .line 58
    .line 59
    invoke-static {v0}, Ll/voq;->Y1(Ll/voq;)Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v2, p0, Ll/voq$h;->a:Ll/voq;

    .line 64
    .line 65
    invoke-static {v2}, Ll/voq;->R1(Ll/voq;)I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    invoke-static {v2, v3}, Ll/voq;->Z1(Ll/voq;I)I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    invoke-virtual {v0, v2}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->setFaceWarpType(I)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/voq$h;->a:Ll/voq;

    .line 77
    .line 78
    invoke-static {v0}, Ll/voq;->R1(Ll/voq;)I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    invoke-static {v0, v2}, Ll/voq;->a2(Ll/voq;I)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/voq$h;->a:Ll/voq;

    .line 86
    .line 87
    invoke-static {v0}, Ll/voq;->Y1(Ll/voq;)Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getLightningRender()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const/4 v2, 0x0

    .line 96
    if-eqz v0, :cond_1

    .line 97
    .line 98
    iget-object v0, p0, Ll/voq$h;->a:Ll/voq;

    .line 99
    .line 100
    invoke-static {v0}, Ll/voq;->Y1(Ll/voq;)Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getLightningRender()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    if-eqz v0, :cond_1

    .line 113
    .line 114
    iget-object v0, p0, Ll/voq$h;->a:Ll/voq;

    .line 115
    .line 116
    invoke-static {v0}, Ll/voq;->Y1(Ll/voq;)Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getLightningRender()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iget-object v3, p0, Ll/voq$h;->a:Ll/voq;

    .line 129
    .line 130
    invoke-static {v3}, Ll/voq;->R1(Ll/voq;)I

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    const/4 v4, 0x3

    .line 135
    if-ne v3, v4, :cond_0

    .line 136
    .line 137
    move v3, v1

    .line 138
    goto :goto_0

    .line 139
    :cond_0
    move v3, v2

    .line 140
    :goto_0
    invoke-interface {v0, v3}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->setEnable(Z)V

    .line 141
    .line 142
    .line 143
    :cond_1
    iget-object v0, p0, Ll/voq$h;->a:Ll/voq;

    .line 144
    .line 145
    invoke-static {v0}, Ll/voq;->R1(Ll/voq;)I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    const/4 v3, 0x2

    .line 150
    if-eq v0, v3, :cond_2

    .line 151
    .line 152
    iget-object v0, p0, Ll/voq$h;->a:Ll/voq;

    .line 153
    .line 154
    invoke-static {v0}, Ll/voq;->R1(Ll/voq;)I

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    const/4 v3, -0x1

    .line 159
    if-eq v0, v3, :cond_2

    .line 160
    .line 161
    goto :goto_1

    .line 162
    :cond_2
    move v1, v2

    .line 163
    :goto_1
    iget-object v0, p0, Ll/voq$h;->a:Ll/voq;

    .line 164
    .line 165
    invoke-static {v0}, Ll/voq;->Y1(Ll/voq;)Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->enableBeautyFace(Z)V

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Ll/voq$h;->a:Ll/voq;

    .line 173
    .line 174
    invoke-static {v0}, Ll/voq;->b2(Ll/voq;)Ljava/util/Queue;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    if-eqz v1, :cond_3

    .line 187
    .line 188
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    check-cast v1, Ljava/lang/Runnable;

    .line 193
    .line 194
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 195
    .line 196
    .line 197
    goto :goto_2

    .line 198
    :cond_3
    iget-object v0, p0, Ll/voq$h;->a:Ll/voq;

    .line 199
    .line 200
    invoke-static {v0}, Ll/voq;->c2(Ll/voq;)Ll/ytl;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    if-eqz v0, :cond_4

    .line 205
    .line 206
    iget-object p0, p0, Ll/voq$h;->a:Ll/voq;

    .line 207
    .line 208
    invoke-static {p0}, Ll/voq;->c2(Ll/voq;)Ll/ytl;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-interface {p0}, Ll/ytl;->b()V

    .line 213
    .line 214
    .line 215
    :cond_4
    return-void
.end method
