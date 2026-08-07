.class public final synthetic Lcom/appsflyer/internal/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/appsflyer/internal/AFe1wSDK;


# direct methods
.method public synthetic constructor <init>(Lcom/appsflyer/internal/AFe1wSDK;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/appsflyer/internal/a;->a:Lcom/appsflyer/internal/AFe1wSDK;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/appsflyer/internal/a;->a:Lcom/appsflyer/internal/AFe1wSDK;

    invoke-virtual {p0}, Lcom/appsflyer/internal/AFd1hSDK;->getMonetizationNetwork()Z

    return-void
.end method
