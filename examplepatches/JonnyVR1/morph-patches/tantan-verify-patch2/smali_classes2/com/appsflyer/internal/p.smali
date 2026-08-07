.class public final synthetic Lcom/appsflyer/internal/p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/appsflyer/internal/AFd1ySDK;

.field public final synthetic b:Lcom/appsflyer/internal/AFh1sSDK;


# direct methods
.method public synthetic constructor <init>(Lcom/appsflyer/internal/AFd1ySDK;Lcom/appsflyer/internal/AFh1sSDK;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/appsflyer/internal/p;->a:Lcom/appsflyer/internal/AFd1ySDK;

    iput-object p2, p0, Lcom/appsflyer/internal/p;->b:Lcom/appsflyer/internal/AFh1sSDK;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/p;->a:Lcom/appsflyer/internal/AFd1ySDK;

    iget-object p0, p0, Lcom/appsflyer/internal/p;->b:Lcom/appsflyer/internal/AFh1sSDK;

    invoke-static {v0, p0}, Lcom/appsflyer/internal/AFd1ySDK;->c(Lcom/appsflyer/internal/AFd1ySDK;Lcom/appsflyer/internal/AFh1sSDK;)V

    return-void
.end method
