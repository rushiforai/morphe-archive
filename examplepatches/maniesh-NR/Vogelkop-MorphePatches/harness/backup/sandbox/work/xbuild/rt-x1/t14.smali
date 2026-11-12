.class public final synthetic Lt14;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lg94;
.implements Ljr9;
.implements Lrwg;
.implements Lph4;
.implements Lktn;
.implements Ljtl;
.implements Lxjj;
.implements Lgjc;
.implements Lxo4;
.implements Lfjc;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 8
    iput-byte p1, p0, Lt14;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lzo4;)V
    .registers 2

    const/16 p1, 0x14

    iput-byte p1, p0, Lt14;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bridge synthetic b()Ljava/lang/String;
    .registers 1

    sget-object v0, Landroid/os/Build;->SOC_MODEL:Ljava/lang/String;

    return-object v0
.end method

.method public static synthetic c(Ljava/lang/Object;)V
    .registers 2

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic d(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/AssertionError;

    invoke-direct {p1, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1
.end method

.method public static synthetic f(Ljava/lang/String;IILjava/lang/Object;)V
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic g(Ljava/lang/StringBuilder;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic h(Ljava/lang/StringBuilder;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public final a(Lbuk;)V
    .registers 6

    new-instance p0, Landroid/graphics/SurfaceTexture;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    iget-object v1, p1, Lbuk;->b:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    iget-object v2, p1, Lbuk;->b:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v2

    invoke-virtual {p0, v1, v2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    invoke-virtual {p0}, Landroid/graphics/SurfaceTexture;->detachFromGLContext()V

    new-instance v1, Landroid/view/Surface;

    invoke-direct {v1, p0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    invoke-static {}, Ln97;->a()Ln97;

    move-result-object v2

    new-instance v3, Ljg4;

    invoke-direct {v3, v1, p0, v0}, Ljg4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v1, v2, v3}, Lbuk;->a(Landroid/view/Surface;Ljava/util/concurrent/Executor;Lqp5;)V

    return-void
.end method

.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    iget-byte p0, p0, Lt14;->a:B

    packed-switch p0, :pswitch_data_16

    check-cast p1, Lybl;

    iget-byte p0, p1, Lybl;->a:B

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_e
    new-instance p0, Lg1h;

    check-cast p1, Lf1h;

    invoke-direct {p0, p1}, Lg1h;-><init>(Lf1h;)V

    return-object p0

    :pswitch_data_16
    .packed-switch 0x8
        :pswitch_e
    .end packed-switch
.end method

.method public final cancel()V
    .registers 1

    return-void
.end method

.method public final e(Lorg/chromium/content/browser/webcontents/WebContentsImpl;)Ljava/lang/Object;
    .registers 2

    new-instance p0, Lorg/chromium/content/browser/accessibility/captioning/CaptioningController;

    invoke-direct {p0, p1}, Lorg/chromium/content/browser/accessibility/captioning/CaptioningController;-><init>(Lorg/chromium/content/browser/webcontents/WebContentsImpl;)V

    return-object p0
.end method

.method public final i(Ljava/lang/Object;Landroidx/recyclerview/widget/i;)V
    .registers 12

    iget-byte p0, p0, Lt14;->a:B

    packed-switch p0, :pswitch_data_e0

    check-cast p1, Lcom/opera/android/suggestion/Suggestion;

    check-cast p2, Lkl4;

    iput-object p1, p2, Lkl4;->f:Lcom/opera/android/suggestion/Suggestion;

    iget-object p0, p2, Lkl4;->b:Lcq3;

    iget-object p0, p0, Lcq3;->b:Landroid/view/View;

    check-cast p0, Lcom/opera/android/suggestion/ChatSuggestionView;

    iget-object p1, p1, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p2, Lkl4;->f:Lcom/opera/android/suggestion/Suggestion;

    if-eqz p0, :cond_25

    iget p1, p2, Lkl4;->g:I

    const/16 v0, 0x64

    if-ne p1, v0, :cond_25

    iget-object p1, p2, Lkl4;->e:Lnv6;

    invoke-virtual {p1, p0}, Lnv6;->D(Lcom/opera/android/suggestion/Suggestion;)V

    :cond_25
    return-void

    :pswitch_26
    check-cast p1, Lcom/opera/android/autofill/CreditCard;

    check-cast p2, Lal4;

    iput-object p1, p2, Lal4;->c:Lcom/opera/android/autofill/CreditCard;

    iget-object p0, p2, Lal4;->b:Lvs;

    iget-object v0, p0, Lvs;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    iget-object v1, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p1, Lcom/opera/android/autofill/CreditCard;->f:I

    invoke-static {v2, v1}, Ly9m;->V(ILandroid/content/Context;)I

    move-result v2

    if-nez v2, :cond_45

    const/4 v2, 0x5

    invoke-static {v2, v1}, Ly9m;->V(ILandroid/content/Context;)I

    move-result v2

    :cond_45
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-object v0, p0, Lvs;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v1, p0, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v2, p1, Lcom/opera/android/autofill/CreditCard;->c:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p1, Lcom/opera/android/autofill/CreditCard;->e:Ljava/lang/String;

    iget-object v2, p1, Lcom/opera/android/autofill/CreditCard;->d:Ljava/lang/String;

    const/4 v3, 0x1

    :try_start_5a
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/util/Calendar;->get(I)I

    move-result v7

    const/4 v8, 0x2

    invoke-virtual {v6, v8}, Ljava/util/Calendar;->get(I)I

    move-result v6
    :try_end_6f
    .catch Ljava/lang/NumberFormatException; {:try_start_5a .. :try_end_6f} :catch_77

    add-int/2addr v6, v3

    if-lt v4, v7, :cond_77

    if-ne v4, v7, :cond_76

    if-lt v5, v6, :cond_77

    :cond_76
    const/4 v3, 0x0

    :catch_77
    :cond_77
    iget-object p0, p0, Lvs;->b:Landroid/view/ViewGroup;

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v3, :cond_9d

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v2, 0x7f04021f

    const v3, 0x7f060ade

    invoke-static {v2, v0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f140c95

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_d0

    :cond_9d
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v3, 0x7f0409c4

    const v4, 0x7f0608b0

    invoke-static {v3, p0, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v3, 0x7f14029f

    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_d0
    iget-object p0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object p2, p2, Lal4;->d:Lyw;

    new-instance v0, Lnf;

    const/16 v1, 0x18

    invoke-direct {v0, p2, p1, v1}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    nop

    :pswitch_data_e0
    .packed-switch 0x12
        :pswitch_26
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Leig;

    sget-object p0, Lfzl;->b:Lfzl;

    invoke-interface {p1, p0}, Leig;->G(Lfzl;)V

    return-void
.end method

.method public final j(I)Z
    .registers 3

    iget-byte p0, p0, Lt14;->a:B

    packed-switch p0, :pswitch_data_2c

    const/4 p0, 0x2

    if-eq p1, p0, :cond_18

    const/4 p0, 0x3

    if-eq p1, p0, :cond_18

    const/4 p0, 0x4

    if-eq p1, p0, :cond_18

    const/16 p0, 0xb

    if-eq p1, p0, :cond_18

    const/16 p0, 0x20

    if-eq p1, p0, :cond_18

    const/4 p0, 0x0

    goto :goto_19

    :cond_18
    const/4 p0, 0x1

    :goto_19
    return p0

    :pswitch_1a
    const/4 p0, 0x1

    if-eq p1, p0, :cond_2b

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2b

    const/4 v0, 0x3

    if-eq p1, v0, :cond_2b

    const/4 v0, 0x4

    if-eq p1, v0, :cond_2b

    const/16 v0, 0x20

    if-eq p1, v0, :cond_2b

    const/4 p0, 0x0

    :cond_2b
    return p0

    :pswitch_data_2c
    .packed-switch 0x1a
        :pswitch_1a
    .end packed-switch
.end method

.method public final k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Ljava/lang/Object;
    .registers 9

    const p0, 0x7f0d01db

    const/4 v0, 0x0

    invoke-virtual {p1, p0, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p1, 0x7f0a0987

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v3, p2

    check-cast v3, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v3, :cond_49

    const p1, 0x7f0a0991

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v5, p2

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v5, :cond_49

    const p1, 0x7f0a099e

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_49

    new-instance v1, Ljq2;

    check-cast p2, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    const/4 p1, 0x1

    invoke-direct {v1, p2, p1}, Ljq2;-><init>(Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;B)V

    const p1, 0x7f0a09ae

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v4, p2

    check-cast v4, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v4, :cond_49

    new-instance v0, Lgl9;

    move-object v2, p0

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-direct/range {v0 .. v5}, Lgl9;-><init>(Ljq2;Landroid/widget/LinearLayout;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/custom_views/SeparatorView;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    return-object v0

    :cond_49
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final l(Ljava/lang/Object;)V
    .registers 2

    return-void
.end method

.method public final m(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;)Lcom/google/android/gms/common/api/PendingResult;
    .registers 2

    iget-byte p0, p0, Lt14;->a:B

    packed-switch p0, :pswitch_data_1e

    invoke-virtual {p1}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->pause()Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p0

    return-object p0

    :pswitch_a
    invoke-virtual {p1}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->play()Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p0

    return-object p0

    :pswitch_f
    invoke-virtual {p1}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->pause()Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p0

    return-object p0

    :pswitch_14
    invoke-virtual {p1}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->stop()Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p0

    return-object p0

    :pswitch_19
    invoke-virtual {p1}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->stop()Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p0

    return-object p0

    :pswitch_data_1e
    .packed-switch 0x15
        :pswitch_19
        :pswitch_14
        :pswitch_f
        :pswitch_a
    .end packed-switch
.end method

.method public final o(Ljava/lang/Object;Lw69;)V
    .registers 3

    check-cast p1, Leig;

    new-instance p0, Ldig;

    invoke-direct {p0, p2}, Ldig;-><init>(Lw69;)V

    invoke-interface {p1, p0}, Leig;->c(Ldig;)V

    return-void
.end method
