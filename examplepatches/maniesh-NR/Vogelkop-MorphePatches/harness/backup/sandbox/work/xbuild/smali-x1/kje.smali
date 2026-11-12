.class public final synthetic Lkje;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbcf;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;B)V
    .registers 3

    iput-byte p2, p0, Lkje;->a:B

    iput-object p1, p0, Lkje;->b:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 4

    iget-byte p1, p0, Lkje;->a:B

    const/16 v0, 0x207

    iget-object p0, p0, Lkje;->b:Landroid/view/View;

    packed-switch p1, :pswitch_data_2e

    iget-object p1, p2, Lg3o;->a:Ld3o;

    invoke-virtual {p1, v0}, Ld3o;->i(I)Lr9b;

    move-result-object p1

    iget p1, p1, Lr9b;->b:I

    invoke-static {p1, p0}, Lp37;->q0(ILandroid/view/View;)V

    return-object p2

    :pswitch_15
    iget-object p1, p2, Lg3o;->a:Ld3o;

    invoke-virtual {p1, v0}, Ld3o;->i(I)Lr9b;

    move-result-object p1

    iget p1, p1, Lr9b;->b:I

    invoke-static {p1, p0}, Lp37;->q0(ILandroid/view/View;)V

    return-object p2

    :pswitch_21
    iget-object p1, p2, Lg3o;->a:Ld3o;

    invoke-virtual {p1, v0}, Ld3o;->i(I)Lr9b;

    move-result-object p1

    iget p1, p1, Lr9b;->d:I

    invoke-static {p1, p0}, Lp37;->p0(ILandroid/view/View;)V

    return-object p2

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_21
        :pswitch_15
    .end packed-switch
.end method
