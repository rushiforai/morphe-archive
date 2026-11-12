.class public final synthetic Lgp7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lnr5;

.field public final synthetic c:Lv4b;


# direct methods
.method public synthetic constructor <init>(Lnr5;Lv4b;B)V
    .registers 4

    iput-byte p3, p0, Lgp7;->a:B

    iput-object p1, p0, Lgp7;->b:Lnr5;

    iput-object p2, p0, Lgp7;->c:Lv4b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lgp7;->a:B

    packed-switch v0, :pswitch_data_38

    iget-object v0, p0, Lgp7;->b:Lnr5;

    iget-object p0, p0, Lgp7;->c:Lv4b;

    check-cast p1, Lndc;

    iget-object p1, v0, Lnr5;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    monitor-enter p1

    :try_start_10
    iget-object v0, v0, Lnr5;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_17
    .catchall {:try_start_10 .. :try_end_17} :catchall_1b

    monitor-exit p1

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :catchall_1b
    move-exception p0

    monitor-exit p1

    throw p0

    :pswitch_1e
    iget-object v0, p0, Lgp7;->b:Lnr5;

    iget-object p0, p0, Lgp7;->c:Lv4b;

    check-cast p1, Lndc;

    iget-object p1, v0, Lnr5;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    monitor-enter p1

    :try_start_29
    iget-object v0, v0, Lnr5;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_30
    .catchall {:try_start_29 .. :try_end_30} :catchall_34

    monitor-exit p1

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :catchall_34
    move-exception p0

    monitor-exit p1

    throw p0

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
