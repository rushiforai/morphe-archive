.class public final Llx1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lbhi;


# direct methods
.method public synthetic constructor <init>(Lbhi;B)V
    .registers 3

    iput-byte p2, p0, Llx1;->a:B

    iput-object p1, p0, Llx1;->b:Lbhi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Llx1;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Llx1;->b:Lbhi;

    packed-switch v0, :pswitch_data_a2

    check-cast p1, Ljava/util/List;

    sget-object v0, Lt0i;->b:Lp0i;

    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Lyg9;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Lyg9;-><init>(B)V

    invoke-static {v0, p1}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->Y(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lbhi;->resumeWith(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_25
    check-cast p1, Ltw7;

    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_39

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Throwable;

    sget-object p1, Lt0i;->b:Lp0i;

    sget-object p1, Ll08;->a:Ll08;

    invoke-virtual {p0, p1}, Lbhi;->resumeWith(Ljava/lang/Object;)V

    goto :goto_48

    :cond_39
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_4b

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0, p1}, Lbhi;->resumeWith(Ljava/lang/Object;)V

    :goto_48
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_4e

    :cond_4b
    invoke-static {}, Lh9o;->p()V

    :goto_4e
    return-object v1

    :pswitch_4f
    check-cast p1, Ltw7;

    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_63

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Throwable;

    sget-object p1, Lt0i;->b:Lp0i;

    sget-object p1, Ll08;->a:Ll08;

    invoke-virtual {p0, p1}, Lbhi;->resumeWith(Ljava/lang/Object;)V

    goto :goto_72

    :cond_63
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_75

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0, p1}, Lbhi;->resumeWith(Ljava/lang/Object;)V

    :goto_72
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_78

    :cond_75
    invoke-static {}, Lh9o;->p()V

    :goto_78
    return-object v1

    :pswitch_79
    check-cast p1, Ltw7;

    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_8b

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Throwable;

    sget-object p1, Lt0i;->b:Lp0i;

    invoke-virtual {p0, v1}, Lbhi;->resumeWith(Ljava/lang/Object;)V

    goto :goto_9a

    :cond_8b
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_9d

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Ltfb;

    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0, p1}, Lbhi;->resumeWith(Ljava/lang/Object;)V

    :goto_9a
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_a0

    :cond_9d
    invoke-static {}, Lh9o;->p()V

    :goto_a0
    return-object v1

    nop

    :pswitch_data_a2
    .packed-switch 0x0
        :pswitch_79
        :pswitch_4f
        :pswitch_25
    .end packed-switch
.end method
