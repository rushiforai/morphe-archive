.class public final synthetic Lcom/momo/xeengine/L/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/L/SDKLicenseManager;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/L/SDKLicenseManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/L/a;->a:Lcom/momo/xeengine/L/SDKLicenseManager;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/L/a;->a:Lcom/momo/xeengine/L/SDKLicenseManager;

    invoke-static {p0}, Lcom/momo/xeengine/L/SDKLicenseManager;->a(Lcom/momo/xeengine/L/SDKLicenseManager;)V

    return-void
.end method
