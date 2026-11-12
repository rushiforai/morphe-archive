.class public final synthetic Ld2l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx2l;


# direct methods
.method public synthetic constructor <init>(Lx2l;B)V
    .registers 3

    iput-byte p2, p0, Ld2l;->a:B

    iput-object p1, p0, Ld2l;->b:Lx2l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Ld2l;->a:B

    iget-object p0, p0, Ld2l;->b:Lx2l;

    packed-switch v0, :pswitch_data_18

    iget-object p0, p0, Lx2l;->m:Lh5k;

    invoke-virtual {p0}, Lh5k;->f()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f
    iget-object p0, p0, Lx2l;->m:Lh5k;

    invoke-virtual {p0}, Lh5k;->f()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
