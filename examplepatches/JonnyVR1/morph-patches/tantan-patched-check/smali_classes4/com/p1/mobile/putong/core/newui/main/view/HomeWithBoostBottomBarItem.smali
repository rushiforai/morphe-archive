.class public final Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;
.super Lv/bottombar/VBottomBarOldItem;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\n\u0018\u00002\u00020\u0001B\'\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\u000b\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u001f\u0010\u0010\u001a\u00020\n2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u000f\u001a\u00020\rH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u0017\u0010\u0013\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\rH\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\u0014R\u0018\u0010\u0018\u001a\u0004\u0018\u00010\u00158\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\u0017R\u0016\u0010\u001c\u001a\u00020\u00198\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010\u001bR\u0016\u0010\u001e\u001a\u00020\u00198\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001d\u0010\u001bR\u0016\u0010 \u001a\u00020\u00198\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001f\u0010\u001bR\u0016\u0010\"\u001a\u00020\u00198\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008!\u0010\u001b\u00a8\u0006#"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;",
        "Lv/bottombar/VBottomBarOldItem;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "",
        "defStyleAttr",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;I)V",
        "",
        "c",
        "()V",
        "",
        "selected",
        "selectedAnim",
        "a",
        "(ZZ)V",
        "enableDarkMode",
        "setDarkMode",
        "(Z)V",
        "Lcom/tantan/library/svga/SVGAnimationView;",
        "n",
        "Lcom/tantan/library/svga/SVGAnimationView;",
        "svgaAnim",
        "",
        "o",
        "Ljava/lang/String;",
        "nameString",
        "p",
        "boostingNameString",
        "q",
        "boostingSvga",
        "r",
        "darkModeSvga",
        "b_core_intlGmsRelease"
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
.field public n:Lcom/tantan/library/svga/SVGAnimationView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public o:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public p:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public q:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public r:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 6
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x6

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6
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

    .line 18
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
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

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2, p3}, Lv/bottombar/VBottomBarOldItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 5
    .line 6
    .line 7
    const-string p1, ""

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->o:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->p:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->q:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->r:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    const/4 p3, 0x0

    .line 20
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public a(ZZ)V
    .locals 5

    .line 1
    sget-object v0, Ll/ric0;->Companion:Ll/ric0$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ric0$a;->b()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->c2:Ll/dw6;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/dw6;->t3()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    :cond_0
    invoke-static {}, Ll/t450;->j()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 29
    .line 30
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->o:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lv/bottombar/VBottomBarOldItem;->i:Lv/bottombar/VBottomBarRippleView;

    .line 36
    .line 37
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 41
    .line 42
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-ne v0, v3, :cond_2

    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 56
    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    invoke-static {v0, v2, v3, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation$default(Lcom/tantan/library/svga/SVGAnimationView;ZILjava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    invoke-super {p0, p1, p2}, Lv/bottombar/VBottomBarDefaultItem;->a(ZZ)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_3
    iget-object v0, p0, Lv/bottombar/VBottomBarOldItem;->i:Lv/bottombar/VBottomBarRippleView;

    .line 67
    .line 68
    if-eqz p1, :cond_6

    .line 69
    .line 70
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 74
    .line 75
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 79
    .line 80
    if-eqz v0, :cond_4

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-ne v0, v3, :cond_4

    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 89
    .line 90
    if-eqz v0, :cond_4

    .line 91
    .line 92
    invoke-static {v0, v2, v3, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation$default(Lcom/tantan/library/svga/SVGAnimationView;ZILjava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    :cond_4
    iget-object v0, p0, Lv/bottombar/VBottomBarOldItem;->i:Lv/bottombar/VBottomBarRippleView;

    .line 96
    .line 97
    if-eqz p2, :cond_5

    .line 98
    .line 99
    invoke-virtual {v0}, Lv/bottombar/VBottomBarRippleView;->i()V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_5
    invoke-virtual {v0}, Lv/bottombar/VBottomBarRippleView;->d()V

    .line 104
    .line 105
    .line 106
    :goto_0
    iget-object p2, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->o:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    iget-object p2, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 114
    .line 115
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    sget v2, Ll/z8c0;->t:I

    .line 120
    .line 121
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 126
    .line 127
    .line 128
    iget-object p2, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 129
    .line 130
    invoke-virtual {p2, v1, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 131
    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_6
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 138
    .line 139
    invoke-static {p2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 140
    .line 141
    .line 142
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 143
    .line 144
    if-eqz p2, :cond_7

    .line 145
    .line 146
    invoke-virtual {p2}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 147
    .line 148
    .line 149
    :cond_7
    iget-object p2, p0, Lv/bottombar/VBottomBarOldItem;->i:Lv/bottombar/VBottomBarRippleView;

    .line 150
    .line 151
    invoke-virtual {p2}, Lv/bottombar/VBottomBarRippleView;->f()V

    .line 152
    .line 153
    .line 154
    iget-object p2, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 155
    .line 156
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->p:Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    .line 160
    .line 161
    iget-boolean p2, p0, Lv/bottombar/VBottomBarDefaultItem;->g:Z

    .line 162
    .line 163
    iget-object v0, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 164
    .line 165
    if-eqz p2, :cond_8

    .line 166
    .line 167
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 168
    .line 169
    .line 170
    move-result-object p2

    .line 171
    sget v3, Ll/z8c0;->v:I

    .line 172
    .line 173
    invoke-virtual {p2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 174
    .line 175
    .line 176
    move-result p2

    .line 177
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 178
    .line 179
    .line 180
    goto :goto_1

    .line 181
    :cond_8
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    sget v3, Ll/z8c0;->o:I

    .line 186
    .line 187
    invoke-virtual {p2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 188
    .line 189
    .line 190
    move-result p2

    .line 191
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 192
    .line 193
    .line 194
    :goto_1
    iget-object p2, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 195
    .line 196
    invoke-virtual {p2, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 197
    .line 198
    .line 199
    :goto_2
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 200
    .line 201
    .line 202
    return-void
.end method

.method public c()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/kec0;->b0:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    const/4 v2, -0x2

    .line 28
    const/4 v3, -0x1

    .line 29
    invoke-direct {v1, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    const/4 v1, 0x0

    .line 36
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 40
    .line 41
    .line 42
    sget v1, Ll/adc0;->Ib:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    check-cast v1, Lv/bottombar/VBottomBarRippleView;

    .line 52
    .line 53
    iput-object v1, p0, Lv/bottombar/VBottomBarOldItem;->i:Lv/bottombar/VBottomBarRippleView;

    .line 54
    .line 55
    sget v1, Ll/adc0;->K8:I

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 62
    .line 63
    .line 64
    check-cast v1, Lv/VText;

    .line 65
    .line 66
    iput-object v1, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 67
    .line 68
    sget v1, Ll/adc0;->la:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 75
    .line 76
    .line 77
    check-cast v0, Lv/VDraweeView;

    .line 78
    .line 79
    iput-object v0, p0, Lv/bottombar/VBottomBarOldItem;->h:Lv/VDraweeView;

    .line 80
    .line 81
    sget v0, Ll/adc0;->l0:I

    .line 82
    .line 83
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 88
    .line 89
    .line 90
    check-cast v0, Lv/RedPointView;

    .line 91
    .line 92
    iput-object v0, p0, Lv/bottombar/VBottomBarDefaultItem;->c:Lv/RedPointView;

    .line 93
    .line 94
    sget v0, Ll/adc0;->u4:I

    .line 95
    .line 96
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 101
    .line 102
    .line 103
    check-cast v0, Landroid/widget/FrameLayout;

    .line 104
    .line 105
    iput-object v0, p0, Lv/bottombar/VBottomBarOldItem;->l:Landroid/widget/FrameLayout;

    .line 106
    .line 107
    sget v0, Ll/adc0;->m6:I

    .line 108
    .line 109
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 114
    .line 115
    .line 116
    check-cast v0, Lv/VOnlineIndicator;

    .line 117
    .line 118
    iput-object v0, p0, Lv/bottombar/VBottomBarDefaultItem;->d:Lv/VOnlineIndicator;

    .line 119
    .line 120
    sget v0, Ll/adc0;->na:I

    .line 121
    .line 122
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 127
    .line 128
    .line 129
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 130
    .line 131
    iput-object v0, p0, Lv/bottombar/VBottomBarOldItem;->k:Landroid/widget/RelativeLayout;

    .line 132
    .line 133
    sget v0, Ll/adc0;->i3:I

    .line 134
    .line 135
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    check-cast v0, Lv/VImage;

    .line 140
    .line 141
    iput-object v0, p0, Lv/bottombar/VBottomBarDefaultItem;->e:Lv/VImage;

    .line 142
    .line 143
    sget v0, Ll/adc0;->Mb:I

    .line 144
    .line 145
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 150
    .line 151
    iput-object v0, p0, Lv/bottombar/VBottomBarOldItem;->j:Landroid/widget/RelativeLayout;

    .line 152
    .line 153
    sget v0, Ll/adc0;->td:I

    .line 154
    .line 155
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 160
    .line 161
    .line 162
    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 163
    .line 164
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 165
    .line 166
    return-void
.end method

.method public setDarkMode(Z)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lv/bottombar/VBottomBarOldItem;->setDarkMode(Z)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    const/4 v1, -0x1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->r:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/view/HomeWithBoostBottomBarItem;->q:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    return-void
.end method
