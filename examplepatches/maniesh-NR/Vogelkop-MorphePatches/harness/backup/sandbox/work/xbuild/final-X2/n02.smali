.class public final synthetic Ln02;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwth;

.field public final synthetic c:Lj31;


# direct methods
.method public synthetic constructor <init>(Lwth;Lj31;B)V
    .registers 4

    iput-byte p3, p0, Ln02;->a:B

    iput-object p1, p0, Ln02;->b:Lwth;

    iput-object p2, p0, Ln02;->c:Lj31;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    iget-byte v0, p0, Ln02;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_9e

    check-cast p1, Lsfb;

    iget-object v3, p0, Ln02;->c:Lj31;

    if-eqz p1, :cond_33

    iget-wide v5, p1, Lsfb;->a:J

    iget-object v7, p1, Lsfb;->h:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-gtz p1, :cond_1a

    invoke-virtual {v3, v1}, Lj31;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_36

    :cond_1a
    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    new-instance v2, Lp02;

    iget-object v4, p0, Ln02;->b:Lwth;

    const/4 v9, 0x1

    invoke-direct/range {v2 .. v9}, Lp02;-><init>(Lkotlin/jvm/functions/Function1;Lwth;JLjava/util/ArrayList;II)V

    move-wide v7, v0

    move-object v9, v2

    invoke-virtual/range {v4 .. v9}, Lwth;->z(JJLkotlin/jvm/functions/Function1;)V

    goto :goto_36

    :cond_33
    invoke-virtual {v3, v1}, Lj31;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_36
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_39
    check-cast p1, Ltw7;

    instance-of v0, p1, Lrw7;

    iget-object v6, p0, Ln02;->c:Lj31;

    if-eqz v0, :cond_4b

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Throwable;

    invoke-virtual {v6, v1}, Lj31;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_97

    :cond_4b
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_9a

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    move-object v10, p1

    check-cast v10, Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result p1

    const/4 v0, 0x1

    const/4 v11, 0x0

    iget-object v3, p0, Ln02;->b:Lwth;

    if-ne p1, v0, :cond_74

    invoke-interface {v10, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    new-instance v2, Lo02;

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Lo02;-><init>(Ljava/lang/Object;JLjava/lang/Object;B)V

    invoke-virtual {v3, v4, v5, v2}, Lwth;->y(JLkotlin/jvm/functions/Function1;)V

    goto :goto_97

    :cond_74
    new-instance v8, Ln02;

    invoke-direct {v8, v3, v6, v0}, Ln02;-><init>(Lwth;Lj31;B)V

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result p0

    if-gtz p0, :cond_83

    invoke-virtual {v8, v1}, Ln02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_97

    :cond_83
    invoke-interface {v10, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide p0

    new-instance v7, Ltw0;

    const/4 v12, 0x1

    move-object v9, v3

    invoke-direct/range {v7 .. v12}, Ltw0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;IB)V

    invoke-virtual {v3, p0, p1, v7}, Lwth;->y(JLkotlin/jvm/functions/Function1;)V

    :goto_97
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_9d

    :cond_9a
    invoke-static {}, Lh9o;->p()V

    :goto_9d
    return-object v1

    :pswitch_data_9e
    .packed-switch 0x0
        :pswitch_39
    .end packed-switch
.end method
