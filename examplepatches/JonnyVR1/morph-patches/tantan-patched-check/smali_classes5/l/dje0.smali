.class public Ll/dje0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/l3m;


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/VImage;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/LinearLayout;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/Space;

.field public final h:Lcom/p1/mobile/android/app/Act;

.field public i:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;


# virtual methods
.method public a(Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/dje0;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/rec0;->W2:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/dje0;->d(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    sget v1, Ll/qa00;->h:I

    .line 20
    .line 21
    if-eqz p2, :cond_0

    .line 22
    .line 23
    mul-int/lit8 v1, v1, 0x10

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-wide v3, 0x4036800000000000L    # 22.5

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    int-to-double v5, v1

    .line 32
    mul-double/2addr v5, v3

    .line 33
    double-to-int v1, v5

    .line 34
    :goto_0
    iget-object v3, p0, Ll/dje0;->h:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    sget v4, Ll/rec0;->L2:I

    .line 41
    .line 42
    invoke-virtual {v3, v4, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 47
    .line 48
    iput-object p1, p0, Ll/dje0;->i:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 49
    .line 50
    const/4 p1, -0x1

    .line 51
    if-eqz p2, :cond_1

    .line 52
    .line 53
    iget-object p2, p0, Ll/dje0;->b:Lv/VImage;

    .line 54
    .line 55
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    check-cast p2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 60
    .line 61
    const/high16 v2, 0x43340000    # 180.0f

    .line 62
    .line 63
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    iput v2, p2, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 68
    .line 69
    iget-object v2, p0, Ll/dje0;->b:Lv/VImage;

    .line 70
    .line 71
    invoke-virtual {v2, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_1
    new-instance p2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 76
    .line 77
    const/4 v2, -0x2

    .line 78
    invoke-direct {p2, p1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 79
    .line 80
    .line 81
    iget-object v2, p0, Ll/dje0;->b:Lv/VImage;

    .line 82
    .line 83
    invoke-virtual {v2, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 84
    .line 85
    .line 86
    :goto_1
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 87
    .line 88
    invoke-direct {p2, p1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Ll/dje0;->d:Landroid/widget/LinearLayout;

    .line 92
    .line 93
    iget-object p0, p0, Ll/dje0;->i:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 94
    .line 95
    invoke-virtual {p1, p0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 96
    .line 97
    .line 98
    return-object v0
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ll/a690;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p1, p0, Ll/dje0;->h:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->t7:I

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    :goto_0
    iget-object v0, p0, Ll/dje0;->c:Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Ll/dje0;->c:Landroid/widget/TextView;

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    iget-object v0, p0, Ll/dje0;->e:Landroid/widget/TextView;

    .line 44
    .line 45
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-object v0, p0, Ll/dje0;->e:Landroid/widget/TextView;

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    :goto_1
    invoke-virtual {p0}, Ll/dje0;->g()V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/dje0;->i:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->k()V

    .line 62
    .line 63
    .line 64
    :cond_3
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 65
    .line 66
    iget-object p0, p0, Ll/dje0;->b:Lv/VImage;

    .line 67
    .line 68
    const-string v0, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IktTUUJGWTRDTUZGUUNZRkNaUDZRQllTV1lLT05XUjE0IiwidyI6OTMwLCJoIjo3MDIsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMDM4NDQ2MTg0NTgyMTkwNjYxfQ.webp"

    .line 69
    .line 70
    invoke-virtual {p1, p0, v0}, Ll/fsb0;->D(Landroid/view/View;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/eje0;->a(Ll/dje0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dje0;->g:Landroid/widget/Space;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget p1, Ll/qa00;->h:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget p1, Ll/qa00;->o:I

    .line 13
    .line 14
    :goto_0
    iput p1, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 15
    .line 16
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dje0;->i:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->l(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final g()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->t5()Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->x5()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v2, v1, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->vb(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreLikers$a;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    iget-object v3, p0, Ll/dje0;->f:Landroid/widget/TextView;

    .line 30
    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v2, p0, Ll/dje0;->a:Landroid/widget/RelativeLayout;

    .line 42
    .line 43
    iget-object v4, p0, Ll/dje0;->f:Landroid/widget/TextView;

    .line 44
    .line 45
    invoke-interface {v0, v1, v2, v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->L9(Lcom/p1/mobile/putong/data/User;Landroid/view/View;Landroid/widget/TextView;)Ljava/lang/CharSequence;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    const/4 v0, 0x1

    .line 53
    invoke-virtual {p0, v0}, Ll/dje0;->e(Z)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    const/4 v1, 0x0

    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    move v0, v1

    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iget v0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 63
    .line 64
    :goto_0
    invoke-static {v0}, Ll/hge0;->e(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v1}, Ll/dje0;->e(Z)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    return-void
.end method
