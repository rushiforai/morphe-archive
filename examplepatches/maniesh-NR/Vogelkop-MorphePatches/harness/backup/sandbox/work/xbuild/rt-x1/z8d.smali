.class public final Lz8d;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Ldr9;


# instance fields
.field public final synthetic t:B

.field public synthetic u:Z

.field public synthetic v:Ljava/lang/Object;

.field public synthetic w:Ljava/lang/Object;

.field public final synthetic x:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLmt5;Ljava/lang/Object;)V
    .registers 4

    iput-byte p1, p0, Lz8d;->t:B

    iput-object p3, p0, Lz8d;->x:Ljava/lang/Object;

    const/4 p1, 0x4

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lz8d;->t:B

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_7a

    iget-object v0, p0, Lz8d;->v:Ljava/lang/Object;

    check-cast v0, Ls5h;

    iget-object v2, p0, Lz8d;->w:Ljava/lang/Object;

    check-cast v2, Lnsl;

    iget-boolean v3, p0, Lz8d;->u:Z

    sget-object v4, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Luij;

    const/4 v4, 0x0

    if-nez v3, :cond_34

    iget-object p0, p0, Lz8d;->x:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    invoke-static {p0, v2}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_34

    sget-object p0, Lnsl;->e:Lnsl;

    if-eq v2, p0, :cond_32

    sget-object p0, Lnsl;->f:Lnsl;

    if-eq v2, p0, :cond_32

    sget-object p0, Lnsl;->g:Lnsl;

    if-ne v2, p0, :cond_34

    :cond_32
    move p0, v1

    goto :goto_35

    :cond_34
    move p0, v4

    :goto_35
    sget-object v3, Lnsl;->f:Lnsl;

    if-eq v2, v3, :cond_3f

    sget-object v3, Lnsl;->g:Lnsl;

    if-eq v2, v3, :cond_3f

    move v3, v4

    goto :goto_40

    :cond_3f
    move v3, v1

    :goto_40
    sget-object v5, Lnsl;->g:Lnsl;

    if-eq v2, v5, :cond_45

    move v1, v4

    :cond_45
    invoke-direct {p1, p0, v3, v1, v0}, Luij;-><init>(ZZZLs5h;)V

    return-object p1

    :pswitch_49
    iget-object v0, p0, Lz8d;->v:Ljava/lang/Object;

    check-cast v0, Lu8d;

    iget-boolean v2, p0, Lz8d;->u:Z

    iget-object p0, p0, Lz8d;->w:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    sget-object v3, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Lv8d;

    if-eqz v2, :cond_5f

    sget-object v1, Llyi;->a:Llyi;

    goto :goto_75

    :cond_5f
    if-nez v0, :cond_64

    sget-object v1, Llyi;->a:Llyi;

    goto :goto_75

    :cond_64
    iget-byte v2, v0, Lu8d;->a:B

    if-eq v2, v1, :cond_73

    const/4 v1, 0x3

    if-eq v2, v1, :cond_73

    if-eqz p0, :cond_70

    sget-object v1, Llyi;->b:Llyi;

    goto :goto_75

    :cond_70
    sget-object v1, Llyi;->b:Llyi;

    goto :goto_75

    :cond_73
    sget-object v1, Llyi;->a:Llyi;

    :goto_75
    invoke-direct {p1, v0, v1, p0}, Lv8d;-><init>(Lu8d;Llyi;Ljava/lang/Integer;)V

    return-object p1

    nop

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_49
    .end packed-switch
.end method

.method public final j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Lz8d;->t:B

    iget-object p0, p0, Lz8d;->x:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_4a

    check-cast p1, Ls5h;

    check-cast p2, Lnsl;

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    check-cast p4, Lmt5;

    new-instance v0, Lz8d;

    check-cast p0, Ljava/util/List;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p4, p0}, Lz8d;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, v0, Lz8d;->v:Ljava/lang/Object;

    iput-object p2, v0, Lz8d;->w:Ljava/lang/Object;

    iput-boolean p3, v0, Lz8d;->u:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lz8d;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_28
    check-cast p1, Lu8d;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    check-cast p3, Ljava/lang/Integer;

    check-cast p4, Lmt5;

    new-instance v0, Lz8d;

    check-cast p0, La9d;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p4, p0}, Lz8d;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object p1, v0, Lz8d;->v:Ljava/lang/Object;

    iput-boolean p2, v0, Lz8d;->u:Z

    iput-object p3, v0, Lz8d;->w:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lz8d;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_28
    .end packed-switch
.end method
