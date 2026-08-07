.class public final Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\r\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u001d\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0014\u00a2\u0006\u0004\u0008\t\u0010\nJ\u001f\u0010\u000f\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000b2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\r\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0017\u0010\u0013\u001a\u00020\u00082\u0006\u0010\u0012\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J!\u0010\u0015\u001a\u00020\u00082\u0008\u0010\u000e\u001a\u0004\u0018\u00010\r2\u0006\u0010\u000c\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u0011\u0010\u0018\u001a\u0004\u0018\u00010\u0017H\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\u0019R\"\u0010\u001f\u001a\u00020\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u0013\u0010\u001a\u001a\u0004\u0008\u001b\u0010\u001c\"\u0004\u0008\u001d\u0010\u001eR\"\u0010&\u001a\u00020 8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u000f\u0010!\u001a\u0004\u0008\"\u0010#\"\u0004\u0008$\u0010%\u00a8\u0006\'"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;",
        "Landroid/widget/FrameLayout;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "onFinishInflate",
        "()V",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "purchaseType",
        "Lcom/p1/mobile/putong/core/data/Privilege;",
        "privilege",
        "b",
        "(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V",
        "Landroid/view/View;",
        "view",
        "a",
        "(Landroid/view/View;)V",
        "d",
        "(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)V",
        "",
        "c",
        "()Ljava/lang/CharSequence;",
        "Landroid/widget/FrameLayout;",
        "get_container",
        "()Landroid/widget/FrameLayout;",
        "set_container",
        "(Landroid/widget/FrameLayout;)V",
        "_container",
        "Lv/VText;",
        "Lv/VText;",
        "get_description",
        "()Lv/VText;",
        "set_description",
        "(Lv/VText;)V",
        "_description",
        "pay_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 3
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/kgb0;->a(Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/Privilege;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->d(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 5
    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView$a;->a:[I

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    aget v0, v0, v1

    .line 18
    .line 19
    :goto_0
    const/high16 v1, 0x3f400000    # 0.75f

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    packed-switch v0, :pswitch_data_0

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget v1, Ll/rec0;->r1:I

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v0, v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;

    .line 47
    .line 48
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :pswitch_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    sget p2, Ll/rec0;->q1:I

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p1, p2, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    .line 79
    .line 80
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeHideMeFromNearbyView;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeHideMeFromNearbyView;->b()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :pswitch_1
    invoke-static {}, Ll/s7a;->h()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_1

    .line 98
    .line 99
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_1

    .line 104
    .line 105
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    sget v1, Ll/rec0;->v1:I

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    invoke-virtual {v0, v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 124
    .line 125
    .line 126
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeSVGAContainerView;

    .line 127
    .line 128
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeSVGAContainerView;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    sget v1, Ll/rec0;->r1:I

    .line 148
    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    invoke-virtual {v0, v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 158
    .line 159
    .line 160
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;

    .line 161
    .line 162
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :pswitch_2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    sget p2, Ll/rec0;->y1:I

    .line 182
    .line 183
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-virtual {p1, p2, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 192
    .line 193
    .line 194
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;

    .line 195
    .line 196
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVisitorHideFootPrintView;->b()V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 204
    .line 205
    .line 206
    return-void

    .line 207
    :pswitch_3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    sget p2, Ll/rec0;->s1:I

    .line 216
    .line 217
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-virtual {p1, p2, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 226
    .line 227
    .line 228
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeOdiamondSkinView;

    .line 229
    .line 230
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeOdiamondSkinView;->b()V

    .line 231
    .line 232
    .line 233
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 238
    .line 239
    .line 240
    return-void

    .line 241
    :pswitch_4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    sget v0, Ll/rec0;->o1:I

    .line 250
    .line 251
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 260
    .line 261
    .line 262
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeCommonStyleView;

    .line 263
    .line 264
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeCommonStyleView;->b(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 265
    .line 266
    .line 267
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 272
    .line 273
    .line 274
    return-void

    .line 275
    :pswitch_5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    sget p2, Ll/rec0;->p1:I

    .line 284
    .line 285
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    invoke-virtual {p1, p2, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 290
    .line 291
    .line 292
    move-result-object p1

    .line 293
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 294
    .line 295
    .line 296
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeCustomService;

    .line 297
    .line 298
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeCustomService;->b()V

    .line 299
    .line 300
    .line 301
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 302
    .line 303
    .line 304
    move-result-object p0

    .line 305
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 306
    .line 307
    .line 308
    return-void

    .line 309
    :pswitch_6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 310
    .line 311
    .line 312
    move-result-object p1

    .line 313
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 314
    .line 315
    .line 316
    move-result-object p1

    .line 317
    sget p2, Ll/rec0;->t1:I

    .line 318
    .line 319
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    invoke-virtual {p1, p2, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 324
    .line 325
    .line 326
    move-result-object p1

    .line 327
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 328
    .line 329
    .line 330
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeSayHiView;

    .line 331
    .line 332
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeSayHiView;->b()V

    .line 333
    .line 334
    .line 335
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 336
    .line 337
    .line 338
    move-result-object p0

    .line 339
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 340
    .line 341
    .line 342
    return-void

    .line 343
    :pswitch_7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 348
    .line 349
    .line 350
    move-result-object p1

    .line 351
    sget p2, Ll/rec0;->A1:I

    .line 352
    .line 353
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    invoke-virtual {p1, p2, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 358
    .line 359
    .line 360
    move-result-object p1

    .line 361
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 362
    .line 363
    .line 364
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVoiceView;

    .line 365
    .line 366
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 367
    .line 368
    .line 369
    move-result-object p0

    .line 370
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 371
    .line 372
    .line 373
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeVoiceView;->k0()V

    .line 374
    .line 375
    .line 376
    return-void

    .line 377
    :pswitch_8
    invoke-static {}, Ll/s7a;->h()Z

    .line 378
    .line 379
    .line 380
    move-result v0

    .line 381
    if-eqz v0, :cond_2

    .line 382
    .line 383
    invoke-static {p1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 384
    .line 385
    .line 386
    move-result v0

    .line 387
    if-eqz v0, :cond_2

    .line 388
    .line 389
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 390
    .line 391
    .line 392
    move-result-object v0

    .line 393
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    sget v1, Ll/rec0;->r1:I

    .line 398
    .line 399
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 400
    .line 401
    .line 402
    move-result-object v3

    .line 403
    invoke-virtual {v0, v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 404
    .line 405
    .line 406
    move-result-object v0

    .line 407
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 408
    .line 409
    .line 410
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;

    .line 411
    .line 412
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 413
    .line 414
    .line 415
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 416
    .line 417
    .line 418
    move-result-object p0

    .line 419
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 420
    .line 421
    .line 422
    return-void

    .line 423
    :cond_2
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 424
    .line 425
    .line 426
    move-result p1

    .line 427
    if-eqz p1, :cond_3

    .line 428
    .line 429
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 430
    .line 431
    .line 432
    move-result-object p1

    .line 433
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 434
    .line 435
    .line 436
    move-result-object p1

    .line 437
    sget v0, Ll/rec0;->o1:I

    .line 438
    .line 439
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 440
    .line 441
    .line 442
    move-result-object v1

    .line 443
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 444
    .line 445
    .line 446
    move-result-object p1

    .line 447
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 448
    .line 449
    .line 450
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeCommonStyleView;

    .line 451
    .line 452
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeCommonStyleView;->b(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 453
    .line 454
    .line 455
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 456
    .line 457
    .line 458
    move-result-object p0

    .line 459
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 460
    .line 461
    .line 462
    return-void

    .line 463
    :cond_3
    new-instance p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;

    .line 464
    .line 465
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 466
    .line 467
    .line 468
    move-result-object p2

    .line 469
    invoke-direct {p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;-><init>(Landroid/content/Context;)V

    .line 470
    .line 471
    .line 472
    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleX(F)V

    .line 473
    .line 474
    .line 475
    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleY(F)V

    .line 476
    .line 477
    .line 478
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 479
    .line 480
    .line 481
    move-result-object p0

    .line 482
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 483
    .line 484
    .line 485
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->t0()V

    .line 486
    .line 487
    .line 488
    return-void

    .line 489
    :pswitch_9
    invoke-static {}, Ll/s7a;->h()Z

    .line 490
    .line 491
    .line 492
    move-result v0

    .line 493
    if-eqz v0, :cond_4

    .line 494
    .line 495
    invoke-static {p1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 496
    .line 497
    .line 498
    move-result v0

    .line 499
    if-eqz v0, :cond_4

    .line 500
    .line 501
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 502
    .line 503
    .line 504
    move-result-object v0

    .line 505
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 506
    .line 507
    .line 508
    move-result-object v0

    .line 509
    sget v1, Ll/rec0;->v1:I

    .line 510
    .line 511
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 512
    .line 513
    .line 514
    move-result-object v3

    .line 515
    invoke-virtual {v0, v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 516
    .line 517
    .line 518
    move-result-object v0

    .line 519
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 520
    .line 521
    .line 522
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeSVGAContainerView;

    .line 523
    .line 524
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeSVGAContainerView;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 525
    .line 526
    .line 527
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 528
    .line 529
    .line 530
    move-result-object p0

    .line 531
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 532
    .line 533
    .line 534
    return-void

    .line 535
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 536
    .line 537
    .line 538
    move-result-object p1

    .line 539
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 540
    .line 541
    .line 542
    move-result-object p1

    .line 543
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->W9()Z

    .line 544
    .line 545
    .line 546
    move-result p1

    .line 547
    if-eqz p1, :cond_5

    .line 548
    .line 549
    invoke-static {}, Ll/rbb0;->f()Lcom/p1/mobile/putong/data/User;

    .line 550
    .line 551
    .line 552
    move-result-object p1

    .line 553
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 554
    .line 555
    .line 556
    move-result p1

    .line 557
    if-eqz p1, :cond_5

    .line 558
    .line 559
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 560
    .line 561
    .line 562
    move-result-object p1

    .line 563
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 564
    .line 565
    .line 566
    move-result-object p1

    .line 567
    sget p2, Ll/rec0;->X2:I

    .line 568
    .line 569
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 570
    .line 571
    .line 572
    move-result-object v0

    .line 573
    invoke-virtual {p1, p2, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 574
    .line 575
    .line 576
    move-result-object p1

    .line 577
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 578
    .line 579
    .line 580
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;

    .line 581
    .line 582
    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleX(F)V

    .line 583
    .line 584
    .line 585
    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleY(F)V

    .line 586
    .line 587
    .line 588
    invoke-static {}, Ll/rbb0;->f()Lcom/p1/mobile/putong/data/User;

    .line 589
    .line 590
    .line 591
    move-result-object p2

    .line 592
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->d(Lcom/p1/mobile/putong/data/User;)V

    .line 593
    .line 594
    .line 595
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->l0()V

    .line 596
    .line 597
    .line 598
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 599
    .line 600
    .line 601
    move-result-object p2

    .line 602
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 603
    .line 604
    .line 605
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->c()Ljava/lang/CharSequence;

    .line 606
    .line 607
    .line 608
    return-void

    .line 609
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 610
    .line 611
    .line 612
    move-result-object p1

    .line 613
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 614
    .line 615
    .line 616
    move-result-object p1

    .line 617
    sget p2, Ll/rec0;->L2:I

    .line 618
    .line 619
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 620
    .line 621
    .line 622
    move-result-object v0

    .line 623
    invoke-virtual {p1, p2, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 624
    .line 625
    .line 626
    move-result-object p1

    .line 627
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 628
    .line 629
    .line 630
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 631
    .line 632
    const p2, 0x3f0ccccd    # 0.55f

    .line 633
    .line 634
    .line 635
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->setScale(F)V

    .line 636
    .line 637
    .line 638
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 639
    .line 640
    .line 641
    move-result-object p0

    .line 642
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 643
    .line 644
    .line 645
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->k()V

    .line 646
    .line 647
    .line 648
    return-void

    .line 649
    :pswitch_a
    invoke-static {}, Ll/s7a;->h()Z

    .line 650
    .line 651
    .line 652
    move-result v0

    .line 653
    if-eqz v0, :cond_6

    .line 654
    .line 655
    invoke-static {p1}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 656
    .line 657
    .line 658
    move-result v0

    .line 659
    if-eqz v0, :cond_6

    .line 660
    .line 661
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 662
    .line 663
    .line 664
    move-result-object v0

    .line 665
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 666
    .line 667
    .line 668
    move-result-object v0

    .line 669
    sget v1, Ll/rec0;->r1:I

    .line 670
    .line 671
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 672
    .line 673
    .line 674
    move-result-object v3

    .line 675
    invoke-virtual {v0, v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 676
    .line 677
    .line 678
    move-result-object v0

    .line 679
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 680
    .line 681
    .line 682
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;

    .line 683
    .line 684
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeImageContainerView;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 685
    .line 686
    .line 687
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 688
    .line 689
    .line 690
    move-result-object p0

    .line 691
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 692
    .line 693
    .line 694
    return-void

    .line 695
    :cond_6
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 696
    .line 697
    .line 698
    move-result p1

    .line 699
    if-eqz p1, :cond_7

    .line 700
    .line 701
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 702
    .line 703
    .line 704
    move-result-object p1

    .line 705
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 706
    .line 707
    .line 708
    move-result-object p1

    .line 709
    sget v0, Ll/rec0;->o1:I

    .line 710
    .line 711
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 712
    .line 713
    .line 714
    move-result-object v1

    .line 715
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 716
    .line 717
    .line 718
    move-result-object p1

    .line 719
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 720
    .line 721
    .line 722
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeCommonStyleView;

    .line 723
    .line 724
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeCommonStyleView;->b(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 725
    .line 726
    .line 727
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 728
    .line 729
    .line 730
    move-result-object p0

    .line 731
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 732
    .line 733
    .line 734
    return-void

    .line 735
    :cond_7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 736
    .line 737
    .line 738
    move-result-object p1

    .line 739
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 740
    .line 741
    .line 742
    move-result-object p1

    .line 743
    sget p2, Ll/rec0;->u1:I

    .line 744
    .line 745
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 746
    .line 747
    .line 748
    move-result-object v0

    .line 749
    invoke-virtual {p1, p2, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 750
    .line 751
    .line 752
    move-result-object p1

    .line 753
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 754
    .line 755
    .line 756
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeSuperLikeView;

    .line 757
    .line 758
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeSuperLikeView;->b()V

    .line 759
    .line 760
    .line 761
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 762
    .line 763
    .line 764
    move-result-object p0

    .line 765
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 766
    .line 767
    .line 768
    return-void

    .line 769
    :pswitch_b
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 770
    .line 771
    .line 772
    move-result-object p1

    .line 773
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 774
    .line 775
    .line 776
    move-result-object p1

    .line 777
    sget p2, Ll/rec0;->w1:I

    .line 778
    .line 779
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 780
    .line 781
    .line 782
    move-result-object v0

    .line 783
    invoke-virtual {p1, p2, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 784
    .line 785
    .line 786
    move-result-object p1

    .line 787
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 788
    .line 789
    .line 790
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeUndoView;

    .line 791
    .line 792
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeUndoView;->b()V

    .line 793
    .line 794
    .line 795
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 796
    .line 797
    .line 798
    move-result-object p0

    .line 799
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 800
    .line 801
    .line 802
    return-void

    .line 803
    :pswitch_c
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 804
    .line 805
    .line 806
    move-result-object p1

    .line 807
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 808
    .line 809
    .line 810
    move-result-object p1

    .line 811
    sget v0, Ll/rec0;->n1:I

    .line 812
    .line 813
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 814
    .line 815
    .line 816
    move-result-object v1

    .line 817
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 818
    .line 819
    .line 820
    move-result-object p1

    .line 821
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 822
    .line 823
    .line 824
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeBadgeView;

    .line 825
    .line 826
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeBadgeView;->b(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 827
    .line 828
    .line 829
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_container()Landroid/widget/FrameLayout;

    .line 830
    .line 831
    .line 832
    move-result-object p0

    .line 833
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 834
    .line 835
    .line 836
    return-void

    .line 837
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_c
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final c()Ljava/lang/CharSequence;
    .locals 17

    .line 1
    invoke-static {}, Ll/rbb0;->f()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_3

    .line 11
    .line 12
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->l7:I

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 22
    .line 23
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    const/16 v5, 0x1e

    .line 28
    .line 29
    if-le v4, v5, :cond_0

    .line 30
    .line 31
    const-string v4, "30+"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 35
    .line 36
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    :goto_0
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {v1, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v8

    .line 47
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 59
    .line 60
    iget v3, v3, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 61
    .line 62
    invoke-interface {v1, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->oi(I)Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iget-object v3, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 67
    .line 68
    iget-object v4, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 69
    .line 70
    new-instance v5, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    if-eqz v5, :cond_1

    .line 94
    .line 95
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->r7:I

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_1
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->q7:I

    .line 99
    .line 100
    :goto_1
    filled-new-array {v8, v3}, [Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v7

    .line 108
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 109
    .line 110
    .line 111
    new-instance v6, Landroid/text/SpannableString;

    .line 112
    .line 113
    invoke-direct {v6, v7}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    invoke-virtual {v4}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 121
    .line 122
    .line 123
    move-result-object v5

    .line 124
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 125
    .line 126
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 135
    .line 136
    .line 137
    move-result v9

    .line 138
    const/16 v0, 0xd

    .line 139
    .line 140
    invoke-static {v0}, Ll/qa00;->f(I)I

    .line 141
    .line 142
    .line 143
    move-result v10

    .line 144
    invoke-static {v0}, Ll/qa00;->f(I)I

    .line 145
    .line 146
    .line 147
    move-result v11

    .line 148
    const-string v4, "#ffe8aa"

    .line 149
    .line 150
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    move-result v12

    .line 154
    invoke-interface/range {v5 .. v12}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Lp(Landroid/text/SpannableString;Ljava/lang/String;Ljava/lang/String;IIII)V

    .line 155
    .line 156
    .line 157
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 158
    .line 159
    .line 160
    move-result-object v5

    .line 161
    invoke-virtual {v5}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 162
    .line 163
    .line 164
    move-result-object v9

    .line 165
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 166
    .line 167
    check-cast v1, Ljava/lang/String;

    .line 168
    .line 169
    if-eqz v1, :cond_2

    .line 170
    .line 171
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    :cond_2
    move v13, v2

    .line 176
    invoke-static {v0}, Ll/qa00;->f(I)I

    .line 177
    .line 178
    .line 179
    move-result v14

    .line 180
    invoke-static {v0}, Ll/qa00;->f(I)I

    .line 181
    .line 182
    .line 183
    move-result v15

    .line 184
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 185
    .line 186
    .line 187
    move-result v16

    .line 188
    move-object v12, v3

    .line 189
    move-object v10, v6

    .line 190
    move-object v11, v7

    .line 191
    invoke-interface/range {v9 .. v16}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Lp(Landroid/text/SpannableString;Ljava/lang/String;Ljava/lang/String;IIII)V

    .line 192
    .line 193
    .line 194
    return-object v6

    .line 195
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 196
    .line 197
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 198
    .line 199
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->t5()Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    if-eqz v0, :cond_4

    .line 204
    .line 205
    iget v2, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 206
    .line 207
    :cond_4
    invoke-static {v2}, Ll/hge0;->e(I)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    return-object v0
.end method

.method public final d(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 17

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView$a;->a:[I

    .line 6
    .line 7
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    aget v0, v0, v1

    .line 12
    .line 13
    :goto_0
    const-string v1, "\u7684\u5173\u6ce8"

    .line 14
    .line 15
    const-string v2, "\u4e3b\u52a8\u6253\u62db\u547c\uff0c\u8868\u8fbe\u4f60\u7684\u5fc3\u610f\uff0c\u83b7\u53d6\n"

    .line 16
    .line 17
    const-string v3, "male"

    .line 18
    .line 19
    const/4 v4, 0x0

    .line 20
    const-string v5, "\u4e13\u5c5e"

    .line 21
    .line 22
    const/4 v6, 0x2

    .line 23
    const-string v7, "\u7b2c\u4e00\u65f6\u95f4"

    .line 24
    .line 25
    const-string v8, "\u7b2c\u4e00\u65f6\u95f4\u77e5\u9053\u4f60\u7684\u6d88\u606f\n\u5bf9\u65b9\u662f\u5426\u5df2\u8bfb"

    .line 26
    .line 27
    const-string v9, "\u8131\u9896\u800c\u51fa"

    .line 28
    .line 29
    const/4 v10, 0x1

    .line 30
    const-string v11, "\u5979"

    .line 31
    .line 32
    const-string v12, ""

    .line 33
    .line 34
    const-string v13, "\u4ed6"

    .line 35
    .line 36
    packed-switch v0, :pswitch_data_0

    .line 37
    .line 38
    .line 39
    filled-new-array {v12}, [Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v12, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    goto/16 :goto_6

    .line 52
    .line 53
    :pswitch_0
    filled-new-array {v7}, [Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v8, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    goto/16 :goto_6

    .line 66
    .line 67
    :pswitch_1
    const-string v0, "\u76f2\u76d2\u5bf9\u8c61"

    .line 68
    .line 69
    filled-new-array {v0}, [Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const-string v1, "\u5f00\u542f\u60ca\u559c\u76f2\u76d2\u5bf9\u8c61\n\u8ba4\u8bc6\u6709\u8da3\u7684\u65b0\u670b\u53cb"

    .line 78
    .line 79
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    goto/16 :goto_6

    .line 84
    .line 85
    :pswitch_2
    const-string v0, "\u5fc3\u4eea\u7684\u5bf9\u8c61"

    .line 86
    .line 87
    const-string v1, "\u79c1\u804a"

    .line 88
    .line 89
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    const-string v1, "\u76f4\u63a5\u548c\u4f60\u5fc3\u4eea\u7684\u5bf9\u8c61\u53d1\u8d77\u79c1\u804a\n\u9080\u7ea6\u65e0\u9700\u7b49\u5f85"

    .line 98
    .line 99
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    goto/16 :goto_6

    .line 104
    .line 105
    :pswitch_3
    const-string v0, "\u5b66\u6821\u9644\u8fd1\u3001\u65c5\u884c\u76ee\u7684\u5730"

    .line 106
    .line 107
    filled-new-array {v0}, [Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const-string v1, "\u524d\u5f80\u5b66\u6821\u9644\u8fd1\u3001\u65c5\u884c\u76ee\u7684\u5730\n\u6216\u4efb\u610f\u5730\u65b9\u4ea4\u53cb"

    .line 116
    .line 117
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    goto/16 :goto_6

    .line 122
    .line 123
    :pswitch_4
    const-string v0, "\u771f\u4eba\u8ba4\u8bc1\uff0c\u771f\u5b9e\u5934\u50cf\uff0c"

    .line 124
    .line 125
    const-string v1, "\u4e3e\u62a5\u8bb0\u5f55"

    .line 126
    .line 127
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    const-string v1, "\u5e2e\u4f60\u901a\u8fc7\u771f\u4eba\u8ba4\u8bc1\uff0c\u771f\u5b9e\u5934\u50cf\uff0c\n\u4e3e\u62a5\u8bb0\u5f55\u7b49\u4fe1\u606f\u8bc4\u4f30\u7537\u6027\u7528\u6237"

    .line 136
    .line 137
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    goto/16 :goto_6

    .line 142
    .line 143
    :pswitch_5
    invoke-static/range {p2 .. p2}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-eqz v0, :cond_2

    .line 148
    .line 149
    invoke-static {}, Ll/c17;->u0()Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-eqz v0, :cond_1

    .line 154
    .line 155
    move-object v11, v13

    .line 156
    :cond_1
    move-object v13, v11

    .line 157
    :cond_2
    sget-object v0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 158
    .line 159
    filled-new-array {v13, v13}, [Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-static {v0, v6}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    const-string v1, "\u4e86\u89e3%s\u7684\u6027\u683c\uff0c\n\u770b%s\u662f\u5426\u548c\u4f60\u5408\u62cd"

    .line 168
    .line 169
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    filled-new-array {v13}, [Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    invoke-static {v1, v10}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    const-string v2, "%s\u7684\u6027\u683c"

    .line 182
    .line 183
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    const-string v2, "\u548c\u4f60\u5408\u62cd"

    .line 188
    .line 189
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    goto/16 :goto_6

    .line 202
    .line 203
    :pswitch_6
    const-string v0, "\u5173\u95ed\u5f00\u5c4f\u5e7f\u544a"

    .line 204
    .line 205
    filled-new-array {v0}, [Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    const-string v1, "\u4e00\u952e\u5173\u95ed\u5f00\u5c4f\u5e7f\u544a\uff0c\n\u9ad8\u6548\u793e\u4ea4\u65e0\u9700\u7b49\u5f85"

    .line 214
    .line 215
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    goto/16 :goto_6

    .line 220
    .line 221
    :pswitch_7
    const-string v0, "\u62e6\u622a\u9a9a\u6270\u8bcd"

    .line 222
    .line 223
    filled-new-array {v0}, [Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    const-string v1, "\u5e2e\u4f60\u76f4\u63a5\u62e6\u622a\u9a9a\u6270\u8bcd\uff0c\n\u804a\u5929\u66f4\u5b89\u5fc3"

    .line 232
    .line 233
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    goto/16 :goto_6

    .line 238
    .line 239
    :pswitch_8
    const-string v0, "\u7cbe\u786e"

    .line 240
    .line 241
    filled-new-array {v0}, [Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    const-string v1, "\u6839\u636e\u60a8\u7684\u5730\u7406\u4f4d\u7f6e\uff0c\u4e3a\u60a8\u7cbe\u786e\u641c\u7d22\n\u9644\u8fd13\u516c\u91cc\u5185\u7684\u7528\u6237"

    .line 250
    .line 251
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    goto/16 :goto_6

    .line 256
    .line 257
    :pswitch_9
    const-string v0, "\u4f18\u8d28\u8ba4\u8bc1"

    .line 258
    .line 259
    filled-new-array {v0}, [Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    const-string v1, "\u6bcf\u65e5\u89e6\u8fbe16\u4f4d\u5e73\u53f0\u4f18\u8d28\u8ba4\u8bc1\u7528\u6237\uff0c\n\u5c0a\u4eab\u9ad8\u8d28\u91cf\u4ea4\u53cb\u4f53\u9a8c"

    .line 268
    .line 269
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    goto/16 :goto_6

    .line 274
    .line 275
    :pswitch_a
    filled-new-array {v5}, [Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    const-string v1, "\u4e13\u5c5e\u5fbd\u7ae0\u548c\u5165\u573a\u7279\u6548\uff0c\u6210\u4e3a\u5168\u573a\n\u6700\u95ea\u4eae\u7684\u661f"

    .line 284
    .line 285
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    goto/16 :goto_6

    .line 290
    .line 291
    :pswitch_b
    const-string v0, "\u4e0d\u9519\u8fc7"

    .line 292
    .line 293
    filled-new-array {v0}, [Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    const-string v1, "\u89e3\u5bc6\u8c01\u770b\u8fc7\u6211\uff0c\u4e0d\u9519\u8fc7\u4efb\u4f55\n\u4e00\u4e2a\u9ed8\u9ed8\u5173\u5fc3\u6211\u7684\u4eba"

    .line 302
    .line 303
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    goto/16 :goto_6

    .line 308
    .line 309
    :pswitch_c
    invoke-static/range {p2 .. p2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 310
    .line 311
    .line 312
    move-result v0

    .line 313
    if-eqz v0, :cond_3

    .line 314
    .line 315
    filled-new-array {v12}, [Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    const-string v1, "\u53d1\u5e03\u52a8\u6001\u5168\u7a0b\u5f00\u542f\u8d85\u7ea7\u66dd\u5149\uff0c\u6536\u83b7\n\u5927\u91cf\u70b9\u8d5e\u4e92\u52a8"

    .line 324
    .line 325
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 326
    .line 327
    .line 328
    move-result-object v0

    .line 329
    goto/16 :goto_6

    .line 330
    .line 331
    :cond_3
    filled-new-array {v12}, [Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    const-string v1, "\u52a8\u6001\u667a\u80fd\u7cbe\u51c6\u6295\u653e\uff0c\u6536\u83b7\n\u5927\u91cf\u6d4f\u89c8\u4e92\u52a8"

    .line 340
    .line 341
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    goto/16 :goto_6

    .line 346
    .line 347
    :pswitch_d
    invoke-static {}, Ll/c17;->u0()Z

    .line 348
    .line 349
    .line 350
    move-result v0

    .line 351
    if-eqz v0, :cond_4

    .line 352
    .line 353
    move-object v11, v13

    .line 354
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 355
    .line 356
    const-string v1, "\u8ba9"

    .line 357
    .line 358
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 359
    .line 360
    .line 361
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    const-string v1, "\u7b2c\u4e00\u65f6\u95f4\u770b\u5230\u4f60\uff0c\u914d\u5bf9\n\u51e0\u7387\u63d0\u53473\u500d"

    .line 365
    .line 366
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 367
    .line 368
    .line 369
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    filled-new-array {v12}, [Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object v1

    .line 377
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 378
    .line 379
    .line 380
    move-result-object v1

    .line 381
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 382
    .line 383
    .line 384
    move-result-object v0

    .line 385
    goto/16 :goto_6

    .line 386
    .line 387
    :pswitch_e
    invoke-static {}, Ll/c17;->u0()Z

    .line 388
    .line 389
    .line 390
    move-result v0

    .line 391
    if-eqz v0, :cond_5

    .line 392
    .line 393
    move-object v11, v13

    .line 394
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 395
    .line 396
    const-string v1, "\u627e\u56de\u4f60\u89e3\u9664\u7684\u914d\u5bf9\n\u6062\u590d\u548c"

    .line 397
    .line 398
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 399
    .line 400
    .line 401
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 402
    .line 403
    .line 404
    const-string v1, "\u7684\u804a\u5929"

    .line 405
    .line 406
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 407
    .line 408
    .line 409
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object v0

    .line 413
    const-string v1, "\u6062\u590d"

    .line 414
    .line 415
    filled-new-array {v1}, [Ljava/lang/String;

    .line 416
    .line 417
    .line 418
    move-result-object v1

    .line 419
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 420
    .line 421
    .line 422
    move-result-object v1

    .line 423
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 424
    .line 425
    .line 426
    move-result-object v0

    .line 427
    goto/16 :goto_6

    .line 428
    .line 429
    :pswitch_f
    invoke-static/range {p2 .. p2}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 430
    .line 431
    .line 432
    move-result v0

    .line 433
    if-eqz v0, :cond_6

    .line 434
    .line 435
    const-string v0, "\u51bb\u7ed3\u6d3b\u8dc3\u65f6\u95f4"

    .line 436
    .line 437
    const-string v1, "\u9690\u85cf\u8ddd\u79bb\u4f4d\u7f6e"

    .line 438
    .line 439
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 440
    .line 441
    .line 442
    move-result-object v0

    .line 443
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 444
    .line 445
    .line 446
    move-result-object v0

    .line 447
    const-string v1, "\u4e00\u952e\u5f00\u542f\u51bb\u7ed3\u6d3b\u8dc3\u65f6\u95f4\n\u548c\u9690\u85cf\u8ddd\u79bb\u4f4d\u7f6e\u529f\u80fd"

    .line 448
    .line 449
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 450
    .line 451
    .line 452
    move-result-object v0

    .line 453
    goto/16 :goto_6

    .line 454
    .line 455
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 456
    .line 457
    .line 458
    move-result-object v0

    .line 459
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 460
    .line 461
    .line 462
    move-result-object v0

    .line 463
    invoke-interface {v0}, Ll/r97;->N()Z

    .line 464
    .line 465
    .line 466
    move-result v0

    .line 467
    if-eqz v0, :cond_7

    .line 468
    .line 469
    const-string v0, "\u9690\u85cf\u5e74\u9f84\u3001\u4f4d\u7f6e"

    .line 470
    .line 471
    filled-new-array {v0}, [Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object v0

    .line 475
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 476
    .line 477
    .line 478
    move-result-object v0

    .line 479
    const-string v1, "\u53ea\u8ba9\u4f60\u53f3\u6ed1\u7684\u4eba\u770b\u5230\u4f60\n\u8fd8\u53ef\u9690\u85cf\u5e74\u9f84\u3001\u4f4d\u7f6e\u7b49\u4fe1\u606f"

    .line 480
    .line 481
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 482
    .line 483
    .line 484
    move-result-object v0

    .line 485
    goto/16 :goto_6

    .line 486
    .line 487
    :cond_7
    const-string v0, "\u4f4d\u7f6e\u3001\u5e74\u9f84\u3001\n\u6d3b\u8dc3\u65f6\u95f4"

    .line 488
    .line 489
    filled-new-array {v0}, [Ljava/lang/String;

    .line 490
    .line 491
    .line 492
    move-result-object v0

    .line 493
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 494
    .line 495
    .line 496
    move-result-object v0

    .line 497
    const-string v1, "\u9009\u62e9\u662f\u5426\u5c55\u793a\u4f60\u7684\u4f4d\u7f6e\u3001\u5e74\u9f84\u3001\n\u6d3b\u8dc3\u65f6\u95f4\u7b49\u9690\u79c1\u4fe1\u606f"

    .line 498
    .line 499
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 500
    .line 501
    .line 502
    move-result-object v0

    .line 503
    goto/16 :goto_6

    .line 504
    .line 505
    :pswitch_10
    filled-new-array {v7}, [Ljava/lang/String;

    .line 506
    .line 507
    .line 508
    move-result-object v0

    .line 509
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 510
    .line 511
    .line 512
    move-result-object v0

    .line 513
    invoke-static {v8, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 514
    .line 515
    .line 516
    move-result-object v0

    .line 517
    goto/16 :goto_6

    .line 518
    .line 519
    :pswitch_11
    filled-new-array {v12}, [Ljava/lang/String;

    .line 520
    .line 521
    .line 522
    move-result-object v0

    .line 523
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 524
    .line 525
    .line 526
    move-result-object v0

    .line 527
    const-string v1, "\u901a\u8fc7\u504f\u597d\u8bbe\u7f6e\uff0c\u4e3a\u4f60\u63a8\u8350\u7b26\u5408\n\u6761\u4ef6\u7684\u7528\u6237"

    .line 528
    .line 529
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 530
    .line 531
    .line 532
    move-result-object v0

    .line 533
    goto/16 :goto_6

    .line 534
    .line 535
    :pswitch_12
    invoke-static/range {p2 .. p2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 536
    .line 537
    .line 538
    move-result v0

    .line 539
    if-eqz v0, :cond_8

    .line 540
    .line 541
    const-string v0, "\u5168\u5929"

    .line 542
    .line 543
    filled-new-array {v0}, [Ljava/lang/String;

    .line 544
    .line 545
    .line 546
    move-result-object v0

    .line 547
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 548
    .line 549
    .line 550
    move-result-object v0

    .line 551
    const-string v1, "\u5168\u5929\u8ba9\u4f60\u5728\u6240\u5904\u7684\u5730\u533a\u4e2d\uff0c\u6210\u4e3a\n\u6210\u4e3a\u6700\u70ed\u95e8\u7684\u4eba"

    .line 552
    .line 553
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 554
    .line 555
    .line 556
    move-result-object v0

    .line 557
    goto/16 :goto_6

    .line 558
    .line 559
    :cond_8
    const-string v0, "\u6700\u70ed\u95e8"

    .line 560
    .line 561
    filled-new-array {v0}, [Ljava/lang/String;

    .line 562
    .line 563
    .line 564
    move-result-object v0

    .line 565
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 566
    .line 567
    .line 568
    move-result-object v0

    .line 569
    const-string v1, "30\u5206\u949f\u5185\u8ba9\u4f60\u5728\u6240\u5904\u5730\u533a\u4e2d\n\u6210\u4e3a\u6700\u70ed\u95e8\u7684\u4eba"

    .line 570
    .line 571
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 572
    .line 573
    .line 574
    move-result-object v0

    .line 575
    goto/16 :goto_6

    .line 576
    .line 577
    :pswitch_13
    new-instance v0, Ljava/util/ArrayList;

    .line 578
    .line 579
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 580
    .line 581
    .line 582
    const-string v1, "\u53d1\u9001\u8d85\u7ea7\u559c\u6b22\u6216\u4f7f\u7528\u4e00\u952e\u914d\u5bf9\uff0c\u518d\u6b21\n\u6253\u52a8\u4f60\u559c\u6b22\u7684\u4eba\uff01"

    .line 583
    .line 584
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 585
    .line 586
    .line 587
    move-result-object v0

    .line 588
    goto/16 :goto_6

    .line 589
    .line 590
    :pswitch_14
    invoke-static {}, Ll/c17;->u0()Z

    .line 591
    .line 592
    .line 593
    move-result v0

    .line 594
    if-eqz v0, :cond_9

    .line 595
    .line 596
    move-object v11, v13

    .line 597
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 598
    .line 599
    const-string v1, "\u6bcf\u59292\u4e2a\u4e13\u5c5e\u514d\u8d39\u793c\u7269\uff0c\u7ed9"

    .line 600
    .line 601
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 602
    .line 603
    .line 604
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 605
    .line 606
    .line 607
    const-string v1, "\n\u4e00\u4efd\u5c0f\u60ca\u559c\uff01"

    .line 608
    .line 609
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 610
    .line 611
    .line 612
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 613
    .line 614
    .line 615
    move-result-object v0

    .line 616
    filled-new-array {v5}, [Ljava/lang/String;

    .line 617
    .line 618
    .line 619
    move-result-object v1

    .line 620
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 621
    .line 622
    .line 623
    move-result-object v1

    .line 624
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 625
    .line 626
    .line 627
    move-result-object v0

    .line 628
    goto/16 :goto_6

    .line 629
    .line 630
    :pswitch_15
    const-string v0, "\u4efb\u610f\u5207\u6362"

    .line 631
    .line 632
    filled-new-array {v0}, [Ljava/lang/String;

    .line 633
    .line 634
    .line 635
    move-result-object v0

    .line 636
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 637
    .line 638
    .line 639
    move-result-object v0

    .line 640
    const-string v1, "\u4efb\u610f\u5207\u6362\u5b9a\u4f4d\uff0c\u4e0e\u5404\u5730\n\u597d\u53cb\u7545\u804a"

    .line 641
    .line 642
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 643
    .line 644
    .line 645
    move-result-object v0

    .line 646
    goto/16 :goto_6

    .line 647
    .line 648
    :pswitch_16
    invoke-static {}, Ll/rbb0;->n()Lcom/p1/mobile/putong/data/User;

    .line 649
    .line 650
    .line 651
    move-result-object v0

    .line 652
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 653
    .line 654
    .line 655
    move-result v0

    .line 656
    if-eqz v0, :cond_b

    .line 657
    .line 658
    invoke-static {}, Ll/rbb0;->n()Lcom/p1/mobile/putong/data/User;

    .line 659
    .line 660
    .line 661
    move-result-object v0

    .line 662
    if-eqz v0, :cond_a

    .line 663
    .line 664
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 665
    .line 666
    :cond_a
    invoke-static {v3}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 667
    .line 668
    .line 669
    move-result-object v0

    .line 670
    invoke-static {v4, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 671
    .line 672
    .line 673
    move-result v0

    .line 674
    goto :goto_1

    .line 675
    :cond_b
    invoke-static {}, Ll/c17;->u0()Z

    .line 676
    .line 677
    .line 678
    move-result v0

    .line 679
    :goto_1
    if-eqz v0, :cond_c

    .line 680
    .line 681
    move-object v11, v13

    .line 682
    :cond_c
    const-string v0, "\u5c3d\u60c5\u53f3\u6ed1\u3001\u7a81\u7834\u53f3\u6ed1\u4e0a\u9650\u3001\u4e0d\u9519\u8fc7\n\u4efb\u4f55\u4f60\u559c\u6b22\u7684"

    .line 683
    .line 684
    invoke-virtual {v0, v11}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 685
    .line 686
    .line 687
    move-result-object v0

    .line 688
    const-string v1, "\u7a81\u7834\u53f3\u6ed1\u4e0a\u9650"

    .line 689
    .line 690
    filled-new-array {v1}, [Ljava/lang/String;

    .line 691
    .line 692
    .line 693
    move-result-object v1

    .line 694
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 695
    .line 696
    .line 697
    move-result-object v1

    .line 698
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 699
    .line 700
    .line 701
    move-result-object v0

    .line 702
    goto/16 :goto_6

    .line 703
    .line 704
    :pswitch_17
    const-string v0, "\u4fdd\u62a4\u9690\u79c1"

    .line 705
    .line 706
    filled-new-array {v0}, [Ljava/lang/String;

    .line 707
    .line 708
    .line 709
    move-result-object v0

    .line 710
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 711
    .line 712
    .line 713
    move-result-object v0

    .line 714
    const-string v1, "\u4e0d\u8ba9\u8ddd\u79bb\u592a\u8fd1\u7684\u4eba\u770b\u5230\u6211\uff0c\u968f\u65f6\n\u4fdd\u62a4\u9690\u79c1"

    .line 715
    .line 716
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 717
    .line 718
    .line 719
    move-result-object v0

    .line 720
    goto/16 :goto_6

    .line 721
    .line 722
    :pswitch_18
    const-string v0, "\u65e0\u9700\u7b49\u5f85"

    .line 723
    .line 724
    filled-new-array {v0}, [Ljava/lang/String;

    .line 725
    .line 726
    .line 727
    move-result-object v0

    .line 728
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 729
    .line 730
    .line 731
    move-result-object v0

    .line 732
    const-string v1, "\u4e00\u952e\u5f00\u804a\uff0c\u65e0\u9700\u7b49\u5f85\uff0c\u6bcf\u59293\u6b21\n\u5f00\u6302\u4f53\u9a8c\uff01"

    .line 733
    .line 734
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 735
    .line 736
    .line 737
    move-result-object v0

    .line 738
    goto/16 :goto_6

    .line 739
    .line 740
    :pswitch_19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 741
    .line 742
    .line 743
    move-result-object v0

    .line 744
    invoke-virtual {v0}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 745
    .line 746
    .line 747
    move-result-object v0

    .line 748
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->Xm()I

    .line 749
    .line 750
    .line 751
    move-result v0

    .line 752
    new-instance v1, Ljava/lang/StringBuilder;

    .line 753
    .line 754
    const-string v2, "\u6bcf\u6708"

    .line 755
    .line 756
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 757
    .line 758
    .line 759
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 760
    .line 761
    .line 762
    const-string v2, "\u6b21\u673a\u4f1a\uff0c\u5f00\u542f\u540e\u8bbf\u95ee\u5176\u4ed6\u4eba\uff0c\n\u5bf9\u65b9\u5c06\u4e0d\u4f1a\u770b\u5230\u4f60\u7684\u8bbf\u95ee\u8bb0\u5f55"

    .line 763
    .line 764
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 765
    .line 766
    .line 767
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 768
    .line 769
    .line 770
    move-result-object v1

    .line 771
    new-instance v2, Ljava/lang/StringBuilder;

    .line 772
    .line 773
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 774
    .line 775
    .line 776
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 777
    .line 778
    .line 779
    const-string v0, "\u6b21"

    .line 780
    .line 781
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 782
    .line 783
    .line 784
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 785
    .line 786
    .line 787
    move-result-object v0

    .line 788
    filled-new-array {v0}, [Ljava/lang/String;

    .line 789
    .line 790
    .line 791
    move-result-object v0

    .line 792
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 793
    .line 794
    .line 795
    move-result-object v0

    .line 796
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 797
    .line 798
    .line 799
    move-result-object v0

    .line 800
    goto/16 :goto_6

    .line 801
    .line 802
    :pswitch_1a
    filled-new-array {v12}, [Ljava/lang/String;

    .line 803
    .line 804
    .line 805
    move-result-object v0

    .line 806
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 807
    .line 808
    .line 809
    move-result-object v0

    .line 810
    const-string v1, "\u89e3\u9501\u9ed1\u91d1\u4e13\u5c5e\u76ae\u80a4\uff0c\u968f\u65f6\n\u5f70\u663e\u4e0e\u4f17\u4e0d\u540c"

    .line 811
    .line 812
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 813
    .line 814
    .line 815
    move-result-object v0

    .line 816
    goto/16 :goto_6

    .line 817
    .line 818
    :pswitch_1b
    invoke-static {}, Ll/c17;->u0()Z

    .line 819
    .line 820
    .line 821
    move-result v0

    .line 822
    if-eqz v0, :cond_d

    .line 823
    .line 824
    move-object v11, v13

    .line 825
    :cond_d
    new-instance v0, Ljava/lang/StringBuilder;

    .line 826
    .line 827
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 828
    .line 829
    .line 830
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 831
    .line 832
    .line 833
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 834
    .line 835
    .line 836
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 837
    .line 838
    .line 839
    move-result-object v0

    .line 840
    filled-new-array {v12}, [Ljava/lang/String;

    .line 841
    .line 842
    .line 843
    move-result-object v1

    .line 844
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 845
    .line 846
    .line 847
    move-result-object v1

    .line 848
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 849
    .line 850
    .line 851
    move-result-object v0

    .line 852
    goto/16 :goto_6

    .line 853
    .line 854
    :pswitch_1c
    const-string v0, "\u4e00\u5bf9\u4e00"

    .line 855
    .line 856
    filled-new-array {v0}, [Ljava/lang/String;

    .line 857
    .line 858
    .line 859
    move-result-object v0

    .line 860
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 861
    .line 862
    .line 863
    move-result-object v0

    .line 864
    const-string v1, "\u4e00\u5bf9\u4e00\u4e13\u5c5e\u5ba2\u670d\uff0c\u4e3a\u4f60\u7684\n\u4f53\u9a8c\u4fdd\u9a7e\u62a4\u822a"

    .line 865
    .line 866
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 867
    .line 868
    .line 869
    move-result-object v0

    .line 870
    goto/16 :goto_6

    .line 871
    .line 872
    :pswitch_1d
    invoke-static {}, Ll/c17;->u0()Z

    .line 873
    .line 874
    .line 875
    move-result v0

    .line 876
    if-eqz v0, :cond_e

    .line 877
    .line 878
    move-object v11, v13

    .line 879
    :cond_e
    new-instance v0, Ljava/lang/StringBuilder;

    .line 880
    .line 881
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 882
    .line 883
    .line 884
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 885
    .line 886
    .line 887
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 888
    .line 889
    .line 890
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 891
    .line 892
    .line 893
    move-result-object v0

    .line 894
    const-string v1, "\u4e3b\u52a8"

    .line 895
    .line 896
    filled-new-array {v1}, [Ljava/lang/String;

    .line 897
    .line 898
    .line 899
    move-result-object v1

    .line 900
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 901
    .line 902
    .line 903
    move-result-object v1

    .line 904
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 905
    .line 906
    .line 907
    move-result-object v0

    .line 908
    goto/16 :goto_6

    .line 909
    .line 910
    :pswitch_1e
    const-string v0, "\u7acb\u5373"

    .line 911
    .line 912
    const-string v1, "\u9644\u8fd1\u5728\u7ebf"

    .line 913
    .line 914
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 915
    .line 916
    .line 917
    move-result-object v0

    .line 918
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 919
    .line 920
    .line 921
    move-result-object v0

    .line 922
    const-string v1, "\u6bcf\u59291\u6b21\u8bed\u97f3\u8fde\u7ebf\uff0c\u7acb\u5373\u4e0e\n\u9644\u8fd1\u5728\u7ebf\u7684\u7528\u6237\u7545\u804a\uff01"

    .line 923
    .line 924
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 925
    .line 926
    .line 927
    move-result-object v0

    .line 928
    goto/16 :goto_6

    .line 929
    .line 930
    :pswitch_1f
    invoke-static/range {p2 .. p2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 931
    .line 932
    .line 933
    move-result v0

    .line 934
    const-string v1, "\u7acb\u5373\u5f00\u804a"

    .line 935
    .line 936
    if-eqz v0, :cond_f

    .line 937
    .line 938
    filled-new-array {v1}, [Ljava/lang/String;

    .line 939
    .line 940
    .line 941
    move-result-object v0

    .line 942
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 943
    .line 944
    .line 945
    move-result-object v0

    .line 946
    const-string v1, "\u65e0\u9650\u6b21\u95ea\u804a\u673a\u4f1a\uff0c\u65e0\u9700\u914d\u5bf9\n\u7acb\u5373\u5f00\u804a\uff01"

    .line 947
    .line 948
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 949
    .line 950
    .line 951
    move-result-object v0

    .line 952
    goto/16 :goto_6

    .line 953
    .line 954
    :cond_f
    filled-new-array {v1}, [Ljava/lang/String;

    .line 955
    .line 956
    .line 957
    move-result-object v0

    .line 958
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 959
    .line 960
    .line 961
    move-result-object v0

    .line 962
    const-string v1, "\u6bcf\u59293\u6b21\u5339\u914d\u9644\u8fd1\u5728\u7ebf\u7528\u6237\n\u7acb\u5373\u5f00\u804a\uff01"

    .line 963
    .line 964
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 965
    .line 966
    .line 967
    move-result-object v0

    .line 968
    goto/16 :goto_6

    .line 969
    .line 970
    :pswitch_20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 971
    .line 972
    .line 973
    move-result-object v0

    .line 974
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 975
    .line 976
    .line 977
    move-result-object v0

    .line 978
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->W9()Z

    .line 979
    .line 980
    .line 981
    move-result v0

    .line 982
    if-eqz v0, :cond_11

    .line 983
    .line 984
    invoke-static {}, Ll/rbb0;->f()Lcom/p1/mobile/putong/data/User;

    .line 985
    .line 986
    .line 987
    move-result-object v0

    .line 988
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 989
    .line 990
    .line 991
    move-result v0

    .line 992
    if-eqz v0, :cond_11

    .line 993
    .line 994
    invoke-virtual/range {p0 .. p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->c()Ljava/lang/CharSequence;

    .line 995
    .line 996
    .line 997
    move-result-object v0

    .line 998
    if-nez v0, :cond_10

    .line 999
    .line 1000
    goto :goto_2

    .line 1001
    :cond_10
    move-object v12, v0

    .line 1002
    :goto_2
    new-instance v0, Ljava/util/ArrayList;

    .line 1003
    .line 1004
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1005
    .line 1006
    .line 1007
    invoke-static {v12, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 1008
    .line 1009
    .line 1010
    move-result-object v0

    .line 1011
    goto/16 :goto_6

    .line 1012
    .line 1013
    :cond_11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1014
    .line 1015
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 1016
    .line 1017
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->t5()Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 1018
    .line 1019
    .line 1020
    move-result-object v0

    .line 1021
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1022
    .line 1023
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 1024
    .line 1025
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->x5()Lcom/p1/mobile/putong/data/User;

    .line 1026
    .line 1027
    .line 1028
    move-result-object v1

    .line 1029
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1030
    .line 1031
    .line 1032
    move-result-object v2

    .line 1033
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1034
    .line 1035
    .line 1036
    move-result-object v2

    .line 1037
    invoke-interface {v2, v1, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->vb(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreLikers$a;)Z

    .line 1038
    .line 1039
    .line 1040
    move-result v2

    .line 1041
    if-eqz v2, :cond_12

    .line 1042
    .line 1043
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1044
    .line 1045
    .line 1046
    move-result-object v0

    .line 1047
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1048
    .line 1049
    .line 1050
    move-result-object v0

    .line 1051
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->yl(Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;

    .line 1052
    .line 1053
    .line 1054
    move-result-object v0

    .line 1055
    goto :goto_4

    .line 1056
    :cond_12
    if-eqz v0, :cond_13

    .line 1057
    .line 1058
    iget v0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 1059
    .line 1060
    goto :goto_3

    .line 1061
    :cond_13
    const/4 v0, 0x0

    .line 1062
    :goto_3
    invoke-static {v0}, Ll/hge0;->e(I)Ljava/lang/String;

    .line 1063
    .line 1064
    .line 1065
    move-result-object v0

    .line 1066
    :goto_4
    new-instance v1, Ljava/util/ArrayList;

    .line 1067
    .line 1068
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1069
    .line 1070
    .line 1071
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 1072
    .line 1073
    .line 1074
    move-result-object v0

    .line 1075
    goto/16 :goto_6

    .line 1076
    .line 1077
    :pswitch_21
    filled-new-array {v9}, [Ljava/lang/String;

    .line 1078
    .line 1079
    .line 1080
    move-result-object v0

    .line 1081
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 1082
    .line 1083
    .line 1084
    move-result-object v0

    .line 1085
    const-string v1, "\u8d85\u7ea7\u559c\u6b22\u4ed6\uff1f\u4f7f\u7528\u540e\u8ba9\u4f60\u7684\n\u559c\u6b22\u8131\u9896\u800c\u51fa"

    .line 1086
    .line 1087
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 1088
    .line 1089
    .line 1090
    move-result-object v0

    .line 1091
    goto/16 :goto_6

    .line 1092
    .line 1093
    :pswitch_22
    invoke-static/range {p2 .. p2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 1094
    .line 1095
    .line 1096
    move-result v0

    .line 1097
    if-eqz v0, :cond_14

    .line 1098
    .line 1099
    const-string v0, "\u65e0\u9650\u6b21"

    .line 1100
    .line 1101
    filled-new-array {v0, v9}, [Ljava/lang/String;

    .line 1102
    .line 1103
    .line 1104
    move-result-object v0

    .line 1105
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 1106
    .line 1107
    .line 1108
    move-result-object v0

    .line 1109
    const-string v1, "\u65e0\u9650\u6b21\u8d85\u7ea7\u559c\u6b22\uff0c\u4f7f\u7528\u540e\u8ba9\u4f60\u7684\n\u559c\u6b22\u8131\u9896\u800c\u51fa\uff01"

    .line 1110
    .line 1111
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 1112
    .line 1113
    .line 1114
    move-result-object v0

    .line 1115
    goto/16 :goto_6

    .line 1116
    .line 1117
    :cond_14
    invoke-static {}, Ll/rbb0;->j()Lcom/p1/mobile/putong/data/User;

    .line 1118
    .line 1119
    .line 1120
    move-result-object v0

    .line 1121
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1122
    .line 1123
    .line 1124
    move-result v0

    .line 1125
    if-eqz v0, :cond_16

    .line 1126
    .line 1127
    invoke-static {}, Ll/rbb0;->j()Lcom/p1/mobile/putong/data/User;

    .line 1128
    .line 1129
    .line 1130
    move-result-object v0

    .line 1131
    if-eqz v0, :cond_15

    .line 1132
    .line 1133
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 1134
    .line 1135
    :cond_15
    invoke-static {v3}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 1136
    .line 1137
    .line 1138
    move-result-object v0

    .line 1139
    invoke-static {v4, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 1140
    .line 1141
    .line 1142
    move-result v0

    .line 1143
    goto :goto_5

    .line 1144
    :cond_16
    invoke-static {}, Ll/c17;->u0()Z

    .line 1145
    .line 1146
    .line 1147
    move-result v0

    .line 1148
    :goto_5
    if-eqz v0, :cond_17

    .line 1149
    .line 1150
    move-object v11, v13

    .line 1151
    :cond_17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1152
    .line 1153
    const-string v1, "\u8d85\u7ea7\u559c\u6b22"

    .line 1154
    .line 1155
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1156
    .line 1157
    .line 1158
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1159
    .line 1160
    .line 1161
    const-string v1, "\uff1f\u4f7f\u7528\u540e\u8ba9\u4f60\u7684\n\u559c\u6b22\u8131\u9896\u800c\u51fa\uff01"

    .line 1162
    .line 1163
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1164
    .line 1165
    .line 1166
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1167
    .line 1168
    .line 1169
    move-result-object v0

    .line 1170
    filled-new-array {v9}, [Ljava/lang/String;

    .line 1171
    .line 1172
    .line 1173
    move-result-object v1

    .line 1174
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 1175
    .line 1176
    .line 1177
    move-result-object v1

    .line 1178
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 1179
    .line 1180
    .line 1181
    move-result-object v0

    .line 1182
    goto :goto_6

    .line 1183
    :pswitch_23
    invoke-static {}, Ll/c17;->u0()Z

    .line 1184
    .line 1185
    .line 1186
    move-result v0

    .line 1187
    if-eqz v0, :cond_18

    .line 1188
    .line 1189
    move-object v11, v13

    .line 1190
    :cond_18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1191
    .line 1192
    .line 1193
    move-result-object v0

    .line 1194
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1195
    .line 1196
    .line 1197
    move-result-object v0

    .line 1198
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Vf()Z

    .line 1199
    .line 1200
    .line 1201
    move-result v0

    .line 1202
    if-eqz v0, :cond_19

    .line 1203
    .line 1204
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1205
    .line 1206
    const-string v1, "\u624b\u6ed1\u5566\uff1f\u4f7f\u7528\u53cd\u6094\u7279\u6743\uff0c\u91cd\u65b0\u559c\u6b22"

    .line 1207
    .line 1208
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1209
    .line 1210
    .line 1211
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1212
    .line 1213
    .line 1214
    const-string v1, "\uff01"

    .line 1215
    .line 1216
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1217
    .line 1218
    .line 1219
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1220
    .line 1221
    .line 1222
    move-result-object v0

    .line 1223
    const-string v1, "\u53cd\u6094\u7279\u6743"

    .line 1224
    .line 1225
    filled-new-array {v1}, [Ljava/lang/String;

    .line 1226
    .line 1227
    .line 1228
    move-result-object v1

    .line 1229
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 1230
    .line 1231
    .line 1232
    move-result-object v1

    .line 1233
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 1234
    .line 1235
    .line 1236
    move-result-object v0

    .line 1237
    goto :goto_6

    .line 1238
    :cond_19
    const-string v0, "\u624b\u6ed1\u4e86\uff1f\u4f60\u53ef\u4ee5\u64a4\u56de\u4e0a\u4e00\u5f20\u5361\u7247\uff0c\n\u627e\u56de\u9519\u8fc7\u7684"

    .line 1239
    .line 1240
    invoke-virtual {v0, v11}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1241
    .line 1242
    .line 1243
    move-result-object v0

    .line 1244
    const-string v1, "\u64a4\u56de\u4e0a\u4e00\u5f20"

    .line 1245
    .line 1246
    filled-new-array {v1}, [Ljava/lang/String;

    .line 1247
    .line 1248
    .line 1249
    move-result-object v1

    .line 1250
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 1251
    .line 1252
    .line 1253
    move-result-object v1

    .line 1254
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 1255
    .line 1256
    .line 1257
    move-result-object v0

    .line 1258
    goto :goto_6

    .line 1259
    :pswitch_24
    const-string v0, "2.5\u500d"

    .line 1260
    .line 1261
    filled-new-array {v0}, [Ljava/lang/String;

    .line 1262
    .line 1263
    .line 1264
    move-result-object v0

    .line 1265
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 1266
    .line 1267
    .line 1268
    move-result-object v0

    .line 1269
    const-string v1, "\u5c0a\u4eabSVIP\u8eab\u4efd\u6807\u8bc6\uff0c\u7a81\u51fa\u5c0a\u8d35\u8eab\u4efd\uff0c\n\u5e2e\u4f60\u63d0\u53472.5\u500d\u914d\u5bf9\u6210\u529f\u7387"

    .line 1270
    .line 1271
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 1272
    .line 1273
    .line 1274
    move-result-object v0

    .line 1275
    goto :goto_6

    .line 1276
    :pswitch_25
    new-instance v0, Ljava/util/ArrayList;

    .line 1277
    .line 1278
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1279
    .line 1280
    .line 1281
    const-string v1, "VIP\u4f1a\u5458\u4e13\u5c5e\u6807\u8bc6\uff0c\u5f70\u663e\u4f60\u7684\n\u4f1a\u5458\u8eab\u4efd"

    .line 1282
    .line 1283
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 1284
    .line 1285
    .line 1286
    move-result-object v0

    .line 1287
    :goto_6
    invoke-virtual/range {p0 .. p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_description()Lv/VText;

    .line 1288
    .line 1289
    .line 1290
    move-result-object v1

    .line 1291
    invoke-static/range {p2 .. p2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 1292
    .line 1293
    .line 1294
    move-result v2

    .line 1295
    if-eqz v2, :cond_1a

    .line 1296
    .line 1297
    const-string v2, "#E8CA8A"

    .line 1298
    .line 1299
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1300
    .line 1301
    .line 1302
    move-result v2

    .line 1303
    goto :goto_7

    .line 1304
    :cond_1a
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1305
    .line 1306
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 1307
    .line 1308
    .line 1309
    move-result-object v2

    .line 1310
    sget v3, Ll/h9c0;->g:I

    .line 1311
    .line 1312
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 1313
    .line 1314
    .line 1315
    move-result v2

    .line 1316
    :goto_7
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1317
    .line 1318
    .line 1319
    iget-object v1, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 1320
    .line 1321
    check-cast v1, Ljava/util/Collection;

    .line 1322
    .line 1323
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 1324
    .line 1325
    .line 1326
    move-result v1

    .line 1327
    if-eqz v1, :cond_1b

    .line 1328
    .line 1329
    invoke-virtual/range {p0 .. p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_description()Lv/VText;

    .line 1330
    .line 1331
    .line 1332
    move-result-object v1

    .line 1333
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 1334
    .line 1335
    check-cast v0, Ljava/lang/CharSequence;

    .line 1336
    .line 1337
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1338
    .line 1339
    .line 1340
    return-void

    .line 1341
    :cond_1b
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 1342
    .line 1343
    check-cast v1, Ljava/lang/CharSequence;

    .line 1344
    .line 1345
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 1346
    .line 1347
    check-cast v0, Ljava/util/ArrayList;

    .line 1348
    .line 1349
    invoke-static/range {p2 .. p2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 1350
    .line 1351
    .line 1352
    move-result v2

    .line 1353
    if-eqz v2, :cond_1d

    .line 1354
    .line 1355
    new-instance v11, Landroid/text/SpannableString;

    .line 1356
    .line 1357
    invoke-direct {v11, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 1358
    .line 1359
    .line 1360
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 1361
    .line 1362
    .line 1363
    move-result-object v0

    .line 1364
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1365
    .line 1366
    .line 1367
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 1368
    .line 1369
    .line 1370
    move-result v1

    .line 1371
    if-eqz v1, :cond_1c

    .line 1372
    .line 1373
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1374
    .line 1375
    .line 1376
    move-result-object v1

    .line 1377
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1378
    .line 1379
    .line 1380
    move-object v12, v1

    .line 1381
    check-cast v12, Ljava/lang/String;

    .line 1382
    .line 1383
    new-instance v1, Landroid/text/style/RelativeSizeSpan;

    .line 1384
    .line 1385
    const v2, 0x3f8e38e4

    .line 1386
    .line 1387
    .line 1388
    invoke-direct {v1, v2}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    .line 1389
    .line 1390
    .line 1391
    const/4 v15, 0x6

    .line 1392
    const/16 v16, 0x0

    .line 1393
    .line 1394
    const/4 v13, 0x0

    .line 1395
    const/4 v14, 0x0

    .line 1396
    invoke-static/range {v11 .. v16}, Lkotlin/text/StringsKt;->c0(Ljava/lang/CharSequence;Ljava/lang/String;IZILjava/lang/Object;)I

    .line 1397
    .line 1398
    .line 1399
    move-result v2

    .line 1400
    invoke-static/range {v11 .. v16}, Lkotlin/text/StringsKt;->c0(Ljava/lang/CharSequence;Ljava/lang/String;IZILjava/lang/Object;)I

    .line 1401
    .line 1402
    .line 1403
    move-result v3

    .line 1404
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    .line 1405
    .line 1406
    .line 1407
    move-result v4

    .line 1408
    add-int/2addr v3, v4

    .line 1409
    const/16 v4, 0x21

    .line 1410
    .line 1411
    invoke-virtual {v11, v1, v2, v3, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 1412
    .line 1413
    .line 1414
    new-instance v1, Ll/jor;

    .line 1415
    .line 1416
    const-string v2, "#FFD233"

    .line 1417
    .line 1418
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1419
    .line 1420
    .line 1421
    move-result v2

    .line 1422
    const-string v3, "#FF7C03"

    .line 1423
    .line 1424
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1425
    .line 1426
    .line 1427
    move-result v3

    .line 1428
    invoke-direct {v1, v2, v3, v10}, Ll/jor;-><init>(IIZ)V

    .line 1429
    .line 1430
    .line 1431
    invoke-static/range {v11 .. v16}, Lkotlin/text/StringsKt;->c0(Ljava/lang/CharSequence;Ljava/lang/String;IZILjava/lang/Object;)I

    .line 1432
    .line 1433
    .line 1434
    move-result v2

    .line 1435
    invoke-static/range {v11 .. v16}, Lkotlin/text/StringsKt;->c0(Ljava/lang/CharSequence;Ljava/lang/String;IZILjava/lang/Object;)I

    .line 1436
    .line 1437
    .line 1438
    move-result v3

    .line 1439
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    .line 1440
    .line 1441
    .line 1442
    move-result v5

    .line 1443
    add-int/2addr v3, v5

    .line 1444
    invoke-virtual {v11, v1, v2, v3, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 1445
    .line 1446
    .line 1447
    goto :goto_8

    .line 1448
    :cond_1c
    invoke-virtual/range {p0 .. p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_description()Lv/VText;

    .line 1449
    .line 1450
    .line 1451
    move-result-object v0

    .line 1452
    invoke-virtual {v0, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1453
    .line 1454
    .line 1455
    return-void

    .line 1456
    :cond_1d
    new-instance v2, Ljava/util/ArrayList;

    .line 1457
    .line 1458
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1459
    .line 1460
    .line 1461
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 1462
    .line 1463
    .line 1464
    move-result-object v3

    .line 1465
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1466
    .line 1467
    .line 1468
    :goto_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 1469
    .line 1470
    .line 1471
    move-result v4

    .line 1472
    if-eqz v4, :cond_20

    .line 1473
    .line 1474
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1475
    .line 1476
    .line 1477
    move-result-object v4

    .line 1478
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1479
    .line 1480
    .line 1481
    check-cast v4, Ljava/lang/String;

    .line 1482
    .line 1483
    invoke-static/range {p2 .. p2}, Ll/wib0;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 1484
    .line 1485
    .line 1486
    move-result v4

    .line 1487
    if-eqz v4, :cond_1e

    .line 1488
    .line 1489
    const-string v4, "#6AA631"

    .line 1490
    .line 1491
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1492
    .line 1493
    .line 1494
    move-result v4

    .line 1495
    goto :goto_a

    .line 1496
    :cond_1e
    invoke-static/range {p2 .. p2}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 1497
    .line 1498
    .line 1499
    move-result v4

    .line 1500
    if-eqz v4, :cond_1f

    .line 1501
    .line 1502
    const-string v4, "#FF67C5"

    .line 1503
    .line 1504
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1505
    .line 1506
    .line 1507
    move-result v4

    .line 1508
    goto :goto_a

    .line 1509
    :cond_1f
    const-string v4, "#FE611D"

    .line 1510
    .line 1511
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1512
    .line 1513
    .line 1514
    move-result v4

    .line 1515
    :goto_a
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1516
    .line 1517
    .line 1518
    move-result-object v4

    .line 1519
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1520
    .line 1521
    .line 1522
    goto :goto_9

    .line 1523
    :cond_20
    invoke-virtual/range {p0 .. p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->get_description()Lv/VText;

    .line 1524
    .line 1525
    .line 1526
    move-result-object v3

    .line 1527
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 1528
    .line 1529
    .line 1530
    move-result-object v1

    .line 1531
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 1532
    .line 1533
    .line 1534
    move-result-object v4

    .line 1535
    invoke-static {v4, v10}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    .line 1536
    .line 1537
    .line 1538
    move-result-object v4

    .line 1539
    const/16 v5, 0x14

    .line 1540
    .line 1541
    invoke-static {v5}, Ll/qa00;->f(I)I

    .line 1542
    .line 1543
    .line 1544
    move-result v5

    .line 1545
    invoke-static {v1, v0, v2, v4, v5}, Ll/q8g0;->d0(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/graphics/Typeface;I)Landroid/text/SpannableStringBuilder;

    .line 1546
    .line 1547
    .line 1548
    move-result-object v0

    .line 1549
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1550
    .line 1551
    .line 1552
    return-void

    .line 1553
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_22
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final get_container()Landroid/widget/FrameLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->a:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_container"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_description()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->b:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_description"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final set_container(Landroid/widget/FrameLayout;)V
    .locals 0
    .param p1    # Landroid/widget/FrameLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->a:Landroid/widget/FrameLayout;

    .line 5
    .line 6
    return-void
.end method

.method public final set_description(Lv/VText;)V
    .locals 0
    .param p1    # Lv/VText;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/page/PurchasePrivilegeView;->b:Lv/VText;

    .line 5
    .line 6
    return-void
.end method
