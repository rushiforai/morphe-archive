.class public final synthetic Lo03;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lqie;


# direct methods
.method public synthetic constructor <init>(Lqie;B)V
    .registers 3

    iput-byte p2, p0, Lo03;->a:B

    iput-object p1, p0, Lo03;->b:Lqie;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lo03;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lo03;->b:Lqie;

    packed-switch v0, :pswitch_data_10

    invoke-virtual {p0, v1}, Lqie;->a(Z)V

    return-void

    :pswitch_c
    invoke-virtual {p0, v1}, Lqie;->a(Z)V

    return-void

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method
