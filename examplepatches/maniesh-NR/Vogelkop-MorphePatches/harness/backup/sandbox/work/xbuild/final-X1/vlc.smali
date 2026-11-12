.class public final synthetic Lvlc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwlc;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lwlc;Ljava/util/List;B)V
    .registers 4

    iput-byte p3, p0, Lvlc;->a:B

    iput-object p1, p0, Lvlc;->b:Lwlc;

    iput-object p2, p0, Lvlc;->c:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lvlc;->a:B

    iget-object v1, p0, Lvlc;->c:Ljava/util/List;

    iget-object p0, p0, Lvlc;->b:Lwlc;

    check-cast p1, Losk;

    packed-switch v0, :pswitch_data_1c

    iget-object p0, p0, Lwlc;->g:Lnb2;

    invoke-virtual {p0, p1, v1}, Lkfo;->P(Losk;Ljava/lang/Iterable;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    iget-object p0, p0, Lwlc;->b:Lnb2;

    invoke-virtual {p0, p1, v1}, Lkfo;->P(Losk;Ljava/lang/Iterable;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
