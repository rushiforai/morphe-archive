.class public Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Ll/cj0;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;

.field public b:Lv/VDraweeView;

.field public c:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lcom/p1/mobile/putong/core/data/Conversation;

.field public m:Lcom/p1/mobile/putong/data/User;

.field public n:I

.field public o:Z

.field public p:Landroid/view/View$OnClickListener;

.field public q:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->o:Z

    .line 6
    .line 7
    new-instance p1, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView$a;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->q:Ll/x20;

    .line 13
    .line 14
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

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->o:Z

    .line 17
    new-instance p1, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->q:Ll/x20;

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

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->o:Z

    .line 20
    new-instance p1, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->q:Ll/x20;

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->h(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;)Landroid/view/View$OnClickListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->p:Landroid/view/View$OnClickListener;

    return-object p0
.end method


# virtual methods
.method public a(Ll/jic0;Lcom/p1/mobile/putong/core/data/Conversation;IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jic0<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "IZ)V"
        }
    .end annotation

    .line 1
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->n:I

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->l:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iput-boolean p4, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->o:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p4, p2}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p1, p3, p2}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance p2, Ll/fj0;

    .line 26
    .line 27
    invoke-direct {p2, p0}, Ll/fj0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    sget-object p2, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 46
    .line 47
    if-eq p1, p2, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->j()V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->q:Ll/x20;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->q:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gj0;->a(Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final g(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ina;->w3(Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideActiveFromSVip()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->m:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->b:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-static {p1}, Ll/vx6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {v0, v1, v2, v3}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->j:Lv/VText;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->l:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/4 v2, 0x1

    .line 34
    xor-int/2addr v1, v2

    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;->f:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;->g:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_0

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->j:Lv/VText;

    .line 61
    .line 62
    const-string v1, ""

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    sget v0, Ll/qa00;->j:I

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->j:Lv/VText;

    .line 70
    .line 71
    new-array v4, v2, [Landroid/view/View;

    .line 72
    .line 73
    aput-object v1, v4, v3

    .line 74
    .line 75
    invoke-static {v0, v4}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->j:Lv/VText;

    .line 79
    .line 80
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->j:Lv/VText;

    .line 84
    .line 85
    sget v1, Ll/dbc0;->Wd:I

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 88
    .line 89
    .line 90
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 91
    .line 92
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 96
    .line 97
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    sget v4, Ll/dbc0;->Bd:I

    .line 102
    .line 103
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->d:Lv/VText;

    .line 111
    .line 112
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 113
    .line 114
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 115
    .line 116
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/api/f;->j3(Lcom/p1/mobile/putong/data/User;)Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-eqz v1, :cond_1

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->g(Lcom/p1/mobile/putong/data/User;)Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-eqz v1, :cond_1

    .line 127
    .line 128
    move v1, v2

    .line 129
    goto :goto_0

    .line 130
    :cond_1
    move v1, v3

    .line 131
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    invoke-static {p1}, Ll/dj0;->a(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->f:Landroid/widget/LinearLayout;

    .line 143
    .line 144
    if-eqz v0, :cond_2

    .line 145
    .line 146
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->e:Lv/VText;

    .line 150
    .line 151
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 152
    .line 153
    .line 154
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->d:Lv/VText;

    .line 155
    .line 156
    const/high16 p1, 0x41600000    # 14.0f

    .line 157
    .line 158
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :cond_2
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->e:Lv/VText;

    .line 170
    .line 171
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->d:Lv/VText;

    .line 175
    .line 176
    const/high16 v1, 0x41e00000    # 28.0f

    .line 177
    .line 178
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 183
    .line 184
    .line 185
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->e:Lv/VText;

    .line 186
    .line 187
    invoke-static {p1}, Ll/dj0;->a(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 192
    .line 193
    .line 194
    return-void
.end method

.method public final i()Ljava/lang/String;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->o:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string p0, "p_contacts_matches"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final j()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;->f:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->l:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->m:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->n:I

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->i()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object v4, Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;->g:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-static {v1, v2, v3, p0, v0}, Ll/dj0;->e(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;ILjava/lang/String;Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->l:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->m:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->l:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 24
    .line 25
    const/16 v1, 0x1c

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-static {p1, v0, v2, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l2(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {}, Ll/gra;->C1()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    invoke-static {}, Ll/k05;->h()Ll/k05;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->l:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 43
    .line 44
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/k05;->d(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const-string v0, "all_match_new_match"

    .line 50
    .line 51
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->u2(Landroid/content/Intent;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;->f:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->l:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->m:Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->n:I

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->i()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    sget-object v3, Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;->g:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    invoke-static {v0, v1, v2, p0, p1}, Ll/dj0;->c(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;ILjava/lang/String;Z)V

    .line 92
    .line 93
    .line 94
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-double v0, v0

    .line 6
    const-wide v2, 0x3ff553f7ced91687L    # 1.333

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    mul-double/2addr v0, v2

    .line 12
    double-to-int v0, v0

    .line 13
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-static {v0, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1
    .param p1    # Landroid/view/View$OnClickListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/zg6;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/AllPairsItemView;->p:Landroid/view/View$OnClickListener;

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
