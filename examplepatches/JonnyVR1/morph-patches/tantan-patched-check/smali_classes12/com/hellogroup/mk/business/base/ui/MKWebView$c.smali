.class Lcom/hellogroup/mk/business/base/ui/MKWebView$c;
.super Ll/jri;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/base/ui/MKWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jri;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lez v0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    move v1, v0

    .line 23
    :goto_0
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 24
    .line 25
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 32
    .line 33
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    move v2, v0

    .line 43
    :goto_1
    if-ge v1, v2, :cond_2

    .line 44
    .line 45
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 46
    .line 47
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 58
    .line 59
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    check-cast v2, Ll/ilw;

    .line 68
    .line 69
    invoke-virtual {v2, p1}, Ll/ilw;->a(Landroid/webkit/ConsoleMessage;)Z

    .line 70
    .line 71
    .line 72
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    sget-object v0, Landroid/webkit/ConsoleMessage$MessageLevel;->ERROR:Landroid/webkit/ConsoleMessage$MessageLevel;

    .line 76
    .line 77
    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->messageLevel()Landroid/webkit/ConsoleMessage$MessageLevel;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_5

    .line 86
    .line 87
    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->message()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-static {v1}, Ll/c2f;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    if-nez v3, :cond_3

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_3
    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->message()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    :goto_2
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    if-nez v3, :cond_4

    .line 111
    .line 112
    const-string v3, "[WE]"

    .line 113
    .line 114
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    if-eqz v3, :cond_4

    .line 119
    .line 120
    iget-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 121
    .line 122
    invoke-virtual {v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-static {v3}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    invoke-virtual {v3, v2}, Ll/xkw;->X(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    goto :goto_3

    .line 134
    :cond_4
    iget-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 135
    .line 136
    invoke-virtual {v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-static {v3}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-virtual {v3, v2}, Ll/xkw;->E(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    :goto_3
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 148
    .line 149
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->k(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    if-eqz v2, :cond_6

    .line 154
    .line 155
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 156
    .line 157
    invoke-virtual {v2}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    iget-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 162
    .line 163
    invoke-static {v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->m(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    const-string v4, "mk"

    .line 168
    .line 169
    invoke-static {v4, v2, v3, v1}, Ll/qgi;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    goto :goto_4

    .line 173
    :cond_5
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 174
    .line 175
    invoke-virtual {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    invoke-static {v1}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->message()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    invoke-virtual {v1, v2}, Ll/xkw;->F(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    :cond_6
    :goto_4
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 191
    .line 192
    invoke-virtual {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebMonitorListener()Ll/grp0;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    if-eqz v1, :cond_7

    .line 197
    .line 198
    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->messageLevel()Landroid/webkit/ConsoleMessage$MessageLevel;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    if-eqz v0, :cond_7

    .line 207
    .line 208
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 209
    .line 210
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebMonitorListener()Ll/grp0;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 215
    .line 216
    invoke-static {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->c0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->message()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    iget-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 225
    .line 226
    invoke-static {v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->c0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    const/4 v4, -0x1

    .line 231
    invoke-interface {v0, v1, v4, v2, v3}, Ll/grp0;->d(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    :cond_7
    invoke-super {p0, p1}, Landroid/webkit/WebChromeClient;->onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z

    .line 235
    .line 236
    .line 237
    move-result p0

    .line 238
    return p0
.end method

.method public onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 5
    .line 6
    invoke-static {p0, p1, p2}, Ll/glw;->n(Landroid/view/View;Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_4

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-eqz v1, :cond_4

    .line 9
    .line 10
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    goto :goto_2

    .line 19
    :cond_0
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    if-eqz v1, :cond_3

    .line 26
    .line 27
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-lez v1, :cond_3

    .line 38
    .line 39
    move v1, v0

    .line 40
    :goto_0
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 41
    .line 42
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 49
    .line 50
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    move v2, v0

    .line 60
    :goto_1
    if-ge v1, v2, :cond_3

    .line 61
    .line 62
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 63
    .line 64
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    if-eqz v2, :cond_2

    .line 73
    .line 74
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 75
    .line 76
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Ll/ilw;

    .line 85
    .line 86
    invoke-virtual {v2, p1, p2, p3, p4}, Ll/ilw;->b(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z

    .line 87
    .line 88
    .line 89
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_3
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebChromeClient;->onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    return p0

    .line 97
    :cond_4
    :goto_2
    return v0
.end method

.method public onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_4

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-eqz v1, :cond_4

    .line 9
    .line 10
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    goto :goto_2

    .line 19
    :cond_0
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    if-eqz v1, :cond_3

    .line 26
    .line 27
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-lez v1, :cond_3

    .line 38
    .line 39
    move v1, v0

    .line 40
    :goto_0
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 41
    .line 42
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 49
    .line 50
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    move v2, v0

    .line 60
    :goto_1
    if-ge v1, v2, :cond_3

    .line 61
    .line 62
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 63
    .line 64
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    if-eqz v2, :cond_2

    .line 73
    .line 74
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 75
    .line 76
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Ll/ilw;

    .line 85
    .line 86
    invoke-virtual {v2, p1, p2, p3, p4}, Ll/ilw;->c(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z

    .line 87
    .line 88
    .line 89
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_3
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebChromeClient;->onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    return p0

    .line 97
    :cond_4
    :goto_2
    return v0
.end method

.method public onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v2, "ms"

    .line 4
    .line 5
    const-string v3, "       "

    .line 6
    .line 7
    const-string v4, "   "

    .line 8
    .line 9
    const-string v5, "tang-----onJsPrompt-\u5904\u7406\u65f6\u95f4\u662f  "

    .line 10
    .line 11
    const-string v6, "MK---WebView"

    .line 12
    .line 13
    iget-object v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v7, 0x1

    .line 20
    if-eqz v0, :cond_d

    .line 21
    .line 22
    if-eqz p1, :cond_d

    .line 23
    .line 24
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_d

    .line 29
    .line 30
    iget-object v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    goto/16 :goto_b

    .line 39
    .line 40
    :cond_0
    iget-object v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const/4 v8, 0x0

    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    iget-object v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-lez v0, :cond_3

    .line 60
    .line 61
    move v0, v8

    .line 62
    :goto_0
    iget-object v9, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 63
    .line 64
    invoke-static {v9}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object v9

    .line 68
    if-eqz v9, :cond_1

    .line 69
    .line 70
    iget-object v9, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 71
    .line 72
    invoke-static {v9}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 73
    .line 74
    .line 75
    move-result-object v9

    .line 76
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 77
    .line 78
    .line 79
    move-result v9

    .line 80
    goto :goto_1

    .line 81
    :cond_1
    move v9, v8

    .line 82
    :goto_1
    if-ge v0, v9, :cond_3

    .line 83
    .line 84
    iget-object v9, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 85
    .line 86
    invoke-static {v9}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 87
    .line 88
    .line 89
    move-result-object v9

    .line 90
    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v9

    .line 94
    if-eqz v9, :cond_2

    .line 95
    .line 96
    iget-object v9, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 97
    .line 98
    invoke-static {v9}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 99
    .line 100
    .line 101
    move-result-object v9

    .line 102
    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v9

    .line 106
    move-object v10, v9

    .line 107
    check-cast v10, Ll/ilw;

    .line 108
    .line 109
    move-object/from16 v11, p1

    .line 110
    .line 111
    move-object/from16 v12, p2

    .line 112
    .line 113
    move-object/from16 v13, p3

    .line 114
    .line 115
    move-object/from16 v14, p4

    .line 116
    .line 117
    move-object/from16 v15, p5

    .line 118
    .line 119
    invoke-virtual/range {v10 .. v15}, Ll/ilw;->d(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z

    .line 120
    .line 121
    .line 122
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 126
    .line 127
    .line 128
    move-result-wide v9

    .line 129
    :try_start_0
    invoke-static/range {p2 .. p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-nez v0, :cond_4

    .line 134
    .line 135
    invoke-static/range {p2 .. p2}, Ll/bfe0;->d(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    goto :goto_2

    .line 139
    :catchall_0
    move-exception v0

    .line 140
    goto/16 :goto_8

    .line 141
    .line 142
    :catch_0
    move-exception v0

    .line 143
    goto/16 :goto_5

    .line 144
    .line 145
    :cond_4
    :goto_2
    iget-object v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 146
    .line 147
    move-object/from16 v14, p3

    .line 148
    .line 149
    invoke-static {v0, v14}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->n(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/hellogroup/mk/core/safety/MKUrlNotSafeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 150
    .line 151
    .line 152
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 153
    .line 154
    .line 155
    move-result-wide v11

    .line 156
    new-instance v0, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    sub-long/2addr v11, v9

    .line 174
    invoke-virtual {v0, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-static {v6, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual/range {p5 .. p5}, Landroid/webkit/JsResult;->cancel()V

    .line 188
    .line 189
    .line 190
    iget-object v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 191
    .line 192
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    if-eqz v0, :cond_9

    .line 197
    .line 198
    iget-object v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 199
    .line 200
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    if-lez v0, :cond_9

    .line 209
    .line 210
    move v0, v8

    .line 211
    :goto_3
    iget-object v2, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 212
    .line 213
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    if-eqz v2, :cond_5

    .line 218
    .line 219
    iget-object v2, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 220
    .line 221
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 226
    .line 227
    .line 228
    move-result v2

    .line 229
    goto :goto_4

    .line 230
    :cond_5
    move v2, v8

    .line 231
    :goto_4
    if-ge v0, v2, :cond_9

    .line 232
    .line 233
    iget-object v2, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 234
    .line 235
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    if-eqz v2, :cond_6

    .line 244
    .line 245
    iget-object v2, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 246
    .line 247
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object v2

    .line 255
    move-object v11, v2

    .line 256
    check-cast v11, Ll/ilw;

    .line 257
    .line 258
    move-object/from16 v12, p1

    .line 259
    .line 260
    move-object/from16 v13, p2

    .line 261
    .line 262
    move-object/from16 v15, p4

    .line 263
    .line 264
    move-object/from16 v16, p5

    .line 265
    .line 266
    invoke-virtual/range {v11 .. v16}, Ll/ilw;->d(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z

    .line 267
    .line 268
    .line 269
    :cond_6
    add-int/lit8 v0, v0, 0x1

    .line 270
    .line 271
    move-object/from16 v14, p3

    .line 272
    .line 273
    goto :goto_3

    .line 274
    :goto_5
    :try_start_1
    const-string v11, ""

    .line 275
    .line 276
    invoke-static {v6, v11, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 277
    .line 278
    .line 279
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 280
    .line 281
    .line 282
    move-result-wide v11

    .line 283
    new-instance v0, Ljava/lang/StringBuilder;

    .line 284
    .line 285
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    invoke-virtual {v0, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    sub-long/2addr v11, v9

    .line 301
    invoke-virtual {v0, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    invoke-static {v6, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    invoke-virtual/range {p5 .. p5}, Landroid/webkit/JsResult;->cancel()V

    .line 315
    .line 316
    .line 317
    iget-object v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 318
    .line 319
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    if-eqz v0, :cond_9

    .line 324
    .line 325
    iget-object v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 326
    .line 327
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 332
    .line 333
    .line 334
    move-result v0

    .line 335
    if-lez v0, :cond_9

    .line 336
    .line 337
    move v0, v8

    .line 338
    :goto_6
    iget-object v2, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 339
    .line 340
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 341
    .line 342
    .line 343
    move-result-object v2

    .line 344
    if-eqz v2, :cond_7

    .line 345
    .line 346
    iget-object v2, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 347
    .line 348
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 349
    .line 350
    .line 351
    move-result-object v2

    .line 352
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 353
    .line 354
    .line 355
    move-result v2

    .line 356
    goto :goto_7

    .line 357
    :cond_7
    move v2, v8

    .line 358
    :goto_7
    if-ge v0, v2, :cond_9

    .line 359
    .line 360
    iget-object v2, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 361
    .line 362
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 363
    .line 364
    .line 365
    move-result-object v2

    .line 366
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 367
    .line 368
    .line 369
    move-result-object v2

    .line 370
    if-eqz v2, :cond_8

    .line 371
    .line 372
    iget-object v2, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 373
    .line 374
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 375
    .line 376
    .line 377
    move-result-object v2

    .line 378
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 379
    .line 380
    .line 381
    move-result-object v2

    .line 382
    move-object v11, v2

    .line 383
    check-cast v11, Ll/ilw;

    .line 384
    .line 385
    move-object/from16 v12, p1

    .line 386
    .line 387
    move-object/from16 v13, p2

    .line 388
    .line 389
    move-object/from16 v14, p3

    .line 390
    .line 391
    move-object/from16 v15, p4

    .line 392
    .line 393
    move-object/from16 v16, p5

    .line 394
    .line 395
    invoke-virtual/range {v11 .. v16}, Ll/ilw;->d(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z

    .line 396
    .line 397
    .line 398
    :cond_8
    add-int/lit8 v0, v0, 0x1

    .line 399
    .line 400
    goto :goto_6

    .line 401
    :cond_9
    return v7

    .line 402
    :goto_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 403
    .line 404
    .line 405
    move-result-wide v11

    .line 406
    new-instance v7, Ljava/lang/StringBuilder;

    .line 407
    .line 408
    invoke-direct {v7, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 409
    .line 410
    .line 411
    invoke-virtual {v7, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 412
    .line 413
    .line 414
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 415
    .line 416
    .line 417
    invoke-virtual {v7, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 418
    .line 419
    .line 420
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 421
    .line 422
    .line 423
    sub-long/2addr v11, v9

    .line 424
    invoke-virtual {v7, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 428
    .line 429
    .line 430
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 431
    .line 432
    .line 433
    move-result-object v2

    .line 434
    invoke-static {v6, v2}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 435
    .line 436
    .line 437
    invoke-virtual/range {p5 .. p5}, Landroid/webkit/JsResult;->cancel()V

    .line 438
    .line 439
    .line 440
    iget-object v2, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 441
    .line 442
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 443
    .line 444
    .line 445
    move-result-object v2

    .line 446
    if-eqz v2, :cond_c

    .line 447
    .line 448
    iget-object v2, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 449
    .line 450
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 451
    .line 452
    .line 453
    move-result-object v2

    .line 454
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 455
    .line 456
    .line 457
    move-result v2

    .line 458
    if-lez v2, :cond_c

    .line 459
    .line 460
    move v2, v8

    .line 461
    :goto_9
    iget-object v3, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 462
    .line 463
    invoke-static {v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 464
    .line 465
    .line 466
    move-result-object v3

    .line 467
    if-eqz v3, :cond_a

    .line 468
    .line 469
    iget-object v3, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 470
    .line 471
    invoke-static {v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 472
    .line 473
    .line 474
    move-result-object v3

    .line 475
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 476
    .line 477
    .line 478
    move-result v3

    .line 479
    goto :goto_a

    .line 480
    :cond_a
    move v3, v8

    .line 481
    :goto_a
    if-ge v2, v3, :cond_c

    .line 482
    .line 483
    iget-object v3, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 484
    .line 485
    invoke-static {v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 486
    .line 487
    .line 488
    move-result-object v3

    .line 489
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 490
    .line 491
    .line 492
    move-result-object v3

    .line 493
    if-eqz v3, :cond_b

    .line 494
    .line 495
    iget-object v3, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 496
    .line 497
    invoke-static {v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 498
    .line 499
    .line 500
    move-result-object v3

    .line 501
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 502
    .line 503
    .line 504
    move-result-object v3

    .line 505
    move-object v11, v3

    .line 506
    check-cast v11, Ll/ilw;

    .line 507
    .line 508
    move-object/from16 v12, p1

    .line 509
    .line 510
    move-object/from16 v13, p2

    .line 511
    .line 512
    move-object/from16 v14, p3

    .line 513
    .line 514
    move-object/from16 v15, p4

    .line 515
    .line 516
    move-object/from16 v16, p5

    .line 517
    .line 518
    invoke-virtual/range {v11 .. v16}, Ll/ilw;->d(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z

    .line 519
    .line 520
    .line 521
    :cond_b
    add-int/lit8 v2, v2, 0x1

    .line 522
    .line 523
    goto :goto_9

    .line 524
    :cond_c
    throw v0

    .line 525
    :cond_d
    :goto_b
    return v7
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onProgressChanged(Landroid/webkit/WebView;I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->q(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const/16 v0, 0x1e

    .line 13
    .line 14
    if-le p2, v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-static {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->r(Lcom/hellogroup/mk/business/base/ui/MKWebView;Z)Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 23
    .line 24
    const-string v1, "onProgressChanged"

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/c2f;->e(Ll/hul;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-lez v0, :cond_3

    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    move v1, v0

    .line 51
    :goto_0
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 52
    .line 53
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    if-eqz v2, :cond_1

    .line 58
    .line 59
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 60
    .line 61
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    goto :goto_1

    .line 70
    :cond_1
    move v2, v0

    .line 71
    :goto_1
    if-ge v1, v2, :cond_3

    .line 72
    .line 73
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 74
    .line 75
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    if-eqz v2, :cond_2

    .line 84
    .line 85
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 86
    .line 87
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    check-cast v2, Ll/ilw;

    .line 96
    .line 97
    invoke-virtual {v2, p1, p2}, Ll/ilw;->h(Landroid/webkit/WebView;I)V

    .line 98
    .line 99
    .line 100
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_3
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 104
    .line 105
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebMonitorListener()Ll/grp0;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    if-eqz v0, :cond_4

    .line 110
    .line 111
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 112
    .line 113
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebMonitorListener()Ll/grp0;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-interface {v0, p1, p2}, Ll/grp0;->f(Landroid/webkit/WebView;I)V

    .line 118
    .line 119
    .line 120
    :cond_4
    :try_start_0
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 121
    .line 122
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    if-eqz p1, :cond_5

    .line 127
    .line 128
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 129
    .line 130
    invoke-static {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;->k(Ljava/lang/Integer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    .line 140
    .line 141
    :cond_5
    return-void

    .line 142
    :catch_0
    move-exception p0

    .line 143
    const-string p1, "MK---WebView"

    .line 144
    .line 145
    const-string p2, ""

    .line 146
    .line 147
    invoke-static {p1, p2, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public onReceivedIcon(Landroid/webkit/WebView;Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onReceivedIcon(Landroid/webkit/WebView;Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-lez v0, :cond_2

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    move v1, v0

    .line 26
    :goto_0
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 27
    .line 28
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 35
    .line 36
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    move v2, v0

    .line 46
    :goto_1
    if-ge v1, v2, :cond_2

    .line 47
    .line 48
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 49
    .line 50
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    if-eqz v2, :cond_1

    .line 59
    .line 60
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 61
    .line 62
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    check-cast v2, Ll/ilw;

    .line 71
    .line 72
    invoke-virtual {v2, p1, p2}, Ll/ilw;->i(Landroid/webkit/WebView;Landroid/graphics/Bitmap;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    return-void
.end method

.method public onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getCurrentLogKey()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ll/mkw;->f()Ll/mkw;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1, v0}, Ll/mkw;->g(Ljava/lang/String;)Ll/pxl;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    check-cast v1, Ll/vkw;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/vkw;->p()V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/mkw;->f()Ll/mkw;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2, v0, v1}, Ll/mkw;->h(Ljava/lang/String;Ll/pxl;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-lez v0, :cond_3

    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    move v1, v0

    .line 54
    :goto_0
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 55
    .line 56
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    if-eqz v2, :cond_1

    .line 61
    .line 62
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 63
    .line 64
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    goto :goto_1

    .line 73
    :cond_1
    move v2, v0

    .line 74
    :goto_1
    if-ge v1, v2, :cond_3

    .line 75
    .line 76
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 77
    .line 78
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    if-eqz v2, :cond_2

    .line 87
    .line 88
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 89
    .line 90
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    check-cast v2, Ll/ilw;

    .line 99
    .line 100
    invoke-virtual {v2, p1, p2}, Ll/ilw;->k(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_3
    sget-object p1, Ll/auf;->INSTANCE:Ll/auf;

    .line 107
    .line 108
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 109
    .line 110
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->o(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p1, v0, p2}, Ll/auf;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 118
    .line 119
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    if-eqz p1, :cond_4

    .line 124
    .line 125
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 126
    .line 127
    invoke-static {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {p0, p2}, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;->m(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    :cond_4
    return-void
.end method

.method public onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/webkit/WebChromeClient$FileChooserParams;",
            ")Z"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ll/wam;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ll/wam;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1}, Ll/wam;->d()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ll/wam;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-interface {p1, v0, p2}, Ll/wam;->b(Landroid/webkit/ValueCallback;Landroid/webkit/ValueCallback;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ll/wam;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance p2, Ll/wam$a;

    .line 38
    .line 39
    invoke-direct {p2, p3}, Ll/wam$a;-><init>(Landroid/webkit/WebChromeClient$FileChooserParams;)V

    .line 40
    .line 41
    .line 42
    invoke-interface {p1, p2}, Ll/wam;->c(Ll/wam$a;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 46
    .line 47
    invoke-static {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ll/wam;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {p0}, Ll/wam;->f()V

    .line 52
    .line 53
    .line 54
    :cond_0
    const/4 p0, 0x1

    .line 55
    return p0
.end method

.method public openFileChooser(Landroid/webkit/ValueCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/ValueCallback<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .line 56
    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->openFileChooser(Landroid/webkit/ValueCallback;Ljava/lang/String;)V

    return-void
.end method

.method public openFileChooser(Landroid/webkit/ValueCallback;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/ValueCallback<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 55
    invoke-virtual {p0, p1, p2, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->openFileChooser(Landroid/webkit/ValueCallback;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public openFileChooser(Landroid/webkit/ValueCallback;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/ValueCallback<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ll/wam;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    iget-object p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    invoke-static {p3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ll/wam;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    invoke-interface {p3}, Ll/wam;->d()Z

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    if-nez p3, :cond_0

    .line 20
    .line 21
    iget-object p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 22
    .line 23
    invoke-static {p3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ll/wam;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-interface {p3, p1, v0}, Ll/wam;->b(Landroid/webkit/ValueCallback;Landroid/webkit/ValueCallback;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ll/wam;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance p3, Ll/wam$a;

    .line 38
    .line 39
    invoke-direct {p3, p2}, Ll/wam$a;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-interface {p1, p3}, Ll/wam;->c(Ll/wam$a;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 46
    .line 47
    invoke-static {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ll/wam;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {p0}, Ll/wam;->f()V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method
