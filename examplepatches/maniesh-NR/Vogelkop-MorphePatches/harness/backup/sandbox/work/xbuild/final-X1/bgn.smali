.class public final synthetic Lbgn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcgn;

.field public final synthetic c:Luvg;


# direct methods
.method public synthetic constructor <init>(Lcgn;Luvg;B)V
    .registers 4

    iput-byte p3, p0, Lbgn;->a:B

    iput-object p1, p0, Lbgn;->b:Lcgn;

    iput-object p2, p0, Lbgn;->c:Luvg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Lbgn;->a:B

    const/4 v0, 0x4

    iget-object v1, p0, Lbgn;->c:Luvg;

    iget-object p0, p0, Lbgn;->b:Lcgn;

    packed-switch p1, :pswitch_data_3c

    const/4 p1, 0x3

    invoke-virtual {p0, v1, p1}, Lcgn;->J0(Luvg;I)V

    return-void

    :pswitch_f
    iget-object p1, p0, Lcgn;->v:Lydn;

    iget-object p1, p1, Lydn;->c:Lgfn;

    invoke-interface {p1}, Lgfn;->isEnabled()Z

    move-result p1

    if-nez p1, :cond_1e

    const/4 p1, 0x2

    invoke-virtual {p0, v1, p1}, Lcgn;->J0(Luvg;I)V

    goto :goto_32

    :cond_1e
    iget-object p0, p0, Lcgn;->x:Lz77;

    new-instance p1, Ltim;

    new-instance v0, Lsfn;

    invoke-direct {v0}, Lsfn;-><init>()V

    invoke-direct {p1, v0}, Ltim;-><init>(Luim;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    :goto_32
    return-void

    :pswitch_33
    invoke-virtual {p0, v1, v0}, Lcgn;->J0(Luvg;I)V

    return-void

    :pswitch_37
    invoke-virtual {p0, v1, v0}, Lcgn;->J0(Luvg;I)V

    return-void

    nop

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_37
        :pswitch_33
        :pswitch_f
    .end packed-switch
.end method
