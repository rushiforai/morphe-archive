.class public Ll/k5c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/z4c;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VText;

.field public c:Lv/VFrame;

.field public d:Lv/VText;

.field public e:Lv/VFrame;

.field public f:Lv/VText;

.field public g:Lv/VFrame;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VFrame;

.field public k:[Ljava/lang/String;

.field public l:Landroid/app/Dialog;

.field public m:Lcom/p1/mobile/putong/core/ui/settings/datastorage/DataAndStorageAct;

.field public n:[Ljava/lang/String;

.field public o:Ll/z4c;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/datastorage/DataAndStorageAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/k5c;->n:[Ljava/lang/String;

    .line 6
    .line 7
    iput-object p1, p0, Ll/k5c;->m:Lcom/p1/mobile/putong/core/ui/settings/datastorage/DataAndStorageAct;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/k5c;->v()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic C(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/k5c;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget v0, Lcom/p1/mobile/putong/core/R$string;->co:I

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    sget v0, Lcom/p1/mobile/putong/core/R$string;->bo:I

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    sget v0, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget v0, Lcom/p1/mobile/putong/core/R$string;->f:I

    .line 28
    .line 29
    new-instance v1, Ll/i5c;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/i5c;-><init>(Ll/k5c;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private synthetic E(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k5c;->s()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Ll/k5c;->J(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private K()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/k5c;->m:Lcom/p1/mobile/putong/core/ui/settings/datastorage/DataAndStorageAct;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Landroid/app/Dialog;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/k5c;->l:Landroid/app/Dialog;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic a(Ll/k5c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k5c;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/k5c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k5c;->C(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/k5c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k5c;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/k5c;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/k5c;->F(Ljava/lang/String;Ll/x20;)V

    return-void
.end method

.method public static synthetic e(Ll/k5c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k5c;->B()V

    return-void
.end method

.method public static synthetic f(Ll/k5c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k5c;->E(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/k5c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k5c;->A()V

    return-void
.end method

.method public static synthetic j(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ll/k5c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k5c;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/k5c;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/k5c;->y(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method private synthetic x(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k5c;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic z(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/k5c;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget v0, Lcom/p1/mobile/putong/core/R$string;->qo:I

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Ll/k5c;->k:[Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    sget-object v0, Ll/jm5;->b:Ll/jxd0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    xor-int/lit8 v0, v0, 0x1

    .line 41
    .line 42
    new-instance v1, Ll/h5c;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/h5c;-><init>(Ll/k5c;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->h0(ILcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    sget p1, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 58
    .line 59
    .line 60
    return-void
.end method


# virtual methods
.method public final synthetic A()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/k5c;->K()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/k5c;->o:Ll/z4c;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/z4c;->o0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic B()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/k5c;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/j5c;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/j5c;-><init>(Ll/k5c;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/k5c;->m:Lcom/p1/mobile/putong/core/ui/settings/datastorage/DataAndStorageAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic F(Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/k5c;->o:Ll/z4c;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/z4c;->D0(Ljava/lang/String;Ll/x20;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->G8:I

    .line 14
    .line 15
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public G(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k5c;->d:Lv/VText;

    .line 2
    .line 3
    iget-object p0, p0, Ll/k5c;->n:[Ljava/lang/String;

    .line 4
    .line 5
    aget-object p0, p0, p1

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public H(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/k5c;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/k5c;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget v2, Lcom/p1/mobile/putong/core/R$string;->eo:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/k5c;->a:Lv/navigationbar/VNavigationBar;

    .line 17
    .line 18
    new-instance v1, Ll/a5c;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/a5c;-><init>(Ll/k5c;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/k5c;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget v1, Lcom/p1/mobile/putong/core/R$string;->ro:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0}, Ll/k5c;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    sget v2, Lcom/p1/mobile/putong/core/R$string;->so:I

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iput-object v0, p0, Ll/k5c;->k:[Ljava/lang/String;

    .line 59
    .line 60
    iget-object v0, p0, Ll/k5c;->f:Lv/VText;

    .line 61
    .line 62
    sget-object v1, Ll/jm5;->b:Ll/jxd0;

    .line 63
    .line 64
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, Ljava/lang/Boolean;

    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    iget-object v2, p0, Ll/k5c;->k:[Ljava/lang/String;

    .line 75
    .line 76
    if-eqz v1, :cond_0

    .line 77
    .line 78
    const/4 v1, 0x0

    .line 79
    aget-object v1, v2, v1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_0
    const/4 v1, 0x1

    .line 83
    aget-object v1, v2, v1

    .line 84
    .line 85
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/k5c;->e:Lv/VFrame;

    .line 89
    .line 90
    new-instance v1, Ll/b5c;

    .line 91
    .line 92
    invoke-direct {v1, p0}, Ll/b5c;-><init>(Ll/k5c;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v1}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, p1}, Ll/k5c;->I(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Ll/k5c;->j:Lv/VFrame;

    .line 102
    .line 103
    new-instance v0, Ll/c5c;

    .line 104
    .line 105
    invoke-direct {v0, p0}, Ll/c5c;-><init>(Ll/k5c;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1, v0}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Ll/k5c;->s()I

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    invoke-virtual {p0, p1}, Ll/k5c;->G(I)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Ll/k5c;->c:Lv/VFrame;

    .line 119
    .line 120
    new-instance v0, Ll/d5c;

    .line 121
    .line 122
    invoke-direct {v0, p0}, Ll/d5c;-><init>(Ll/k5c;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, v0}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public I(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k5c;->i:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final J(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/k5c;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/core/R$string;->No:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/k5c;->n:[Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object p0, p0, Ll/k5c;->o:Ll/z4c;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/z4c;->p0(I)Lcom/p1/mobile/android/app/Dialog$g;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/android/app/Dialog$e;->h0(ILcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    sget p1, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public L()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/k5c;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/k5c;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Lcom/p1/mobile/putong/core/R$string;->K5:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Ll/k5c;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    sget v3, Lcom/p1/mobile/putong/core/R$string;->H5:I

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {p0}, Ll/k5c;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    sget v4, Lcom/p1/mobile/putong/core/R$string;->G5:I

    .line 30
    .line 31
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {p0}, Ll/k5c;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    sget v5, Lcom/p1/mobile/putong/core/R$string;->ar:I

    .line 40
    .line 41
    invoke-virtual {v4, v5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    new-instance v5, Ll/e5c;

    .line 46
    .line 47
    invoke-direct {v5, p0}, Ll/e5c;-><init>(Ll/k5c;)V

    .line 48
    .line 49
    .line 50
    invoke-static/range {v0 .. v5}, Ll/ebn;->B(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;)Lcom/p1/mobile/android/app/Dialog;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k5c;->m:Lcom/p1/mobile/putong/core/ui/settings/datastorage/DataAndStorageAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/z4c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/k5c;->n(Ll/z4c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/k5c;->m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/l5c;->b(Ll/k5c;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n(Ll/z4c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k5c;->o:Ll/z4c;

    .line 2
    .line 3
    return-void
.end method

.method public p(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k5c;->g:Lv/VFrame;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    const-string p1, "e_download_data_button"

    .line 7
    .line 8
    const-string v0, "p_data_and_cache_settings_view"

    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/k5c;->g:Lv/VFrame;

    .line 14
    .line 15
    new-instance v0, Ll/f5c;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/f5c;-><init>(Ll/k5c;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public q()V
    .locals 4

    .line 1
    const-string v0, "p_download_data_requested_recently_view"

    .line 2
    .line 3
    const-string v1, "emailInvalidTipsShow"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/k5c;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0}, Ll/k5c;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    sget v3, Lcom/p1/mobile/putong/core/R$string;->J5:I

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {p0}, Ll/k5c;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Tr:I

    .line 36
    .line 37
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v1, p0}, Lcom/p1/mobile/android/app/Dialog$e;->u0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const/4 v1, 0x1

    .line 46
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    new-instance v1, Ll/g5c;

    .line 51
    .line 52
    invoke-direct {v1, v0}, Ll/g5c;-><init>(Ll/l4g0;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 64
    .line 65
    .line 66
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final s()I
    .locals 0

    .line 1
    sget-object p0, Ll/jm5;->a:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x2

    .line 16
    return p0

    .line 17
    :cond_0
    sget-object p0, Ll/jm5;->c:Ll/jxd0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_1

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_1
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public u()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k5c;->l:Landroid/app/Dialog;

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
    iget-object p0, p0, Ll/k5c;->l:Landroid/app/Dialog;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final v()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/k5c;->m:Lcom/p1/mobile/putong/core/ui/settings/datastorage/DataAndStorageAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Oo:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/k5c;->m:Lcom/p1/mobile/putong/core/ui/settings/datastorage/DataAndStorageAct;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Qo:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, p0, Ll/k5c;->m:Lcom/p1/mobile/putong/core/ui/settings/datastorage/DataAndStorageAct;

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Po:I

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Ll/k5c;->n:[Ljava/lang/String;

    .line 42
    .line 43
    return-void
.end method

.method public final synthetic w(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_download_data_button"

    .line 2
    .line 3
    const-string v0, "p_data_and_cache_settings_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/k5c;->o:Ll/z4c;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/z4c;->n0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic y(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    const/4 p2, 0x1

    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    move p3, p2

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move p3, p1

    .line 8
    :goto_0
    sget-object p4, Ll/jm5;->b:Ll/jxd0;

    .line 9
    .line 10
    invoke-virtual {p4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p4

    .line 14
    check-cast p4, Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 17
    .line 18
    .line 19
    move-result p4

    .line 20
    if-eq p3, p4, :cond_3

    .line 21
    .line 22
    if-eqz p3, :cond_1

    .line 23
    .line 24
    sget-object p2, Ll/jm5;->b:Ll/jxd0;

    .line 25
    .line 26
    sget-object p4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {p2, p4}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Ll/k5c;->o:Ll/z4c;

    .line 32
    .line 33
    invoke-virtual {p2}, Ll/z4c;->z0()V

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Ll/k5c;->f:Lv/VText;

    .line 37
    .line 38
    iget-object p0, p0, Ll/k5c;->k:[Ljava/lang/String;

    .line 39
    .line 40
    aget-object p0, p0, p1

    .line 41
    .line 42
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    sget-object p1, Ll/jm5;->b:Ll/jxd0;

    .line 47
    .line 48
    sget-object p4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 49
    .line 50
    invoke-virtual {p1, p4}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->l()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-nez p1, :cond_2

    .line 58
    .line 59
    iget-object p1, p0, Ll/k5c;->o:Ll/z4c;

    .line 60
    .line 61
    invoke-virtual {p1}, Ll/z4c;->A0()V

    .line 62
    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Ll/k5c;->f:Lv/VText;

    .line 65
    .line 66
    iget-object p0, p0, Ll/k5c;->k:[Ljava/lang/String;

    .line 67
    .line 68
    aget-object p0, p0, p2

    .line 69
    .line 70
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    :goto_1
    sget-object p0, Ll/jm5;->b:Ll/jxd0;

    .line 74
    .line 75
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    :cond_3
    return-void
.end method
