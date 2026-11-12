.class public final synthetic Lwk6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmo7;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lyk6;


# direct methods
.method public synthetic constructor <init>(Lyk6;B)V
    .registers 3

    iput-byte p2, p0, Lwk6;->a:B

    iput-object p1, p0, Lwk6;->b:Lyk6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final o(Z)V
    .registers 3

    iget-byte v0, p0, Lwk6;->a:B

    iget-object p0, p0, Lwk6;->b:Lyk6;

    packed-switch v0, :pswitch_data_14

    if-nez p1, :cond_c

    invoke-virtual {p0}, Lyk6;->e()V

    :cond_c
    return-void

    :pswitch_d
    if-nez p1, :cond_12

    invoke-virtual {p0}, Lyk6;->e()V

    :cond_12
    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
