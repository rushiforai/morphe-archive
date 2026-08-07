.class public Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lcom/p1/mobile/putong/core/data/Privilege;

.field public e:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

.field public f:Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;

.field public g:Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;

.field public h:Ll/kcg0;

.field public i:Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;

.field public j:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

.field public k:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

.field public l:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ce90;->a(Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->e:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->e:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->l(Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 23
    .line 24
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->online_match_tickets:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 25
    .line 26
    if-ne v0, v2, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->f:Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->f:Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;->t0()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 43
    .line 44
    if-ne v0, v1, :cond_2

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->g:Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->g:Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->l0()V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 61
    .line 62
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->voice_quick_chat:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 63
    .line 64
    if-ne v0, v2, :cond_3

    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->i:Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;

    .line 67
    .line 68
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->i:Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->m0()V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 81
    .line 82
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->top_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 83
    .line 84
    if-ne v0, v2, :cond_4

    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->j:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 87
    .line 88
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_4

    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->j:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;->f()V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 101
    .line 102
    if-ne v0, v1, :cond_5

    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->k:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 105
    .line 106
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_5

    .line 111
    .line 112
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->k:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;->f()V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 119
    .line 120
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 121
    .line 122
    if-ne v0, v1, :cond_6

    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->l:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 125
    .line 126
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-eqz v0, :cond_6

    .line 131
    .line 132
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->l:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;->f()V

    .line 135
    .line 136
    .line 137
    :cond_6
    return-void
.end method

.method public d(Ll/a690;ILcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 7

    .line 1
    invoke-static {p3}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p3}, Ll/wib0;->p(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {p3}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget v2, Ll/h9c0;->x:I

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sget v2, Ll/h9c0;->y:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 47
    .line 48
    .line 49
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 50
    .line 51
    const/4 v1, 0x3

    .line 52
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 64
    .line 65
    const/4 v1, 0x0

    .line 66
    const/16 v2, 0x10

    .line 67
    .line 68
    const/4 v3, -0x1

    .line 69
    if-nez v0, :cond_2

    .line 70
    .line 71
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 72
    .line 73
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    sget v0, Ll/rec0;->H0:I

    .line 89
    .line 90
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 91
    .line 92
    invoke-virtual {p2, v0, v4, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    check-cast p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;

    .line 97
    .line 98
    invoke-virtual {p2, p1, p3}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->b(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 99
    .line 100
    .line 101
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 102
    .line 103
    invoke-direct {p3, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 104
    .line 105
    .line 106
    iput v2, p3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 109
    .line 110
    invoke-virtual {v0, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 114
    .line 115
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_2
    sget-object v4, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding$a;->a:[I

    .line 124
    .line 125
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    aget v0, v4, v0

    .line 130
    .line 131
    const/16 v4, 0x11

    .line 132
    .line 133
    const/4 v5, -0x2

    .line 134
    packed-switch v0, :pswitch_data_0

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :pswitch_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 139
    .line 140
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 141
    .line 142
    .line 143
    move-result-object p3

    .line 144
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 145
    .line 146
    .line 147
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 148
    .line 149
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    sget p2, Ll/rec0;->f1:I

    .line 165
    .line 166
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 167
    .line 168
    invoke-virtual {p1, p2, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PurchaseDlgItemHideMeFromNearby;

    .line 173
    .line 174
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PurchaseDlgItemHideMeFromNearby;->b()V

    .line 175
    .line 176
    .line 177
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 178
    .line 179
    invoke-direct {p2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 180
    .line 181
    .line 182
    iput v2, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 183
    .line 184
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 185
    .line 186
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 187
    .line 188
    .line 189
    return-void

    .line 190
    :pswitch_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 191
    .line 192
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 193
    .line 194
    .line 195
    move-result-object p3

    .line 196
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 197
    .line 198
    .line 199
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 200
    .line 201
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 206
    .line 207
    .line 208
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->confession_first:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 209
    .line 210
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->f(Lcom/p1/mobile/putong/core/data/Privilege;)Landroid/view/View;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 215
    .line 216
    invoke-direct {p2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 217
    .line 218
    .line 219
    iput v2, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 220
    .line 221
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 222
    .line 223
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 224
    .line 225
    .line 226
    return-void

    .line 227
    :pswitch_2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 228
    .line 229
    .line 230
    move-result-object p2

    .line 231
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 232
    .line 233
    .line 234
    move-result-object p2

    .line 235
    sget p3, Ll/rec0;->h1:I

    .line 236
    .line 237
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 238
    .line 239
    invoke-virtual {p2, p3, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 240
    .line 241
    .line 242
    move-result-object p2

    .line 243
    check-cast p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PurchaseDlgItemVisitorHideFootPrint;

    .line 244
    .line 245
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PurchaseDlgItemVisitorHideFootPrint;->b()V

    .line 246
    .line 247
    .line 248
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 249
    .line 250
    const/high16 v0, 0x42dc0000    # 110.0f

    .line 251
    .line 252
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    invoke-direct {p3, v3, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 257
    .line 258
    .line 259
    iput v2, p3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 260
    .line 261
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 262
    .line 263
    invoke-virtual {v0, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 264
    .line 265
    .line 266
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 267
    .line 268
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 269
    .line 270
    .line 271
    move-result-object p3

    .line 272
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 273
    .line 274
    .line 275
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 276
    .line 277
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 278
    .line 279
    .line 280
    move-result-object p1

    .line 281
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 282
    .line 283
    .line 284
    return-void

    .line 285
    :pswitch_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 286
    .line 287
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 288
    .line 289
    .line 290
    move-result-object p3

    .line 291
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 292
    .line 293
    .line 294
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 295
    .line 296
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 297
    .line 298
    .line 299
    move-result-object p1

    .line 300
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 301
    .line 302
    .line 303
    new-instance p1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 304
    .line 305
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 306
    .line 307
    .line 308
    move-result-object p2

    .line 309
    invoke-direct {p1, p2}, Lcom/tantan/library/svga/SVGAnimationView;-><init>(Landroid/content/Context;)V

    .line 310
    .line 311
    .line 312
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 313
    .line 314
    .line 315
    move-result-object p2

    .line 316
    invoke-static {p2}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 317
    .line 318
    .line 319
    move-result-object p2

    .line 320
    const-string p3, "https://auto.tancdn.com/v1/raw/5b7b48e6-7289-4204-acc9-eb6b424938fa14.so"

    .line 321
    .line 322
    invoke-virtual {p2, p3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 323
    .line 324
    .line 325
    move-result-object p2

    .line 326
    invoke-virtual {p2, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 327
    .line 328
    .line 329
    move-result-object p2

    .line 330
    invoke-virtual {p2, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 331
    .line 332
    .line 333
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 334
    .line 335
    invoke-direct {p2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 336
    .line 337
    .line 338
    iput v2, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 339
    .line 340
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 341
    .line 342
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 343
    .line 344
    .line 345
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 346
    .line 347
    .line 348
    return-void

    .line 349
    :pswitch_4
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 350
    .line 351
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 352
    .line 353
    .line 354
    move-result-object p3

    .line 355
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 356
    .line 357
    .line 358
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 359
    .line 360
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 361
    .line 362
    .line 363
    move-result-object p1

    .line 364
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 365
    .line 366
    .line 367
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->say_hi_pkg:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 368
    .line 369
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->f(Lcom/p1/mobile/putong/core/data/Privilege;)Landroid/view/View;

    .line 370
    .line 371
    .line 372
    move-result-object p1

    .line 373
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 374
    .line 375
    invoke-direct {p2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 376
    .line 377
    .line 378
    iput v2, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 379
    .line 380
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 381
    .line 382
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 383
    .line 384
    .line 385
    return-void

    .line 386
    :pswitch_5
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 387
    .line 388
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 389
    .line 390
    .line 391
    move-result-object p3

    .line 392
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 393
    .line 394
    .line 395
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 396
    .line 397
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 398
    .line 399
    .line 400
    move-result-object p1

    .line 401
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 402
    .line 403
    .line 404
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 405
    .line 406
    .line 407
    move-result-object p1

    .line 408
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 409
    .line 410
    .line 411
    move-result-object p1

    .line 412
    sget p2, Ll/rec0;->M0:I

    .line 413
    .line 414
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 415
    .line 416
    invoke-virtual {p1, p2, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 417
    .line 418
    .line 419
    move-result-object p1

    .line 420
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondService;

    .line 421
    .line 422
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondService;->b()V

    .line 423
    .line 424
    .line 425
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 426
    .line 427
    invoke-direct {p2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 428
    .line 429
    .line 430
    iput v2, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 431
    .line 432
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 433
    .line 434
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 435
    .line 436
    .line 437
    return-void

    .line 438
    :pswitch_6
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 439
    .line 440
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 441
    .line 442
    .line 443
    move-result-object p3

    .line 444
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 445
    .line 446
    .line 447
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 448
    .line 449
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 450
    .line 451
    .line 452
    move-result-object p1

    .line 453
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 454
    .line 455
    .line 456
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 457
    .line 458
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->e(Lcom/p1/mobile/putong/core/data/Privilege;)Landroid/view/View;

    .line 459
    .line 460
    .line 461
    move-result-object p1

    .line 462
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 463
    .line 464
    invoke-direct {p2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 465
    .line 466
    .line 467
    iput v2, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 468
    .line 469
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 470
    .line 471
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 472
    .line 473
    .line 474
    return-void

    .line 475
    :pswitch_7
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 476
    .line 477
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 478
    .line 479
    .line 480
    move-result-object p3

    .line 481
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 482
    .line 483
    .line 484
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 485
    .line 486
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 487
    .line 488
    .line 489
    move-result-object p1

    .line 490
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 491
    .line 492
    .line 493
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 494
    .line 495
    .line 496
    move-result-object p1

    .line 497
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 498
    .line 499
    .line 500
    move-result-object p1

    .line 501
    sget p2, Ll/rec0;->N0:I

    .line 502
    .line 503
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 504
    .line 505
    invoke-virtual {p1, p2, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 506
    .line 507
    .line 508
    move-result-object p1

    .line 509
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondSkin;

    .line 510
    .line 511
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondSkin;->b()V

    .line 512
    .line 513
    .line 514
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 515
    .line 516
    invoke-direct {p2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 517
    .line 518
    .line 519
    iput v2, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 520
    .line 521
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 522
    .line 523
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 524
    .line 525
    .line 526
    return-void

    .line 527
    :pswitch_8
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 528
    .line 529
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 530
    .line 531
    .line 532
    move-result-object v0

    .line 533
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 534
    .line 535
    .line 536
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 537
    .line 538
    .line 539
    move-result-object p2

    .line 540
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 541
    .line 542
    .line 543
    move-result-object p2

    .line 544
    sget v0, Ll/rec0;->R0:I

    .line 545
    .line 546
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 547
    .line 548
    invoke-virtual {p2, v0, v4, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 549
    .line 550
    .line 551
    move-result-object p2

    .line 552
    check-cast p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVIPBadgeView;

    .line 553
    .line 554
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVIPBadgeView;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 555
    .line 556
    .line 557
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 558
    .line 559
    invoke-direct {p3, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 560
    .line 561
    .line 562
    iput v2, p3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 563
    .line 564
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 565
    .line 566
    invoke-virtual {v0, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 567
    .line 568
    .line 569
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 570
    .line 571
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 572
    .line 573
    .line 574
    move-result-object p1

    .line 575
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 576
    .line 577
    .line 578
    return-void

    .line 579
    :pswitch_9
    invoke-static {}, Ll/s7a;->h()Z

    .line 580
    .line 581
    .line 582
    move-result p2

    .line 583
    if-eqz p2, :cond_4

    .line 584
    .line 585
    invoke-static {p3}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 586
    .line 587
    .line 588
    move-result p2

    .line 589
    if-nez p2, :cond_3

    .line 590
    .line 591
    invoke-static {p3}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 592
    .line 593
    .line 594
    move-result p2

    .line 595
    if-eqz p2, :cond_4

    .line 596
    .line 597
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 598
    .line 599
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 600
    .line 601
    .line 602
    move-result-object v0

    .line 603
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 604
    .line 605
    .line 606
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 607
    .line 608
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 609
    .line 610
    .line 611
    move-result-object v0

    .line 612
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 613
    .line 614
    .line 615
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 616
    .line 617
    .line 618
    move-result-object p2

    .line 619
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 620
    .line 621
    .line 622
    move-result-object p2

    .line 623
    sget v0, Ll/rec0;->Q0:I

    .line 624
    .line 625
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 626
    .line 627
    invoke-virtual {p2, v0, v4, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 628
    .line 629
    .line 630
    move-result-object p2

    .line 631
    check-cast p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 632
    .line 633
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->l:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 634
    .line 635
    invoke-virtual {p2, p1, p3}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;->c(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 636
    .line 637
    .line 638
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 639
    .line 640
    invoke-direct {p1, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 641
    .line 642
    .line 643
    iput v2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 644
    .line 645
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 646
    .line 647
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->l:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 648
    .line 649
    invoke-virtual {p2, p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 650
    .line 651
    .line 652
    return-void

    .line 653
    :cond_4
    :pswitch_a
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 654
    .line 655
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 656
    .line 657
    .line 658
    move-result-object v0

    .line 659
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 660
    .line 661
    .line 662
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 663
    .line 664
    .line 665
    move-result-object p2

    .line 666
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 667
    .line 668
    .line 669
    move-result-object p2

    .line 670
    sget v0, Ll/rec0;->H0:I

    .line 671
    .line 672
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 673
    .line 674
    invoke-virtual {p2, v0, v4, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 675
    .line 676
    .line 677
    move-result-object p2

    .line 678
    check-cast p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;

    .line 679
    .line 680
    invoke-virtual {p2, p1, p3}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->b(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 681
    .line 682
    .line 683
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 684
    .line 685
    invoke-direct {p3, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 686
    .line 687
    .line 688
    iput v2, p3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 689
    .line 690
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 691
    .line 692
    invoke-virtual {v0, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 693
    .line 694
    .line 695
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 696
    .line 697
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 698
    .line 699
    .line 700
    move-result-object p1

    .line 701
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 702
    .line 703
    .line 704
    return-void

    .line 705
    :pswitch_b
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 706
    .line 707
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 708
    .line 709
    .line 710
    move-result-object v0

    .line 711
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 712
    .line 713
    .line 714
    invoke-static {}, Ll/s7a;->r()Z

    .line 715
    .line 716
    .line 717
    move-result p2

    .line 718
    if-eqz p2, :cond_5

    .line 719
    .line 720
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 721
    .line 722
    .line 723
    move-result-object p2

    .line 724
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 725
    .line 726
    .line 727
    move-result-object p2

    .line 728
    sget v0, Ll/rec0;->Q0:I

    .line 729
    .line 730
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 731
    .line 732
    invoke-virtual {p2, v0, v4, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 733
    .line 734
    .line 735
    move-result-object p2

    .line 736
    check-cast p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 737
    .line 738
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->j:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 739
    .line 740
    invoke-virtual {p2, p1, p3}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;->b(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 741
    .line 742
    .line 743
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 744
    .line 745
    invoke-direct {p2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 746
    .line 747
    .line 748
    iput v2, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 749
    .line 750
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 751
    .line 752
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->j:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 753
    .line 754
    invoke-virtual {p3, v0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 755
    .line 756
    .line 757
    goto :goto_0

    .line 758
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 759
    .line 760
    .line 761
    move-result-object p2

    .line 762
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 763
    .line 764
    .line 765
    move-result-object p2

    .line 766
    sget v0, Ll/rec0;->H0:I

    .line 767
    .line 768
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 769
    .line 770
    invoke-virtual {p2, v0, v4, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 771
    .line 772
    .line 773
    move-result-object p2

    .line 774
    check-cast p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;

    .line 775
    .line 776
    invoke-virtual {p2, p1, p3}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->b(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 777
    .line 778
    .line 779
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 780
    .line 781
    invoke-direct {p3, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 782
    .line 783
    .line 784
    iput v2, p3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 785
    .line 786
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 787
    .line 788
    invoke-virtual {v0, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 789
    .line 790
    .line 791
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 792
    .line 793
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 794
    .line 795
    .line 796
    move-result-object p1

    .line 797
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 798
    .line 799
    .line 800
    return-void

    .line 801
    :pswitch_c
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 802
    .line 803
    sget-object p3, Lcom/p1/mobile/putong/core/data/Privilege;->leave_message:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 804
    .line 805
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 806
    .line 807
    if-ne p2, p3, :cond_6

    .line 808
    .line 809
    const-string p2, "\u6bcf\u59295\u6761\u8d44\u6599\u7559\u8a00"

    .line 810
    .line 811
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 812
    .line 813
    .line 814
    goto :goto_1

    .line 815
    :cond_6
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 816
    .line 817
    .line 818
    move-result-object p2

    .line 819
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 820
    .line 821
    .line 822
    :goto_1
    new-instance p2, Landroid/widget/ImageView;

    .line 823
    .line 824
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 825
    .line 826
    .line 827
    move-result-object p3

    .line 828
    invoke-direct {p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 829
    .line 830
    .line 831
    invoke-virtual {p1}, Ll/a690;->j()I

    .line 832
    .line 833
    .line 834
    move-result p3

    .line 835
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 836
    .line 837
    .line 838
    sget-object p3, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    .line 839
    .line 840
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 841
    .line 842
    .line 843
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 844
    .line 845
    invoke-direct {p3, v3, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 846
    .line 847
    .line 848
    iput v2, p3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 849
    .line 850
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 851
    .line 852
    invoke-virtual {v0, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 853
    .line 854
    .line 855
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 856
    .line 857
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 858
    .line 859
    .line 860
    move-result-object p1

    .line 861
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 862
    .line 863
    .line 864
    return-void

    .line 865
    :pswitch_d
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 866
    .line 867
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 868
    .line 869
    .line 870
    move-result-object p3

    .line 871
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 872
    .line 873
    .line 874
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 875
    .line 876
    .line 877
    move-result-object p2

    .line 878
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 879
    .line 880
    .line 881
    move-result-object p2

    .line 882
    sget p3, Ll/rec0;->K0:I

    .line 883
    .line 884
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 885
    .line 886
    invoke-virtual {p2, p3, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 887
    .line 888
    .line 889
    move-result-object p2

    .line 890
    check-cast p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeLetterView;

    .line 891
    .line 892
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeLetterView;->b()V

    .line 893
    .line 894
    .line 895
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 896
    .line 897
    invoke-direct {p3, v3, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 898
    .line 899
    .line 900
    iput v2, p3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 901
    .line 902
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 903
    .line 904
    invoke-virtual {v0, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 905
    .line 906
    .line 907
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 908
    .line 909
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 910
    .line 911
    .line 912
    move-result-object p1

    .line 913
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 914
    .line 915
    .line 916
    return-void

    .line 917
    :pswitch_e
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 918
    .line 919
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 920
    .line 921
    .line 922
    move-result-object v0

    .line 923
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 924
    .line 925
    .line 926
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 927
    .line 928
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 929
    .line 930
    .line 931
    move-result-object p1

    .line 932
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 933
    .line 934
    .line 935
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 936
    .line 937
    .line 938
    move-result-object p1

    .line 939
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 940
    .line 941
    .line 942
    move-result-object p1

    .line 943
    sget p2, Ll/rec0;->s2:I

    .line 944
    .line 945
    const/4 v0, 0x0

    .line 946
    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 947
    .line 948
    .line 949
    move-result-object p1

    .line 950
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;

    .line 951
    .line 952
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->i:Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;

    .line 953
    .line 954
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->i0(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 955
    .line 956
    .line 957
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 958
    .line 959
    invoke-direct {p1, v3, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 960
    .line 961
    .line 962
    iput v2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 963
    .line 964
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 965
    .line 966
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->i:Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;

    .line 967
    .line 968
    invoke-virtual {p2, p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 969
    .line 970
    .line 971
    return-void

    .line 972
    :pswitch_f
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 973
    .line 974
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 975
    .line 976
    .line 977
    move-result-object v0

    .line 978
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 979
    .line 980
    .line 981
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 982
    .line 983
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 984
    .line 985
    .line 986
    move-result-object v0

    .line 987
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 988
    .line 989
    .line 990
    invoke-static {}, Ll/s7a;->h()Z

    .line 991
    .line 992
    .line 993
    move-result p2

    .line 994
    if-eqz p2, :cond_7

    .line 995
    .line 996
    invoke-static {p3}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 997
    .line 998
    .line 999
    move-result p2

    .line 1000
    if-eqz p2, :cond_7

    .line 1001
    .line 1002
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1003
    .line 1004
    .line 1005
    move-result-object p2

    .line 1006
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 1007
    .line 1008
    .line 1009
    move-result-object p2

    .line 1010
    sget v0, Ll/rec0;->H0:I

    .line 1011
    .line 1012
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1013
    .line 1014
    invoke-virtual {p2, v0, v4, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 1015
    .line 1016
    .line 1017
    move-result-object p2

    .line 1018
    check-cast p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;

    .line 1019
    .line 1020
    invoke-virtual {p2, p1, p3}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->c(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 1021
    .line 1022
    .line 1023
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 1024
    .line 1025
    invoke-direct {p1, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1026
    .line 1027
    .line 1028
    iput v2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1029
    .line 1030
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1031
    .line 1032
    invoke-virtual {p0, p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1033
    .line 1034
    .line 1035
    return-void

    .line 1036
    :cond_7
    invoke-static {p3}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 1037
    .line 1038
    .line 1039
    move-result p1

    .line 1040
    if-nez p1, :cond_9

    .line 1041
    .line 1042
    invoke-static {p3}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 1043
    .line 1044
    .line 1045
    move-result p1

    .line 1046
    if-eqz p1, :cond_8

    .line 1047
    .line 1048
    goto :goto_2

    .line 1049
    :cond_8
    new-instance p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;

    .line 1050
    .line 1051
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1052
    .line 1053
    .line 1054
    move-result-object p2

    .line 1055
    invoke-direct {p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;-><init>(Landroid/content/Context;)V

    .line 1056
    .line 1057
    .line 1058
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->f:Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;

    .line 1059
    .line 1060
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 1061
    .line 1062
    invoke-direct {p1, v3, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1063
    .line 1064
    .line 1065
    iput v2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1066
    .line 1067
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1068
    .line 1069
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->f:Lcom/p1/mobile/putong/core/ui/purchase/privilege/QuickChatPrivilegeAnimView;

    .line 1070
    .line 1071
    invoke-virtual {p2, p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1072
    .line 1073
    .line 1074
    return-void

    .line 1075
    :cond_9
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 1076
    .line 1077
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->e(Lcom/p1/mobile/putong/core/data/Privilege;)Landroid/view/View;

    .line 1078
    .line 1079
    .line 1080
    move-result-object p1

    .line 1081
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 1082
    .line 1083
    invoke-direct {p2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1084
    .line 1085
    .line 1086
    iput v2, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1087
    .line 1088
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1089
    .line 1090
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1091
    .line 1092
    .line 1093
    return-void

    .line 1094
    :pswitch_10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 1095
    .line 1096
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1097
    .line 1098
    .line 1099
    move-result-object v5

    .line 1100
    sget v6, Lcom/p1/mobile/putong/core/pay/R$string;->m7:I

    .line 1101
    .line 1102
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 1103
    .line 1104
    .line 1105
    move-result-object v5

    .line 1106
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1107
    .line 1108
    .line 1109
    invoke-static {}, Ll/s7a;->h()Z

    .line 1110
    .line 1111
    .line 1112
    move-result v0

    .line 1113
    if-eqz v0, :cond_d

    .line 1114
    .line 1115
    invoke-static {p3}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 1116
    .line 1117
    .line 1118
    move-result v0

    .line 1119
    if-eqz v0, :cond_d

    .line 1120
    .line 1121
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1122
    .line 1123
    .line 1124
    move-result-object v0

    .line 1125
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 1126
    .line 1127
    .line 1128
    move-result-object v0

    .line 1129
    sget v4, Ll/rec0;->Q0:I

    .line 1130
    .line 1131
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1132
    .line 1133
    invoke-virtual {v0, v4, v5, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 1134
    .line 1135
    .line 1136
    move-result-object v0

    .line 1137
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 1138
    .line 1139
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->k:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 1140
    .line 1141
    invoke-virtual {v0, p1, p3}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;->d(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 1142
    .line 1143
    .line 1144
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 1145
    .line 1146
    invoke-direct {p1, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1147
    .line 1148
    .line 1149
    iput v2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1150
    .line 1151
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1152
    .line 1153
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->k:Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;

    .line 1154
    .line 1155
    invoke-virtual {p3, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1156
    .line 1157
    .line 1158
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1159
    .line 1160
    .line 1161
    move-result-object p1

    .line 1162
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1163
    .line 1164
    .line 1165
    move-result-object p1

    .line 1166
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->W9()Z

    .line 1167
    .line 1168
    .line 1169
    move-result p1

    .line 1170
    if-eqz p1, :cond_a

    .line 1171
    .line 1172
    invoke-static {}, Ll/rbb0;->f()Lcom/p1/mobile/putong/data/User;

    .line 1173
    .line 1174
    .line 1175
    move-result-object p1

    .line 1176
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1177
    .line 1178
    .line 1179
    move-result p1

    .line 1180
    if-eqz p1, :cond_a

    .line 1181
    .line 1182
    if-nez p2, :cond_a

    .line 1183
    .line 1184
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->g()V

    .line 1185
    .line 1186
    .line 1187
    return-void

    .line 1188
    :cond_a
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1189
    .line 1190
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 1191
    .line 1192
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->t5()Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 1193
    .line 1194
    .line 1195
    move-result-object p1

    .line 1196
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1197
    .line 1198
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 1199
    .line 1200
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/CoreLikers;->x5()Lcom/p1/mobile/putong/data/User;

    .line 1201
    .line 1202
    .line 1203
    move-result-object p2

    .line 1204
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1205
    .line 1206
    .line 1207
    move-result-object p3

    .line 1208
    invoke-virtual {p3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1209
    .line 1210
    .line 1211
    move-result-object p3

    .line 1212
    invoke-interface {p3, p2, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->vb(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreLikers$a;)Z

    .line 1213
    .line 1214
    .line 1215
    move-result p3

    .line 1216
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 1217
    .line 1218
    if-eqz p3, :cond_b

    .line 1219
    .line 1220
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1221
    .line 1222
    .line 1223
    move-result-object p1

    .line 1224
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1225
    .line 1226
    .line 1227
    move-result-object p1

    .line 1228
    invoke-interface {p1, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->yl(Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;

    .line 1229
    .line 1230
    .line 1231
    move-result-object p1

    .line 1232
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1233
    .line 1234
    .line 1235
    return-void

    .line 1236
    :cond_b
    if-nez p1, :cond_c

    .line 1237
    .line 1238
    goto :goto_3

    .line 1239
    :cond_c
    iget v1, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 1240
    .line 1241
    :goto_3
    invoke-static {v1}, Ll/hge0;->e(I)Ljava/lang/String;

    .line 1242
    .line 1243
    .line 1244
    move-result-object p1

    .line 1245
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1246
    .line 1247
    .line 1248
    return-void

    .line 1249
    :cond_d
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1250
    .line 1251
    .line 1252
    move-result-object p1

    .line 1253
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1254
    .line 1255
    .line 1256
    move-result-object p1

    .line 1257
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->W9()Z

    .line 1258
    .line 1259
    .line 1260
    move-result p1

    .line 1261
    if-eqz p1, :cond_e

    .line 1262
    .line 1263
    invoke-static {}, Ll/rbb0;->f()Lcom/p1/mobile/putong/data/User;

    .line 1264
    .line 1265
    .line 1266
    move-result-object p1

    .line 1267
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1268
    .line 1269
    .line 1270
    move-result p1

    .line 1271
    if-eqz p1, :cond_e

    .line 1272
    .line 1273
    if-nez p2, :cond_e

    .line 1274
    .line 1275
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1276
    .line 1277
    .line 1278
    move-result-object p1

    .line 1279
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 1280
    .line 1281
    .line 1282
    move-result-object p1

    .line 1283
    sget p2, Ll/rec0;->X2:I

    .line 1284
    .line 1285
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1286
    .line 1287
    invoke-virtual {p1, p2, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 1288
    .line 1289
    .line 1290
    move-result-object p1

    .line 1291
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;

    .line 1292
    .line 1293
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->g:Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;

    .line 1294
    .line 1295
    invoke-static {}, Ll/rbb0;->f()Lcom/p1/mobile/putong/data/User;

    .line 1296
    .line 1297
    .line 1298
    move-result-object p2

    .line 1299
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;->d(Lcom/p1/mobile/putong/data/User;)V

    .line 1300
    .line 1301
    .line 1302
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 1303
    .line 1304
    invoke-direct {p1, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1305
    .line 1306
    .line 1307
    iput v4, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1308
    .line 1309
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1310
    .line 1311
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->g:Lcom/p1/mobile/putong/core/ui/purchase/privilege/SvipDlgSeeAnimLayout;

    .line 1312
    .line 1313
    invoke-virtual {p2, p3, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1314
    .line 1315
    .line 1316
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1317
    .line 1318
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 1319
    .line 1320
    .line 1321
    move-result-object p1

    .line 1322
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 1323
    .line 1324
    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 1325
    .line 1326
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->g()V

    .line 1327
    .line 1328
    .line 1329
    return-void

    .line 1330
    :cond_e
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1331
    .line 1332
    .line 1333
    move-result-object p1

    .line 1334
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 1335
    .line 1336
    .line 1337
    move-result-object p1

    .line 1338
    sget p2, Ll/rec0;->L2:I

    .line 1339
    .line 1340
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1341
    .line 1342
    invoke-virtual {p1, p2, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 1343
    .line 1344
    .line 1345
    move-result-object p1

    .line 1346
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 1347
    .line 1348
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->e:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 1349
    .line 1350
    const p2, 0x3f4ccccd    # 0.8f

    .line 1351
    .line 1352
    .line 1353
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->setScale(F)V

    .line 1354
    .line 1355
    .line 1356
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 1357
    .line 1358
    invoke-direct {p1, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1359
    .line 1360
    .line 1361
    iput v4, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1362
    .line 1363
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1364
    .line 1365
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->e:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 1366
    .line 1367
    invoke-virtual {p2, p3, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1368
    .line 1369
    .line 1370
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1371
    .line 1372
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 1373
    .line 1374
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->t5()Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 1375
    .line 1376
    .line 1377
    move-result-object p1

    .line 1378
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1379
    .line 1380
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 1381
    .line 1382
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/CoreLikers;->x5()Lcom/p1/mobile/putong/data/User;

    .line 1383
    .line 1384
    .line 1385
    move-result-object p2

    .line 1386
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1387
    .line 1388
    .line 1389
    move-result-object p3

    .line 1390
    invoke-virtual {p3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1391
    .line 1392
    .line 1393
    move-result-object p3

    .line 1394
    invoke-interface {p3, p2, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->vb(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreLikers$a;)Z

    .line 1395
    .line 1396
    .line 1397
    move-result p3

    .line 1398
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 1399
    .line 1400
    if-eqz p3, :cond_f

    .line 1401
    .line 1402
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1403
    .line 1404
    .line 1405
    move-result-object p1

    .line 1406
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 1407
    .line 1408
    .line 1409
    move-result-object p1

    .line 1410
    invoke-interface {p1, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->yl(Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;

    .line 1411
    .line 1412
    .line 1413
    move-result-object p1

    .line 1414
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1415
    .line 1416
    .line 1417
    return-void

    .line 1418
    :cond_f
    if-nez p1, :cond_10

    .line 1419
    .line 1420
    goto :goto_4

    .line 1421
    :cond_10
    iget v1, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 1422
    .line 1423
    :goto_4
    invoke-static {v1}, Ll/hge0;->e(I)Ljava/lang/String;

    .line 1424
    .line 1425
    .line 1426
    move-result-object p1

    .line 1427
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1428
    .line 1429
    .line 1430
    return-void

    .line 1431
    :pswitch_11
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 1432
    .line 1433
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 1434
    .line 1435
    .line 1436
    move-result-object v0

    .line 1437
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1438
    .line 1439
    .line 1440
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 1441
    .line 1442
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 1443
    .line 1444
    .line 1445
    move-result-object p1

    .line 1446
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1447
    .line 1448
    .line 1449
    invoke-static {p3}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 1450
    .line 1451
    .line 1452
    move-result p1

    .line 1453
    if-nez p1, :cond_12

    .line 1454
    .line 1455
    invoke-static {p3}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 1456
    .line 1457
    .line 1458
    move-result p1

    .line 1459
    if-eqz p1, :cond_11

    .line 1460
    .line 1461
    goto :goto_5

    .line 1462
    :cond_11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1463
    .line 1464
    .line 1465
    move-result-object p1

    .line 1466
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 1467
    .line 1468
    .line 1469
    move-result-object p1

    .line 1470
    sget p2, Ll/rec0;->P0:I

    .line 1471
    .line 1472
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1473
    .line 1474
    invoke-virtual {p1, p2, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 1475
    .line 1476
    .line 1477
    move-result-object p1

    .line 1478
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSuperLikeView;

    .line 1479
    .line 1480
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSuperLikeView;->b()V

    .line 1481
    .line 1482
    .line 1483
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 1484
    .line 1485
    invoke-direct {p2, v3, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1486
    .line 1487
    .line 1488
    iput v2, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1489
    .line 1490
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1491
    .line 1492
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1493
    .line 1494
    .line 1495
    return-void

    .line 1496
    :cond_12
    :goto_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 1497
    .line 1498
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->e(Lcom/p1/mobile/putong/core/data/Privilege;)Landroid/view/View;

    .line 1499
    .line 1500
    .line 1501
    move-result-object p1

    .line 1502
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 1503
    .line 1504
    invoke-direct {p2, v3, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1505
    .line 1506
    .line 1507
    iput v1, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 1508
    .line 1509
    iput v1, p2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 1510
    .line 1511
    iput v4, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1512
    .line 1513
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1514
    .line 1515
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1516
    .line 1517
    .line 1518
    return-void

    .line 1519
    :pswitch_12
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 1520
    .line 1521
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 1522
    .line 1523
    .line 1524
    move-result-object p3

    .line 1525
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1526
    .line 1527
    .line 1528
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1529
    .line 1530
    .line 1531
    move-result-object p2

    .line 1532
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 1533
    .line 1534
    .line 1535
    move-result-object p2

    .line 1536
    sget p3, Ll/rec0;->T0:I

    .line 1537
    .line 1538
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1539
    .line 1540
    invoke-virtual {p2, p3, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 1541
    .line 1542
    .line 1543
    move-result-object p2

    .line 1544
    check-cast p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUnLimitLikeView;

    .line 1545
    .line 1546
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUnLimitLikeView;->b()V

    .line 1547
    .line 1548
    .line 1549
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 1550
    .line 1551
    invoke-direct {p3, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1552
    .line 1553
    .line 1554
    iput v2, p3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1555
    .line 1556
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1557
    .line 1558
    invoke-virtual {v0, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1559
    .line 1560
    .line 1561
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 1562
    .line 1563
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 1564
    .line 1565
    .line 1566
    move-result-object p1

    .line 1567
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1568
    .line 1569
    .line 1570
    return-void

    .line 1571
    :pswitch_13
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 1572
    .line 1573
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 1574
    .line 1575
    .line 1576
    move-result-object p3

    .line 1577
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1578
    .line 1579
    .line 1580
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1581
    .line 1582
    .line 1583
    move-result-object p2

    .line 1584
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 1585
    .line 1586
    .line 1587
    move-result-object p2

    .line 1588
    sget p3, Ll/rec0;->S0:I

    .line 1589
    .line 1590
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1591
    .line 1592
    invoke-virtual {p2, p3, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 1593
    .line 1594
    .line 1595
    move-result-object p2

    .line 1596
    check-cast p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUndoView;

    .line 1597
    .line 1598
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeUndoView;->b()V

    .line 1599
    .line 1600
    .line 1601
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 1602
    .line 1603
    invoke-direct {p3, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1604
    .line 1605
    .line 1606
    iput v2, p3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1607
    .line 1608
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1609
    .line 1610
    invoke-virtual {v0, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1611
    .line 1612
    .line 1613
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 1614
    .line 1615
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 1616
    .line 1617
    .line 1618
    move-result-object p1

    .line 1619
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1620
    .line 1621
    .line 1622
    return-void

    .line 1623
    :pswitch_14
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 1624
    .line 1625
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 1626
    .line 1627
    .line 1628
    move-result-object p3

    .line 1629
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1630
    .line 1631
    .line 1632
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1633
    .line 1634
    .line 1635
    move-result-object p2

    .line 1636
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 1637
    .line 1638
    .line 1639
    move-result-object p2

    .line 1640
    sget p3, Ll/rec0;->V0:I

    .line 1641
    .line 1642
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1643
    .line 1644
    invoke-virtual {p2, p3, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 1645
    .line 1646
    .line 1647
    move-result-object p2

    .line 1648
    check-cast p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeVIPBadgeView;

    .line 1649
    .line 1650
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeVIPBadgeView;->b()V

    .line 1651
    .line 1652
    .line 1653
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 1654
    .line 1655
    invoke-direct {p3, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1656
    .line 1657
    .line 1658
    iput v2, p3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1659
    .line 1660
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 1661
    .line 1662
    invoke-virtual {v0, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1663
    .line 1664
    .line 1665
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 1666
    .line 1667
    invoke-virtual {p1}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 1668
    .line 1669
    .line 1670
    move-result-object p1

    .line 1671
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1672
    .line 1673
    .line 1674
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_b
        :pswitch_9
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
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

.method public final e(Lcom/p1/mobile/putong/core/data/Privilege;)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/rec0;->L0:I

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondMatchView;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeODiamondMatchView;->b(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 21
    .line 22
    .line 23
    return-object p0
.end method

.method public final f(Lcom/p1/mobile/putong/core/data/Privilege;)Landroid/view/View;
    .locals 3

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
    sget v1, Ll/rec0;->g1:I

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PurchaseDlgItemSVipSayHiView;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PurchaseDlgItemSVipSayHiView;->b(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 21
    .line 22
    .line 23
    return-object p0
.end method

.method public final g()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Ll/rbb0;->f()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_2

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->l7:I

    .line 18
    .line 19
    iget-object v4, v1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    const/16 v5, 0x1e

    .line 26
    .line 27
    if-le v4, v5, :cond_0

    .line 28
    .line 29
    const-string v4, "30+"

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v4, v1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 33
    .line 34
    :goto_0
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v8

    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 51
    .line 52
    iget v3, v3, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 53
    .line 54
    invoke-interface {v2, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->oi(I)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    new-instance v3, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    iget-object v4, v2, Ll/pf60;->a:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v4, Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    iget-object v4, v2, Ll/pf60;->b:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v4, Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    if-eqz v5, :cond_1

    .line 90
    .line 91
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->r7:I

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_1
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->q7:I

    .line 95
    .line 96
    :goto_1
    filled-new-array {v8, v3}, [Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v7

    .line 104
    new-instance v6, Landroid/text/SpannableString;

    .line 105
    .line 106
    invoke-direct {v6, v7}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    invoke-virtual {v4}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 114
    .line 115
    .line 116
    move-result-object v5

    .line 117
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 118
    .line 119
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 124
    .line 125
    .line 126
    move-result v9

    .line 127
    const/16 v1, 0xd

    .line 128
    .line 129
    invoke-static {v1}, Ll/qa00;->f(I)I

    .line 130
    .line 131
    .line 132
    move-result v10

    .line 133
    invoke-static {v1}, Ll/qa00;->f(I)I

    .line 134
    .line 135
    .line 136
    move-result v11

    .line 137
    const-string v4, "#ffe8aa"

    .line 138
    .line 139
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    move-result v12

    .line 143
    invoke-interface/range {v5 .. v12}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Lp(Landroid/text/SpannableString;Ljava/lang/String;Ljava/lang/String;IIII)V

    .line 144
    .line 145
    .line 146
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 147
    .line 148
    .line 149
    move-result-object v5

    .line 150
    invoke-virtual {v5}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 151
    .line 152
    .line 153
    move-result-object v9

    .line 154
    iget-object v2, v2, Ll/pf60;->a:Ljava/lang/Object;

    .line 155
    .line 156
    check-cast v2, Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 159
    .line 160
    .line 161
    move-result v13

    .line 162
    invoke-static {v1}, Ll/qa00;->f(I)I

    .line 163
    .line 164
    .line 165
    move-result v14

    .line 166
    invoke-static {v1}, Ll/qa00;->f(I)I

    .line 167
    .line 168
    .line 169
    move-result v15

    .line 170
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    move-result v16

    .line 174
    move-object v12, v3

    .line 175
    move-object v10, v6

    .line 176
    move-object v11, v7

    .line 177
    invoke-interface/range {v9 .. v16}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Lp(Landroid/text/SpannableString;Ljava/lang/String;Ljava/lang/String;IIII)V

    .line 178
    .line 179
    .line 180
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 181
    .line 182
    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 183
    .line 184
    .line 185
    return-void

    .line 186
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 187
    .line 188
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 189
    .line 190
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->t5()Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->c:Lv/VText;

    .line 195
    .line 196
    if-nez v1, :cond_3

    .line 197
    .line 198
    const/4 v1, 0x0

    .line 199
    goto :goto_2

    .line 200
    :cond_3
    iget v1, v1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 201
    .line 202
    :goto_2
    invoke-static {v1}, Ll/hge0;->e(I)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 207
    .line 208
    .line 209
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->h:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeItemIntroOutstanding;->b:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
