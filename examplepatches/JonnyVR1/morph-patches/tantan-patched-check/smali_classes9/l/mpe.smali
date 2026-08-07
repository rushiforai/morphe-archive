.class public Ll/mpe;
.super Ll/kpe;
.source "SourceFile"


# instance fields
.field public A:Lv/VText_Tags;

.field public B:Landroid/widget/LinearLayout;

.field public C:Lv/VText;

.field public D:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/kpe;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b0(Ll/mpe;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/text/SpannableStringBuilder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/mpe;->c0(Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/text/SpannableStringBuilder;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public Z()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic c0(Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/text/SpannableStringBuilder;
    .locals 15

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "1"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 9
    .line 10
    .line 11
    new-instance v2, Ll/df00;

    .line 12
    .line 13
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 14
    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v4, "+ "

    .line 18
    .line 19
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 23
    .line 24
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Tk:I

    .line 25
    .line 26
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {p0}, Ll/aza0;->O()Ll/t3m;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    sget v1, Ll/c9c0;->p:I

    .line 52
    .line 53
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result v7

    .line 61
    sget v9, Ll/qa00;->i:I

    .line 62
    .line 63
    const/high16 p0, 0x40400000    # 3.0f

    .line 64
    .line 65
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    int-to-float v12, p0

    .line 70
    const/high16 p0, 0x42300000    # 44.0f

    .line 71
    .line 72
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result v14

    .line 76
    const/4 v6, -0x1

    .line 77
    const/4 v8, 0x6

    .line 78
    const/high16 v10, 0x41500000    # 13.0f

    .line 79
    .line 80
    const v11, -0x60708

    .line 81
    .line 82
    .line 83
    const/4 v13, 0x1

    .line 84
    invoke-direct/range {v2 .. v14}, Ll/df00;-><init>(Landroid/content/Context;Ljava/lang/String;IIIIIFIFZI)V

    .line 85
    .line 86
    .line 87
    const/4 p0, 0x1

    .line 88
    const/16 v1, 0x21

    .line 89
    .line 90
    const/4 v3, 0x0

    .line 91
    invoke-virtual {v0, v2, v3, p0, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 92
    .line 93
    .line 94
    return-object v0
.end method

.method public j(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/kpe;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/mpe;->A:Lv/VText_Tags;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-static {v0}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/aza0;->v:Lv/VText;

    .line 15
    .line 16
    invoke-static {v0}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/mpe;->A:Lv/VText_Tags;

    .line 24
    .line 25
    new-instance v0, Ll/lpe;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/lpe;-><init>(Ll/mpe;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v0}, Lv/VText_Tags;->setTags(Ll/rcj;)V

    .line 31
    .line 32
    .line 33
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
    invoke-virtual {p0}, Ll/aza0;->O()Ll/t3m;

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
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x1

    .line 14
    return p0
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/aza0;->O()Ll/t3m;

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
    sget v1, Ll/kec0;->Va:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    sget v0, Ll/adc0;->ib:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lv/VText;

    .line 23
    .line 24
    iput-object v0, p0, Ll/mpe;->C:Lv/VText;

    .line 25
    .line 26
    sget v0, Ll/adc0;->jb:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lv/VLinear_Dividers;

    .line 33
    .line 34
    iput-object v0, p0, Ll/aza0;->u:Lv/VLinear_Dividers;

    .line 35
    .line 36
    sget v0, Ll/adc0;->t6:I

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 43
    .line 44
    iput-object v0, p0, Ll/mpe;->D:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 45
    .line 46
    sget v0, Ll/adc0;->ib:I

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Lv/VText;

    .line 53
    .line 54
    iput-object v0, p0, Ll/aza0;->v:Lv/VText;

    .line 55
    .line 56
    sget v0, Ll/adc0;->q:I

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Lv/VText_Tags;

    .line 63
    .line 64
    iput-object v0, p0, Ll/mpe;->A:Lv/VText_Tags;

    .line 65
    .line 66
    iput-object v0, p0, Ll/aza0;->w:Lv/VText;

    .line 67
    .line 68
    sget v0, Ll/adc0;->x2:I

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Landroid/widget/LinearLayout;

    .line 75
    .line 76
    iput-object v0, p0, Ll/mpe;->B:Landroid/widget/LinearLayout;

    .line 77
    .line 78
    return-object p1
.end method

.method public t()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/kpe;->t()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/gra;->L3()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-static {}, Ll/xra;->s()Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 16
    .line 17
    iget v0, v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->question:I

    .line 18
    .line 19
    if-lez v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/aza0;->O()Ll/t3m;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v2}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 32
    .line 33
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    move v1, v0

    .line 41
    :goto_0
    iget-object v2, p0, Ll/mpe;->D:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 42
    .line 43
    const-string v3, "\u6dfb\u52a0\u95ee\u7b54"

    .line 44
    .line 45
    invoke-virtual {v2, v1, v0, v3}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;->P(IILjava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/mpe;->D:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 49
    .line 50
    const/4 v1, 0x1

    .line 51
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    iget-object v0, p0, Ll/mpe;->D:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 56
    .line 57
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    iget-object v0, p0, Ll/mpe;->D:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 62
    .line 63
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    :goto_1
    invoke-virtual {p0}, Ll/aza0;->O()Ll/t3m;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-interface {p0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    .line 73
    return-void
.end method
