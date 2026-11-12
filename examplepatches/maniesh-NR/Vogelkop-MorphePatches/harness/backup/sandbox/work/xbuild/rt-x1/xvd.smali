.class public final synthetic Lxvd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lyvd;

.field public final synthetic c:Lib9;


# direct methods
.method public synthetic constructor <init>(Lyvd;Lib9;B)V
    .registers 4

    iput-byte p3, p0, Lxvd;->a:B

    iput-object p1, p0, Lxvd;->b:Lyvd;

    iput-object p2, p0, Lxvd;->c:Lib9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    iget-byte v0, p0, Lxvd;->a:B

    iget-object v1, p0, Lxvd;->c:Lib9;

    iget-object p0, p0, Lxvd;->b:Lyvd;

    packed-switch v0, :pswitch_data_38

    iget-object p0, p0, Lyvd;->h:Ljava/lang/Object;

    check-cast p0, Lfge;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v1, Lib9;->l:Landroid/net/Uri;

    if-eqz v0, :cond_2e

    new-instance v2, Lghf;

    iget-object v1, v1, Lib9;->h:Ljava/lang/String;

    new-instance v3, Li4d;

    new-instance v4, Lvvf;

    const/16 v5, 0x13

    invoke-direct {v4, v0, v1, v5}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v3, v4}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-direct {v2, v3}, Lghf;-><init>(Li4d;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v2, p0}, Lghf;->I(Landroid/content/Context;)Ljjm;

    :cond_2e
    return-void

    :pswitch_2f
    iget-object p0, p0, Lyvd;->h:Ljava/lang/Object;

    check-cast p0, Lfge;

    const/4 v0, 0x1

    invoke-virtual {p0, v1, v0}, Lfge;->K0(Lib9;Z)Z

    return-void

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_2f
    .end packed-switch
.end method
