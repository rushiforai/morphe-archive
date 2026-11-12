.class public final synthetic Ldt3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljt3;


# direct methods
.method public synthetic constructor <init>(Ljt3;B)V
    .registers 3

    iput-byte p2, p0, Ldt3;->a:B

    iput-object p1, p0, Ldt3;->b:Ljt3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Ldt3;->a:B

    iget-object p0, p0, Ldt3;->b:Ljt3;

    packed-switch v0, :pswitch_data_10

    iget-object p0, p0, Ljt3;->h:Lb2l;

    return-object p0

    :pswitch_a
    iget-object p0, p0, Ljt3;->h:Lb2l;

    return-object p0

    :pswitch_d
    iget-object p0, p0, Ljt3;->h:Lb2l;

    return-object p0

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_d
        :pswitch_a
    .end packed-switch
.end method
