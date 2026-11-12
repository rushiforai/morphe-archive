.class public final synthetic Lu68;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/esim/ui/EsimActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/esim/ui/EsimActivity;B)V
    .registers 3

    iput-byte p2, p0, Lu68;->a:B

    iput-object p1, p0, Lu68;->b:Lcom/opera/android/esim/ui/EsimActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lu68;->a:B

    iget-object p0, p0, Lu68;->b:Lcom/opera/android/esim/ui/EsimActivity;

    check-cast p1, Ljava/lang/String;

    packed-switch v0, :pswitch_data_26

    new-instance v0, Lorg/chromium/url/GURL;

    invoke-direct {v0, p1}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    sget p1, Lcom/opera/android/esim/ui/EsimActivity;->f0:I

    invoke-virtual {p0, v0}, Lcom/opera/android/FullscreenWebActivity;->q0(Lorg/chromium/url/GURL;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_16
    iget-object p0, p0, Lcom/opera/android/esim/ui/EsimActivity;->Y:Ls9i;

    if-nez p0, :cond_1b

    const/4 p0, 0x0

    :cond_1b
    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/webcore/WebcoreRpcBridge;

    invoke-virtual {p0, p1}, Lcom/opera/android/webcore/WebcoreRpcBridge;->a(Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method
