.class public final synthetic Lcom/appsflyer/internal/j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/appsflyer/internal/AFj1vSDK;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/appsflyer/internal/AFj1vSDK;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/appsflyer/internal/j0;->a:Lcom/appsflyer/internal/AFj1vSDK;

    iput-object p2, p0, Lcom/appsflyer/internal/j0;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/j0;->a:Lcom/appsflyer/internal/AFj1vSDK;

    iget-object p0, p0, Lcom/appsflyer/internal/j0;->b:Ljava/lang/Runnable;

    invoke-static {v0, p0}, Lcom/appsflyer/internal/AFj1vSDK;->d(Lcom/appsflyer/internal/AFj1vSDK;Ljava/lang/Runnable;)V

    return-void
.end method
