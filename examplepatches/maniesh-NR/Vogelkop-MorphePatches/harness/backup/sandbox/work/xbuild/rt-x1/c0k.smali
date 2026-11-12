.class public final synthetic Lc0k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ld0k;


# direct methods
.method public synthetic constructor <init>(Ld0k;B)V
    .registers 3

    iput-byte p2, p0, Lc0k;->a:B

    iput-object p1, p0, Lc0k;->b:Ld0k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lc0k;->a:B

    iget-object p0, p0, Lc0k;->b:Ld0k;

    packed-switch v0, :pswitch_data_18

    check-cast p1, Ltta;

    invoke-virtual {p0}, Ld0k;->Z()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0}, Ld0k;->Z()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
