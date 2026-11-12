.class public final synthetic Lh7l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ln7l;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ln7l;IB)V
    .registers 4

    iput-byte p3, p0, Lh7l;->a:B

    iput-object p1, p0, Lh7l;->b:Ln7l;

    iput p2, p0, Lh7l;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lh7l;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_5a

    iget-object v0, p0, Lh7l;->b:Ln7l;

    iget p0, p0, Lh7l;->c:I

    check-cast p1, Lkotlin/Unit;

    invoke-virtual {v0}, Ln7l;->a()Lf58;

    move-result-object p1

    monitor-enter p1

    :try_start_12
    invoke-virtual {v0}, Ln7l;->a()Lf58;

    move-result-object v3

    iget-object v4, v3, Lf58;->a:Ly5i;

    new-instance v5, Lr95;

    invoke-direct {v5, p0, v3}, Lr95;-><init>(ILf58;)V

    invoke-static {v4, v1, v2, v5}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lm7l;

    if-eqz p0, :cond_33

    invoke-virtual {v0}, Ln7l;->a()Lf58;

    move-result-object v0

    iget-object v3, v0, Lf58;->a:Ly5i;

    new-instance v4, Lc58;

    invoke-direct {v4, v0, p0, v2}, Lc58;-><init>(Lf58;Lm7l;B)V

    invoke-static {v3, v2, v1, v4}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;
    :try_end_33
    .catchall {:try_start_12 .. :try_end_33} :catchall_35

    :cond_33
    monitor-exit p1

    return-object p0

    :catchall_35
    move-exception p0

    monitor-exit p1

    throw p0

    :pswitch_38
    iget-object v0, p0, Lh7l;->b:Ln7l;

    iget p0, p0, Lh7l;->c:I

    check-cast p1, Lkotlin/Unit;

    invoke-virtual {v0}, Ln7l;->a()Lf58;

    move-result-object p1

    monitor-enter p1

    :try_start_43
    invoke-virtual {v0}, Ln7l;->a()Lf58;

    move-result-object v0

    iget-object v3, v0, Lf58;->a:Ly5i;

    new-instance v4, Lr95;

    invoke-direct {v4, p0, v0}, Lr95;-><init>(ILf58;)V

    invoke-static {v3, v1, v2, v4}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lm7l;
    :try_end_54
    .catchall {:try_start_43 .. :try_end_54} :catchall_56

    monitor-exit p1

    return-object p0

    :catchall_56
    move-exception p0

    monitor-exit p1

    throw p0

    nop

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_38
    .end packed-switch
.end method
