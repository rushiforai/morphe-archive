.class public final Lsw0;
.super Lpde;
.source "SourceFile"


# instance fields
.field public final synthetic l:B

.field public final m:Ljava/lang/Object;

.field public final n:Landroid/content/ComponentCallbacks;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lsw0;->l:B

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-direct {p0, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lsw0;->m:Ljava/lang/Object;

    new-instance v0, Lit5;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lit5;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lsw0;->n:Landroid/content/ComponentCallbacks;

    new-instance v0, Lz61;

    const/16 v1, 0x1a

    invoke-direct {v0, p0, v1}, Lz61;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method

.method public constructor <init>(Ligi;Lcom/opera/android/BrowserActivity;Lf08;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lsw0;->l:B

    iput-object p1, p0, Lsw0;->m:Ljava/lang/Object;

    iput-object p2, p0, Lsw0;->n:Landroid/content/ComponentCallbacks;

    .line 39
    invoke-direct {p0, p3}, Lekc;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final l()V
    .registers 6

    iget-byte v0, p0, Lsw0;->l:B

    packed-switch v0, :pswitch_data_24

    return-void

    :pswitch_6
    iget-object v0, p0, Lsw0;->m:Ljava/lang/Object;

    check-cast v0, Ligi;

    iget-object v1, v0, Ligi;->c:Ljava/lang/Object;

    check-cast v1, Ldll;

    iget-object p0, p0, Lsw0;->n:Landroid/content/ComponentCallbacks;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    iget-object v2, v0, Ligi;->f:Ljava/lang/Object;

    check-cast v2, Lrw0;

    new-instance v3, Lvme;

    const/16 v4, 0x13

    invoke-direct {v3, v4}, Lvme;-><init>(B)V

    invoke-static {v1, p0, v2, v3}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    invoke-virtual {v0}, Ligi;->A0()V

    return-void

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final m()V
    .registers 3

    iget-byte v0, p0, Lsw0;->l:B

    packed-switch v0, :pswitch_data_1a

    return-void

    :pswitch_6
    iget-object p0, p0, Lsw0;->m:Ljava/lang/Object;

    check-cast p0, Ligi;

    iget-object v0, p0, Ligi;->c:Ljava/lang/Object;

    check-cast v0, Ldll;

    iget-object v1, p0, Ligi;->f:Ljava/lang/Object;

    check-cast v1, Lrw0;

    invoke-virtual {v0, v1}, Ldll;->b(Lcll;)V

    invoke-virtual {p0}, Ligi;->A0()V

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method
