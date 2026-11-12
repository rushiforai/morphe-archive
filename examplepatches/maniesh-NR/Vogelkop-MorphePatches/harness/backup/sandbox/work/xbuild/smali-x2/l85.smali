.class public final synthetic Ll85;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lo24;


# direct methods
.method public synthetic constructor <init>(Lo24;B)V
    .registers 3

    iput-byte p2, p0, Ll85;->a:B

    iput-object p1, p0, Ll85;->b:Lo24;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte v0, p0, Ll85;->a:B

    sget-object v1, Lbf;->a:Lbf;

    iget-object p0, p0, Ll85;->b:Lo24;

    packed-switch v0, :pswitch_data_24

    iget-object p0, p0, Lo24;->b:Ljf;

    iget-object p0, p0, Ljf;->a:Lkotlin/jvm/functions/Function2;

    new-instance v0, Lef;

    invoke-direct {v0, v1}, Lef;-><init>(Ldf;)V

    invoke-interface {p0, p1, v0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_16
    iget-object p0, p0, Lo24;->b:Ljf;

    iget-object p0, p0, Ljf;->a:Lkotlin/jvm/functions/Function2;

    new-instance v0, Lef;

    invoke-direct {v0, v1}, Lef;-><init>(Ldf;)V

    invoke-interface {p0, p1, v0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method
