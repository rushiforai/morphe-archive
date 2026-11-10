.class public final Li/h;
.super Lh/x;
.source "SourceFile"


# instance fields
.field public final synthetic l:I

.field public final synthetic m:Li/l;


# direct methods
.method public constructor <init>(Li/l;Landroid/content/Context;Lh/F;Landroid/view/View;)V
    .locals 7

    const/4 v0, 0x0

    iput v0, p0, Li/h;->l:I

    iput-object p1, p0, Li/h;->m:Li/l;

    const/4 v6, 0x0

    const v2, 0x7f030020

    move-object v1, p0

    move-object v3, p2

    move-object v5, p3

    move-object v4, p4

    invoke-direct/range {v1 .. v6}, Lh/x;-><init>(ILandroid/content/Context;Landroid/view/View;Lh/n;Z)V

    iget-object p2, v5, Lh/F;->A:Lh/p;

    iget p2, p2, Lh/p;->x:I

    const/16 p3, 0x20

    and-int/2addr p2, p3

    if-ne p2, p3, :cond_0

    goto :goto_0

    :cond_0
    iget-object p2, p1, Li/l;->i:Li/k;

    if-nez p2, :cond_1

    iget-object p2, p1, Li/l;->h:Lh/B;

    check-cast p2, Landroid/view/View;

    :cond_1
    iput-object p2, v1, Lh/x;->e:Landroid/view/View;

    :goto_0
    iget-object p1, p1, Li/l;->w:LC/j;

    iput-object p1, v1, Lh/x;->h:Lh/y;

    iget-object p2, v1, Lh/x;->i:Lh/v;

    if-eqz p2, :cond_2

    invoke-interface {p2, p1}, Lh/z;->e(Lh/y;)V

    :cond_2
    return-void
.end method

.method public constructor <init>(Li/l;Landroid/content/Context;Lh/n;Landroid/view/View;)V
    .locals 7

    const/4 v0, 0x1

    iput v0, p0, Li/h;->l:I

    iput-object p1, p0, Li/h;->m:Li/l;

    const v2, 0x7f030020

    const/4 v6, 0x1

    move-object v1, p0

    move-object v3, p2

    move-object v5, p3

    move-object v4, p4

    invoke-direct/range {v1 .. v6}, Lh/x;-><init>(ILandroid/content/Context;Landroid/view/View;Lh/n;Z)V

    const p2, 0x800005

    iput p2, v1, Lh/x;->f:I

    iget-object p1, p1, Li/l;->w:LC/j;

    iput-object p1, v1, Lh/x;->h:Lh/y;

    iget-object p2, v1, Lh/x;->i:Lh/v;

    if-eqz p2, :cond_0

    invoke-interface {p2, p1}, Lh/z;->e(Lh/y;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public final c()V
    .locals 3

    iget v0, p0, Li/h;->l:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Li/h;->m:Li/l;

    iget-object v1, v0, Li/l;->c:Lh/n;

    if-eqz v1, :cond_0

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lh/n;->c(Z)V

    :cond_0
    const/4 v1, 0x0

    iput-object v1, v0, Li/l;->s:Li/h;

    invoke-super {p0}, Lh/x;->c()V

    return-void

    :pswitch_0
    const/4 v0, 0x0

    iget-object v1, p0, Li/h;->m:Li/l;

    iput-object v0, v1, Li/l;->t:Li/h;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-super {p0}, Lh/x;->c()V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
