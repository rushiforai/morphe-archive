.class public final synthetic Los8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lts8;


# direct methods
.method public synthetic constructor <init>(Lts8;B)V
    .registers 3

    iput-byte p2, p0, Los8;->a:B

    iput-object p1, p0, Los8;->b:Lts8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Los8;->a:B

    iget-object p0, p0, Los8;->b:Lts8;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    packed-switch v0, :pswitch_data_14

    invoke-virtual {p0}, Lu5k;->A()V

    return-void

    :pswitch_10
    invoke-virtual {p0}, Lu5k;->A()V

    return-void

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
