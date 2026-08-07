.class public final synthetic Lcom/appsflyer/internal/i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/appsflyer/internal/AFd1dSDK;


# direct methods
.method public synthetic constructor <init>(Lcom/appsflyer/internal/AFd1dSDK;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/appsflyer/internal/i;->a:Lcom/appsflyer/internal/AFd1dSDK;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/appsflyer/internal/i;->a:Lcom/appsflyer/internal/AFd1dSDK;

    invoke-static {p0}, Lcom/appsflyer/internal/AFd1dSDK;->a(Lcom/appsflyer/internal/AFd1dSDK;)V

    return-void
.end method
