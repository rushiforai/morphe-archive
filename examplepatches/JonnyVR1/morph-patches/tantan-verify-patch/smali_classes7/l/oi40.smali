.class public Ll/oi40;
.super Ll/g1e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/oi40$a;
    }
.end annotation


# instance fields
.field public j:Ll/oi40$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sget v1, Ll/agc0;->p:I

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic E(Ll/oi40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/oi40;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/oi40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/oi40;->G(Landroid/view/View;)V

    return-void
.end method

.method private synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/oi40;->j:Ll/oi40$a;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/oi40;->j:Ll/oi40$a;

    .line 13
    .line 14
    const-string p1, "action_add"

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ll/oi40$a;->onClick(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/oi40;->j:Ll/oi40$a;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/oi40;->j:Ll/oi40$a;

    .line 13
    .line 14
    const-string p1, "action_notadd"

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ll/oi40$a;->onClick(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method


# virtual methods
.method public I(Ll/oi40$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/oi40;->j:Ll/oi40$a;

    .line 2
    .line 3
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget v0, Ll/kec0;->m8:I

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    sget v0, Ll/adc0;->w:I

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/mi40;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/mi40;-><init>(Ll/oi40;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    sget v0, Ll/adc0;->T8:I

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance v0, Ll/ni40;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/ni40;-><init>(Ll/oi40;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
