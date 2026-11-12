.class public final synthetic Lgw7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpde;


# direct methods
.method public synthetic constructor <init>(Lpde;B)V
    .registers 3

    iput-byte p2, p0, Lgw7;->a:B

    iput-object p1, p0, Lgw7;->b:Lpde;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lgw7;->a:B

    iget-object p0, p0, Lgw7;->b:Lpde;

    packed-switch v0, :pswitch_data_1e

    goto :goto_f

    :pswitch_8
    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    return-object p0

    :goto_f
    :pswitch_f
    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    return-object p0

    :pswitch_16
    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltta;

    return-object p0

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_16
        :pswitch_f
        :pswitch_16
        :pswitch_8
    .end packed-switch
.end method
