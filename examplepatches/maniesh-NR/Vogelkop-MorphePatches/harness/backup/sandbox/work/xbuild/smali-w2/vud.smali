.class public final synthetic Lvud;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpqh;

.field public final synthetic c:Lisd;

.field public final synthetic d:Lpqh;


# direct methods
.method public synthetic constructor <init>(Lpqh;Lisd;Lpqh;B)V
    .registers 5

    iput-byte p4, p0, Lvud;->a:B

    iput-object p1, p0, Lvud;->b:Lpqh;

    iput-object p2, p0, Lvud;->c:Lisd;

    iput-object p3, p0, Lvud;->d:Lpqh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lvud;->a:B

    iget-object v1, p0, Lvud;->d:Lpqh;

    iget-object v2, p0, Lvud;->c:Lisd;

    iget-object p0, p0, Lvud;->b:Lpqh;

    check-cast p1, Lpcc;

    packed-switch v0, :pswitch_data_38

    iput-object p1, p0, Lpqh;->a:Ljava/lang/Object;

    iget-object p0, v1, Lpqh;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Comparable;

    invoke-virtual {p1, p0}, Ljava/lang/Enum;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-lez v0, :cond_1a

    move-object p1, p0

    :cond_1a
    check-cast p1, Lpcc;

    invoke-virtual {v2, p1}, Lisd;->D(Lpcc;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_22
    iput-object p1, p0, Lpqh;->a:Ljava/lang/Object;

    iget-object p0, v1, Lpqh;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Comparable;

    invoke-virtual {p1, p0}, Ljava/lang/Enum;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-lez v0, :cond_2f

    move-object p1, p0

    :cond_2f
    check-cast p1, Lpcc;

    invoke-virtual {v2, p1}, Lisd;->D(Lpcc;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_22
    .end packed-switch
.end method
