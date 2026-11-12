.class public final Lqf2;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/r;Lztn;Lcom/opera/android/history/f;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lqf2;->a:B

    .line 13
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 14
    iput-object p1, p0, Lqf2;->b:Ljava/lang/Object;

    .line 15
    iput-object p2, p0, Lqf2;->c:Ljava/lang/Object;

    .line 16
    iput-object p3, p0, Lqf2;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ltn;Lszk;Lmi8;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lqf2;->a:B

    iput-object p1, p0, Lqf2;->d:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    iput-object p2, p0, Lqf2;->c:Ljava/lang/Object;

    iput-object p3, p0, Lqf2;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 4

    iget-byte p1, p0, Lqf2;->a:B

    iget-object v0, p0, Lqf2;->c:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_3e

    check-cast v0, Lztn;

    iget-object p1, p0, Lqf2;->b:Ljava/lang/Object;

    check-cast p1, Landroidx/fragment/app/r;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Landroid/text/format/DateFormat;->getTimeFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object p1

    iput-object p1, v0, Lztn;->i:Ljava/text/DateFormat;

    iget-object p0, p0, Lqf2;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/history/f;

    iget-object p0, p0, Lcom/opera/android/history/f;->f:Lcom/opera/android/history/d;

    iget-object p0, p0, Loy;->b:Ljava/lang/Object;

    check-cast p0, Lysi;

    invoke-interface {p0}, Lysi;->l()V

    return-void

    :pswitch_24
    const-string p1, "android.media.AUDIO_BECOMING_NOISY"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3c

    check-cast v0, Lszk;

    new-instance p1, Lq02;

    const/16 p2, 0xe

    invoke-direct {p1, p0, p2}, Lq02;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Lszk;->c(Ljava/lang/Runnable;)V

    :cond_3c
    return-void

    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_24
    .end packed-switch
.end method
