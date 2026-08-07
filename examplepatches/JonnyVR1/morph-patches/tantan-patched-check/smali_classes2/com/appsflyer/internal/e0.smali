.class public final synthetic Lcom/appsflyer/internal/e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/appsflyer/internal/AFj1tSDK;


# direct methods
.method public synthetic constructor <init>(Lcom/appsflyer/internal/AFj1tSDK;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/appsflyer/internal/e0;->a:Lcom/appsflyer/internal/AFj1tSDK;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/appsflyer/internal/e0;->a:Lcom/appsflyer/internal/AFj1tSDK;

    invoke-static {p0}, Lcom/appsflyer/internal/AFj1tSDK;->c(Lcom/appsflyer/internal/AFj1tSDK;)V

    return-void
.end method
