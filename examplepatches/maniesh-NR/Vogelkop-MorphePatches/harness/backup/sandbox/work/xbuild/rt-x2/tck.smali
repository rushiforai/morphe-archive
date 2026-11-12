.class public final synthetic Ltck;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lev7;

.field public final synthetic c:Luck;


# direct methods
.method public synthetic constructor <init>(Lev7;Luck;B)V
    .registers 4

    iput-byte p3, p0, Ltck;->a:B

    iput-object p1, p0, Ltck;->b:Lev7;

    iput-object p2, p0, Ltck;->c:Luck;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Ltck;->a:B

    iget-object v1, p0, Ltck;->c:Luck;

    iget-object p0, p0, Ltck;->b:Lev7;

    packed-switch v0, :pswitch_data_34

    iget-object p0, p0, Lev7;->e:Ljava/lang/Object;

    check-cast p0, Lypd;

    iget-object v0, v1, Luck;->b:Lsck;

    iget v0, v0, Lsck;->a:I

    invoke-virtual {p0, v0}, Lypd;->E(I)Lb2l;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_17
    iget-object p0, p0, Lev7;->e:Ljava/lang/Object;

    check-cast p0, Lypd;

    iget-object v0, v1, Luck;->b:Lsck;

    iget v0, v0, Lsck;->a:I

    invoke-virtual {p0, v0}, Lypd;->p0(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_25
    iget-object p0, p0, Lev7;->e:Ljava/lang/Object;

    check-cast p0, Lypd;

    iget-object v0, v1, Luck;->b:Lsck;

    iget v0, v0, Lsck;->a:I

    invoke-virtual {p0, v0}, Lypd;->q(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_25
        :pswitch_17
    .end packed-switch
.end method
