.class public final synthetic Ln3m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lo3m;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lo3m;Ljava/util/List;B)V
    .registers 4

    iput-byte p3, p0, Ln3m;->a:B

    iput-object p1, p0, Ln3m;->b:Lo3m;

    iput-object p2, p0, Ln3m;->c:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Ln3m;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v3, p0, Ln3m;->c:Ljava/util/List;

    iget-object p0, p0, Ln3m;->b:Lo3m;

    check-cast p1, Losk;

    packed-switch v0, :pswitch_data_6e

    iget-object p0, p0, Lo3m;->b:Lnb2;

    check-cast v3, Ljava/lang/Iterable;

    invoke-virtual {p0, p1, v3}, Lkfo;->P(Losk;Ljava/lang/Iterable;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_17
    iget-object p1, p0, Lo3m;->a:Ly5i;

    new-instance v0, Lqjl;

    const/16 v4, 0x8

    invoke-direct {v0, v4}, Lqjl;-><init>(B)V

    invoke-static {p1, v2, v1, v0}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    check-cast v3, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {v3, v4}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_34
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_49

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    new-instance v5, Lzf8;

    invoke-direct {v5, v4}, Lzf8;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_34

    :cond_49
    new-instance v3, Lgil;

    const/16 v4, 0xd

    invoke-direct {v3, p0, v0, v4}, Lgil;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1, v2, v1, v3}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_56
    iget-object p1, p0, Lo3m;->a:Ly5i;

    new-instance v0, Lqjl;

    const/16 v4, 0x9

    invoke-direct {v0, v4}, Lqjl;-><init>(B)V

    invoke-static {p1, v2, v1, v0}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    new-instance v0, Ln3m;

    const/4 v4, 0x2

    invoke-direct {v0, p0, v3, v4}, Ln3m;-><init>(Lo3m;Ljava/util/List;B)V

    invoke-static {p1, v2, v1, v0}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_56
        :pswitch_17
    .end packed-switch
.end method
