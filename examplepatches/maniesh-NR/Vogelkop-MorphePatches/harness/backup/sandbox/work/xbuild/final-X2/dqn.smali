.class public final synthetic Ldqn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Llqn;


# direct methods
.method public synthetic constructor <init>(Llqn;B)V
    .registers 3

    iput-byte p2, p0, Ldqn;->a:B

    iput-object p1, p0, Ldqn;->b:Llqn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Ldqn;->a:B

    iget-object p0, p0, Ldqn;->b:Llqn;

    packed-switch v0, :pswitch_data_32

    iget-object p0, p0, Llqn;->w:Lvsn;

    iget-object v0, p0, Lvsn;->c:Ls62;

    invoke-virtual {v0}, Ls62;->f()Lqyj;

    move-result-object v1

    invoke-virtual {v1}, Lqyj;->f()V

    invoke-virtual {v1}, Lqyj;->m()V

    invoke-virtual {v0}, Ls62;->c()Lp62;

    move-result-object v0

    sget-object v1, Lt52;->k:Lt52;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lp62;->a(Lwyh;Lm62;)V

    iget-object p0, p0, Lvsn;->k:Lg7m;

    sget-object v0, Ll60;->c:Ll60;

    invoke-virtual {p0, v0}, Lg7m;->c(Ll60;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_29
    iget-object p0, p0, Llqn;->w:Lvsn;

    invoke-virtual {p0}, Lvsn;->g()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_29
    .end packed-switch
.end method
