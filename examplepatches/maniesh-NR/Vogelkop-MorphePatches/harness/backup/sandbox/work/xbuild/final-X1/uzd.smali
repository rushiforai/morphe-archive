.class public final synthetic Luzd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lb0e;


# direct methods
.method public synthetic constructor <init>(Lb0e;B)V
    .registers 3

    iput-byte p2, p0, Luzd;->a:B

    iput-object p1, p0, Luzd;->b:Lb0e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Luzd;->a:B

    iget-object p0, p0, Luzd;->b:Lb0e;

    packed-switch v0, :pswitch_data_18

    iget-object p0, p0, Lb0e;->k:Lrn9;

    invoke-virtual {p0}, Lrn9;->N()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f
    iget-object p0, p0, Lb0e;->k:Lrn9;

    invoke-virtual {p0}, Lrn9;->N()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
