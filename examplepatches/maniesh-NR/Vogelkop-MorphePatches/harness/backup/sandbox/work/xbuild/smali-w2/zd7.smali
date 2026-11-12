.class public final synthetic Lzd7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lzd7;->a:B

    iput-object p1, p0, Lzd7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .registers 6

    iget-byte p1, p0, Lzd7;->a:B

    iget-object p0, p0, Lzd7;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_46

    check-cast p0, Lrhj;

    invoke-virtual {p0}, Lrhj;->d()V

    return-void

    :pswitch_d
    check-cast p0, Lx77;

    iget-object p1, p0, Lx77;->b:Ljava/lang/Object;

    check-cast p1, Ldkf;

    iget-object v0, p0, Lx77;->d:Ljava/lang/Object;

    check-cast v0, Lbz0;

    const v1, 0x7f0a00d6

    invoke-virtual {v0, v1}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/DialogTitle;

    const/4 v2, 0x4

    if-eqz v1, :cond_2a

    invoke-virtual {v1, v2}, Landroid/view/View;->setTextAlignment(I)V

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setGravity(I)V

    :cond_2a
    new-instance v1, Le73;

    invoke-direct {v1, p0, p1, v2}, Le73;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const p0, 0x7f0a00dc

    invoke-virtual {v0, p0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_44

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p1

    if-eqz p1, :cond_41

    invoke-static {p1, p0, v1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_41
    invoke-virtual {v1, p0}, Le73;->a(Landroid/view/View;)V

    :cond_44
    return-void

    nop

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
