.class public final synthetic Ln6n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltjn;


# direct methods
.method public synthetic constructor <init>(Ltjn;B)V
    .registers 3

    iput-byte p2, p0, Ln6n;->a:B

    iput-object p1, p0, Ln6n;->b:Ltjn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte v0, p0, Ln6n;->a:B

    iget-object p0, p0, Ln6n;->b:Ltjn;

    packed-switch v0, :pswitch_data_18

    invoke-interface {p0, p1}, Ltjn;->k(Landroid/view/View;)V

    return-void

    :pswitch_b
    invoke-interface {p0}, Ltjn;->g()V

    return-void

    :pswitch_f
    invoke-interface {p0}, Ltjn;->b()V

    return-void

    :pswitch_13
    invoke-interface {p0, p1}, Ltjn;->i(Landroid/view/View;)V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_13
        :pswitch_f
        :pswitch_b
    .end packed-switch
.end method
