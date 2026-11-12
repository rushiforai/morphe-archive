.class public final synthetic Lbji;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Liji;


# direct methods
.method public synthetic constructor <init>(Liji;B)V
    .registers 3

    iput-byte p2, p0, Lbji;->a:B

    iput-object p1, p0, Lbji;->b:Liji;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Lbji;->a:B

    iget-object p0, p0, Lbji;->b:Liji;

    packed-switch p1, :pswitch_data_1c

    invoke-virtual {p0}, Liji;->C()V

    iget-object p1, p0, Liji;->c:Ldx3;

    iget-object v0, p0, Liji;->p:Landroid/net/Uri;

    new-instance v1, Lvii;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lvii;-><init>(Liji;B)V

    invoke-static {p1, v0, v2, v1}, Llcp;->G(Ldx3;Landroid/net/Uri;ZLcom/opera/api/Callback;)V

    return-void

    :pswitch_18
    invoke-virtual {p0}, Liji;->f()V

    return-void

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method
