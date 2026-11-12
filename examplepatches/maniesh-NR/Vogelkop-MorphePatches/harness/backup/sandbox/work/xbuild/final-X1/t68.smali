.class public final synthetic Lt68;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/esim/ui/EsimActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/esim/ui/EsimActivity;B)V
    .registers 3

    iput-byte p2, p0, Lt68;->a:B

    iput-object p1, p0, Lt68;->b:Lcom/opera/android/esim/ui/EsimActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lt68;->a:B

    iget-object p0, p0, Lt68;->b:Lcom/opera/android/esim/ui/EsimActivity;

    packed-switch v0, :pswitch_data_38

    sget v0, Lcom/opera/android/esim/ui/EsimActivity;->f0:I

    iget-object p0, p0, Lcom/opera/android/esim/ui/EsimActivity;->R:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldp6;

    iget-object p0, p0, Ldp6;->q:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lql6;

    invoke-virtual {p0}, Lql6;->a()Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :pswitch_1e
    sget v0, Lcom/opera/android/esim/ui/EsimActivity;->f0:I

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->v:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldp6;

    return-object p0

    :pswitch_31
    iget-object p0, p0, Lcom/opera/android/esim/ui/EsimActivity;->U:Lv78;

    if-nez p0, :cond_36

    const/4 p0, 0x0

    :cond_36
    return-object p0

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_31
        :pswitch_1e
    .end packed-switch
.end method
