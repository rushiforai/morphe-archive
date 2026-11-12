.class public final synthetic Lulc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwlc;

.field public final synthetic c:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lwlc;Ljava/util/ArrayList;B)V
    .registers 4

    iput-byte p3, p0, Lulc;->a:B

    iput-object p1, p0, Lulc;->b:Lwlc;

    iput-object p2, p0, Lulc;->c:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lulc;->a:B

    iget-object v1, p0, Lulc;->c:Ljava/util/ArrayList;

    iget-object p0, p0, Lulc;->b:Lwlc;

    packed-switch v0, :pswitch_data_24

    check-cast p1, Losk;

    iget-object p0, p0, Lwlc;->i:Lnb2;

    invoke-virtual {p0, p1, v1}, Lkfo;->P(Losk;Ljava/lang/Iterable;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    check-cast p1, Lmt5;

    invoke-static {p0, v1, p1}, Lwlc;->a(Lwlc;Ljava/util/ArrayList;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1a
    check-cast p1, Losk;

    iget-object p0, p0, Lwlc;->d:Lnb2;

    invoke-virtual {p0, p1, v1}, Lkfo;->P(Losk;Ljava/lang/Iterable;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_13
    .end packed-switch
.end method
