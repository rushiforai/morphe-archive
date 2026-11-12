.class public Lga6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lywh;
.implements Luif;
.implements Lrk8;
.implements Lph;
.implements Lrr9;
.implements Lwga;
.implements Lez4;
.implements Ll0p;
.implements Lg1i;
.implements Ly7;
.implements Lhsd;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lga6;->a:B

    packed-switch p1, :pswitch_data_2e

    new-instance p1, Lhu3;

    invoke-direct {p1}, Lhu3;-><init>()V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lga6;->b:Ljava/lang/Object;

    iget-boolean p0, p1, Lhu3;->b:Z

    if-nez p0, :cond_22

    iget-boolean p0, p1, Lhu3;->c:Z

    if-eqz p0, :cond_1c

    const-string p0, "ManagedValuesStore tried to enter composition twice. Did you attempt to install the same store multiple times or into two compositions?"

    invoke-static {p0}, Lcpg;->a(Ljava/lang/String;)V

    :cond_1c
    invoke-virtual {p1}, Lhu3;->a()V

    const/4 p0, 0x1

    iput-boolean p0, p1, Lhu3;->c:Z

    :cond_22
    return-void

    :pswitch_23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lga6;->b:Ljava/lang/Object;

    return-void

    :pswitch_data_2e
    .packed-switch 0x1b
        :pswitch_23
    .end packed-switch
.end method

.method public synthetic constructor <init>(BZ)V
    .registers 3

    .line 53
    iput-byte p1, p0, Lga6;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/View;)V
    .registers 4

    const/4 v0, 0x6

    iput-byte v0, p0, Lga6;->a:B

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Lu85;

    invoke-direct {v0, p1, p2}, Lu85;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object v0, p0, Lga6;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lddc;Lpad;Lwx6;Lole;Lxm5;)V
    .registers 6

    const/4 p1, 0x4

    iput-byte p1, p0, Lga6;->a:B

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p3, p0, Lga6;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 46
    iput-byte p2, p0, Lga6;->a:B

    iput-object p1, p0, Lga6;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lygh;)V
    .registers 3

    const/16 v0, 0x16

    iput-byte v0, p0, Lga6;->a:B

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const-class v0, Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;

    invoke-virtual {p1, v0}, Lygh;->b(Ljava/lang/Class;)Ltgh;

    move-result-object p1

    check-cast p1, Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;

    iput-object p1, p0, Lga6;->b:Ljava/lang/Object;

    return-void
.end method

.method public static j(Landroid/view/View;Landroid/view/View;Z)Lga6;
    .registers 5

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    iget v0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget p0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-gez v0, :cond_14

    if-gez p0, :cond_14

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    iget v0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget p0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    :cond_14
    if-eqz p2, :cond_24

    if-gtz v0, :cond_1e

    if-lez p0, :cond_24

    shl-int/lit8 p1, p0, 0x4

    div-int/lit8 v0, p1, 0x9

    :cond_1e
    if-gtz p0, :cond_24

    mul-int/lit8 p0, v0, 0x9

    div-int/lit8 p0, p0, 0x10

    :cond_24
    const/16 p1, 0xb

    if-lez v0, :cond_35

    if-lez p0, :cond_35

    new-instance p2, Lga6;

    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1, v0, p0}, Landroid/graphics/Point;-><init>(II)V

    invoke-direct {p2, v1, p1}, Lga6;-><init>(Ljava/lang/Object;B)V

    return-object p2

    :cond_35
    new-instance p2, Lga6;

    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1, v0, p0}, Landroid/graphics/Point;-><init>(II)V

    invoke-direct {p2, v1, p1}, Lga6;-><init>(Ljava/lang/Object;B)V

    return-object p2
.end method

.method public static m(Landroid/widget/ImageView;Landroid/view/View;)Lga6;
    .registers 4

    invoke-virtual {p0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v0

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    invoke-static {p0, p1, v0}, Lga6;->j(Landroid/view/View;Landroid/view/View;Z)Lga6;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final a(Lz7;Lz4o;)V
    .registers 4

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lg77;

    new-instance v0, Llra;

    invoke-direct {v0, p2}, Llra;-><init>(Lz4o;)V

    invoke-virtual {p0, p1, v0}, Lg77;->B(Lz7;Lqff;)Lsff;

    move-result-object p0

    new-instance p1, Landroid/os/CancellationSignal;

    invoke-direct {p1}, Landroid/os/CancellationSignal;-><init>()V

    new-instance p2, Lmg5;

    const/4 v0, 0x2

    invoke-direct {p2, p0, v0}, Lmg5;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/os/CancellationSignal;->setOnCancelListener(Landroid/os/CancellationSignal$OnCancelListener;)V

    return-void
.end method

.method public final b(Z)V
    .registers 2

    if-eqz p1, :cond_9

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_9
    return-void
.end method

.method public final c(Ljava/util/ArrayList;)V
    .registers 4

    new-instance v0, Lbm8;

    const/16 v1, 0x1b

    invoke-direct {v0, p0, v1}, Lbm8;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, v0}, Lm5h;->c(Ljava/util/Collection;Lv2p;)V

    return-void
.end method

.method public final close()V
    .registers 1

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Ll2b;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final d()V
    .registers 1

    return-void
.end method

.method public final e(Lcie;)V
    .registers 5

    new-instance v0, Lz5p;

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Ljsd;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Laoo;-><init>(Landroid/content/Context;Landroid/view/View;)V

    invoke-virtual {p0, v0}, Ljsd;->a(Laoo;)V

    iget-object p0, p0, Ljsd;->a:Ljava/util/HashMap;

    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-object v0, p1, Lcie;->w0:Laoo;

    invoke-static {v0, p1}, Ljsd;->c(Laoo;Lcie;)V

    return-void
.end method

.method public final f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lw98;)V
    .registers 5

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Ld06;

    if-eqz p0, :cond_9

    invoke-virtual {p0, p1, p2, p3, p4}, Ld06;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lw98;)V

    :cond_9
    return-void
.end method

.method public final g(Lvho;)Z
    .registers 3

    invoke-virtual {p1}, Lvho;->a()Llho;

    move-result-object p0

    iget-object p0, p0, Llho;->j:Ldro;

    sget-object v0, Ldro;->b:Ldro;

    if-ne p0, v0, :cond_16

    iget-object p1, p1, Lvho;->a:Lw06;

    iget-object p0, p0, Ldro;->a:Ljava/util/EnumSet;

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method

.method public final getHeight()I
    .registers 1

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->P()I

    move-result p0

    return p0
.end method

.method public final getPaddingEnd()I
    .registers 2

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->P()I

    move-result v0

    iget p0, p0, Lcom/google/android/material/button/MaterialButton;->p:I

    sub-int/2addr v0, p0

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public final getPaddingStart()I
    .registers 2

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->P()I

    move-result v0

    iget p0, p0, Lcom/google/android/material/button/MaterialButton;->p:I

    sub-int/2addr v0, p0

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public final getWidth()I
    .registers 1

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->P()I

    move-result p0

    return p0
.end method

.method public final h(Lz7;Ly7;)V
    .registers 4

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lg77;

    new-instance v0, Lkra;

    invoke-direct {v0, p2}, Lkra;-><init>(Ly7;)V

    invoke-virtual {p0, p1, v0}, Lg77;->B(Lz7;Lqff;)Lsff;

    move-result-object p0

    new-instance p1, Landroid/os/CancellationSignal;

    invoke-direct {p1}, Landroid/os/CancellationSignal;-><init>()V

    new-instance p2, Lmg5;

    const/4 v0, 0x2

    invoke-direct {p2, p0, v0}, Lmg5;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/os/CancellationSignal;->setOnCancelListener(Landroid/os/CancellationSignal$OnCancelListener;)V

    return-void
.end method

.method public final i(Lzhj;)V
    .registers 2

    invoke-static {p1}, Lac8;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final k(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Loh;

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/fragment/app/w;

    iget-object v0, p0, Landroidx/fragment/app/w;->H:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pollFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lyl9;

    if-eqz v0, :cond_1c

    iget-object v1, v0, Lyl9;->a:Ljava/lang/String;

    iget v0, v0, Lyl9;->b:I

    iget-object p0, p0, Landroidx/fragment/app/w;->c:Landroidx/fragment/app/a0;

    invoke-virtual {p0, v1}, Landroidx/fragment/app/a0;->c(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p0

    if-nez p0, :cond_1d

    :cond_1c
    return-void

    :cond_1d
    iget v1, p1, Loh;->a:I

    iget-object p1, p1, Loh;->b:Landroid/content/Intent;

    invoke-virtual {p0, v0, v1, p1}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public final l()V
    .registers 3

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lazc;

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Lazc;->h(ZZ)V

    return-void
.end method

.method public final n()Landroid/view/ViewGroup$LayoutParams;
    .registers 3

    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->P()I

    move-result v1

    invoke-virtual {p0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->P()I

    move-result p0

    invoke-direct {v0, v1, p0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public final o(ILvjk;)V
    .registers 7

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content/browser/input/ImeAdapterImpl;

    iget-wide v0, p0, Lorg/chromium/content/browser/input/ImeAdapterImpl;->a:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_d

    return-void

    :cond_d
    iget-object p0, p0, Lorg/chromium/content/browser/input/ImeAdapterImpl;->f:Lorg/chromium/content/browser/webcontents/WebContentsImpl;

    iget-object p0, p0, Lorg/chromium/content/browser/webcontents/WebContentsImpl;->g:Lhuh;

    iget p0, p0, Lhuh;->k:F

    float-to-int p0, p0

    iget-object v2, p2, Lvjk;->d:Lorg/chromium/gfx/mojom/Rect;

    iget v3, v2, Lorg/chromium/gfx/mojom/Rect;->c:I

    sub-int/2addr v3, p0

    iput v3, v2, Lorg/chromium/gfx/mojom/Rect;->c:I

    iget-object v2, p2, Lvjk;->e:Lorg/chromium/gfx/mojom/Rect;

    if-eqz v2, :cond_24

    iget v3, v2, Lorg/chromium/gfx/mojom/Rect;->c:I

    sub-int/2addr v3, p0

    iput v3, v2, Lorg/chromium/gfx/mojom/Rect;->c:I

    :cond_24
    new-instance p0, Lbp;

    iget-short v2, p2, Luik;->a:S

    const/4 v3, 0x0

    invoke-direct {p0, v3, v2}, Lbp;-><init>(Lorg/chromium/mojo/system/impl/CoreImpl;I)V

    invoke-virtual {p2, p0}, Lvjk;->a(Lbp;)V

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Lzg;

    iget-object p2, p0, Lzg;->c:Ljava/lang/Object;

    check-cast p2, Ljava/nio/ByteBuffer;

    const/4 v2, 0x0

    invoke-virtual {p2, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/ByteBuffer;

    iget-object p2, p0, Lzg;->c:Ljava/lang/Object;

    check-cast p2, Ljava/nio/ByteBuffer;

    iget v2, p0, Lzg;->a:I

    invoke-virtual {p2, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/ByteBuffer;

    iget-object p2, p0, Lzg;->c:Ljava/lang/Object;

    check-cast p2, Ljava/nio/ByteBuffer;

    iget-object p0, p0, Lzg;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_56

    invoke-static {v0, v1, p1, p2}, LJ/N;->M3wL9MnJ(JILjava/lang/Object;)V

    return-void

    :cond_56
    const-string p0, "Handles are discarded."

    invoke-static {p0}, Lyt7;->k(Ljava/lang/String;)V

    return-void
.end method

.method public final onFailure(Ljava/lang/Throwable;)V
    .registers 3

    iget-byte v0, p0, Lga6;->a:B

    packed-switch v0, :pswitch_data_16

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lqya;

    invoke-interface {p0}, Ljava/lang/AutoCloseable;->close()V

    return-void

    :pswitch_d
    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Ll94;

    invoke-virtual {p0, p1}, Ll94;->d(Ljava/lang/Throwable;)Z

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0xe
        :pswitch_d
    .end packed-switch
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lga6;->a:B

    packed-switch v0, :pswitch_data_16

    check-cast p1, Ljava/lang/Void;

    return-void

    :pswitch_8
    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Ll94;

    :try_start_c
    invoke-virtual {p0, p1}, Ll94;->b(Ljava/lang/Object;)Z
    :try_end_f
    .catchall {:try_start_c .. :try_end_f} :catchall_10

    goto :goto_14

    :catchall_10
    move-exception p1

    invoke-virtual {p0, p1}, Ll94;->d(Ljava/lang/Throwable;)Z

    :goto_14
    return-void

    nop

    :pswitch_data_16
    .packed-switch 0xe
        :pswitch_8
    .end packed-switch
.end method

.method public final p()Z
    .registers 7

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    iget-object v0, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    const-string v1, "wallpaper_current"

    invoke-interface {v0, v1}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_38

    iget-object v0, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    const-string v2, "manual_wallpaper_first_occurrence"

    invoke-interface {v0, v2}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_38

    invoke-virtual {p0, v2}, Lcom/opera/android/settings/SettingsManager;->q(Ljava/lang/String;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    const/4 v2, 0x0

    if-nez v0, :cond_37

    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "NETWORK_"

    invoke-static {p0, v0, v2}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_38

    const-string v0, "THEME_WALLPAPER"

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_38

    :cond_37
    return v2

    :cond_38
    const/4 p0, 0x1

    return p0
.end method

.method public final q(D)V
    .registers 7

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content/browser/input/DateTimeChooserAndroid;

    iget-wide v0, p0, Lorg/chromium/content/browser/input/DateTimeChooserAndroid;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_d

    return-void

    :cond_d
    invoke-static {v0, v1, p1, p2}, LJ/N;->MgUhdCLo(JD)V

    return-void
.end method

.method public final z(Ljava/lang/String;Z)V
    .registers 3

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lazc;

    const/4 p1, 0x0

    invoke-interface {p0, p1, p2}, Lazc;->h(ZZ)V

    return-void
.end method
