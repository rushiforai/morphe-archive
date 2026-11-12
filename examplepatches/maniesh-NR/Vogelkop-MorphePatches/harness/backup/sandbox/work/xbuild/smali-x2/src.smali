.class public final synthetic Lsrc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lurc;

.field public final synthetic c:Leq6;


# direct methods
.method public synthetic constructor <init>(Lurc;Leq6;B)V
    .registers 4

    iput-byte p3, p0, Lsrc;->a:B

    iput-object p1, p0, Lsrc;->b:Lurc;

    iput-object p2, p0, Lsrc;->c:Leq6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lsrc;->a:B

    iget-object v1, p0, Lsrc;->c:Leq6;

    iget-object p0, p0, Lsrc;->b:Lurc;

    check-cast p1, Lndc;

    packed-switch v0, :pswitch_data_24

    iget-object p0, p0, Lurc;->f:Lta7;

    iput-object v1, p0, Lta7;->m:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_12
    iget-object p0, p0, Lurc;->f:Lta7;

    iget-object p1, p0, Lta7;->m:Ljava/lang/Object;

    check-cast p1, Leq6;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_21

    const/4 p1, 0x0

    iput-object p1, p0, Lta7;->m:Ljava/lang/Object;

    :cond_21
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
