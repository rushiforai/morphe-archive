.class public final synthetic Lj0a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lm0a;


# direct methods
.method public synthetic constructor <init>(Lm0a;B)V
    .registers 3

    iput-byte p2, p0, Lj0a;->a:B

    iput-object p1, p0, Lj0a;->b:Lm0a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lj0a;->a:B

    iget-object p0, p0, Lj0a;->b:Lm0a;

    packed-switch v0, :pswitch_data_42

    check-cast p1, Ljava/util/List;

    iget-object p1, p0, Lm0a;->d:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2b

    iget-object p1, p0, Lm0a;->a:Ltah;

    iget-object p1, p1, Ltah;->h:Ljava/lang/Object;

    check-cast p1, Lpde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Collection;

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_2b

    sget-object p1, Lo0a;->a:Lo0a;

    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p1

    iput-object p1, p0, Lm0a;->d:Ljava/util/Set;

    :cond_2b
    invoke-virtual {p0}, Lm0a;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_31
    check-cast p1, Leri;

    invoke-virtual {p0}, Lm0a;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_39
    check-cast p1, Li0a;

    invoke-virtual {p0}, Lm0a;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_39
        :pswitch_31
    .end packed-switch
.end method
