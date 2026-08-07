.class final Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->U(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

.field final synthetic b:Lorg/json/JSONObject;

.field final synthetic c:Landroid/graphics/Bitmap;

.field final synthetic d:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;Landroid/graphics/Bitmap;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    iput-object p2, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;->b:Lorg/json/JSONObject;

    iput-object p3, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;->c:Landroid/graphics/Bitmap;

    iput-object p4, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;->d:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;->b:Lorg/json/JSONObject;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v3, "isLocal"

    .line 8
    .line 9
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-ne v0, v2, :cond_0

    .line 14
    .line 15
    move v0, v2

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v1

    .line 18
    :goto_0
    iget-object v3, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;->b:Lorg/json/JSONObject;

    .line 19
    .line 20
    if-eqz v3, :cond_1

    .line 21
    .line 22
    const-string v4, "callback"

    .line 23
    .line 24
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    const/4 v3, 0x0

    .line 30
    :goto_1
    iget-object v4, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;->c:Landroid/graphics/Bitmap;

    .line 31
    .line 32
    const-string v5, ""

    .line 33
    .line 34
    if-eqz v4, :cond_8

    .line 35
    .line 36
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-eqz v4, :cond_2

    .line 41
    .line 42
    goto/16 :goto_3

    .line 43
    .line 44
    :cond_2
    invoke-static {}, Ll/ckw;->j()Ljava/io/File;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    const-string v6, "\u5b58\u50a8\u622a\u56fe\u5931\u8d25"

    .line 49
    .line 50
    if-nez v4, :cond_3

    .line 51
    .line 52
    iget-object p0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 53
    .line 54
    invoke-static {p0, v2, v6, v5}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->q(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {p0, v3, v0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->y(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_3
    new-instance v7, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 68
    .line 69
    .line 70
    move-result-wide v8

    .line 71
    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v8

    .line 75
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v8, ".jpg_"

    .line 79
    .line 80
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v7

    .line 87
    new-instance v8, Ljava/io/File;

    .line 88
    .line 89
    invoke-direct {v8, v4, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    iget-object v9, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 97
    .line 98
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 99
    .line 100
    .line 101
    iget-object v10, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;->c:Landroid/graphics/Bitmap;

    .line 102
    .line 103
    invoke-static {v9, v4, v10}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->B(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ljava/lang/String;Landroid/graphics/Bitmap;)Z

    .line 104
    .line 105
    .line 106
    move-result v9

    .line 107
    if-eqz v9, :cond_6

    .line 108
    .line 109
    if-eqz v0, :cond_4

    .line 110
    .line 111
    iget-object v0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;->d:Landroid/content/Context;

    .line 112
    .line 113
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 114
    .line 115
    .line 116
    move-result v6

    .line 117
    sub-int/2addr v6, v2

    .line 118
    invoke-virtual {v7, v1, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    invoke-static {v0, v8, v2}, Lcom/hellogroup/common/file/FileUtil;->j(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    :cond_4
    iget-object v0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 126
    .line 127
    invoke-static {v4}, Ll/wkw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    if-eqz v2, :cond_5

    .line 132
    .line 133
    move-object v5, v2

    .line 134
    :cond_5
    const-string v2, "\u6210\u529f"

    .line 135
    .line 136
    invoke-static {v0, v1, v2, v5}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->q(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-static {v0, v3, v2}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->y(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_6
    iget-object v0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 145
    .line 146
    invoke-static {v0, v2, v6, v5}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->q(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-static {v0, v3, v2}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->y(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    :goto_2
    iget-object v0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;->c:Landroid/graphics/Bitmap;

    .line 154
    .line 155
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-nez v0, :cond_7

    .line 160
    .line 161
    iget-object v0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;->c:Landroid/graphics/Bitmap;

    .line 162
    .line 163
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 164
    .line 165
    .line 166
    iget-object p0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 167
    .line 168
    invoke-static {p0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->x(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Ll/hul;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-interface {p0, v1}, Ll/hul;->setWebDrawingCacheEnabled(Z)V

    .line 173
    .line 174
    .line 175
    :cond_7
    return-void

    .line 176
    :cond_8
    :goto_3
    iget-object p0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$g;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 177
    .line 178
    const-string v0, "\u622a\u56fe\u5931\u8d25"

    .line 179
    .line 180
    invoke-static {p0, v2, v0, v5}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->q(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-static {p0, v3, v0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->y(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    return-void
.end method
