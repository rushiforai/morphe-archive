.class public Landroidx/biometric/FingerprintDialogFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "SyntheticAccessor"
    }
.end annotation

.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/biometric/FingerprintDialogFragment$d;
    }
.end annotation


# instance fields
.field public A:Landroid/os/Bundle;

.field public B:I

.field public C:I

.field public D:I

.field public E:Landroid/widget/ImageView;

.field public F:Landroid/widget/TextView;

.field public G:Landroid/content/Context;

.field public H:Z

.field public I:Landroid/content/DialogInterface$OnClickListener;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final J:Landroid/content/DialogInterface$OnClickListener;

.field public z:Landroidx/biometric/FingerprintDialogFragment$d;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroidx/biometric/FingerprintDialogFragment$d;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Landroidx/biometric/FingerprintDialogFragment$d;-><init>(Landroidx/biometric/FingerprintDialogFragment;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroidx/biometric/FingerprintDialogFragment;->z:Landroidx/biometric/FingerprintDialogFragment$d;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Landroidx/biometric/FingerprintDialogFragment;->H:Z

    .line 13
    .line 14
    new-instance v0, Landroidx/biometric/FingerprintDialogFragment$a;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Landroidx/biometric/FingerprintDialogFragment$a;-><init>(Landroidx/biometric/FingerprintDialogFragment;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Landroidx/biometric/FingerprintDialogFragment;->J:Landroid/content/DialogInterface$OnClickListener;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic V3(Landroidx/biometric/FingerprintDialogFragment;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/biometric/FingerprintDialogFragment;->n4(Ljava/lang/CharSequence;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W3(Landroidx/biometric/FingerprintDialogFragment;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/biometric/FingerprintDialogFragment;->m4(Ljava/lang/CharSequence;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X3(Landroidx/biometric/FingerprintDialogFragment;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/biometric/FingerprintDialogFragment;->k4(Ljava/lang/CharSequence;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y3(Landroidx/biometric/FingerprintDialogFragment;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/biometric/FingerprintDialogFragment;->l4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z3(Landroidx/biometric/FingerprintDialogFragment;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/biometric/FingerprintDialogFragment;->H:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic a4(Landroidx/biometric/FingerprintDialogFragment;)Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment;->A:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b4(Landroidx/biometric/FingerprintDialogFragment;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/biometric/FingerprintDialogFragment;->o4()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic c4(Landroidx/biometric/FingerprintDialogFragment;)Landroid/content/DialogInterface$OnClickListener;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment;->J:Landroid/content/DialogInterface$OnClickListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static h4(Landroid/content/Context;)I
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/aok0;->g(Landroid/content/Context;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    const/16 p0, 0x7d0

    .line 14
    .line 15
    return p0
.end method

.method private o4()Z
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment;->A:Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v0, "allow_device_credential"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static p4()Landroidx/biometric/FingerprintDialogFragment;
    .locals 1

    .line 1
    new-instance v0, Landroidx/biometric/FingerprintDialogFragment;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/biometric/FingerprintDialogFragment;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public final d4(Ljava/lang/CharSequence;)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/biometric/FingerprintDialogFragment;->F:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget v1, p0, Landroidx/biometric/FingerprintDialogFragment;->B:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Landroidx/biometric/FingerprintDialogFragment;->F:Landroid/widget/TextView;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget p1, Landroidx/biometric/R$string;->f:I

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    iget-object p1, p0, Landroidx/biometric/FingerprintDialogFragment;->z:Landroidx/biometric/FingerprintDialogFragment$d;

    .line 24
    .line 25
    new-instance v0, Landroidx/biometric/FingerprintDialogFragment$c;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Landroidx/biometric/FingerprintDialogFragment$c;-><init>(Landroidx/biometric/FingerprintDialogFragment;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment;->G:Landroid/content/Context;

    .line 31
    .line 32
    invoke-static {p0}, Landroidx/biometric/FingerprintDialogFragment;->h4(Landroid/content/Context;)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    int-to-long v1, p0

    .line 37
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public e4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "FingerprintDialogFrag"

    .line 8
    .line 9
    const-string v0, "Failed to dismiss fingerprint dialog fragment. Fragment manager was null."

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->dismissAllowingStateLoss()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final f4(II)Landroid/graphics/drawable/Drawable;
    .locals 2
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x15
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    if-ne p2, v0, :cond_0

    .line 5
    .line 6
    sget p1, Ll/sbc0;->b:I

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v1, 0x2

    .line 10
    if-ne p1, v0, :cond_1

    .line 11
    .line 12
    if-ne p2, v1, :cond_1

    .line 13
    .line 14
    sget p1, Ll/sbc0;->b:I

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    if-ne p1, v1, :cond_2

    .line 18
    .line 19
    if-ne p2, v0, :cond_2

    .line 20
    .line 21
    sget p1, Ll/sbc0;->a:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_2
    if-ne p1, v0, :cond_3

    .line 25
    .line 26
    const/4 p1, 0x3

    .line 27
    if-ne p2, p1, :cond_3

    .line 28
    .line 29
    sget p1, Ll/sbc0;->a:I

    .line 30
    .line 31
    :goto_0
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment;->G:Landroid/content/Context;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_3
    const/4 p0, 0x0

    .line 39
    return-object p0
.end method

.method public g4()Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment;->z:Landroidx/biometric/FingerprintDialogFragment$d;

    .line 2
    .line 3
    return-object p0
.end method

.method public i4()Ljava/lang/CharSequence;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment;->A:Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v0, "negative_text"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final j4(I)I
    .locals 3

    .line 1
    new-instance v0, Landroid/util/TypedValue;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Landroidx/biometric/FingerprintDialogFragment;->G:Landroid/content/Context;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iget v0, v0, Landroid/util/TypedValue;->data:I

    .line 21
    .line 22
    filled-new-array {p1}, [I

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-virtual {p0, p1, p1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 36
    .line 37
    .line 38
    return p1
.end method

.method public final k4(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Landroidx/biometric/FingerprintDialogFragment;->H:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/biometric/FingerprintDialogFragment;->e4()V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/biometric/FingerprintDialogFragment;->d4(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    :goto_0
    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Landroidx/biometric/FingerprintDialogFragment;->H:Z

    .line 14
    .line 15
    return-void
.end method

.method public final l4()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroidx/biometric/FingerprintDialogFragment;->t4(I)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Landroidx/biometric/FingerprintDialogFragment;->F:Landroid/widget/TextView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget v1, p0, Landroidx/biometric/FingerprintDialogFragment;->C:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Landroidx/biometric/FingerprintDialogFragment;->F:Landroid/widget/TextView;

    .line 15
    .line 16
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment;->G:Landroid/content/Context;

    .line 17
    .line 18
    sget v1, Landroidx/biometric/R$string;->c:I

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final m4(Ljava/lang/CharSequence;)V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Landroidx/biometric/FingerprintDialogFragment;->t4(I)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Landroidx/biometric/FingerprintDialogFragment;->z:Landroidx/biometric/FingerprintDialogFragment$d;

    .line 6
    .line 7
    const/4 v1, 0x4

    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Landroidx/biometric/FingerprintDialogFragment;->F:Landroid/widget/TextView;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget v1, p0, Landroidx/biometric/FingerprintDialogFragment;->B:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Landroidx/biometric/FingerprintDialogFragment;->F:Landroid/widget/TextView;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p1, p0, Landroidx/biometric/FingerprintDialogFragment;->z:Landroidx/biometric/FingerprintDialogFragment$d;

    .line 26
    .line 27
    const/4 v0, 0x3

    .line 28
    invoke-virtual {p1, v0}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment;->G:Landroid/content/Context;

    .line 33
    .line 34
    invoke-static {p0}, Landroidx/biometric/FingerprintDialogFragment;->h4(Landroid/content/Context;)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    int-to-long v1, p0

    .line 39
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final n4(Ljava/lang/CharSequence;)V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Landroidx/biometric/FingerprintDialogFragment;->t4(I)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Landroidx/biometric/FingerprintDialogFragment;->z:Landroidx/biometric/FingerprintDialogFragment$d;

    .line 6
    .line 7
    const/4 v1, 0x4

    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Landroidx/biometric/FingerprintDialogFragment;->F:Landroid/widget/TextView;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget v2, p0, Landroidx/biometric/FingerprintDialogFragment;->B:I

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Landroidx/biometric/FingerprintDialogFragment;->F:Landroid/widget/TextView;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment;->z:Landroidx/biometric/FingerprintDialogFragment$d;

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-wide/16 v0, 0x7d0

    .line 32
    .line 33
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1    # Landroid/content/DialogInterface;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-string p1, "FingerprintHelperFragment"

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Landroidx/biometric/FingerprintHelperFragment;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, p1}, Landroidx/biometric/FingerprintHelperFragment;->b4(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Landroidx/biometric/FingerprintDialogFragment;->G:Landroid/content/Context;

    .line 9
    .line 10
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 11
    .line 12
    const/16 v1, 0x1a

    .line 13
    .line 14
    if-lt v0, v1, :cond_0

    .line 15
    .line 16
    const p1, 0x1010543

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroidx/biometric/FingerprintDialogFragment;->j4(I)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iput p1, p0, Landroidx/biometric/FingerprintDialogFragment;->B:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget v0, Ll/i9c0;->a:I

    .line 27
    .line 28
    invoke-static {p1, v0}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput p1, p0, Landroidx/biometric/FingerprintDialogFragment;->B:I

    .line 33
    .line 34
    :goto_0
    const p1, 0x1010038

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroidx/biometric/FingerprintDialogFragment;->j4(I)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iput p1, p0, Landroidx/biometric/FingerprintDialogFragment;->C:I

    .line 42
    .line 43
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 7
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Landroidx/biometric/FingerprintDialogFragment;->A:Landroid/os/Bundle;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "SavedBundle"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Landroidx/biometric/FingerprintDialogFragment;->A:Landroid/os/Bundle;

    .line 14
    .line 15
    :cond_0
    new-instance p1, Landroidx/appcompat/app/a$a;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-direct {p1, v0}, Landroidx/appcompat/app/a$a;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Landroidx/biometric/FingerprintDialogFragment;->A:Landroid/os/Bundle;

    .line 25
    .line 26
    const-string v1, "title"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1, v0}, Landroidx/appcompat/app/a$a;->setTitle(Ljava/lang/CharSequence;)Landroidx/appcompat/app/a$a;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Landroidx/appcompat/app/a$a;->getContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget v1, Ll/lec0;->b:I

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sget v1, Ll/occ0;->d:I

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Landroid/widget/TextView;

    .line 57
    .line 58
    sget v2, Ll/occ0;->a:I

    .line 59
    .line 60
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, Landroid/widget/TextView;

    .line 65
    .line 66
    iget-object v3, p0, Landroidx/biometric/FingerprintDialogFragment;->A:Landroid/os/Bundle;

    .line 67
    .line 68
    const-string v4, "subtitle"

    .line 69
    .line 70
    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    const/16 v5, 0x8

    .line 79
    .line 80
    const/4 v6, 0x0

    .line 81
    if-eqz v4, :cond_1

    .line 82
    .line 83
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    :goto_0
    iget-object v1, p0, Landroidx/biometric/FingerprintDialogFragment;->A:Landroid/os/Bundle;

    .line 94
    .line 95
    const-string v3, "description"

    .line 96
    .line 97
    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    if-eqz v3, :cond_2

    .line 106
    .line 107
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 108
    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_2
    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    :goto_1
    sget v1, Ll/occ0;->c:I

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    check-cast v1, Landroid/widget/ImageView;

    .line 124
    .line 125
    iput-object v1, p0, Landroidx/biometric/FingerprintDialogFragment;->E:Landroid/widget/ImageView;

    .line 126
    .line 127
    sget v1, Ll/occ0;->b:I

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    check-cast v1, Landroid/widget/TextView;

    .line 134
    .line 135
    iput-object v1, p0, Landroidx/biometric/FingerprintDialogFragment;->F:Landroid/widget/TextView;

    .line 136
    .line 137
    invoke-direct {p0}, Landroidx/biometric/FingerprintDialogFragment;->o4()Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_3

    .line 142
    .line 143
    sget v1, Landroidx/biometric/R$string;->a:I

    .line 144
    .line 145
    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    goto :goto_2

    .line 150
    :cond_3
    iget-object v1, p0, Landroidx/biometric/FingerprintDialogFragment;->A:Landroid/os/Bundle;

    .line 151
    .line 152
    const-string v2, "negative_text"

    .line 153
    .line 154
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    :goto_2
    new-instance v2, Landroidx/biometric/FingerprintDialogFragment$b;

    .line 159
    .line 160
    invoke-direct {v2, p0}, Landroidx/biometric/FingerprintDialogFragment$b;-><init>(Landroidx/biometric/FingerprintDialogFragment;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p1, v1, v2}, Landroidx/appcompat/app/a$a;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/a$a;

    .line 164
    .line 165
    .line 166
    invoke-virtual {p1, v0}, Landroidx/appcompat/app/a$a;->setView(Landroid/view/View;)Landroidx/appcompat/app/a$a;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p1}, Landroidx/appcompat/app/a$a;->create()Landroidx/appcompat/app/a;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    invoke-virtual {p0, v6}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 174
    .line 175
    .line 176
    return-object p0
.end method

.method public onPause()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment;->z:Landroidx/biometric/FingerprintDialogFragment$d;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Landroidx/biometric/FingerprintDialogFragment;->D:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0}, Landroidx/biometric/FingerprintDialogFragment;->t4(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "SavedBundle"

    .line 5
    .line 6
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment;->A:Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public q4(Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Landroidx/biometric/FingerprintDialogFragment;->A:Landroid/os/Bundle;

    .line 2
    .line 3
    return-void
.end method

.method public r4(Landroid/content/DialogInterface$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/FingerprintDialogFragment;->I:Landroid/content/DialogInterface$OnClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public final s4(II)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    const/4 v0, 0x1

    if-nez p1, :cond_0

    if-ne p2, v0, :cond_0

    return p0

    :cond_0
    const/4 v1, 0x2

    if-ne p1, v0, :cond_1

    if-ne p2, v1, :cond_1

    return v0

    :cond_1
    if-ne p1, v1, :cond_2

    if-ne p2, v0, :cond_2

    return v0

    :cond_2
    return p0
.end method

.method public final t4(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/biometric/FingerprintDialogFragment;->E:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget v0, p0, Landroidx/biometric/FingerprintDialogFragment;->D:I

    .line 7
    .line 8
    invoke-virtual {p0, v0, p1}, Landroidx/biometric/FingerprintDialogFragment;->f4(II)Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    instance-of v1, v0, Landroid/graphics/drawable/AnimatedVectorDrawable;

    .line 16
    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    move-object v1, v0

    .line 20
    check-cast v1, Landroid/graphics/drawable/AnimatedVectorDrawable;

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_2
    const/4 v1, 0x0

    .line 24
    :goto_1
    iget-object v2, p0, Landroidx/biometric/FingerprintDialogFragment;->E:Landroid/widget/ImageView;

    .line 25
    .line 26
    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 27
    .line 28
    .line 29
    if-eqz v1, :cond_3

    .line 30
    .line 31
    iget v0, p0, Landroidx/biometric/FingerprintDialogFragment;->D:I

    .line 32
    .line 33
    invoke-virtual {p0, v0, p1}, Landroidx/biometric/FingerprintDialogFragment;->s4(II)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    invoke-virtual {v1}, Landroid/graphics/drawable/AnimatedVectorDrawable;->start()V

    .line 40
    .line 41
    .line 42
    :cond_3
    iput p1, p0, Landroidx/biometric/FingerprintDialogFragment;->D:I

    .line 43
    .line 44
    return-void
.end method
