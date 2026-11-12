.class public final synthetic Le2l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzjj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpde;

.field public final synthetic c:Lb3c;


# direct methods
.method public synthetic constructor <init>(Lpde;Lb3c;B)V
    .registers 4

    iput-byte p3, p0, Le2l;->a:B

    iput-object p1, p0, Le2l;->b:Lpde;

    iput-object p2, p0, Le2l;->c:Lb3c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)Z
    .registers 6

    iget-byte v0, p0, Le2l;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object v3, p0, Le2l;->c:Lb3c;

    iget-object p0, p0, Le2l;->b:Lpde;

    packed-switch v0, :pswitch_data_2a

    check-cast p1, Lg2l;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v3, :cond_14

    move v1, v2

    :cond_14
    return v1

    :pswitch_15
    check-cast p1, Ll2l;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v3, :cond_1e

    move v1, v2

    :cond_1e
    return v1

    :pswitch_1f
    check-cast p1, Lu2l;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v3, :cond_28

    move v1, v2

    :cond_28
    return v1

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_15
    .end packed-switch
.end method
