.class public Ll/pfk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/pfk$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ffk;",
        ">;",
        "Landroid/text/TextWatcher;"
    }
.end annotation


# instance fields
.field public a:Lv/VScroll;

.field public b:Lv/VText;

.field public c:Landroidx/cardview/widget/CardView;

.field public d:Lv/VImage;

.field public e:Lv/VDraweeView;

.field public f:Lv/VEditText;

.field public g:Lv/VImage;

.field public h:Lv/VButton;

.field public i:Lv/VImage;

.field public final j:Lcom/p1/mobile/putong/core/newui/group/GroupCreateNameAct;

.field public k:Ll/ffk;

.field public l:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/group/GroupCreateNameAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pfk;->j:Lcom/p1/mobile/putong/core/newui/group/GroupCreateNameAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/pfk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pfk;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/pfk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pfk;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/pfk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pfk;->z()V

    return-void
.end method

.method public static synthetic d(Ll/pfk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pfk;->y()V

    return-void
.end method

.method public static synthetic e(Ll/pfk;Lcom/p1/mobile/putong/data/Picture;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pfk;->B(Lcom/p1/mobile/putong/data/Picture;[I)V

    return-void
.end method

.method public static synthetic f(Ll/pfk;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pfk;->A()V

    return-void
.end method

.method public static bridge synthetic i(Ll/pfk;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pfk;->i:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic j(Ll/pfk;Lv/VButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pfk;->h:Lv/VButton;

    return-void
.end method

.method public static bridge synthetic k(Ll/pfk;Lv/VScroll;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pfk;->a:Lv/VScroll;

    return-void
.end method

.method public static bridge synthetic l(Ll/pfk;Landroidx/cardview/widget/CardView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pfk;->c:Landroidx/cardview/widget/CardView;

    return-void
.end method

.method public static bridge synthetic m(Ll/pfk;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pfk;->e:Lv/VDraweeView;

    return-void
.end method

.method public static bridge synthetic n(Ll/pfk;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pfk;->d:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic p(Ll/pfk;Lv/VEditText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pfk;->f:Lv/VEditText;

    return-void
.end method

.method public static bridge synthetic q(Ll/pfk;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pfk;->g:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic s(Ll/pfk;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pfk;->b:Lv/VText;

    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pfk;->j:Lcom/p1/mobile/putong/core/newui/group/GroupCreateNameAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic x(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pfk;->f:Lv/VEditText;

    .line 2
    .line 3
    const-string p1, ""

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pfk;->f:Lv/VEditText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/pfk;->f:Lv/VEditText;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/pfk;->f:Lv/VEditText;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic z()V
    .locals 2

    .line 1
    iget v0, p0, Ll/pfk;->l:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/pfk;->a:Lv/VScroll;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    if-ge v1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/pfk;->E()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iput v1, p0, Ll/pfk;->l:I

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final synthetic A()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pfk;->a:Lv/VScroll;

    .line 2
    .line 3
    const/16 v0, 0x82

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/ScrollView;->fullScroll(I)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic B(Lcom/p1/mobile/putong/data/Picture;[I)V
    .locals 1

    .line 1
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pfk;->e:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->jpgSquare640()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p2, p0, p1, v0}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final C()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pfk;->g:Lv/VImage;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pfk;->f:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/widget/TextView;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-lez v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v1, 0x4

    .line 14
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/pfk;->k:Ll/ffk;

    .line 18
    .line 19
    iget-object v1, p0, Ll/pfk;->f:Lv/VEditText;

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/ffk;->p0(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/pfk;->h:Lv/VButton;

    .line 33
    .line 34
    iget-object p0, p0, Ll/pfk;->k:Ll/ffk;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/ffk;->i0()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-virtual {v0, p0}, Landroid/view/View;->setEnabled(Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pfk;->j:Lcom/p1/mobile/putong/core/newui/group/GroupCreateNameAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public E()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pfk;->a:Lv/VScroll;

    .line 2
    .line 3
    new-instance v1, Ll/ofk;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ofk;-><init>(Ll/pfk;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/data/Picture;)V
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/data/Picture;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/pfk;->d:Lv/VImage;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/16 v3, 0x8

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/pfk;->e:Lv/VDraweeView;

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/pfk;->e:Lv/VDraweeView;

    .line 21
    .line 22
    new-instance v1, Ll/gfk;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1}, Ll/gfk;-><init>(Ll/pfk;Lcom/p1/mobile/putong/data/Picture;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/pfk;->e:Lv/VDraweeView;

    .line 35
    .line 36
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    :goto_0
    iget-object p1, p0, Ll/pfk;->h:Lv/VButton;

    .line 40
    .line 41
    iget-object p0, p0, Ll/pfk;->k:Ll/ffk;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/ffk;->i0()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    invoke-virtual {p1, p0}, Landroid/view/View;->setEnabled(Z)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pfk;->C()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ffk;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pfk;->v(Ll/ffk;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pfk;->u(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pfk;->j:Lcom/p1/mobile/putong/core/newui/group/GroupCreateNameAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/pfk;->j:Lcom/p1/mobile/putong/core/newui/group/GroupCreateNameAct;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/c30;->m()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/pfk;->i:Lv/VImage;

    .line 23
    .line 24
    new-instance v1, Ll/hfk;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/hfk;-><init>(Ll/pfk;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/pfk;->c:Landroidx/cardview/widget/CardView;

    .line 33
    .line 34
    iget-object v1, p0, Ll/pfk;->k:Ll/ffk;

    .line 35
    .line 36
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    new-instance v2, Ll/ifk;

    .line 40
    .line 41
    invoke-direct {v2, v1}, Ll/ifk;-><init>(Ll/ffk;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    invoke-virtual {p0, v0}, Ll/pfk;->F(Lcom/p1/mobile/putong/data/Picture;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/pfk;->f:Lv/VEditText;

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/pfk;->f:Lv/VEditText;

    .line 57
    .line 58
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/pfk;->C()V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/pfk;->g:Lv/VImage;

    .line 65
    .line 66
    new-instance v1, Ll/jfk;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/jfk;-><init>(Ll/pfk;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/pfk;->h:Lv/VButton;

    .line 75
    .line 76
    iget-object v1, p0, Ll/pfk;->k:Ll/ffk;

    .line 77
    .line 78
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    new-instance v2, Ll/kfk;

    .line 82
    .line 83
    invoke-direct {v2, v1}, Ll/kfk;-><init>(Ll/ffk;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/pfk;->f:Lv/VEditText;

    .line 90
    .line 91
    iget-object v1, p0, Ll/pfk;->k:Ll/ffk;

    .line 92
    .line 93
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    new-instance v2, Ll/lfk;

    .line 97
    .line 98
    invoke-direct {v2, v1}, Ll/lfk;-><init>(Ll/ffk;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/pfk;->f:Lv/VEditText;

    .line 105
    .line 106
    new-instance v1, Ll/mfk;

    .line 107
    .line 108
    invoke-direct {v1, p0}, Ll/mfk;-><init>(Ll/pfk;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/pfk;->a:Lv/VScroll;

    .line 115
    .line 116
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    new-instance v1, Ll/nfk;

    .line 121
    .line 122
    invoke-direct {v1, p0}, Ll/nfk;-><init>(Ll/pfk;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public u(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/pfk$a;->a(Ll/pfk;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public v(Ll/ffk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pfk;->k:Ll/ffk;

    .line 2
    .line 3
    return-void
.end method
