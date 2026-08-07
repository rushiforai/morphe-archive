.class public Ll/qxm;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lv/AutoVDraweeView;

.field public b:Lv/VImage;

.field public c:Lv/VRelative;

.field public d:Lv/VImage;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/android/app/Act;

.field public i:Lcom/p1/mobile/putong/core/data/Privilege;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qxm;->h:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rxm;->a(Ll/qxm;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/rec0;->L:I

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
    invoke-virtual {p0, p1}, Ll/qxm;->b(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    return-object p1
.end method

.method public final d(Ljava/lang/String;)I
    .locals 2

    .line 1
    const/16 p0, 0xe

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/vnb;->o1(ILjava/lang/String;)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {}, Ll/bnl0;->y0()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/high16 v0, 0x42200000    # 40.0f

    .line 12
    .line 13
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    sub-int/2addr p1, v1

    .line 18
    int-to-float p1, p1

    .line 19
    rem-float p1, p0, p1

    .line 20
    .line 21
    invoke-static {}, Ll/bnl0;->y0()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    sub-int/2addr v1, v0

    .line 30
    int-to-float v0, v1

    .line 31
    div-float/2addr p0, v0

    .line 32
    float-to-int p0, p0

    .line 33
    const/4 v0, 0x0

    .line 34
    cmpl-float p1, p1, v0

    .line 35
    .line 36
    const/high16 v0, 0x41880000    # 17.0f

    .line 37
    .line 38
    const v1, 0x43958000    # 299.0f

    .line 39
    .line 40
    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    add-int/lit8 p0, p0, 0x1

    .line 48
    .line 49
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    :goto_0
    mul-int/2addr p0, v0

    .line 54
    add-int/2addr p1, p0

    .line 55
    return p1

    .line 56
    :cond_0
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    goto :goto_0
.end method

.method public e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qxm;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SwitchIntDef"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/qxm;->a:Lv/AutoVDraweeView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/qxm;->h:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->N5:I

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p0, v1}, Ll/qxm;->d(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/qxm;->a:Lv/AutoVDraweeView;

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/qxm;->b:Lv/VImage;

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/qxm;->a:Lv/AutoVDraweeView;

    .line 30
    .line 31
    const-string v2, "https://auto.tancdn.com/v1/raw/a541c11d-11a4-45a0-8da8-5bbe944a579614.webp"

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/qxm;->e:Lv/VImage;

    .line 37
    .line 38
    sget v2, Ll/jbc0;->Q0:I

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/qxm;->f:Lv/VText;

    .line 44
    .line 45
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->N5:I

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/qxm;->g:Lv/VText;

    .line 51
    .line 52
    iget-object v2, p0, Ll/qxm;->h:Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->K5:I

    .line 55
    .line 56
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-static {}, Ll/joa;->R3()I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Ll/qxm;->f:Lv/VText;

    .line 80
    .line 81
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public g(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qxm;->d:Lv/VImage;

    .line 2
    .line 3
    new-instance v0, Ll/pxm;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/pxm;-><init>(Ll/y20;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
