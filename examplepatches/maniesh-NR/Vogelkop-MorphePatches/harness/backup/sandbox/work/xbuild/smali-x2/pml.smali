.class public final synthetic Lpml;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lra;


# direct methods
.method public synthetic constructor <init>(Lra;B)V
    .registers 3

    iput-byte p2, p0, Lpml;->a:B

    iput-object p1, p0, Lpml;->b:Lra;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lpml;->a:B

    iget-object p0, p0, Lpml;->b:Lra;

    packed-switch v0, :pswitch_data_1c

    invoke-virtual {p0, p1}, Lra;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt0i;

    return-object p0

    :pswitch_e
    invoke-virtual {p0, p1}, Lra;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt0i;

    return-object p0

    :pswitch_15
    invoke-virtual {p0, p1}, Lra;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt0i;

    return-object p0

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_15
        :pswitch_e
    .end packed-switch
.end method
