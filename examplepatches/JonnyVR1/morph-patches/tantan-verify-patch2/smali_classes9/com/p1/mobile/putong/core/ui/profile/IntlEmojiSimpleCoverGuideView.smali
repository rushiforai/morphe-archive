.class public Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;
.super Lv/SimpleCoverGuideView;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;
    }
.end annotation


# instance fields
.field public c:Landroid/widget/ImageView;

.field public d:Lv/VDraweeView;

.field public e:Landroid/widget/RelativeLayout;

.field public f:Ljava/lang/Runnable;


# direct methods
.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->k(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public e(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->f:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-super {p0, p1}, Lv/SimpleCoverGuideView;->e(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public i()Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;
    .locals 0

    .line 1
    invoke-super {p0}, Lv/SimpleCoverGuideView;->b()Lv/SimpleCoverGuideView$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;

    .line 6
    .line 7
    return-object p0
.end method

.method public final j()V
    .locals 11

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->i()Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;->e(Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v2, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 13
    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    aget v3, v1, v2

    .line 17
    .line 18
    const/4 v4, 0x1

    .line 19
    aget v5, v1, v4

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->i()Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    invoke-static {v6}, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;->e(Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->i()Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;

    .line 34
    .line 35
    .line 36
    move-result-object v7

    .line 37
    invoke-static {v7}, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;->e(Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v7

    .line 41
    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    .line 42
    .line 43
    .line 44
    move-result v7

    .line 45
    div-int/2addr v6, v0

    .line 46
    add-int/2addr v6, v5

    .line 47
    const/high16 v8, 0x41f80000    # 31.0f

    .line 48
    .line 49
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v9

    .line 53
    sub-int/2addr v6, v9

    .line 54
    iget-object v9, p0, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->c:Landroid/widget/ImageView;

    .line 55
    .line 56
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 57
    .line 58
    .line 59
    move-result-object v9

    .line 60
    check-cast v9, Landroid/widget/FrameLayout$LayoutParams;

    .line 61
    .line 62
    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    .line 63
    .line 64
    .line 65
    move-result v10

    .line 66
    iput v10, v9, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 67
    .line 68
    div-int/2addr v7, v0

    .line 69
    add-int/2addr v7, v3

    .line 70
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    sub-int/2addr v7, v0

    .line 75
    iput v7, v9, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->c:Landroid/widget/ImageView;

    .line 78
    .line 79
    invoke-virtual {v0, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->d:Lv/VDraweeView;

    .line 83
    .line 84
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 89
    .line 90
    iput v5, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 91
    .line 92
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 93
    .line 94
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->d:Lv/VDraweeView;

    .line 95
    .line 96
    invoke-virtual {v3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->i()Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;->h(Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;)Lcom/p1/mobile/putong/data/User;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 112
    .line 113
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 114
    .line 115
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_0

    .line 120
    .line 121
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 122
    .line 123
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->d:Lv/VDraweeView;

    .line 124
    .line 125
    new-instance v5, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .line 129
    .line 130
    sget-object v7, Ll/uqb0;->X:Ll/hj5;

    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->i()Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;

    .line 133
    .line 134
    .line 135
    move-result-object v8

    .line 136
    invoke-static {v8}, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;->h(Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;)Lcom/p1/mobile/putong/data/User;

    .line 137
    .line 138
    .line 139
    move-result-object v8

    .line 140
    iget-object v8, v8, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 141
    .line 142
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 143
    .line 144
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 145
    .line 146
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 147
    .line 148
    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    check-cast v2, Ljava/lang/String;

    .line 153
    .line 154
    invoke-virtual {v7, v2}, Ll/hj5;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string v2, ".png"

    .line 162
    .line 163
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    invoke-virtual {v0, v3, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->i()Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;->f(Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;)Landroid/view/View;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-virtual {v0, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 182
    .line 183
    .line 184
    aget v0, v1, v4

    .line 185
    .line 186
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->e:Landroid/widget/RelativeLayout;

    .line 187
    .line 188
    const/high16 v2, 0x42200000    # 40.0f

    .line 189
    .line 190
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 191
    .line 192
    .line 193
    move-result v2

    .line 194
    sub-int/2addr v0, v6

    .line 195
    const/high16 v3, 0x42780000    # 62.0f

    .line 196
    .line 197
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 198
    .line 199
    .line 200
    move-result v3

    .line 201
    sub-int/2addr v0, v3

    .line 202
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    invoke-static {v1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 207
    .line 208
    .line 209
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->e:Landroid/widget/RelativeLayout;

    .line 210
    .line 211
    new-instance v1, Ll/bcn;

    .line 212
    .line 213
    invoke-direct {v1, p0}, Ll/bcn;-><init>(Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;)V

    .line 214
    .line 215
    .line 216
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 217
    .line 218
    .line 219
    return-void
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->i()Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;->g(Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;)Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->i()Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;->g(Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView$a;)Landroid/app/Activity;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "other_profile_first"

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/addemoji/AddEmojiAct;->a2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lv/SimpleCoverGuideView;->d()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->f:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onGlobalLayout()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/IntlEmojiSimpleCoverGuideView;->j()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0}, Lv/SimpleCoverGuideView;->d()V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/View;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method
