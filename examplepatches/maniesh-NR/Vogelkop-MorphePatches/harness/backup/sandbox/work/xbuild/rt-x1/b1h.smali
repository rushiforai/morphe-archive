.class public abstract Lb1h;
.super Lzp5;
.source "SourceFile"


# instance fields
.field public final synthetic c:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lb1h;->c:B

    invoke-direct {p0}, Lzp5;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lorg/chromium/content/app/ContentChildProcessServiceDelegate;
    .registers 2

    iget-byte p0, p0, Lb1h;->c:B

    packed-switch p0, :pswitch_data_14

    new-instance p0, La1h;

    const/4 v0, 0x1

    invoke-direct {p0, v0}, La1h;-><init>(B)V

    return-object p0

    :pswitch_c
    new-instance p0, La1h;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, La1h;-><init>(B)V

    return-object p0

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method
