.class public final synthetic Lp8k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmo7;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lu8k;


# direct methods
.method public synthetic constructor <init>(Lu8k;B)V
    .registers 3

    iput-byte p2, p0, Lp8k;->a:B

    iput-object p1, p0, Lp8k;->b:Lu8k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final o(Z)V
    .registers 2

    iget-byte p1, p0, Lp8k;->a:B

    iget-object p0, p0, Lp8k;->b:Lu8k;

    packed-switch p1, :pswitch_data_10

    invoke-virtual {p0}, Lu8k;->c()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Lu8k;->c()V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
