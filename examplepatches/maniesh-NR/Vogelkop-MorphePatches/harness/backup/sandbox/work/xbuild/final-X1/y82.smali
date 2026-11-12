.class public final synthetic Ly82;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lf92;


# direct methods
.method public synthetic constructor <init>(Lf92;B)V
    .registers 3

    iput-byte p2, p0, Ly82;->a:B

    iput-object p1, p0, Ly82;->b:Lf92;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Ly82;->a:B

    iget-object p0, p0, Ly82;->b:Lf92;

    packed-switch v0, :pswitch_data_12

    invoke-virtual {p0}, Lf92;->a()Lu82;

    move-result-object p0

    return-object p0

    :pswitch_c
    invoke-virtual {p0}, Lf92;->b()Ld53;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method
