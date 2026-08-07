.class public Ll/be2;
.super Ll/gf2;
.source "SourceFile"


# instance fields
.field public l:Lv/VDraweeView;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public final q:Ljava/lang/String;

.field public final r:Lcom/p1/mobile/putong/core/data/BarLoverplaces;

.field public final s:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/BarLoverplaces;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/gf2;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "p_near_bar_location_popup"

    .line 5
    .line 6
    iput-object v0, p0, Ll/be2;->q:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, p0, Ll/be2;->r:Lcom/p1/mobile/putong/core/data/BarLoverplaces;

    .line 9
    .line 10
    iput-object p1, p0, Ll/be2;->s:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic F(Ll/be2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/be2;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H(Ll/be2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/be2;->J(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public I(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ce2;->b(Ll/be2;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic J(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p1, p1, Ll/dkb;->X4:Ll/vxd0;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p1, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/gf2;->dismiss()V

    .line 16
    .line 17
    .line 18
    const-string p1, "e_bar_location_popup_enter"

    .line 19
    .line 20
    const-string v0, "p_near_bar_location_popup"

    .line 21
    .line 22
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/be2;->s:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    invoke-static {p1}, Ll/xd2;->b(Lcom/p1/mobile/android/app/Act;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/be2;->s:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    iget-object p0, p0, Ll/be2;->r:Lcom/p1/mobile/putong/core/data/BarLoverplaces;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/BarLoverplaces;->id:Ljava/lang/String;

    .line 35
    .line 36
    const-string v0, "homepage_popup"

    .line 37
    .line 38
    invoke-static {p1, p0, v0}, Ll/xd2;->a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gf2;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Dialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, p1, v0}, Ll/be2;->I(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 18
    .line 19
    .line 20
    const-class p1, Ll/be2;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v0, "p_near_bar_location_popup"

    .line 27
    .line 28
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    sget v1, Ll/dbc0;->Id:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 56
    .line 57
    sget v3, Ll/qa00;->F:I

    .line 58
    .line 59
    sub-int/2addr v2, v3

    .line 60
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    iget-object v0, p0, Ll/be2;->m:Lv/VText;

    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const/4 v1, 0x1

    .line 72
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/be2;->o:Lv/VText;

    .line 76
    .line 77
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/be2;->p:Lv/VText;

    .line 85
    .line 86
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/be2;->o:Lv/VText;

    .line 94
    .line 95
    new-instance v1, Ll/yd2;

    .line 96
    .line 97
    invoke-direct {v1, p0}, Ll/yd2;-><init>(Ll/be2;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Ll/be2;->p:Lv/VText;

    .line 104
    .line 105
    new-instance v1, Ll/zd2;

    .line 106
    .line 107
    invoke-direct {v1, p0}, Ll/zd2;-><init>(Ll/be2;)V

    .line 108
    .line 109
    .line 110
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 111
    .line 112
    .line 113
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 114
    .line 115
    .line 116
    new-instance v0, Ll/ae2;

    .line 117
    .line 118
    invoke-direct {v0, p1}, Ll/ae2;-><init>(Ll/l4g0;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, v0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method
