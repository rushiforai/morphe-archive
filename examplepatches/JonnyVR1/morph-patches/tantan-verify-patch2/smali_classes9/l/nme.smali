.class public Ll/nme;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public u:Ll/co90;

.field public v:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


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
    new-instance p1, Ll/co90;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/co90;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/nme;->u:Ll/co90;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic R(Ll/nme;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/nme;->U()V

    return-void
.end method

.method public static synthetic S(Ll/nme;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/nme;->T()V

    return-void
.end method

.method private synthetic T()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->BIRTHDAY:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 18
    .line 19
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic U()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->NICKNAME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 18
    .line 19
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final V(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nme;->u:Ll/co90;

    .line 2
    .line 3
    iget-object v0, v0, Ll/co90;->f:Lv/VText;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/nme;->u:Ll/co90;

    .line 11
    .line 12
    iget-object v0, v0, Ll/co90;->k:Lv/VText;

    .line 13
    .line 14
    iget-object v1, p0, Ll/nme;->v:Ljava/util/Map;

    .line 15
    .line 16
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 17
    .line 18
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ljava/lang/CharSequence;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/nme;->u:Ll/co90;

    .line 32
    .line 33
    iget-object v0, v0, Ll/co90;->i:Lv/VText;

    .line 34
    .line 35
    sget-object v1, Ll/pzi0;->b:Ljava/text/SimpleDateFormat;

    .line 36
    .line 37
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 38
    .line 39
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    iget-object p0, p0, Ll/nme;->u:Ll/co90;

    .line 53
    .line 54
    if-eqz p1, :cond_0

    .line 55
    .line 56
    iget-object p0, p0, Ll/co90;->l:Lv/VImage;

    .line 57
    .line 58
    sget p1, Ll/dbc0;->Ym:I

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    iget-object p0, p0, Ll/co90;->l:Lv/VImage;

    .line 65
    .line 66
    sget p1, Ll/dbc0;->Zm:I

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/nme;->u:Ll/co90;

    .line 5
    .line 6
    iget-object p1, p1, Ll/co90;->b:Lv/VText;

    .line 7
    .line 8
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/nme;->u:Ll/co90;

    .line 14
    .line 15
    iget-object p1, p1, Ll/co90;->d:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/nme;->u:Ll/co90;

    .line 21
    .line 22
    iget-object p1, p1, Ll/co90;->g:Lv/VText;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/nme;->u:Ll/co90;

    .line 28
    .line 29
    iget-object p1, p1, Ll/co90;->j:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/nme;->u:Ll/co90;

    .line 35
    .line 36
    iget-object p1, p1, Ll/co90;->i:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/nme;->u:Ll/co90;

    .line 42
    .line 43
    iget-object p1, p1, Ll/co90;->k:Lv/VText;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/nme;->u:Ll/co90;

    .line 49
    .line 50
    iget-object p1, p1, Ll/co90;->f:Lv/VText;

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/nme;->u:Ll/co90;

    .line 56
    .line 57
    iget-object p1, p1, Ll/co90;->i:Lv/VText;

    .line 58
    .line 59
    new-instance v0, Ll/lme;

    .line 60
    .line 61
    invoke-direct {v0, p0}, Ll/lme;-><init>(Ll/nme;)V

    .line 62
    .line 63
    .line 64
    const/4 v1, 0x1

    .line 65
    invoke-virtual {p0, p1, v0, v1}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/nme;->u:Ll/co90;

    .line 69
    .line 70
    iget-object p1, p1, Ll/co90;->c:Landroid/widget/RelativeLayout;

    .line 71
    .line 72
    new-instance v0, Ll/mme;

    .line 73
    .line 74
    invoke-direct {v0, p0}, Ll/mme;-><init>(Ll/nme;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, p1, v0, v1}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 78
    .line 79
    .line 80
    new-instance p1, Ll/l01;

    .line 81
    .line 82
    invoke-direct {p1}, Ll/l01;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object p1, p0, Ll/nme;->v:Ljava/util/Map;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    sget v1, Lcom/p1/mobile/putong/core/R$string;->ap:I

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const-string v1, "male"

    .line 108
    .line 109
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Ll/nme;->v:Ljava/util/Map;

    .line 113
    .line 114
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 123
    .line 124
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Zo:I

    .line 129
    .line 130
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    const-string v0, "female"

    .line 135
    .line 136
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public k()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nme;->u:Ll/co90;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0, p1}, Ll/co90;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public t()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/nme;->V(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
