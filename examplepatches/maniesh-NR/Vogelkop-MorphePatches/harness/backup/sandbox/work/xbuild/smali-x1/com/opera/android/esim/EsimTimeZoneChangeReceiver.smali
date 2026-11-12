.class public final Lcom/opera/android/esim/EsimTimeZoneChangeReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/opera/android/esim/EsimTimeZoneChangeReceiver;",
        "Landroid/content/BroadcastReceiver;",
        "<init>",
        "()V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic a:I


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 3

    invoke-static {p1}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_16

    if-eqz p2, :cond_d

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p0

    goto :goto_e

    :cond_d
    const/4 p0, 0x0

    :goto_e
    const-string p2, "android.intent.action.TIMEZONE_CHANGED"

    invoke-static {p0, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    :cond_16
    return-void

    :cond_17
    invoke-static {p1}, Lx4o;->c(Landroid/content/Context;)Lx4o;

    move-result-object p0

    new-instance p1, Ltn;

    const-class p2, Lcom/opera/android/esim/work/EsimPromotionWorker;

    invoke-direct {p1, p2}, Ltn;-><init>(Ljava/lang/Class;)V

    invoke-virtual {p1}, Ltn;->j()Loff;

    move-result-object p1

    const-string p2, "ESIMPR"

    invoke-virtual {p0, p2, p1}, Lx4o;->b(Ljava/lang/String;Loff;)V

    return-void
.end method
