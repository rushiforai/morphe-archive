.class public Ll/y1b0;
.super Ll/g2b0;
.source "SourceFile"


# instance fields
.field public A:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

.field public y:Lv/VText;

.field public z:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/g2b0;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 12
    .line 13
    const-string p1, "personality"

    .line 14
    .line 15
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method


# virtual methods
.method public j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/g2b0;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/y1b0;->y:Lv/VText;

    .line 5
    .line 6
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/g2b0;->O()Ll/t3m;

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
    sget v1, Ll/kec0;->Ka:I

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
    sget v0, Ll/adc0;->w9:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lv/VLinear_Dividers;

    .line 23
    .line 24
    iput-object v0, p0, Ll/g2b0;->u:Lv/VLinear_Dividers;

    .line 25
    .line 26
    sget v0, Ll/adc0;->v9:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lv/VText_Tags;

    .line 33
    .line 34
    iput-object v0, p0, Ll/g2b0;->w:Lv/VText_Tags;

    .line 35
    .line 36
    sget v0, Ll/adc0;->J8:I

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lv/VText;

    .line 43
    .line 44
    iput-object v0, p0, Ll/g2b0;->v:Lv/VText;

    .line 45
    .line 46
    iput-object v0, p0, Ll/y1b0;->y:Lv/VText;

    .line 47
    .line 48
    sget v0, Ll/adc0;->x9:I

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Landroid/widget/ImageView;

    .line 55
    .line 56
    iput-object v0, p0, Ll/y1b0;->z:Landroid/widget/ImageView;

    .line 57
    .line 58
    sget v0, Ll/adc0;->Hd:I

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 65
    .line 66
    iput-object v0, p0, Ll/y1b0;->A:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 67
    .line 68
    return-object p1
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/g2b0;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/g2b0;->O()Ll/t3m;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ll/g2b0;->O()Ll/t3m;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v1}, Ll/t3m;->me()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eqz v0, :cond_3

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/g2b0;->O()Ll/t3m;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-interface {v2}, Ll/t3m;->P1()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_2

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 38
    .line 39
    new-instance v2, Ll/x1b0;

    .line 40
    .line 41
    invoke-direct {v2, v1}, Ll/x1b0;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iget-object p0, p0, Ll/y1b0;->z:Landroid/widget/ImageView;

    .line 53
    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    sget v0, Ll/dbc0;->Tn:I

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    sget v0, Ll/dbc0;->Sn:I

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    iget-object p0, p0, Ll/y1b0;->z:Landroid/widget/ImageView;

    .line 69
    .line 70
    sget v0, Ll/dbc0;->Tn:I

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 73
    .line 74
    .line 75
    :cond_3
    :goto_0
    return-void
.end method
