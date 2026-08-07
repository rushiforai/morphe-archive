.class public final synthetic Lcom/appsflyer/internal/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/appsflyer/internal/AFb1tSDK;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Lcom/appsflyer/internal/AFb1tSDK;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/appsflyer/internal/f;->a:Lcom/appsflyer/internal/AFb1tSDK;

    iput-object p2, p0, Lcom/appsflyer/internal/f;->b:Landroid/content/Context;

    iput-object p3, p0, Lcom/appsflyer/internal/f;->c:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/f;->a:Lcom/appsflyer/internal/AFb1tSDK;

    iget-object v1, p0, Lcom/appsflyer/internal/f;->b:Landroid/content/Context;

    iget-object p0, p0, Lcom/appsflyer/internal/f;->c:Landroid/content/Intent;

    invoke-static {v0, v1, p0}, Lcom/appsflyer/internal/AFb1tSDK;->c(Lcom/appsflyer/internal/AFb1tSDK;Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method
