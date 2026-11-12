.class public final synthetic Lscl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lesk;


# direct methods
.method public synthetic constructor <init>(Lesk;B)V
    .registers 3

    iput-byte p2, p0, Lscl;->a:B

    iput-object p1, p0, Lscl;->b:Lesk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lscl;->a:B

    iget-object p0, p0, Lscl;->b:Lesk;

    check-cast p1, Ljava/lang/Void;

    packed-switch v0, :pswitch_data_14

    invoke-interface {p0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_e
    invoke-interface {p0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
