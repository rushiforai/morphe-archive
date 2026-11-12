.class public Lcom/opera/android/vpn/VpnFailedToConnectService;
.super Lzp5;
.source "SourceFile"


# static fields
.field public static final c:Lbp;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lbp;

    const-class v1, Lcom/opera/android/vpn/VpnFailedToConnectService;

    invoke-direct {v0, v1}, Lbp;-><init>(Ljava/lang/Class;)V

    sput-object v0, Lcom/opera/android/vpn/VpnFailedToConnectService;->c:Lbp;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    sget-object v0, Lcom/opera/android/vpn/VpnFailedToConnectService;->c:Lbp;

    invoke-direct {p0, v0}, Lzp5;-><init>(Lbp;)V

    return-void
.end method


# virtual methods
.method public final onCreate()V
    .registers 3

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    invoke-static {p0}, Lwwc;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lwwc;->f(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v0

    invoke-static {p0, v0}, Lwwc;->h(Landroid/content/Context;Ljava/util/Locale;)Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lcgh;->l(ILandroid/content/Context;)Landroid/app/Notification;

    move-result-object v0

    const/16 v1, 0x1a4

    invoke-virtual {p0, v0, v1}, Lzp5;->b(Landroid/app/Notification;I)V

    return-void
.end method
