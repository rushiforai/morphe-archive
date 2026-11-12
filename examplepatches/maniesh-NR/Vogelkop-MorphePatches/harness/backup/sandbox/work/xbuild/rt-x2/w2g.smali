.class public final Lw2g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lozj;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lw2g;->a:B

    iput-object p1, p0, Lw2g;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 2

    iget-byte v0, p0, Lw2g;->a:B

    iget-object p0, p0, Lw2g;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_12

    check-cast p0, Ltqi;

    iget-object p0, p0, Ltqi;->g:Ljava/lang/String;

    return-object p0

    :pswitch_c
    check-cast p0, Ll2g;

    iget-object p0, p0, Ll2g;->f:Ljava/lang/String;

    return-object p0

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method

.method public final b()I
    .registers 2

    iget-byte v0, p0, Lw2g;->a:B

    iget-object p0, p0, Lw2g;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_12

    check-cast p0, Ltqi;

    iget p0, p0, Ltqi;->a:I

    return p0

    :pswitch_c
    check-cast p0, Ll2g;

    iget p0, p0, Ll2g;->a:I

    return p0

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method
