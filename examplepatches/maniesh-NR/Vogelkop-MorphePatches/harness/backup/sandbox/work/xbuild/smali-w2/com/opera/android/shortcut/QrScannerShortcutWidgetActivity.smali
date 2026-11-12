.class public final Lcom/opera/android/shortcut/QrScannerShortcutWidgetActivity;
.super Lwz5;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/opera/android/shortcut/QrScannerShortcutWidgetActivity;",
        "Lwz5;",
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


# direct methods
.method public constructor <init>()V
    .registers 4

    const v0, 0x7f110004

    const-string v1, "com.opera.android.action.SCAN_QR_CODE_FROM_SHORTCUT_WIDGET"

    const-string v2, "qrWidgetShortcut"

    invoke-direct {p0, v2, v0, v1}, Lwz5;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 3

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v0, "qr.google_lens_supported"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_13

    const p0, 0x7f110008

    return p0

    :cond_13
    const p0, 0x7f110004

    return p0
.end method

.method public final b()Ljava/lang/CharSequence;
    .registers 4

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "qr.google_lens_supported"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_13

    const v0, 0x7f1408ac

    goto :goto_16

    :cond_13
    const v0, 0x7f140ef4

    :goto_16
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
