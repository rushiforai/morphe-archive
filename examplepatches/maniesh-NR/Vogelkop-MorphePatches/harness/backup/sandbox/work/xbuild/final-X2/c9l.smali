.class public final synthetic Lc9l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lr9l;


# direct methods
.method public synthetic constructor <init>(Lr9l;B)V
    .registers 3

    iput-byte p2, p0, Lc9l;->a:B

    iput-object p1, p0, Lc9l;->b:Lr9l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lc9l;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Lc9l;->b:Lr9l;

    packed-switch v0, :pswitch_data_a0

    invoke-virtual {p0, v2}, Lr9l;->i(Z)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f
    iget-object p0, p0, Lr9l;->D:Lg4l;

    iget-object v0, p0, Lg4l;->g:Lbp3;

    invoke-virtual {v0, v1}, Lbp3;->h(Luz3;)V

    new-instance v0, Ld4l;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Ld4l;-><init>(Lg4l;B)V

    invoke-virtual {p0, v0}, Lg4l;->d(Lkotlin/jvm/functions/Function0;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_22
    iget-object p0, p0, Lr9l;->D:Lg4l;

    invoke-static {p0}, Lg4l;->e(Lg4l;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2a
    iget-object v0, p0, Lr9l;->c:Lk6l;

    invoke-virtual {v0}, Lk6l;->A()Lb2l;

    move-result-object v0

    invoke-virtual {p0}, Lr9l;->f()Lz5l;

    move-result-object v1

    iget-object v2, v1, Lz5l;->v:Lx2l;

    iget-object v1, v1, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lbvk;

    const/4 v4, 0x3

    invoke-direct {v3, v4}, Lbvk;-><init>(B)V

    invoke-static {v1, v3}, Lnxg;->n(Landroidx/recyclerview/widget/RecyclerView;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb2l;

    if-nez v1, :cond_53

    iget-object v1, v2, Lx2l;->o:Lo2l;

    iget-object v1, v1, Lo2l;->e:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb2l;

    :cond_53
    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5c

    invoke-virtual {p0, v0}, Lr9l;->p(Lb2l;)V

    :cond_5c
    new-instance v0, Lc9l;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lc9l;-><init>(Lr9l;B)V

    invoke-virtual {p0, v0}, Lr9l;->q(Lkotlin/jvm/functions/Function0;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_68
    iget-object p0, p0, Lr9l;->p:Li03;

    return-object p0

    :pswitch_6b
    iget-object v0, p0, Lr9l;->w:Ls9i;

    invoke-virtual {v0}, Ls9i;->Y()Z

    move-result v0

    if-eqz v0, :cond_77

    iget-object p0, p0, Lr9l;->q:Lebl;

    iget-object v1, p0, Lebl;->u:Lcom/opera/android/custom_views/StylingImageButton;

    :cond_77
    return-object v1

    :pswitch_78
    iget-object p0, p0, Lr9l;->e:Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lzi4;->y(Landroid/content/Context;)Lm24;

    move-result-object p0

    return-object p0

    :pswitch_83
    new-instance v0, Lisj;

    new-instance v1, Li9l;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Li9l;-><init>(Lr9l;B)V

    new-instance v3, Li9l;

    invoke-direct {v3, p0, v2}, Li9l;-><init>(Lr9l;B)V

    invoke-direct {v0, v1, v3}, Lisj;-><init>(Lesk;Lesk;)V

    iput-boolean v2, v0, Lisj;->f:Z

    iget-object v1, p0, Lr9l;->r:Lpde;

    new-instance v2, Ln9l;

    invoke-direct {v2, p0}, Ln9l;-><init>(Lr9l;)V

    invoke-static {v0, v1, v2}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    return-object v0

    :pswitch_data_a0
    .packed-switch 0x0
        :pswitch_83
        :pswitch_78
        :pswitch_6b
        :pswitch_68
        :pswitch_2a
        :pswitch_22
        :pswitch_f
    .end packed-switch
.end method
