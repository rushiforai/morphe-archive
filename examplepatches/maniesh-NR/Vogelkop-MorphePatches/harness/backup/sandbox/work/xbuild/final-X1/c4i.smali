.class public final Lc4i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lg1b;


# direct methods
.method public constructor <init>(Lg1b;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lc4i;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc4i;->b:Lg1b;

    return-void
.end method

.method public constructor <init>(Lu4h;Lg1b;)V
    .registers 3

    const/4 p1, 0x0

    iput-byte p1, p0, Lc4i;->a:B

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lc4i;->b:Lg1b;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lc4i;->a:B

    iget-object p0, p0, Lc4i;->b:Lg1b;

    packed-switch v0, :pswitch_data_22

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    const/4 p0, 0x0

    return-object p0

    :pswitch_12
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc2i;

    iget-object p0, p0, Lc2i;->j:Ljava/lang/String;

    return-object p0

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
