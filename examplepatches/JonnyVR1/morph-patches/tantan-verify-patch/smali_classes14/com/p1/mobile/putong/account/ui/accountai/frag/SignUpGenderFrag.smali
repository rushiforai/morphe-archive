.class public Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;
.super Lcom/p1/mobile/android/app/Frag;
.source "SourceFile"


# instance fields
.field public A:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Gender;",
            ">;"
        }
    .end annotation
.end field

.field public B:Landroid/view/View;

.field public C:Landroid/view/View;

.field public D:Landroid/view/View;

.field public E:Landroid/view/View;

.field public F:Lv/VImage;

.field public G:Lv/VImage;

.field public z:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Frag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A4(Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->E4(Landroid/view/View;)V

    return-void
.end method

.method private synthetic D4(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "male"

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->C4(Lcom/p1/mobile/putong/data/Gender;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->A:Ll/y20;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->A:Ll/y20;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {v0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->C:Landroid/view/View;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->B:Landroid/view/View;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private synthetic E4(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "female"

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->C4(Lcom/p1/mobile/putong/data/Gender;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->A:Ll/y20;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->A:Ll/y20;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {v0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->C:Landroid/view/View;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->B:Landroid/view/View;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static F4()Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->z:Landroid/view/View;

    .line 2
    .line 3
    sget v1, Ll/wcc0;->s:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->B:Landroid/view/View;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->z:Landroid/view/View;

    .line 12
    .line 13
    sget v1, Ll/wcc0;->r:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->C:Landroid/view/View;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->z:Landroid/view/View;

    .line 22
    .line 23
    sget v1, Ll/wcc0;->U:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->D:Landroid/view/View;

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->z:Landroid/view/View;

    .line 32
    .line 33
    sget v1, Ll/wcc0;->S:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->E:Landroid/view/View;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->z:Landroid/view/View;

    .line 42
    .line 43
    sget v1, Ll/wcc0;->T:I

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lv/VImage;

    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->F:Lv/VImage;

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->z:Landroid/view/View;

    .line 54
    .line 55
    sget v1, Ll/wcc0;->R:I

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Lv/VImage;

    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->G:Lv/VImage;

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->B:Landroid/view/View;

    .line 66
    .line 67
    new-instance v1, Ll/tkf0;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/tkf0;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->C:Landroid/view/View;

    .line 76
    .line 77
    new-instance v1, Ll/ukf0;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/ukf0;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    const/4 v0, 0x0

    .line 86
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->C4(Lcom/p1/mobile/putong/data/Gender;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public static synthetic z4(Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->D4(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public B4()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->C:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->C:Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->B:Landroid/view/View;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->B:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public final C4(Lcom/p1/mobile/putong/data/Gender;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->B:Landroid/view/View;

    .line 5
    .line 6
    sget v2, Ll/bbc0;->s1:I

    .line 7
    .line 8
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->C:Landroid/view/View;

    .line 12
    .line 13
    sget v2, Ll/bbc0;->s1:I

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->F:Lv/VImage;

    .line 19
    .line 20
    sget v2, Ll/bbc0;->p1:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->G:Lv/VImage;

    .line 26
    .line 27
    sget v2, Ll/bbc0;->n1:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->D:Landroid/view/View;

    .line 33
    .line 34
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->E:Landroid/view/View;

    .line 38
    .line 39
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    :cond_0
    const-string v1, "female"

    .line 43
    .line 44
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    const/4 v2, 0x1

    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->B:Landroid/view/View;

    .line 52
    .line 53
    sget v3, Ll/bbc0;->s1:I

    .line 54
    .line 55
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->C:Landroid/view/View;

    .line 59
    .line 60
    sget v3, Ll/bbc0;->r1:I

    .line 61
    .line 62
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->F:Lv/VImage;

    .line 66
    .line 67
    sget v3, Ll/bbc0;->p1:I

    .line 68
    .line 69
    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->G:Lv/VImage;

    .line 73
    .line 74
    sget v3, Ll/bbc0;->m1:I

    .line 75
    .line 76
    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->D:Landroid/view/View;

    .line 80
    .line 81
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->E:Landroid/view/View;

    .line 85
    .line 86
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    :cond_1
    const-string v1, "male"

    .line 90
    .line 91
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_2

    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->B:Landroid/view/View;

    .line 98
    .line 99
    sget v1, Ll/bbc0;->q1:I

    .line 100
    .line 101
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->C:Landroid/view/View;

    .line 105
    .line 106
    sget v1, Ll/bbc0;->s1:I

    .line 107
    .line 108
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->F:Lv/VImage;

    .line 112
    .line 113
    sget v1, Ll/bbc0;->o1:I

    .line 114
    .line 115
    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->G:Lv/VImage;

    .line 119
    .line 120
    sget v1, Ll/bbc0;->n1:I

    .line 121
    .line 122
    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->D:Landroid/view/View;

    .line 126
    .line 127
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->E:Landroid/view/View;

    .line 131
    .line 132
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 133
    .line 134
    .line 135
    :cond_2
    return-void
.end method

.method public G4(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Gender;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->A:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->z:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Ll/hec0;->W:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->z:Landroid/view/View;

    .line 13
    .line 14
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->r()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpGenderFrag;->z:Landroid/view/View;

    .line 18
    .line 19
    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
