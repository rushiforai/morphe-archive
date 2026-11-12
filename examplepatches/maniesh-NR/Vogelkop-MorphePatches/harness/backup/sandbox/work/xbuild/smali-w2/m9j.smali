.class public final synthetic Lm9j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ln9j;


# direct methods
.method public synthetic constructor <init>(Ln9j;B)V
    .registers 3

    iput-byte p2, p0, Lm9j;->a:B

    iput-object p1, p0, Lm9j;->b:Ln9j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lm9j;->a:B

    iget-object p0, p0, Lm9j;->b:Ln9j;

    check-cast p1, Ljava/util/List;

    packed-switch v0, :pswitch_data_22

    iput-object p1, p0, Ln9j;->p:Ljava/util/List;

    iget-boolean p1, p0, Ln9j;->n:Z

    if-eqz p1, :cond_12

    invoke-virtual {p0}, Ln9j;->u()V

    :cond_12
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_15
    iput-object p1, p0, Ln9j;->o:Ljava/util/List;

    iget-boolean p1, p0, Ln9j;->n:Z

    if-nez p1, :cond_1e

    invoke-virtual {p0}, Ln9j;->u()V

    :cond_1e
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method
