.class public final synthetic Lr63;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lam9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lk24;


# direct methods
.method public synthetic constructor <init>(Lk24;B)V
    .registers 3

    iput-byte p2, p0, Lr63;->a:B

    iput-object p1, p0, Lr63;->b:Lk24;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onBackStackChanged()V
    .registers 2

    iget-byte v0, p0, Lr63;->a:B

    iget-object p0, p0, Lr63;->b:Lk24;

    packed-switch v0, :pswitch_data_14

    check-cast p0, Lltl;

    invoke-virtual {p0}, Lltl;->D0()V

    return-void

    :pswitch_d
    check-cast p0, Ls63;

    invoke-virtual {p0}, Ls63;->x0()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
