.class public final synthetic Lkrk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lqt6;


# direct methods
.method public synthetic constructor <init>(Lqt6;B)V
    .registers 3

    iput-byte p2, p0, Lkrk;->a:B

    iput-object p1, p0, Lkrk;->b:Lqt6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lkrk;->a:B

    iget-object p0, p0, Lkrk;->b:Lqt6;

    packed-switch v0, :pswitch_data_42

    check-cast p1, Ll0a;

    iget-boolean p0, p0, Lqt6;->a:Z

    if-eqz p0, :cond_10

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_10
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    check-cast p1, Luv7;

    iget-boolean v0, p0, Lqt6;->a:Z

    if-eqz v0, :cond_3e

    iget-boolean v0, p0, Lqt6;->b:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_2a

    iget-boolean v0, p1, Luv7;->a:Z

    if-nez v0, :cond_2a

    new-instance v0, Ljrk;

    invoke-direct {v0, p0, v1}, Ljrk;-><init>(Lqt6;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_2a
    iget-object v0, p0, Lqt6;->d:Ljava/lang/Object;

    check-cast v0, Llbf;

    sget-object v2, Llbf;->a:Llbf;

    if-ne v0, v2, :cond_3e

    iget-object p1, p1, Luv7;->b:Llbf;

    if-eq p1, v2, :cond_3e

    new-instance p1, Ljrk;

    invoke-direct {p1, p0, v1}, Ljrk;-><init>(Lqt6;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_3e
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
