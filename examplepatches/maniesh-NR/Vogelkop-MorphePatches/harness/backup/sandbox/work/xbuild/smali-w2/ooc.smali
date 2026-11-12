.class public final Looc;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Ldr9;


# instance fields
.field public final synthetic t:B

.field public synthetic u:Z

.field public synthetic v:Ljava/lang/Object;

.field public synthetic w:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILmt5;B)V
    .registers 4

    iput-byte p3, p0, Looc;->t:B

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Looc;->t:B

    packed-switch v0, :pswitch_data_66

    iget-boolean v0, p0, Looc;->u:Z

    iget-object v1, p0, Looc;->v:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    check-cast v1, Ljava/util/Set;

    iget-object p0, p0, Looc;->w:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    check-cast p0, Ljava/util/List;

    sget-object v2, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    if-eqz v0, :cond_3e

    check-cast p0, Ljava/lang/Iterable;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_25
    :goto_25
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_40

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljoc;

    iget-object v2, v2, Ljoc;->b:Lapc;

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_25

    :cond_3e
    sget-object p1, Ll08;->a:Ll08;

    :cond_40
    return-object p1

    :pswitch_41
    iget-object v0, p0, Looc;->v:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    iget-object v1, p0, Looc;->w:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Boolean;

    iget-boolean p0, p0, Looc;->u:Z

    sget-object v2, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_60

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_60

    if-eqz p0, :cond_60

    const/4 p0, 0x1

    goto :goto_61

    :cond_60
    const/4 p0, 0x0

    :goto_61
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_41
    .end packed-switch
.end method

.method public final j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    iget-byte p0, p0, Looc;->t:B

    const/4 v0, 0x4

    check-cast p1, Ljava/lang/Boolean;

    packed-switch p0, :pswitch_data_46

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    check-cast p2, Ljava/util/Set;

    check-cast p3, Ljava/util/List;

    check-cast p4, Lmt5;

    new-instance p1, Looc;

    const/4 v1, 0x1

    invoke-direct {p1, v0, p4, v1}, Looc;-><init>(ILmt5;B)V

    iput-boolean p0, p1, Looc;->u:Z

    check-cast p2, Ljava/util/Set;

    iput-object p2, p1, Looc;->v:Ljava/lang/Object;

    check-cast p3, Ljava/util/List;

    iput-object p3, p1, Looc;->w:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p1, p0}, Looc;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_29
    check-cast p2, Ljava/lang/Boolean;

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    check-cast p4, Lmt5;

    new-instance p3, Looc;

    const/4 v1, 0x0

    invoke-direct {p3, v0, p4, v1}, Looc;-><init>(ILmt5;B)V

    iput-object p1, p3, Looc;->v:Ljava/lang/Object;

    iput-object p2, p3, Looc;->w:Ljava/lang/Object;

    iput-boolean p0, p3, Looc;->u:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p3, p0}, Looc;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_29
    .end packed-switch
.end method
