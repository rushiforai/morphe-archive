.class public final synthetic Lccn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lo2g;


# direct methods
.method public synthetic constructor <init>(Lo2g;B)V
    .registers 3

    iput-byte p2, p0, Lccn;->a:B

    iput-object p1, p0, Lccn;->b:Lo2g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lccn;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lccn;->b:Lo2g;

    packed-switch v0, :pswitch_data_14

    sget-object v0, Lxbn;->d:Lxbn;

    invoke-virtual {p0, v0, v1}, Lo2g;->a(Ls75;Ljava/lang/Runnable;)V

    return-void

    :pswitch_e
    sget-object v0, Lybn;->d:Lybn;

    invoke-virtual {p0, v0, v1}, Lo2g;->a(Ls75;Ljava/lang/Runnable;)V

    return-void

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
