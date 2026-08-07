.class public final Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;
.super Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullNativeFragment;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0000\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H\u0014\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J-\u0010\u000e\u001a\u0004\u0018\u00010\r2\u0006\u0010\u0008\u001a\u00020\u00072\u0008\u0010\n\u001a\u0004\u0018\u00010\t2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000bH\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0017\u0010\u0013\u001a\u00020\u00122\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u0010\u00a2\u0006\u0004\u0008\u0013\u0010\u0014R\u0018\u0010\u0018\u001a\u0004\u0018\u00010\u00158\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\u0017\u00a8\u0006\u0019"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;",
        "Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullNativeFragment;",
        "<init>",
        "()V",
        "Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;",
        "W3",
        "()Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;",
        "Landroid/view/LayoutInflater;",
        "inflater",
        "Landroid/view/ViewGroup;",
        "container",
        "Landroid/os/Bundle;",
        "savedInstanceState",
        "Landroid/view/View;",
        "onCreateView",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;",
        "Landroid/content/Context;",
        "context",
        "",
        "I4",
        "(Landroid/content/Context;)Z",
        "Landroid/widget/RelativeLayout;",
        "H",
        "Landroid/widget/RelativeLayout;",
        "relativeLayout",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field private H:Landroid/widget/RelativeLayout;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullNativeFragment;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static G4(Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->Y3(Landroid/os/Bundle;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static final synthetic H4(Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;)Landroid/widget/RelativeLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;->H:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final I4(Landroid/content/Context;)Z
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Ll/uzd;->H(Landroid/content/Context;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, 0x2

    .line 6
    if-ne p0, p1, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public W3()Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;
    .locals 11
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;->Companion:Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->e4()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->T()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment;->v4()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    :goto_0
    move v4, v1

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    const/4 v1, 0x0

    .line 31
    goto :goto_0

    .line 32
    :goto_1
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->m4()Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->b4()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v8

    .line 40
    const/16 v9, 0x60

    .line 41
    .line 42
    const/4 v10, 0x0

    .line 43
    const/4 v6, 0x0

    .line 44
    const/4 v7, 0x0

    .line 45
    move-object v1, p0

    .line 46
    invoke-static/range {v0 .. v10}, Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;->b(Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;Landroidx/fragment/app/Fragment;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;IZLcom/clevertap/android/sdk/inapp/images/FileResourceProvider;ZLkotlin/jvm/functions/Function0;Ljava/lang/String;ILjava/lang/Object;)Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 20
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    new-instance v3, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    invoke-virtual {v4}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->T()Z

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    const/4 v5, 0x0

    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment;->v4()Z

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-nez v4, :cond_1

    .line 31
    .line 32
    :cond_0
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v4}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->P()Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-eqz v4, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-virtual {v0, v4}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;->I4(Landroid/content/Context;)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_2

    .line 51
    .line 52
    :cond_1
    sget v4, Ll/efc0;->u:I

    .line 53
    .line 54
    invoke-virtual {v1, v4, v2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    sget v4, Ll/efc0;->f:I

    .line 63
    .line 64
    invoke-virtual {v1, v4, v2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 69
    .line 70
    .line 71
    :goto_0
    sget v4, Ll/icc0;->i0:I

    .line 72
    .line 73
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    check-cast v4, Landroid/widget/FrameLayout;

    .line 78
    .line 79
    const v6, 0x30a68

    .line 80
    .line 81
    .line 82
    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v6

    .line 86
    check-cast v6, Lcom/clevertap/android/sdk/customviews/CloseImageView;

    .line 87
    .line 88
    sget v7, Ll/icc0;->P:I

    .line 89
    .line 90
    invoke-virtual {v4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v7

    .line 94
    check-cast v7, Landroid/widget/RelativeLayout;

    .line 95
    .line 96
    iput-object v7, v0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;->H:Landroid/widget/RelativeLayout;

    .line 97
    .line 98
    if-eqz v7, :cond_3

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 101
    .line 102
    .line 103
    move-result-object v8

    .line 104
    invoke-virtual {v8}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->d()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v8

    .line 108
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v8

    .line 112
    invoke-virtual {v7, v8}, Landroid/view/View;->setBackgroundColor(I)V

    .line 113
    .line 114
    .line 115
    :cond_3
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->e4()I

    .line 116
    .line 117
    .line 118
    move-result v7

    .line 119
    const/4 v8, 0x2

    .line 120
    const/4 v9, 0x1

    .line 121
    if-eq v7, v9, :cond_5

    .line 122
    .line 123
    if-eq v7, v8, :cond_4

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_4
    iget-object v1, v0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;->H:Landroid/widget/RelativeLayout;

    .line 127
    .line 128
    if-eqz v1, :cond_6

    .line 129
    .line 130
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    if-eqz v1, :cond_6

    .line 135
    .line 136
    new-instance v7, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b;

    .line 137
    .line 138
    invoke-direct {v7, v0, v6}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b;-><init>(Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;Lcom/clevertap/android/sdk/customviews/CloseImageView;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v1, v7}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 142
    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_5
    iget-object v7, v0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;->H:Landroid/widget/RelativeLayout;

    .line 146
    .line 147
    if-eqz v7, :cond_6

    .line 148
    .line 149
    invoke-virtual {v7}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 150
    .line 151
    .line 152
    move-result-object v7

    .line 153
    if-eqz v7, :cond_6

    .line 154
    .line 155
    new-instance v10, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$a;

    .line 156
    .line 157
    invoke-direct {v10, v0, v1, v6}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$a;-><init>(Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;Landroid/view/LayoutInflater;Lcom/clevertap/android/sdk/customviews/CloseImageView;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v7, v10}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 161
    .line 162
    .line 163
    :cond_6
    :goto_1
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->h4()Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;

    .line 164
    .line 165
    .line 166
    move-result-object v11

    .line 167
    iget-object v12, v0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;->H:Landroid/widget/RelativeLayout;

    .line 168
    .line 169
    new-instance v13, Ll/brm;

    .line 170
    .line 171
    sget v14, Ll/icc0;->a:I

    .line 172
    .line 173
    sget v17, Ll/icc0;->I:I

    .line 174
    .line 175
    const/16 v18, 0x4

    .line 176
    .line 177
    const/16 v19, 0x0

    .line 178
    .line 179
    const/4 v15, 0x0

    .line 180
    const/16 v16, 0x0

    .line 181
    .line 182
    invoke-direct/range {v13 .. v19}, Ll/brm;-><init>(IZIIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 183
    .line 184
    .line 185
    const/4 v15, 0x4

    .line 186
    const/16 v16, 0x0

    .line 187
    .line 188
    const/4 v14, 0x0

    .line 189
    invoke-static/range {v11 .. v16}, Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$b;->b(Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;Landroid/widget/RelativeLayout;Ll/brm;Landroid/view/View$OnClickListener;ILjava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    iget-object v1, v0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;->H:Landroid/widget/RelativeLayout;

    .line 193
    .line 194
    const/4 v7, 0x0

    .line 195
    if-eqz v1, :cond_7

    .line 196
    .line 197
    sget v10, Ll/icc0;->N:I

    .line 198
    .line 199
    invoke-virtual {v1, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    check-cast v1, Landroid/widget/LinearLayout;

    .line 204
    .line 205
    goto :goto_2

    .line 206
    :cond_7
    move-object v1, v7

    .line 207
    :goto_2
    if-eqz v1, :cond_8

    .line 208
    .line 209
    sget v10, Ll/icc0;->J:I

    .line 210
    .line 211
    invoke-virtual {v1, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 212
    .line 213
    .line 214
    move-result-object v10

    .line 215
    check-cast v10, Landroid/widget/Button;

    .line 216
    .line 217
    goto :goto_3

    .line 218
    :cond_8
    move-object v10, v7

    .line 219
    :goto_3
    if-eqz v10, :cond_9

    .line 220
    .line 221
    invoke-interface {v3, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    :cond_9
    if-eqz v1, :cond_a

    .line 225
    .line 226
    sget v11, Ll/icc0;->K:I

    .line 227
    .line 228
    invoke-virtual {v1, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    check-cast v1, Landroid/widget/Button;

    .line 233
    .line 234
    goto :goto_4

    .line 235
    :cond_a
    move-object v1, v7

    .line 236
    :goto_4
    if-eqz v1, :cond_b

    .line 237
    .line 238
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    :cond_b
    iget-object v11, v0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;->H:Landroid/widget/RelativeLayout;

    .line 242
    .line 243
    if-eqz v11, :cond_c

    .line 244
    .line 245
    sget v12, Ll/icc0;->Q:I

    .line 246
    .line 247
    invoke-virtual {v11, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object v11

    .line 251
    check-cast v11, Landroid/widget/TextView;

    .line 252
    .line 253
    goto :goto_5

    .line 254
    :cond_c
    move-object v11, v7

    .line 255
    :goto_5
    if-eqz v11, :cond_d

    .line 256
    .line 257
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 258
    .line 259
    .line 260
    move-result-object v12

    .line 261
    invoke-virtual {v12}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->B()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v12

    .line 265
    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 266
    .line 267
    .line 268
    :cond_d
    if-eqz v11, :cond_e

    .line 269
    .line 270
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 271
    .line 272
    .line 273
    move-result-object v12

    .line 274
    invoke-virtual {v12}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->C()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v12

    .line 278
    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 279
    .line 280
    .line 281
    move-result v12

    .line 282
    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 283
    .line 284
    .line 285
    :cond_e
    iget-object v11, v0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;->H:Landroid/widget/RelativeLayout;

    .line 286
    .line 287
    if-eqz v11, :cond_f

    .line 288
    .line 289
    sget v7, Ll/icc0;->O:I

    .line 290
    .line 291
    invoke-virtual {v11, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 292
    .line 293
    .line 294
    move-result-object v7

    .line 295
    check-cast v7, Landroid/widget/TextView;

    .line 296
    .line 297
    :cond_f
    if-eqz v7, :cond_10

    .line 298
    .line 299
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 300
    .line 301
    .line 302
    move-result-object v11

    .line 303
    invoke-virtual {v11}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->w()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v11

    .line 307
    invoke-virtual {v7, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 308
    .line 309
    .line 310
    :cond_10
    if-eqz v7, :cond_11

    .line 311
    .line 312
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 313
    .line 314
    .line 315
    move-result-object v11

    .line 316
    invoke-virtual {v11}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->x()Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object v11

    .line 320
    invoke-static {v11}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 321
    .line 322
    .line 323
    move-result v11

    .line 324
    invoke-virtual {v7, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 325
    .line 326
    .line 327
    :cond_11
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 328
    .line 329
    .line 330
    move-result-object v7

    .line 331
    invoke-virtual {v7}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->f()Ljava/util/List;

    .line 332
    .line 333
    .line 334
    move-result-object v7

    .line 335
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 336
    .line 337
    .line 338
    move-result v11

    .line 339
    const/16 v12, 0x8

    .line 340
    .line 341
    if-ne v11, v9, :cond_14

    .line 342
    .line 343
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->e4()I

    .line 344
    .line 345
    .line 346
    move-result v3

    .line 347
    if-ne v3, v8, :cond_12

    .line 348
    .line 349
    if-eqz v10, :cond_13

    .line 350
    .line 351
    invoke-virtual {v10, v12}, Landroid/view/View;->setVisibility(I)V

    .line 352
    .line 353
    .line 354
    goto :goto_6

    .line 355
    :cond_12
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->e4()I

    .line 356
    .line 357
    .line 358
    move-result v3

    .line 359
    if-ne v3, v9, :cond_13

    .line 360
    .line 361
    if-eqz v10, :cond_13

    .line 362
    .line 363
    const/4 v3, 0x4

    .line 364
    invoke-virtual {v10, v3}, Landroid/view/View;->setVisibility(I)V

    .line 365
    .line 366
    .line 367
    :cond_13
    :goto_6
    if-eqz v1, :cond_16

    .line 368
    .line 369
    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 370
    .line 371
    .line 372
    move-result-object v3

    .line 373
    check-cast v3, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;

    .line 374
    .line 375
    invoke-virtual {v0, v1, v3, v5}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullNativeFragment;->F4(Landroid/widget/Button;Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;I)V

    .line 376
    .line 377
    .line 378
    goto :goto_9

    .line 379
    :cond_14
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    .line 380
    .line 381
    .line 382
    move-result v1

    .line 383
    if-nez v1, :cond_16

    .line 384
    .line 385
    move-object v1, v7

    .line 386
    check-cast v1, Ljava/util/Collection;

    .line 387
    .line 388
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    .line 389
    .line 390
    .line 391
    move-result v1

    .line 392
    move v9, v5

    .line 393
    :goto_7
    if-ge v9, v1, :cond_16

    .line 394
    .line 395
    if-lt v9, v8, :cond_15

    .line 396
    .line 397
    goto :goto_8

    .line 398
    :cond_15
    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 399
    .line 400
    .line 401
    move-result-object v10

    .line 402
    check-cast v10, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;

    .line 403
    .line 404
    invoke-interface {v3, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 405
    .line 406
    .line 407
    move-result-object v11

    .line 408
    check-cast v11, Landroid/widget/Button;

    .line 409
    .line 410
    invoke-virtual {v0, v11, v10, v9}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullNativeFragment;->F4(Landroid/widget/Button;Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;I)V

    .line 411
    .line 412
    .line 413
    :goto_8
    add-int/lit8 v9, v9, 0x1

    .line 414
    .line 415
    goto :goto_7

    .line 416
    :cond_16
    :goto_9
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .line 417
    .line 418
    const/high16 v3, -0x45000000    # -0.001953125f

    .line 419
    .line 420
    invoke-direct {v1, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 421
    .line 422
    .line 423
    invoke-virtual {v4, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 424
    .line 425
    .line 426
    new-instance v1, Ll/kv3;

    .line 427
    .line 428
    invoke-direct {v1, v0}, Ll/kv3;-><init>(Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;)V

    .line 429
    .line 430
    .line 431
    invoke-virtual {v6, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 432
    .line 433
    .line 434
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 435
    .line 436
    .line 437
    move-result-object v0

    .line 438
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->K()Z

    .line 439
    .line 440
    .line 441
    move-result v0

    .line 442
    if-nez v0, :cond_17

    .line 443
    .line 444
    invoke-virtual {v6, v12}, Landroid/view/View;->setVisibility(I)V

    .line 445
    .line 446
    .line 447
    return-object v2

    .line 448
    :cond_17
    invoke-virtual {v6, v5}, Landroid/view/View;->setVisibility(I)V

    .line 449
    .line 450
    .line 451
    return-object v2
.end method
