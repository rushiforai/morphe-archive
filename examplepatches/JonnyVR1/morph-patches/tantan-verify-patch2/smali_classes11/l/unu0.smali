.class public final Ll/unu0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/ltu0;

.field public final b:Ll/qru0;

.field public c:Landroid/view/ViewTreeObserver$OnScrollChangedListener;


# direct methods
.method public constructor <init>(Ll/ltu0;Ll/qru0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/unu0;->a:Ll/ltu0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/unu0;->b:Ll/qru0;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Ll/unu0;->c:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    .line 10
    .line 11
    return-void
.end method

.method public static final f(Landroid/content/Context;Ljava/lang/String;I)I
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    :catch_0
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 6
    .line 7
    .line 8
    invoke-static {p0, p2}, Ll/obt0;->z(Landroid/content/Context;I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method


# virtual methods
.method public final a(Landroid/view/View;Landroid/view/WindowManager;)Landroid/view/View;
    .locals 10
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/WindowManager;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcjw;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/unu0;->a:Ll/ltu0;

    .line 2
    .line 3
    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzq;->H()Lcom/google/android/gms/ads/internal/client/zzq;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2, v2}, Ll/ltu0;->a(Lcom/google/android/gms/ads/internal/client/zzq;Ll/q6w0;Ll/t6w0;)Ll/wit0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    move-object v1, v0

    .line 13
    check-cast v1, Landroid/view/View;

    .line 14
    .line 15
    const/4 v2, 0x4

    .line 16
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    const-string v2, "policy_validator"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ll/onu0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/onu0;-><init>(Ll/unu0;)V

    .line 27
    .line 28
    .line 29
    const-string v2, "/sendMessageToSdk"

    .line 30
    .line 31
    invoke-interface {v0, v2, v1}, Ll/wit0;->j0(Ljava/lang/String;Ll/bqs0;)V

    .line 32
    .line 33
    .line 34
    new-instance v1, Ll/pnu0;

    .line 35
    .line 36
    invoke-direct {v1, p0, p2, p1}, Ll/pnu0;-><init>(Ll/unu0;Landroid/view/WindowManager;Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    const-string v2, "/hideValidatorOverlay"

    .line 40
    .line 41
    invoke-interface {v0, v2, v1}, Ll/wit0;->j0(Ljava/lang/String;Ll/bqs0;)V

    .line 42
    .line 43
    .line 44
    new-instance v3, Ll/mqs0;

    .line 45
    .line 46
    const/4 v8, 0x0

    .line 47
    const/4 v9, 0x0

    .line 48
    const/4 v4, 0x0

    .line 49
    const/4 v5, 0x0

    .line 50
    const/4 v6, 0x0

    .line 51
    const/4 v7, 0x0

    .line 52
    invoke-direct/range {v3 .. v9}, Ll/mqs0;-><init>(Ll/w9s0;Ll/m0t0;Ll/fbv0;Ll/xwu0;Ll/vcw0;Ll/dut0;)V

    .line 53
    .line 54
    .line 55
    const-string v1, "/open"

    .line 56
    .line 57
    invoke-interface {v0, v1, v3}, Ll/wit0;->j0(Ljava/lang/String;Ll/bqs0;)V

    .line 58
    .line 59
    .line 60
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 61
    .line 62
    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    new-instance v2, Ll/qnu0;

    .line 66
    .line 67
    invoke-direct {v2, p0, p1, p2}, Ll/qnu0;-><init>(Ll/unu0;Landroid/view/View;Landroid/view/WindowManager;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/unu0;->b:Ll/qru0;

    .line 71
    .line 72
    const-string p2, "/loadNativeAdPolicyViolations"

    .line 73
    .line 74
    invoke-virtual {p1, v1, p2, v2}, Ll/qru0;->j(Ljava/lang/ref/WeakReference;Ljava/lang/String;Ll/bqs0;)V

    .line 75
    .line 76
    .line 77
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 78
    .line 79
    invoke-direct {p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Ll/unu0;->b:Ll/qru0;

    .line 83
    .line 84
    const-string p2, "/showValidatorOverlay"

    .line 85
    .line 86
    sget-object v1, Ll/rnu0;->a:Ll/rnu0;

    .line 87
    .line 88
    invoke-virtual {p0, p1, p2, v1}, Ll/qru0;->j(Ljava/lang/ref/WeakReference;Ljava/lang/String;Ll/bqs0;)V

    .line 89
    .line 90
    .line 91
    check-cast v0, Landroid/view/View;

    .line 92
    .line 93
    return-object v0
.end method

.method public final synthetic b(Ll/wit0;Ljava/util/Map;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/unu0;->b:Ll/qru0;

    .line 2
    .line 3
    const-string p1, "sendMessageToNativeJs"

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/qru0;->g(Ljava/lang/String;Ljava/util/Map;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic c(Landroid/view/WindowManager;Landroid/view/View;Ll/wit0;Ljava/util/Map;)V
    .locals 1

    .line 1
    const-string p4, "Hide native ad policy validator overlay."

    .line 2
    .line 3
    invoke-static {p4}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p3}, Ll/wit0;->zzF()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p4

    .line 10
    const/16 v0, 0x8

    .line 11
    .line 12
    invoke-virtual {p4, v0}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p3}, Ll/wit0;->zzF()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    invoke-virtual {p4}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    if-eqz p4, :cond_0

    .line 24
    .line 25
    invoke-interface {p3}, Ll/wit0;->zzF()Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p4

    .line 29
    invoke-interface {p1, p4}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-interface {p3}, Ll/wit0;->destroy()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object p2, p0, Ll/unu0;->c:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    .line 40
    .line 41
    if-eqz p2, :cond_1

    .line 42
    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-eqz p2, :cond_1

    .line 50
    .line 51
    iget-object p0, p0, Ll/unu0;->c:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    .line 52
    .line 53
    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->removeOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public final synthetic d(Ljava/util/Map;ZILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    new-instance p2, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p3, "messageType"

    .line 7
    .line 8
    const-string p4, "validatorHtmlLoaded"

    .line 9
    .line 10
    invoke-interface {p2, p3, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    const-string p3, "id"

    .line 14
    .line 15
    invoke-interface {p1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ljava/lang/String;

    .line 20
    .line 21
    invoke-interface {p2, p3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/unu0;->b:Ll/qru0;

    .line 25
    .line 26
    const-string p1, "sendMessageToNativeJs"

    .line 27
    .line 28
    invoke-virtual {p0, p1, p2}, Ll/qru0;->g(Ljava/lang/String;Ljava/util/Map;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic e(Landroid/view/View;Landroid/view/WindowManager;Ll/wit0;Ljava/util/Map;)V
    .locals 11

    .line 1
    invoke-interface {p3}, Ll/wit0;->zzN()Ll/nkt0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/tnu0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p4}, Ll/tnu0;-><init>(Ll/unu0;Ljava/util/Map;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Ll/nkt0;->zzB(Ll/lkt0;)V

    .line 11
    .line 12
    .line 13
    if-nez p4, :cond_0

    .line 14
    .line 15
    goto/16 :goto_4

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "validator_width"

    .line 22
    .line 23
    invoke-interface {p4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/String;

    .line 28
    .line 29
    sget-object v2, Ll/sgs0;->V7:Ll/dgs0;

    .line 30
    .line 31
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v3, v2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Ljava/lang/Integer;

    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-static {v0, v1, v2}, Ll/unu0;->f(Landroid/content/Context;Ljava/lang/String;I)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    const-string v2, "validator_height"

    .line 50
    .line 51
    invoke-interface {p4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Ljava/lang/String;

    .line 56
    .line 57
    sget-object v3, Ll/sgs0;->W7:Ll/dgs0;

    .line 58
    .line 59
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    check-cast v3, Ljava/lang/Integer;

    .line 68
    .line 69
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    invoke-static {v0, v2, v3}, Ll/unu0;->f(Landroid/content/Context;Ljava/lang/String;I)I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    const-string v3, "validator_x"

    .line 78
    .line 79
    invoke-interface {p4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    check-cast v3, Ljava/lang/String;

    .line 84
    .line 85
    const/4 v4, 0x0

    .line 86
    invoke-static {v0, v3, v4}, Ll/unu0;->f(Landroid/content/Context;Ljava/lang/String;I)I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    const-string v5, "validator_y"

    .line 91
    .line 92
    invoke-interface {p4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    check-cast v5, Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {v0, v5, v4}, Ll/unu0;->f(Landroid/content/Context;Ljava/lang/String;I)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    invoke-static {v1, v2}, Ll/xkt0;->b(II)Ll/xkt0;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-interface {p3, v1}, Ll/wit0;->G(Ll/xkt0;)V

    .line 107
    .line 108
    .line 109
    :try_start_0
    invoke-interface {p3}, Ll/wit0;->L()Landroid/webkit/WebView;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    sget-object v2, Ll/sgs0;->X7:Ll/dgs0;

    .line 118
    .line 119
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    invoke-virtual {v4, v2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    check-cast v2, Ljava/lang/Boolean;

    .line 128
    .line 129
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 134
    .line 135
    .line 136
    invoke-interface {p3}, Ll/wit0;->L()Landroid/webkit/WebView;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    sget-object v2, Ll/sgs0;->Y7:Ll/dgs0;

    .line 145
    .line 146
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 147
    .line 148
    .line 149
    move-result-object v4

    .line 150
    invoke-virtual {v4, v2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    check-cast v2, Ljava/lang/Boolean;

    .line 155
    .line 156
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    .line 162
    .line 163
    :catch_0
    invoke-static {}, Ll/d4t0;->b()Landroid/view/WindowManager$LayoutParams;

    .line 164
    .line 165
    .line 166
    move-result-object v8

    .line 167
    iput v3, v8, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 168
    .line 169
    iput v0, v8, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 170
    .line 171
    invoke-interface {p3}, Ll/wit0;->zzF()Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-interface {p2, v1, v8}, Landroid/view/ViewManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 176
    .line 177
    .line 178
    const-string v1, "orientation"

    .line 179
    .line 180
    invoke-interface {p4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    move-object v7, v1

    .line 185
    check-cast v7, Ljava/lang/String;

    .line 186
    .line 187
    new-instance v1, Landroid/graphics/Rect;

    .line 188
    .line 189
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 190
    .line 191
    .line 192
    invoke-virtual {p1, v1}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    if-nez v2, :cond_1

    .line 197
    .line 198
    move-object v6, p3

    .line 199
    goto :goto_3

    .line 200
    :cond_1
    const-string v2, "1"

    .line 201
    .line 202
    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    if-nez v2, :cond_3

    .line 207
    .line 208
    const-string v2, "2"

    .line 209
    .line 210
    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result v2

    .line 214
    if-eqz v2, :cond_2

    .line 215
    .line 216
    goto :goto_1

    .line 217
    :cond_2
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 218
    .line 219
    :goto_0
    sub-int/2addr v1, v0

    .line 220
    move v9, v1

    .line 221
    goto :goto_2

    .line 222
    :cond_3
    :goto_1
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 223
    .line 224
    goto :goto_0

    .line 225
    :goto_2
    new-instance v4, Ll/snu0;

    .line 226
    .line 227
    move-object v5, p1

    .line 228
    move-object v10, p2

    .line 229
    move-object v6, p3

    .line 230
    invoke-direct/range {v4 .. v10}, Ll/snu0;-><init>(Landroid/view/View;Ll/wit0;Ljava/lang/String;Landroid/view/WindowManager$LayoutParams;ILandroid/view/WindowManager;)V

    .line 231
    .line 232
    .line 233
    iput-object v4, p0, Ll/unu0;->c:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    .line 234
    .line 235
    invoke-virtual {v5}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    if-eqz p1, :cond_4

    .line 240
    .line 241
    invoke-virtual {p1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    .line 242
    .line 243
    .line 244
    move-result p2

    .line 245
    if-eqz p2, :cond_4

    .line 246
    .line 247
    iget-object p0, p0, Ll/unu0;->c:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    .line 248
    .line 249
    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    .line 250
    .line 251
    .line 252
    :cond_4
    :goto_3
    const-string p0, "overlay_url"

    .line 253
    .line 254
    invoke-interface {p4, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    check-cast p0, Ljava/lang/String;

    .line 259
    .line 260
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 261
    .line 262
    .line 263
    move-result p1

    .line 264
    if-nez p1, :cond_5

    .line 265
    .line 266
    invoke-interface {v6, p0}, Ll/wit0;->loadUrl(Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    :cond_5
    :goto_4
    return-void
.end method
