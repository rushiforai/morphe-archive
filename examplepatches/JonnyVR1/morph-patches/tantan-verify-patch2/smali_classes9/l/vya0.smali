.class public Ll/vya0;
.super Ll/tya0;
.source "SourceFile"


# instance fields
.field public y:Lv/VText;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/tya0;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public j(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/tya0;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/vya0;->y:Lv/VText;

    .line 5
    .line 6
    sget-object v0, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {p1, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/tya0;->O()Ll/t3m;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object v0, p0, Ll/vya0;->y:Lv/VText;

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    const/high16 p1, 0x41000000    # 8.0f

    .line 25
    .line 26
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-static {v0, p1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/vya0;->y:Lv/VText;

    .line 34
    .line 35
    const/high16 p1, 0x41e00000    # 28.0f

    .line 36
    .line 37
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-static {p0, p1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    const/high16 p1, 0x40800000    # 4.0f

    .line 46
    .line 47
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-static {v0, p1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/vya0;->y:Lv/VText;

    .line 55
    .line 56
    const/high16 p1, 0x41a00000    # 20.0f

    .line 57
    .line 58
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    invoke-static {p0, p1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/tya0;->O()Ll/t3m;

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
    sget v1, Ll/kec0;->s9:I

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
    sget v0, Ll/adc0;->cb:I

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
    iput-object v0, p0, Ll/tya0;->u:Lv/VLinear_Dividers;

    .line 25
    .line 26
    sget v0, Ll/adc0;->Nd:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lv/VText;

    .line 33
    .line 34
    iput-object v0, p0, Ll/vya0;->y:Lv/VText;

    .line 35
    .line 36
    iput-object v0, p0, Ll/tya0;->v:Lv/VText;

    .line 37
    .line 38
    sget v0, Ll/adc0;->Md:I

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lv/VText;

    .line 45
    .line 46
    iput-object v0, p0, Ll/tya0;->w:Lv/VText;

    .line 47
    .line 48
    sget v0, Ll/adc0;->Ld:I

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lv/VText;

    .line 55
    .line 56
    iput-object v0, p0, Ll/tya0;->x:Lv/VText;

    .line 57
    .line 58
    return-object p1
.end method
