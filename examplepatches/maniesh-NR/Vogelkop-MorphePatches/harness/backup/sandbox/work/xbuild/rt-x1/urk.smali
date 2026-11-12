.class public final synthetic Lurk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvrk;


# direct methods
.method public synthetic constructor <init>(Lvrk;B)V
    .registers 3

    iput-byte p2, p0, Lurk;->a:B

    iput-object p1, p0, Lurk;->b:Lvrk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lurk;->a:B

    iget-object p0, p0, Lurk;->b:Lvrk;

    packed-switch v0, :pswitch_data_1a

    sget-object v0, Lsrk;->b:Lsrk;

    invoke-virtual {p0, v0}, Lc63;->j0(Ljava/lang/Object;)V

    invoke-virtual {p0}, Landroidx/fragment/app/i;->dismiss()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_12
    sget-object v0, Lsrk;->a:Lsrk;

    invoke-virtual {p0, v0}, Lc63;->j0(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
