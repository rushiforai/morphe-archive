.class public final synthetic Ljj8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkj8;


# direct methods
.method public synthetic constructor <init>(Lkj8;B)V
    .registers 3

    iput-byte p2, p0, Ljj8;->a:B

    iput-object p1, p0, Ljj8;->b:Lkj8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Ljj8;->a:B

    iget-object p0, p0, Ljj8;->b:Lkj8;

    packed-switch v0, :pswitch_data_2c

    iget-object v0, p0, Lkj8;->b:Lypd;

    iget-object p0, p0, Lkj8;->c:Ll2l;

    iget p0, p0, Ll2l;->b:I

    invoke-virtual {v0, p0}, Lypd;->E(I)Lb2l;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    iget-object v0, p0, Lkj8;->b:Lypd;

    iget-object p0, p0, Lkj8;->c:Ll2l;

    iget p0, p0, Ll2l;->b:I

    invoke-virtual {v0, p0}, Lypd;->p0(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1f
    iget-object v0, p0, Lkj8;->b:Lypd;

    iget-object p0, p0, Lkj8;->c:Ll2l;

    iget p0, p0, Ll2l;->b:I

    invoke-virtual {v0, p0}, Lypd;->q(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_13
    .end packed-switch
.end method
