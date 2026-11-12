.class public final synthetic Loc4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:B

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILiw4;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Loc4;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Loc4;->b:B

    iput-object p2, p0, Loc4;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;IB)V
    .registers 4

    .line 12
    iput-byte p3, p0, Loc4;->a:B

    iput-object p1, p0, Loc4;->c:Ljava/lang/Object;

    iput-byte p2, p0, Loc4;->b:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lycc;II)V
    .registers 4

    .line 11
    const/4 p3, 0x0

    iput-byte p3, p0, Loc4;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Loc4;->c:Ljava/lang/Object;

    iput-byte p2, p0, Loc4;->b:B

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    iget-byte v0, p0, Loc4;->a:B

    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-byte v5, p0, Loc4;->b:B

    iget-object p0, p0, Loc4;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_e4

    check-cast p0, Lcom/google/android/material/sidesheet/SideSheetBehavior;

    iget-object v0, p0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->p:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1a

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/view/View;

    :cond_1a
    if-eqz v4, :cond_20

    const/4 v0, 0x0

    invoke-virtual {p0, v4, v5, v0}, Lcom/google/android/material/sidesheet/SideSheetBehavior;->A(Landroid/view/View;IZ)V

    :cond_20
    return-void

    :pswitch_21
    check-cast p0, Ld8i;

    iget-object v0, p0, Ld8i;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object p0, p0, Ld8i;->a:Lpc4;

    iget-object p0, p0, Lpc4;->a:Lycc;

    iput v5, p0, Lycc;->s:I

    iget-object v0, p0, Lycc;->g:Lqva;

    invoke-virtual {v0, v5}, Lqrm;->D(I)Z

    move-result v1

    if-eqz v1, :cond_3c

    invoke-virtual {v0}, Lqva;->N()V

    :cond_3c
    iget-object v0, p0, Lycc;->d:Lewa;

    invoke-virtual {v0, v5}, Lewa;->M(I)V

    iget-object p0, p0, Lycc;->h:Ly2n;

    invoke-virtual {p0, v5}, Lqrm;->D(I)Z

    move-result v0

    if-eqz v0, :cond_4c

    invoke-virtual {p0}, Ly2n;->T()V

    :cond_4c
    return-void

    :pswitch_4d
    check-cast p0, Ldbh;

    invoke-virtual {p0, v5}, Ldbh;->D(I)V

    return-void

    :pswitch_53
    check-cast p0, Lbv5;

    iget-object v0, p0, Lbv5;->c:Lech;

    iget-object v0, v0, Lech;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldch;

    if-eqz v0, :cond_6e

    iget v1, v0, Ldch;->f:I

    or-int/2addr v1, v5

    iput v1, v0, Ldch;->f:I

    iget-object v1, v0, Ldch;->c:Ljava/util/HashSet;

    invoke-virtual {v1, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Ldch;->a()V

    :cond_6e
    return-void

    :pswitch_6f
    check-cast p0, Lcd9;

    if-eq v5, v3, :cond_89

    if-eq v5, v2, :cond_82

    if-eq v5, v1, :cond_7b

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_9e

    :cond_7b
    const v0, 0x7f140794

    invoke-virtual {p0, v0}, Lcd9;->B0(I)V

    goto :goto_9e

    :cond_82
    const v0, 0x7f140795

    invoke-virtual {p0, v0}, Lcd9;->B0(I)V

    goto :goto_9e

    :cond_89
    iget-object v0, p0, Lcd9;->u:Lod9;

    if-eqz v0, :cond_92

    invoke-virtual {v0}, Lryl;->g0()V

    iput-object v4, p0, Lcd9;->u:Lod9;

    :cond_92
    new-instance v0, Lp99;

    invoke-direct {v0}, Lp99;-><init>()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v0, p0}, Ls63;->w0(Landroid/content/Context;)V

    :goto_9e
    return-void

    :pswitch_9f
    check-cast p0, Liw4;

    sget-object v0, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;->l:Lrl;

    if-eqz v5, :cond_dd

    if-eq v5, v3, :cond_cd

    if-eq v5, v2, :cond_bc

    if-ne v5, v1, :cond_dd

    iget-object v0, p0, Liw4;->s:Lzw4;

    invoke-interface {v0}, Lzw4;->j()Z

    move-result v0

    if-nez v0, :cond_dd

    iget v0, p0, Liw4;->t:I

    sub-int/2addr v0, v3

    iput v0, p0, Liw4;->t:I

    invoke-virtual {p0}, Liw4;->a()V

    goto :goto_dd

    :cond_bc
    iget-object v0, p0, Liw4;->s:Lzw4;

    invoke-interface {v0}, Lzw4;->j()Z

    move-result v0

    if-nez v0, :cond_dd

    iget v0, p0, Liw4;->u:I

    sub-int/2addr v0, v3

    iput v0, p0, Liw4;->u:I

    invoke-virtual {p0}, Liw4;->a()V

    goto :goto_dd

    :cond_cd
    iget-object v0, p0, Liw4;->s:Lzw4;

    invoke-interface {v0}, Lzw4;->j()Z

    move-result v0

    if-nez v0, :cond_dd

    iget v0, p0, Liw4;->v:I

    sub-int/2addr v0, v3

    iput v0, p0, Liw4;->v:I

    invoke-virtual {p0}, Liw4;->a()V

    :cond_dd
    :goto_dd
    return-void

    :pswitch_de
    check-cast p0, Lycc;

    iput-byte v5, p0, Lycc;->b:B

    return-void

    nop

    :pswitch_data_e4
    .packed-switch 0x0
        :pswitch_de
        :pswitch_9f
        :pswitch_6f
        :pswitch_53
        :pswitch_4d
        :pswitch_21
    .end packed-switch
.end method
