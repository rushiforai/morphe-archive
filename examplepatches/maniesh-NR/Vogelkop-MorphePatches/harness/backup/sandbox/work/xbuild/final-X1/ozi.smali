.class public final synthetic Lozi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxbf;


# direct methods
.method public synthetic constructor <init>(Lxbf;B)V
    .registers 3

    iput-byte p2, p0, Lozi;->a:B

    iput-object p1, p0, Lozi;->b:Lxbf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte v0, p0, Lozi;->a:B

    iget-object p0, p0, Lozi;->b:Lxbf;

    packed-switch v0, :pswitch_data_26

    iget-object v0, p0, Lxbf;->g:Ljava/lang/Object;

    check-cast v0, Lj1k;

    invoke-virtual {v0}, Lj1k;->invoke()Ljava/lang/Object;

    new-instance v0, Ltji;

    const/16 v1, 0x8

    invoke-direct {v0, p0, v1}, Ltji;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lge;

    invoke-direct {p0, v0}, Lge;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, p1}, Lo73;->o(Landroid/view/View;)V

    return-void

    :pswitch_1e
    iget-object p0, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast p0, Ls9i;

    invoke-virtual {p0}, Ls9i;->h0()V

    return-void

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
