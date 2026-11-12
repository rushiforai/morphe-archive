.class public final synthetic Li22;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx22;


# direct methods
.method public synthetic constructor <init>(Lx22;B)V
    .registers 3

    iput-byte p2, p0, Li22;->a:B

    iput-object p1, p0, Li22;->b:Lx22;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Li22;->a:B

    iget-object p0, p0, Li22;->b:Lx22;

    packed-switch v0, :pswitch_data_58

    iget-object p0, p0, Lx22;->n:Lr22;

    if-eqz p0, :cond_10

    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-static {p0, v0, v1}, Lr22;->p(Lr22;ZI)V

    :cond_10
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    iget-object v0, p0, Lx22;->m:Lnrl;

    iget-boolean v0, v0, Lnrl;->a:Z

    if-nez v0, :cond_3a

    iget-object v0, p0, Lx22;->l:Lmrn;

    iget-object v0, v0, Lmrn;->j:Lcom/opera/android/custom_views/OperaEditText;

    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object p0, p0, Lx22;->n:Lr22;

    if-eqz p0, :cond_3a

    invoke-virtual {p0}, Lr22;->h()Ls62;

    move-result-object p0

    iget-object p0, p0, Ls62;->b:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->J0()Lorg/chromium/ui/base/ViewAndroidDelegate;

    move-result-object p0

    iget-object p0, p0, Lorg/chromium/ui/base/ViewAndroidDelegate;->b:Lxr5;

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    :cond_3a
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3d
    new-instance v0, Lp22;

    invoke-direct {v0, p0}, Lp22;-><init>(Lx22;)V

    return-object v0

    :pswitch_43
    new-instance v0, Lmlj;

    iget-object v1, p0, Lx22;->e:Lesk;

    invoke-interface {v1}, Lesk;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lysj;

    iget-object p0, p0, Lx22;->f:Lrvg;

    iget-object p0, p0, Lrvg;->b:Landroid/view/ViewGroup;

    check-cast p0, Landroid/widget/FrameLayout;

    invoke-direct {v0, v1, p0}, Lmlj;-><init>(Lysj;Landroid/view/View;)V

    return-object v0

    nop

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_43
        :pswitch_3d
        :pswitch_13
    .end packed-switch
.end method
