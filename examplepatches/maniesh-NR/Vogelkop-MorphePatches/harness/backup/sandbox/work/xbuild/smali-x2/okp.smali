.class public final synthetic Lokp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;IB)V
    .registers 4

    iput-byte p3, p0, Lokp;->a:B

    iput-object p1, p0, Lokp;->c:Ljava/lang/Object;

    iput p2, p0, Lokp;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lokp;->a:B

    iget-object v1, p0, Lokp;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_28

    check-cast v1, Liro;

    iget-object p0, v1, Liro;->b:Lrii;

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lyhp;

    iget-object v0, p0, Lyhp;->a:Laip;

    const/4 v1, 0x7

    iput v1, v0, Laip;->e:I

    iget v1, v0, Laip;->i:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Laip;->i:I

    invoke-virtual {p0}, Lyhp;->a()V

    return-void

    :pswitch_1e
    check-cast v1, Lads_mobile_sdk/wl3;

    iget p0, p0, Lokp;->b:I

    add-int/lit8 p0, p0, 0x1

    invoke-virtual {v1, p0}, Lads_mobile_sdk/wl3;->c(I)Lef9;

    return-void

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
