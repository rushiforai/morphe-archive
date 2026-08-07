.class public final synthetic Ll/xrm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/facebook/appevents/iap/d;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Lcom/facebook/appevents/iap/InAppPurchaseUtils$IAPProductType;

.field public final synthetic d:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/appevents/iap/d;Ljava/lang/Runnable;Lcom/facebook/appevents/iap/InAppPurchaseUtils$IAPProductType;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xrm;->a:Lcom/facebook/appevents/iap/d;

    iput-object p2, p0, Ll/xrm;->b:Ljava/lang/Runnable;

    iput-object p3, p0, Ll/xrm;->c:Lcom/facebook/appevents/iap/InAppPurchaseUtils$IAPProductType;

    iput-object p4, p0, Ll/xrm;->d:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xrm;->a:Lcom/facebook/appevents/iap/d;

    iget-object v1, p0, Ll/xrm;->b:Ljava/lang/Runnable;

    iget-object v2, p0, Ll/xrm;->c:Lcom/facebook/appevents/iap/InAppPurchaseUtils$IAPProductType;

    iget-object p0, p0, Ll/xrm;->d:Ljava/util/List;

    invoke-static {v0, v1, v2, p0}, Lcom/facebook/appevents/iap/d;->c(Lcom/facebook/appevents/iap/d;Ljava/lang/Runnable;Lcom/facebook/appevents/iap/InAppPurchaseUtils$IAPProductType;Ljava/util/List;)V

    return-void
.end method
