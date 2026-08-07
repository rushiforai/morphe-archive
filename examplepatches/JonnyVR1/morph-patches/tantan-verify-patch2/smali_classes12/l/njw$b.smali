.class final Ll/njw$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/njw;->f(Landroid/app/Activity;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
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
        "onGlobalLayout"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic a:Ll/njw;

.field final synthetic b:Landroid/view/Window;

.field final synthetic c:Lcom/hellogroup/mk/business/base/ui/MKWebView;


# direct methods
.method public constructor <init>(Ll/njw;Landroid/view/Window;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/njw$b;->a:Ll/njw;

    .line 2
    .line 3
    iput-object p2, p0, Ll/njw$b;->b:Landroid/view/Window;

    .line 4
    .line 5
    iput-object p3, p0, Ll/njw$b;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 8

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    const-string v1, "initKeyboardState"

    .line 4
    .line 5
    const-string v2, "\u952e\u76d8"

    .line 6
    .line 7
    const-string v3, "visibleHeight="

    .line 8
    .line 9
    :try_start_0
    iget-object v4, p0, Ll/njw$b;->a:Ll/njw;

    .line 10
    .line 11
    invoke-static {v4}, Ll/njw;->a(Ll/njw;)Z

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-nez v4, :cond_0

    .line 16
    .line 17
    goto/16 :goto_5

    .line 18
    .line 19
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v3, p0, Ll/njw$b;->a:Ll/njw;

    .line 25
    .line 26
    invoke-static {v3}, Ll/njw;->b(Ll/njw;)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-static {v1, v3}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    new-instance v3, Landroid/graphics/Rect;

    .line 41
    .line 42
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 43
    .line 44
    .line 45
    iget-object v4, p0, Ll/njw$b;->b:Landroid/view/Window;

    .line 46
    .line 47
    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v4, v3}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    iget-object v4, p0, Ll/njw$b;->a:Ll/njw;

    .line 59
    .line 60
    invoke-static {v4}, Ll/njw;->b(Ll/njw;)I

    .line 61
    .line 62
    .line 63
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    iget-object v5, p0, Ll/njw$b;->a:Ll/njw;

    .line 65
    .line 66
    if-nez v4, :cond_1

    .line 67
    .line 68
    :try_start_1
    invoke-static {v5, v3}, Ll/njw;->e(Ll/njw;I)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :catchall_0
    move-exception p0

    .line 73
    goto/16 :goto_4

    .line 74
    .line 75
    :cond_1
    invoke-static {v5}, Ll/njw;->b(Ll/njw;)I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    if-ne v4, v3, :cond_2

    .line 80
    .line 81
    goto/16 :goto_5

    .line 82
    .line 83
    :cond_2
    iget-object v4, p0, Ll/njw$b;->a:Ll/njw;

    .line 84
    .line 85
    invoke-static {v4}, Ll/njw;->b(Ll/njw;)I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    sub-int/2addr v4, v3

    .line 90
    const/16 v5, 0xc8

    .line 91
    .line 92
    const/4 v6, 0x0

    .line 93
    if-le v4, v5, :cond_3

    .line 94
    .line 95
    iget-object v4, p0, Ll/njw$b;->a:Ll/njw;

    .line 96
    .line 97
    const/4 v7, 0x1

    .line 98
    invoke-static {v4, v7}, Ll/njw;->d(Ll/njw;Z)V

    .line 99
    .line 100
    .line 101
    iget-object v4, p0, Ll/njw$b;->a:Ll/njw;

    .line 102
    .line 103
    invoke-static {v4}, Ll/njw;->b(Ll/njw;)I

    .line 104
    .line 105
    .line 106
    iget-object v4, p0, Ll/njw$b;->a:Ll/njw;

    .line 107
    .line 108
    invoke-static {v4}, Ll/njw;->b(Ll/njw;)I

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    sub-int/2addr v4, v3

    .line 113
    iget-object v7, p0, Ll/njw$b;->a:Ll/njw;

    .line 114
    .line 115
    invoke-static {v7, v3}, Ll/njw;->e(Ll/njw;I)V

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_3
    move v4, v6

    .line 120
    :goto_0
    iget-object v7, p0, Ll/njw$b;->a:Ll/njw;

    .line 121
    .line 122
    invoke-static {v7}, Ll/njw;->b(Ll/njw;)I

    .line 123
    .line 124
    .line 125
    move-result v7

    .line 126
    sub-int v7, v3, v7

    .line 127
    .line 128
    if-le v7, v5, :cond_4

    .line 129
    .line 130
    iget-object v4, p0, Ll/njw$b;->a:Ll/njw;

    .line 131
    .line 132
    invoke-static {v4, v6}, Ll/njw;->d(Ll/njw;Z)V

    .line 133
    .line 134
    .line 135
    iget-object v4, p0, Ll/njw$b;->a:Ll/njw;

    .line 136
    .line 137
    invoke-static {v4}, Ll/njw;->b(Ll/njw;)I

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    sub-int v4, v3, v4

    .line 142
    .line 143
    iget-object v5, p0, Ll/njw$b;->a:Ll/njw;

    .line 144
    .line 145
    invoke-static {v5, v3}, Ll/njw;->e(Ll/njw;I)V

    .line 146
    .line 147
    .line 148
    :cond_4
    new-instance v3, Lorg/json/JSONObject;

    .line 149
    .line 150
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 151
    .line 152
    .line 153
    :try_start_2
    const-string v5, "type"

    .line 154
    .line 155
    iget-object v6, p0, Ll/njw$b;->a:Ll/njw;

    .line 156
    .line 157
    invoke-static {v6}, Ll/njw;->c(Ll/njw;)Z

    .line 158
    .line 159
    .line 160
    move-result v6

    .line 161
    if-eqz v6, :cond_5

    .line 162
    .line 163
    const-string v6, "show"

    .line 164
    .line 165
    goto :goto_1

    .line 166
    :catch_0
    move-exception v5

    .line 167
    goto :goto_2

    .line 168
    :cond_5
    const-string v6, "hide"

    .line 169
    .line 170
    :goto_1
    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 171
    .line 172
    .line 173
    const-string v5, "height"

    .line 174
    .line 175
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    .line 176
    .line 177
    .line 178
    move-result v6

    .line 179
    invoke-static {v6}, Ll/lpj0;->a(I)I

    .line 180
    .line 181
    .line 182
    move-result v6

    .line 183
    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 184
    .line 185
    .line 186
    goto :goto_3

    .line 187
    :goto_2
    :try_start_3
    invoke-static {v1, v0, v5}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 188
    .line 189
    .line 190
    :goto_3
    iget-object v5, p0, Ll/njw$b;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 191
    .line 192
    if-eqz v5, :cond_6

    .line 193
    .line 194
    new-instance v6, Ljava/lang/StringBuilder;

    .line 195
    .line 196
    invoke-direct {v6, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    iget-object p0, p0, Ll/njw$b;->a:Ll/njw;

    .line 200
    .line 201
    invoke-static {p0}, Ll/njw;->c(Ll/njw;)Z

    .line 202
    .line 203
    .line 204
    move-result p0

    .line 205
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    const-string p0, "   keyboardSize="

    .line 209
    .line 210
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    invoke-static {v1, p0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    const-string p0, "keyboard"

    .line 224
    .line 225
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    invoke-virtual {v5}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    invoke-virtual {v5, p0, v2, v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->x0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 234
    .line 235
    .line 236
    goto :goto_5

    .line 237
    :goto_4
    invoke-static {v1, v0, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 238
    .line 239
    .line 240
    :cond_6
    :goto_5
    return-void
.end method
