.class public final synthetic Lz3g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(BI)V
    .registers 3

    iput-byte p1, p0, Lz3g;->a:B

    iput p2, p0, Lz3g;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .registers 3

    iget-byte v0, p0, Lz3g;->a:B

    packed-switch v0, :pswitch_data_2c

    check-cast p1, Laln;

    invoke-interface {p1}, Laln;->f()I

    move-result p1

    iget p0, p0, Lz3g;->b:I

    if-ne p1, p0, :cond_11

    const/4 p0, 0x1

    goto :goto_12

    :cond_11
    const/4 p0, 0x0

    :goto_12
    return p0

    :pswitch_13
    check-cast p1, Li7j;

    iget p1, p1, Li7j;->a:I

    iget p0, p0, Lz3g;->b:I

    if-ne p1, p0, :cond_1d

    const/4 p0, 0x1

    goto :goto_1e

    :cond_1d
    const/4 p0, 0x0

    :goto_1e
    return p0

    :pswitch_1f
    check-cast p1, Lw3g;

    iget p1, p1, Lw3g;->a:I

    iget p0, p0, Lz3g;->b:I

    if-ne p1, p0, :cond_29

    const/4 p0, 0x1

    goto :goto_2a

    :cond_29
    const/4 p0, 0x0

    :goto_2a
    return p0

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_13
    .end packed-switch
.end method
