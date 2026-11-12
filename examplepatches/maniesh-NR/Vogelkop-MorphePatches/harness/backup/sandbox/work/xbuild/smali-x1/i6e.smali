.class public final synthetic Li6e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lk6e;


# direct methods
.method public synthetic constructor <init>(Lk6e;B)V
    .registers 3

    iput-byte p2, p0, Li6e;->a:B

    iput-object p1, p0, Li6e;->b:Lk6e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Li6e;->a:B

    iget-object p0, p0, Li6e;->b:Lk6e;

    packed-switch v0, :pswitch_data_32

    :try_start_7
    sget-object v0, Lkotlin/coroutines/h;->a:Lkotlin/coroutines/h;

    new-instance v1, La7b;

    const/16 v2, 0x10

    invoke-direct {v1, p0, v2}, La7b;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Lscd;->g0(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Li1a;

    invoke-virtual {p0}, Li1a;->b()Lh1a;

    move-result-object p0
    :try_end_1a
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_1a} :catch_1b

    goto :goto_20

    :catch_1b
    move-exception p0

    invoke-static {p0}, Lrqd;->p(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    :goto_20
    return-object p0

    :pswitch_21
    iget-object p0, p0, Lk6e;->a:Lcq5;

    invoke-virtual {p0}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf8f;

    invoke-virtual {p0}, Lf8f;->i()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_21
    .end packed-switch
.end method
