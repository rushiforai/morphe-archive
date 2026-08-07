.class public final synthetic Lcom/appsflyer/internal/r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Observer;


# instance fields
.field public final synthetic a:Lcom/appsflyer/internal/AFj1zSDK;

.field public final synthetic b:Lcom/appsflyer/internal/AFf1hSDK;


# direct methods
.method public synthetic constructor <init>(Lcom/appsflyer/internal/AFj1zSDK;Lcom/appsflyer/internal/AFf1hSDK;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/appsflyer/internal/r;->a:Lcom/appsflyer/internal/AFj1zSDK;

    iput-object p2, p0, Lcom/appsflyer/internal/r;->b:Lcom/appsflyer/internal/AFf1hSDK;

    return-void
.end method


# virtual methods
.method public final update(Ljava/util/Observable;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/r;->a:Lcom/appsflyer/internal/AFj1zSDK;

    iget-object p0, p0, Lcom/appsflyer/internal/r;->b:Lcom/appsflyer/internal/AFf1hSDK;

    invoke-static {v0, p0, p1, p2}, Lcom/appsflyer/internal/AFf1hSDK;->a(Lcom/appsflyer/internal/AFj1zSDK;Lcom/appsflyer/internal/AFf1hSDK;Ljava/util/Observable;Ljava/lang/Object;)V

    return-void
.end method
