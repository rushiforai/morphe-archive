.class public Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;
    }
.end annotation


# instance fields
.field public a:Landroid/widget/ImageView;

.field public b:Lv/VText;

.field public c:Landroid/widget/ImageView;

.field public d:Lv/VText;

.field public e:Landroid/widget/ImageView;

.field public f:Z

.field public g:Lcom/p1/mobile/putong/core/data/RoamedLocationData;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->f:Z

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->new_()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->g:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->f:Z

    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->new_()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->g:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 17
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 18
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->f:Z

    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->new_()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->g:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;Lcom/p1/mobile/putong/core/data/Privilege;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;->a(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->i(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->h(Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;Lcom/p1/mobile/putong/core/data/Privilege;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;->a(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rpl0;->a(Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f(I)Landroid/graphics/drawable/Drawable;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final g()V
    .locals 3

    .line 1
    invoke-static {}, Ll/bnl0;->w0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x500

    .line 6
    .line 7
    if-gt v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/high16 v1, 0x42a00000    # 80.0f

    .line 14
    .line 15
    invoke-static {}, Ll/vnb;->m1()F

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    mul-float/2addr v2, v1

    .line 20
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->a:Landroid/widget/ImageView;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {}, Ll/vnb;->m1()F

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const/high16 v2, 0x42480000    # 50.0f

    .line 37
    .line 38
    mul-float/2addr v1, v2

    .line 39
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->a:Landroid/widget/ImageView;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {}, Ll/vnb;->m1()F

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    mul-float/2addr v1, v2

    .line 56
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->c:Landroid/widget/ImageView;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const/high16 v1, 0x42080000    # 34.0f

    .line 69
    .line 70
    invoke-static {}, Ll/vnb;->m1()F

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    mul-float/2addr v2, v1

    .line 75
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->c:Landroid/widget/ImageView;

    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    const/high16 v0, 0x41800000    # 16.0f

    .line 88
    .line 89
    invoke-static {}, Ll/vnb;->m1()F

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    mul-float/2addr v1, v0

    .line 94
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 99
    .line 100
    :cond_0
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->g:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->g:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 10
    .line 11
    invoke-interface {p2, p1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Q8(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;Lcom/p1/mobile/android/app/Act;)V
    .locals 5

    .line 1
    invoke-static {p1}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

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
    if-eqz v1, :cond_d

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/a690;->j()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_9

    .line 17
    .line 18
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 19
    .line 20
    if-eq v1, p1, :cond_8

    .line 21
    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->see_not_match_guide:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 23
    .line 24
    if-ne v1, p1, :cond_0

    .line 25
    .line 26
    goto/16 :goto_1

    .line 27
    .line 28
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_greet:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 29
    .line 30
    if-eq v1, p1, :cond_7

    .line 31
    .line 32
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->svip_greet:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 33
    .line 34
    if-ne v1, p1, :cond_1

    .line 35
    .line 36
    goto/16 :goto_0

    .line 37
    .line 38
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->leave_message:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 39
    .line 40
    if-ne v1, p1, :cond_2

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->a:Landroid/widget/ImageView;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    sget v4, Ll/jbc0;->u0:I

    .line 49
    .line 50
    invoke-static {v3, v4}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 55
    .line 56
    .line 57
    goto/16 :goto_2

    .line 58
    .line 59
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->message_read_state:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 60
    .line 61
    if-ne v1, p1, :cond_3

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->a:Landroid/widget/ImageView;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    sget v4, Ll/jbc0;->v0:I

    .line 70
    .line 71
    invoke-static {v3, v4}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 76
    .line 77
    .line 78
    goto/16 :goto_2

    .line 79
    .line 80
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->greet:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 81
    .line 82
    if-ne v1, p1, :cond_4

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->a:Landroid/widget/ImageView;

    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    sget v4, Ll/jbc0;->t0:I

    .line 91
    .line 92
    invoke-static {v3, v4}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 97
    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->recover_unmatches:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 101
    .line 102
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->a:Landroid/widget/ImageView;

    .line 103
    .line 104
    if-ne v1, p1, :cond_5

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    sget v4, Ll/jbc0;->w0:I

    .line 111
    .line 112
    invoke-static {v1, v4}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v3, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 117
    .line 118
    .line 119
    goto :goto_2

    .line 120
    :cond_5
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 125
    .line 126
    const/high16 v3, 0x42100000    # 36.0f

    .line 127
    .line 128
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 129
    .line 130
    .line 131
    move-result v4

    .line 132
    iput v4, v1, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 133
    .line 134
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    iput v3, v1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 139
    .line 140
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->a:Landroid/widget/ImageView;

    .line 141
    .line 142
    invoke-virtual {v3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 143
    .line 144
    .line 145
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->intl_no_ad:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 146
    .line 147
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->a:Landroid/widget/ImageView;

    .line 148
    .line 149
    if-ne v1, p1, :cond_6

    .line 150
    .line 151
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    sget v4, Ll/jbc0;->o:I

    .line 156
    .line 157
    invoke-static {v1, v4}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-virtual {v3, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 162
    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_6
    invoke-virtual {v0}, Ll/a690;->j()I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->f(I)Landroid/graphics/drawable/Drawable;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-virtual {v3, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 174
    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_7
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->a:Landroid/widget/ImageView;

    .line 178
    .line 179
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 180
    .line 181
    .line 182
    move-result-object v3

    .line 183
    sget v4, Ll/jbc0;->S9:I

    .line 184
    .line 185
    invoke-static {v3, v4}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 190
    .line 191
    .line 192
    goto :goto_2

    .line 193
    :cond_8
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->a:Landroid/widget/ImageView;

    .line 194
    .line 195
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 196
    .line 197
    .line 198
    move-result-object v3

    .line 199
    sget v4, Ll/jbc0;->Jc:I

    .line 200
    .line 201
    invoke-static {v3, v4}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 206
    .line 207
    .line 208
    :cond_9
    :goto_2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->l(Lcom/p1/mobile/putong/core/data/Privilege;Ll/a690;)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->k(Lcom/p1/mobile/putong/core/data/Privilege;Ll/a690;)V

    .line 212
    .line 213
    .line 214
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 215
    .line 216
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 217
    .line 218
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    if-eqz v1, :cond_d

    .line 227
    .line 228
    invoke-virtual {v0}, Ll/a690;->r()I

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    if-lez v1, :cond_a

    .line 233
    .line 234
    invoke-virtual {v0}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 239
    .line 240
    if-ne v1, v3, :cond_a

    .line 241
    .line 242
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->f:Z

    .line 243
    .line 244
    if-nez v1, :cond_a

    .line 245
    .line 246
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->d:Lv/VText;

    .line 247
    .line 248
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 249
    .line 250
    .line 251
    move-result-object v3

    .line 252
    invoke-virtual {v0}, Ll/a690;->r()I

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 261
    .line 262
    .line 263
    goto :goto_3

    .line 264
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->d:Lv/VText;

    .line 265
    .line 266
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    sget v3, Ll/h9c0;->f0:I

    .line 271
    .line 272
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 277
    .line 278
    .line 279
    :goto_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 280
    .line 281
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k0:Lcom/p1/mobile/putong/core/api/q;

    .line 282
    .line 283
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/q;->R:Lcom/p1/mobile/putong/core/api/q$b;

    .line 284
    .line 285
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    invoke-virtual {p3, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    const/4 v1, 0x1

    .line 294
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    new-instance v1, Ll/npl0;

    .line 299
    .line 300
    invoke-direct {v1, p0}, Ll/npl0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;)V

    .line 301
    .line 302
    .line 303
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 304
    .line 305
    .line 306
    move-result-object v1

    .line 307
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 308
    .line 309
    .line 310
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 311
    .line 312
    if-ne p1, v0, :cond_b

    .line 313
    .line 314
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->f:Z

    .line 315
    .line 316
    if-nez v0, :cond_b

    .line 317
    .line 318
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->d:Lv/VText;

    .line 319
    .line 320
    new-instance v1, Ll/opl0;

    .line 321
    .line 322
    invoke-direct {v1, p0, p3}, Ll/opl0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;Lcom/p1/mobile/android/app/Act;)V

    .line 323
    .line 324
    .line 325
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 326
    .line 327
    .line 328
    goto :goto_4

    .line 329
    :cond_b
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 330
    .line 331
    .line 332
    move-result p3

    .line 333
    if-eqz p3, :cond_c

    .line 334
    .line 335
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->f:Z

    .line 336
    .line 337
    if-nez p3, :cond_c

    .line 338
    .line 339
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->d:Lv/VText;

    .line 340
    .line 341
    new-instance v0, Ll/ppl0;

    .line 342
    .line 343
    invoke-direct {v0, p2, p1}, Ll/ppl0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 344
    .line 345
    .line 346
    invoke-virtual {p3, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 347
    .line 348
    .line 349
    goto :goto_4

    .line 350
    :cond_c
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->d:Lv/VText;

    .line 351
    .line 352
    invoke-virtual {p3, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 353
    .line 354
    .line 355
    :cond_d
    :goto_4
    sget-object p3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 356
    .line 357
    const/4 v0, 0x0

    .line 358
    if-ne p1, p3, :cond_e

    .line 359
    .line 360
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->c:Landroid/widget/ImageView;

    .line 361
    .line 362
    invoke-virtual {p3, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 363
    .line 364
    .line 365
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->c:Landroid/widget/ImageView;

    .line 366
    .line 367
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 368
    .line 369
    .line 370
    move-result-object v0

    .line 371
    invoke-virtual {v0}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 372
    .line 373
    .line 374
    move-result-object v0

    .line 375
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->cc()I

    .line 376
    .line 377
    .line 378
    move-result v0

    .line 379
    invoke-virtual {p3, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 380
    .line 381
    .line 382
    goto :goto_5

    .line 383
    :cond_e
    sget-object p3, Lcom/p1/mobile/putong/core/data/Privilege;->svip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 384
    .line 385
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->c:Landroid/widget/ImageView;

    .line 386
    .line 387
    if-ne p1, p3, :cond_f

    .line 388
    .line 389
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 390
    .line 391
    .line 392
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->c:Landroid/widget/ImageView;

    .line 393
    .line 394
    sget v0, Ll/jbc0;->Ya:I

    .line 395
    .line 396
    invoke-virtual {p3, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 397
    .line 398
    .line 399
    goto :goto_5

    .line 400
    :cond_f
    const/16 p3, 0x8

    .line 401
    .line 402
    invoke-virtual {v1, p3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 403
    .line 404
    .line 405
    :goto_5
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->f:Z

    .line 406
    .line 407
    if-eqz p3, :cond_10

    .line 408
    .line 409
    invoke-virtual {p0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 410
    .line 411
    .line 412
    return-void

    .line 413
    :cond_10
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 414
    .line 415
    .line 416
    move-result p3

    .line 417
    if-eqz p3, :cond_11

    .line 418
    .line 419
    new-instance p3, Ll/qpl0;

    .line 420
    .line 421
    invoke-direct {p3, p2, p1}, Ll/qpl0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 422
    .line 423
    .line 424
    invoke-virtual {p0, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 425
    .line 426
    .line 427
    return-void

    .line 428
    :cond_11
    invoke-virtual {p0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 429
    .line 430
    .line 431
    return-void
.end method

.method public final k(Lcom/p1/mobile/putong/core/data/Privilege;Ll/a690;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->d:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/a690;->q()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final l(Lcom/p1/mobile/putong/core/data/Privilege;Ll/a690;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oi()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->b:Lv/VText;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->b9:I

    .line 26
    .line 27
    const/4 v0, 0x5

    .line 28
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, p2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->b:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {p2}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public m()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/high16 v1, 0x42820000    # 65.0f

    .line 6
    .line 7
    invoke-static {}, Ll/vnb;->m1()F

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    mul-float/2addr v2, v1

    .line 12
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->a:Landroid/widget/ImageView;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Ll/vnb;->m1()F

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const/high16 v2, 0x42280000    # 42.0f

    .line 29
    .line 30
    mul-float/2addr v1, v2

    .line 31
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->a:Landroid/widget/ImageView;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {}, Ll/vnb;->m1()F

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    mul-float/2addr v1, v2

    .line 48
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->e:Landroid/widget/ImageView;

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    const/4 v0, 0x1

    .line 61
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->f:Z

    .line 62
    .line 63
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView;->g()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
