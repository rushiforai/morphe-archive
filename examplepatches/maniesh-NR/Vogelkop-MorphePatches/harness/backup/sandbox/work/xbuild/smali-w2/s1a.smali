.class public final synthetic Ls1a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lv1a;


# direct methods
.method public synthetic constructor <init>(Lv1a;B)V
    .registers 3

    iput-byte p2, p0, Ls1a;->a:B

    iput-object p1, p0, Ls1a;->b:Lv1a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 7

    iget-byte v0, p0, Ls1a;->a:B

    const/4 v1, 0x3

    const/4 v2, 0x0

    iget-object p0, p0, Ls1a;->b:Lv1a;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    packed-switch v0, :pswitch_data_28

    iget-object v0, p0, Lv1a;->b:Lnx5;

    new-instance v3, Lu1a;

    const/4 v4, 0x0

    invoke-direct {v3, p0, p1, v2, v4}, Lu1a;-><init>(Lv1a;ZLmt5;B)V

    invoke-static {v0, v2, v2, v3, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void

    :pswitch_1b
    iget-object v0, p0, Lv1a;->b:Lnx5;

    new-instance v3, Lu1a;

    const/4 v4, 0x1

    invoke-direct {v3, p0, p1, v2, v4}, Lu1a;-><init>(Lv1a;ZLmt5;B)V

    invoke-static {v0, v2, v2, v3, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method
