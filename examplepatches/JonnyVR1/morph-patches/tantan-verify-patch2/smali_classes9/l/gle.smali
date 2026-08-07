.class public Ll/gle;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public u:Lv/VLinear_Dividers;

.field public v:Lv/VText;

.field public w:Landroid/widget/ImageView;

.field public x:Landroid/widget/LinearLayout;

.field public y:Lv/VText;

.field public z:Lv/VText;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ep90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R(Ll/gle;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gle;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S(Ll/gle;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gle;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T(Ll/gle;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gle;->Y(Landroid/view/View;)V

    return-void
.end method

.method private synthetic W(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gle;->V()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic X(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gle;->V()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic Y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gle;->V()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public U(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/hle;->b(Ll/gle;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final V()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_dislike_type_entrance"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->DO_NOT_WISH:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 28
    .line 29
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public d()I
    .locals 0

    .line 1
    sget p0, Ll/qa00;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p1}, Ll/gle;->U(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public t()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/gle;->z:Lv/VText;

    .line 2
    .line 3
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/gle;->v:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/gle;->y:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    new-array v1, v0, [Ll/sfj0$a;

    .line 20
    .line 21
    const-string v2, "e_dislike_type_entrance"

    .line 22
    .line 23
    const-string v3, "p_edit_profile_view"

    .line 24
    .line 25
    invoke-static {v2, v3, v1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v1}, Ll/tr90;->r(Lcom/p1/mobile/putong/data/User;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iget-object v2, p0, Ll/gle;->x:Landroid/widget/LinearLayout;

    .line 41
    .line 42
    const/4 v3, 0x1

    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/gle;->z:Lv/VText;

    .line 49
    .line 50
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Ll/gle;->w:Landroid/widget/ImageView;

    .line 54
    .line 55
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Ll/gle;->z:Lv/VText;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-interface {v2}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 69
    .line 70
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 71
    .line 72
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 73
    .line 74
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->unideal:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Ljava/lang/CharSequence;

    .line 81
    .line 82
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    iget-object v1, p0, Ll/gle;->z:Lv/VText;

    .line 90
    .line 91
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 92
    .line 93
    .line 94
    iget-object v1, p0, Ll/gle;->w:Landroid/widget/ImageView;

    .line 95
    .line 96
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    :goto_0
    iget-object v0, p0, Ll/gle;->z:Lv/VText;

    .line 100
    .line 101
    new-instance v1, Ll/dle;

    .line 102
    .line 103
    invoke-direct {v1, p0}, Ll/dle;-><init>(Ll/gle;)V

    .line 104
    .line 105
    .line 106
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Ll/gle;->x:Landroid/widget/LinearLayout;

    .line 110
    .line 111
    new-instance v1, Ll/ele;

    .line 112
    .line 113
    invoke-direct {v1, p0}, Ll/ele;-><init>(Ll/gle;)V

    .line 114
    .line 115
    .line 116
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/gle;->w:Landroid/widget/ImageView;

    .line 120
    .line 121
    new-instance v1, Ll/fle;

    .line 122
    .line 123
    invoke-direct {v1, p0}, Ll/fle;-><init>(Ll/gle;)V

    .line 124
    .line 125
    .line 126
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 127
    .line 128
    .line 129
    return-void
.end method
