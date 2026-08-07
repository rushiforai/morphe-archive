.class public Ll/gxb;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/android/ui/cropiwa/c;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Z

.field public c:Z

.field public d:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/gxb;->c:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/gxb;->d:Z

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic e0(Ll/gxb;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gxb;->n0(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public static synthetic f0(Ll/gxb;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gxb;->m0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic m0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gxb;->g0()Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/gxb;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    new-instance p1, Ljava/lang/NullPointerException;

    .line 18
    .line 19
    const-string v0, "imageUri is null"

    .line 20
    .line 21
    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p1, Lcom/p1/mobile/android/ui/cropiwa/c;

    .line 30
    .line 31
    iget-object p0, p0, Ll/gxb;->a:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/ui/cropiwa/c;->k(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/rwb;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rwb;-><init>(Ll/gxb;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public g0()Lcom/p1/mobile/android/ui/cropiwa/CropperAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public h0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/android/ui/cropiwa/c;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gxb;->i0()Ll/ewb;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/ui/cropiwa/c;->j(Ll/ewb;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final i0()Ll/ewb;
    .locals 2

    .line 1
    new-instance v0, Ll/ewb$a;

    .line 2
    .line 3
    invoke-static {}, Ll/sim;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-string v1, "webp"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v1, "jpg"

    .line 13
    .line 14
    :goto_0
    invoke-static {v1}, Ll/ecj;->O(Ljava/lang/String;)Ljava/io/File;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {v0, v1}, Ll/ewb$a;-><init>(Landroid/net/Uri;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/sim;->c()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->WEBP:Landroid/graphics/Bitmap$CompressFormat;

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 35
    .line 36
    :goto_1
    invoke-virtual {v0, v1}, Ll/ewb$a;->b(Landroid/graphics/Bitmap$CompressFormat;)Ll/ewb$a;

    .line 37
    .line 38
    .line 39
    invoke-static {}, Ll/sim;->c()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    new-instance v1, Ll/gxb$a;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/gxb$a;-><init>(Ll/gxb;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ll/ewb$a;->e(Ll/qcj;)Ll/ewb$a;

    .line 51
    .line 52
    .line 53
    :cond_2
    const/16 p0, 0x438

    .line 54
    .line 55
    invoke-virtual {v0, p0, p0}, Ll/ewb$a;->d(II)Ll/ewb$a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const/16 v0, 0x64

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ll/ewb$a;->c(I)Ll/ewb$a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Ll/ewb$a;->a()Ll/ewb;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0
.end method

.method public j0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/gxb;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public k0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/gxb;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public l0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/gxb;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic n0(Landroid/view/MenuItem;)Z
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/android/ui/cropiwa/c;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/cropiwa/c;->l()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/gxb;->g0()Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    sget v0, Lcom/p1/mobile/android/R$string;->k7:I

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/gxb;->h0()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/gxb;->g0()Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->E1()V

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-virtual {p0}, Ll/gxb;->l0()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    const-string p0, "confirm_cancel_picture"

    .line 37
    .line 38
    const-string p1, "confirm"

    .line 39
    .line 40
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    filled-new-array {p0}, [Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string p1, "e_picture_editing_page_operation_button"

    .line 49
    .line 50
    const-string v0, "p_picture_editing_page"

    .line 51
    .line 52
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    const/4 p0, 0x1

    .line 56
    return p0
.end method

.method public o0(Landroid/view/Menu;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/gxb;->g0()Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/gxb;->g0()Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Lcom/p1/mobile/android/R$string;->b:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->actionItemPadding(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {p1, v0}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance v0, Ll/wwb;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/wwb;-><init>(Ll/gxb;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const/4 v0, 0x2

    .line 33
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/gxb;->g0()Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pendChangeActionButtonTypeface()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public p0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/gxb;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public q0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gxb;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public r0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/gxb;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public s0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/gxb;->c:Z

    .line 2
    .line 3
    return-void
.end method
