.class public final La1h;
.super Lorg/chromium/content/app/ContentChildProcessServiceDelegate;
.source "SourceFile"


# instance fields
.field public final synthetic e:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, La1h;->e:B

    invoke-direct {p0}, Lorg/chromium/content/app/ContentChildProcessServiceDelegate;-><init>()V

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 3

    iget-byte v0, p0, La1h;->e:B

    const/16 v1, 0x12

    packed-switch v0, :pswitch_data_32

    invoke-super {p0}, Lorg/chromium/content/app/ContentChildProcessServiceDelegate;->b()V

    sget-object p0, Lks3;->k:Lks3;

    iget-object v0, p0, Lks3;->g:Ljava/lang/Object;

    check-cast v0, Lqz5;

    invoke-interface {v0}, Lqz5;->d()V

    new-instance v0, Lfv2;

    invoke-direct {v0, p0, v1}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_1c
    invoke-super {p0}, Lorg/chromium/content/app/ContentChildProcessServiceDelegate;->b()V

    sget-object p0, Lks3;->k:Lks3;

    iget-object v0, p0, Lks3;->g:Ljava/lang/Object;

    check-cast v0, Lqz5;

    invoke-interface {v0}, Lqz5;->d()V

    new-instance v0, Lfv2;

    invoke-direct {v0, p0, v1}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->e(Ljava/lang/Runnable;)V

    return-void

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_1c
    .end packed-switch
.end method
