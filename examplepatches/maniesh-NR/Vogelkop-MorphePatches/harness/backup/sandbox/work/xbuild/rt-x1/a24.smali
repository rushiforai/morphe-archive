.class public final synthetic La24;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljf;


# direct methods
.method public synthetic constructor <init>(Ljf;B)V
    .registers 3

    iput-byte p2, p0, La24;->a:B

    iput-object p1, p0, La24;->b:Ljf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte v0, p0, La24;->a:B

    sget-object v1, Lbf;->a:Lbf;

    iget-object p0, p0, La24;->b:Ljf;

    packed-switch v0, :pswitch_data_20

    iget-object p0, p0, Ljf;->a:Lkotlin/jvm/functions/Function2;

    new-instance v0, Lef;

    invoke-direct {v0, v1}, Lef;-><init>(Ldf;)V

    invoke-interface {p0, p1, v0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_14
    iget-object p0, p0, Ljf;->a:Lkotlin/jvm/functions/Function2;

    new-instance v0, Lef;

    invoke-direct {v0, v1}, Lef;-><init>(Ldf;)V

    invoke-interface {p0, p1, v0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
