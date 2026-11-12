.class public final synthetic Lovl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lp12;


# direct methods
.method public synthetic constructor <init>(Lp12;B)V
    .registers 3

    iput-byte p2, p0, Lovl;->a:B

    iput-object p1, p0, Lovl;->b:Lp12;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lovl;->a:B

    iget-object p0, p0, Lovl;->b:Lp12;

    packed-switch v0, :pswitch_data_10

    const/4 v0, 0x0

    iput-object v0, p0, Lp12;->g:Ljava/lang/Object;

    return-void

    :pswitch_b
    const/4 v0, 0x0

    iput-object v0, p0, Lp12;->f:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
