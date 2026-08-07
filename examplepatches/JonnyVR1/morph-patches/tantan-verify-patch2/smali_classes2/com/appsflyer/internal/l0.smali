.class public final synthetic Lcom/appsflyer/internal/l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/appsflyer/internal/AFj1vSDK;

.field public final synthetic b:Lcom/appsflyer/internal/AFi1gSDK;

.field public final synthetic c:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/appsflyer/internal/AFj1vSDK;Lcom/appsflyer/internal/AFi1gSDK;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/appsflyer/internal/l0;->a:Lcom/appsflyer/internal/AFj1vSDK;

    iput-object p2, p0, Lcom/appsflyer/internal/l0;->b:Lcom/appsflyer/internal/AFi1gSDK;

    iput-object p3, p0, Lcom/appsflyer/internal/l0;->c:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/l0;->a:Lcom/appsflyer/internal/AFj1vSDK;

    iget-object v1, p0, Lcom/appsflyer/internal/l0;->b:Lcom/appsflyer/internal/AFi1gSDK;

    iget-object p0, p0, Lcom/appsflyer/internal/l0;->c:Ljava/lang/Runnable;

    invoke-static {v0, v1, p0}, Lcom/appsflyer/internal/AFj1vSDK;->c(Lcom/appsflyer/internal/AFj1vSDK;Lcom/appsflyer/internal/AFi1gSDK;Ljava/lang/Runnable;)V

    return-void
.end method
