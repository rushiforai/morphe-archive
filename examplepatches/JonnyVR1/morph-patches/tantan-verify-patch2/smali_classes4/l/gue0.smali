.class public Ll/gue0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/cue0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Lv/VMaterialEdit;

.field public c:Landroid/widget/ImageView;

.field public d:Lv/VButton_FakeShadow;

.field public e:Ll/cue0;

.field public f:Lcom/p1/mobile/putong/app/PutongAct;

.field public g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gue0;->f:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/gue0;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gue0;->k(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic b(Ll/gue0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/gue0;->j()V

    return-void
.end method

.method public static synthetic c(Ll/gue0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gue0;->l(Landroid/view/View;)V

    return-void
.end method

.method private synthetic j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gue0;->b:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic k(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/gue0;->g:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, p0, Ll/gue0;->b:Lv/VMaterialEdit;

    .line 8
    .line 9
    iget-object v1, p0, Ll/gue0;->e:Ll/cue0;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v1, p1}, Ll/cue0;->s0(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v0, p1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setError(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/gue0;->e:Ll/cue0;

    .line 23
    .line 24
    iget-object p0, p0, Ll/gue0;->g:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Ll/cue0;->r0(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gue0;->e:Ll/cue0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cue0;->q0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gue0;->f:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gue0;->f:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/hue0;->b(Ll/gue0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/cue0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gue0;->e:Ll/cue0;

    .line 2
    .line 3
    return-void
.end method

.method public f()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gue0;->b:Lv/VMaterialEdit;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gue0;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/cue0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gue0;->e(Ll/cue0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gue0;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/gue0;->d:Lv/VButton_FakeShadow;

    .line 2
    .line 3
    iget-object v1, p0, Ll/gue0;->b:Lv/VMaterialEdit;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getError()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    move v1, v3

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v1, v2

    .line 16
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/gue0;->d:Lv/VButton_FakeShadow;

    .line 20
    .line 21
    iget-object p0, p0, Ll/gue0;->b:Lv/VMaterialEdit;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getError()Ljava/lang/CharSequence;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    move v2, v3

    .line 30
    :cond_1
    invoke-virtual {v0, v2}, Landroid/view/View;->setClickable(Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    new-instance v0, Ll/due0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/due0;-><init>(Ll/gue0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/gue0;->b:Lv/VMaterialEdit;

    .line 10
    .line 11
    iget-object v1, p0, Ll/gue0;->g:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/gue0;->b:Lv/VMaterialEdit;

    .line 17
    .line 18
    iget-object v1, p0, Ll/gue0;->g:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/gue0;->b:Lv/VMaterialEdit;

    .line 28
    .line 29
    invoke-virtual {v0}, Lv/VMaterialEdit;->H()Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/eue0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/eue0;-><init>(Ll/gue0;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/gue0;->d:Lv/VButton_FakeShadow;

    .line 46
    .line 47
    new-instance v1, Ll/fue0;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/fue0;-><init>(Ll/gue0;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
