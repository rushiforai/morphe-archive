.class public final synthetic Lpnc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lsnc;


# direct methods
.method public synthetic constructor <init>(Lsnc;B)V
    .registers 3

    iput-byte p2, p0, Lpnc;->a:B

    iput-object p1, p0, Lpnc;->b:Lsnc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lpnc;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lpnc;->b:Lsnc;

    packed-switch v0, :pswitch_data_1e

    iget-object p0, p0, Lsnc;->b:Lwjh;

    invoke-static {p0, v1}, Lz5i;->o(Lwjh;Lt9f;)Lpna;

    move-result-object p0

    return-object p0

    :pswitch_f
    iget-object p0, p0, Lsnc;->b:Lwjh;

    invoke-static {p0, v1}, Lz5i;->o(Lwjh;Lt9f;)Lpna;

    move-result-object p0

    return-object p0

    :pswitch_16
    iget-object p0, p0, Lsnc;->b:Lwjh;

    invoke-static {p0, v1}, Lz5i;->o(Lwjh;Lt9f;)Lpna;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_16
        :pswitch_f
    .end packed-switch
.end method
