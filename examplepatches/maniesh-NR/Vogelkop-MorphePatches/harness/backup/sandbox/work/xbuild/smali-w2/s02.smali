.class public final synthetic Ls02;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lu02;

.field public final synthetic c:Lgka;


# direct methods
.method public synthetic constructor <init>(Lu02;Lgka;B)V
    .registers 4

    iput-byte p3, p0, Ls02;->a:B

    iput-object p1, p0, Ls02;->b:Lu02;

    iput-object p2, p0, Ls02;->c:Lgka;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Ls02;->a:B

    iget-object v1, p0, Ls02;->c:Lgka;

    iget-object p0, p0, Ls02;->b:Lu02;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    packed-switch v0, :pswitch_data_5c

    iget-object p0, p0, Lu02;->f:Ljava/lang/Object;

    check-cast p0, Lg7m;

    invoke-virtual {p0, p1}, Lg7m;->g(Z)V

    if-eqz p1, :cond_1e

    new-instance p0, Luja;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    goto :goto_2a

    :cond_1e
    new-instance p0, Lqja;

    new-instance p1, Lsja;

    sget-object v0, Lrja;->c:Lrja;

    invoke-direct {p1, v0}, Lsja;-><init>(Lrja;)V

    invoke-direct {p0, p1}, Lqja;-><init>(Lsja;)V

    :goto_2a
    new-instance p1, Lsw7;

    invoke-direct {p1, p0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, p1}, Lgka;->n(Ltw7;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_35
    iget-object p0, p0, Lu02;->f:Ljava/lang/Object;

    check-cast p0, Lg7m;

    invoke-virtual {p0, p1}, Lg7m;->g(Z)V

    if-eqz p1, :cond_44

    new-instance p0, Luja;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    goto :goto_50

    :cond_44
    new-instance p0, Lqja;

    new-instance p1, Lsja;

    sget-object v0, Lrja;->c:Lrja;

    invoke-direct {p1, v0}, Lsja;-><init>(Lrja;)V

    invoke-direct {p0, p1}, Lqja;-><init>(Lsja;)V

    :goto_50
    new-instance p1, Lsw7;

    invoke-direct {p1, p0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, p1}, Lgka;->n(Ltw7;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_5c
    .packed-switch 0x0
        :pswitch_35
    .end packed-switch
.end method
