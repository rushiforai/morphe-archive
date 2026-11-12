.class public final synthetic Ly12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lb22;


# direct methods
.method public synthetic constructor <init>(Lb22;B)V
    .registers 3

    iput-byte p2, p0, Ly12;->a:B

    iput-object p1, p0, Ly12;->b:Lb22;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Ly12;->a:B

    iget-object p0, p0, Ly12;->b:Lb22;

    packed-switch v0, :pswitch_data_1e

    check-cast p1, Landroid/content/Intent;

    iget-object p0, p0, Lb22;->v:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_11
    check-cast p1, Ltsn;

    iget-object p0, p0, Lx22;->l:Lmrn;

    iget-object p1, p1, Ltsn;->b:Llsn;

    invoke-virtual {p0, p1}, Lmrn;->h(Llsn;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
