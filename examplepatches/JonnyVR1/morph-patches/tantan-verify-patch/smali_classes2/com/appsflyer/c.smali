.class public final synthetic Lcom/appsflyer/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:[Lcom/appsflyer/internal/AFh1ySDK;


# direct methods
.method public synthetic constructor <init>([Lcom/appsflyer/internal/AFh1ySDK;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/appsflyer/c;->a:[Lcom/appsflyer/internal/AFh1ySDK;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/appsflyer/c;->a:[Lcom/appsflyer/internal/AFh1ySDK;

    invoke-static {p0}, Lcom/appsflyer/AFLogger;->b([Lcom/appsflyer/internal/AFh1ySDK;)V

    return-void
.end method
