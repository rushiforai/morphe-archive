.class public final synthetic Lcnc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhnc;


# direct methods
.method public synthetic constructor <init>(Lhnc;B)V
    .registers 3

    iput-byte p2, p0, Lcnc;->a:B

    iput-object p1, p0, Lcnc;->b:Lhnc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lcnc;->a:B

    iget-object p0, p0, Lcnc;->b:Lhnc;

    packed-switch v0, :pswitch_data_14

    check-cast p1, Landroid/net/Uri;

    invoke-virtual {p0}, Lhnc;->b()V

    return-void

    :pswitch_d
    check-cast p1, Ltpc;

    invoke-virtual {p0}, Lhnc;->b()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
