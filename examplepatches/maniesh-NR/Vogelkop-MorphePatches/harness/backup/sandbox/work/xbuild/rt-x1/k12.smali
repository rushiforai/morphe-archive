.class public final synthetic Lk12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpjn;


# direct methods
.method public synthetic constructor <init>(Lpjn;B)V
    .registers 3

    iput-byte p2, p0, Lk12;->a:B

    iput-object p1, p0, Lk12;->b:Lpjn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lk12;->a:B

    const v1, 0x7f140800

    iget-object p0, p0, Lk12;->b:Lpjn;

    packed-switch v0, :pswitch_data_2a

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_15

    const v1, 0x7f141429

    :cond_15
    invoke-virtual {p0, v1}, Lpjn;->m(I)V

    return-void

    :pswitch_19
    check-cast p1, Landroid/net/Uri;

    if-nez p1, :cond_21

    invoke-virtual {p0, v1}, Lpjn;->m(I)V

    goto :goto_28

    :cond_21
    invoke-static {}, Lorg/chromium/ui/base/Clipboard;->getInstance()Lorg/chromium/ui/base/Clipboard;

    move-result-object p0

    invoke-virtual {p0, p1}, Lorg/chromium/ui/base/Clipboard;->e(Landroid/net/Uri;)V

    :goto_28
    return-void

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method
