.class public final synthetic Le12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lf12;


# direct methods
.method public synthetic constructor <init>(Lf12;B)V
    .registers 3

    iput-byte p2, p0, Le12;->a:B

    iput-object p1, p0, Le12;->b:Lf12;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Le12;->a:B

    iget-object p0, p0, Le12;->b:Lf12;

    packed-switch v0, :pswitch_data_10

    invoke-virtual {p0}, Lf12;->d()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Lf12;->h()V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
