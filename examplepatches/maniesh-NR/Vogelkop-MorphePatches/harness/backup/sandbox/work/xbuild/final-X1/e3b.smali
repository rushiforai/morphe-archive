.class public final synthetic Le3b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lg3b;


# direct methods
.method public synthetic constructor <init>(Lg3b;B)V
    .registers 3

    iput-byte p2, p0, Le3b;->a:B

    iput-object p1, p0, Le3b;->b:Lg3b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 7

    iget-byte p1, p0, Le3b;->a:B

    const/4 v0, 0x1

    iget-object p0, p0, Le3b;->b:Lg3b;

    packed-switch p1, :pswitch_data_76

    iget-object p1, p0, Lg3b;->t:Ljava/lang/Object;

    check-cast p1, Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lh3b;

    new-instance v1, Lf3b;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lf3b;-><init>(Lg3b;B)V

    iget-object p0, p1, Lh3b;->b:Lot2;

    new-instance v2, Lg2b;

    invoke-direct {v2, v1, p1, v0}, Lg2b;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, p0, Lot2;->c:Ldu3;

    invoke-virtual {v0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqim;

    iget-object v0, v0, Lqim;->c:Lz77;

    new-instance v1, Lwen;

    new-instance v3, Lx2;

    const/16 v4, 0x19

    invoke-direct {v3, p0, v2, v4}, Lx2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 p0, 0x5

    invoke-direct {v1, v3, p0}, Lwen;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, p0}, Lr22;->b(Ljjm;Lijm;)V

    iget-object p0, p1, Lh3b;->e:Lorm;

    sget-object p1, Lgm0;->e:Lgm0;

    check-cast p0, Lx5f;

    invoke-virtual {p0, p1}, Lx5f;->l0(Lgm0;)V

    return-void

    :pswitch_48
    iget-object p1, p0, Lg3b;->t:Ljava/lang/Object;

    check-cast p1, Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lh3b;

    new-instance v1, Lf3b;

    invoke-direct {v1, p0, v0}, Lf3b;-><init>(Lg3b;B)V

    iget-object p0, p1, Lh3b;->b:Lot2;

    new-instance v0, Lqj2;

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lqj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget v1, Lcom/opera/android/import_data/ImportChromePasswordsActivity;->b0:I

    iget-object p0, p0, Lot2;->a:Lcom/opera/android/BrowserActivity;

    sget-object v1, Lw2b;->d:Lw2b;

    invoke-static {p0, v0, v1}, Lk1g;->f0(Lcom/opera/android/BrowserActivity;Lni;Lw2b;)V

    iget-object p0, p1, Lh3b;->e:Lorm;

    sget-object p1, Lgm0;->d:Lgm0;

    check-cast p0, Lx5f;

    invoke-virtual {p0, p1}, Lx5f;->l0(Lgm0;)V

    return-void

    nop

    :pswitch_data_76
    .packed-switch 0x0
        :pswitch_48
    .end packed-switch
.end method
