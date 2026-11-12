.class public final synthetic Lro3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwo3;


# direct methods
.method public synthetic constructor <init>(Lwo3;B)V
    .registers 3

    iput-byte p2, p0, Lro3;->a:B

    iput-object p1, p0, Lro3;->b:Lwo3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lro3;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lro3;->b:Lwo3;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    packed-switch v0, :pswitch_data_28

    iget-object p0, p0, Lwo3;->G:Lwf;

    invoke-virtual {p0, p1}, Ldt1;->H(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkv2;

    if-eqz p0, :cond_1a

    iget-object v1, p0, Lkv2;->a:Lpc;

    :cond_1a
    return-object v1

    :pswitch_1b
    iget-object p0, p0, Lwo3;->F:Lwf;

    invoke-virtual {p0, p1}, Ldt1;->H(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvf;

    if-eqz p0, :cond_27

    iget-object v1, p0, Lvf;->a:Lpc;

    :cond_27
    return-object v1

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method
