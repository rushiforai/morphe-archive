.class public final synthetic Lcom/appsflyer/internal/z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/appsflyer/internal/AFi1aSDK;

.field public final synthetic b:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/appsflyer/internal/AFi1aSDK;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/appsflyer/internal/z;->a:Lcom/appsflyer/internal/AFi1aSDK;

    iput-object p2, p0, Lcom/appsflyer/internal/z;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/z;->a:Lcom/appsflyer/internal/AFi1aSDK;

    iget-object p0, p0, Lcom/appsflyer/internal/z;->b:Landroid/content/Context;

    invoke-static {v0, p0}, Lcom/appsflyer/internal/AFi1aSDK;->a(Lcom/appsflyer/internal/AFi1aSDK;Landroid/content/Context;)V

    return-void
.end method
