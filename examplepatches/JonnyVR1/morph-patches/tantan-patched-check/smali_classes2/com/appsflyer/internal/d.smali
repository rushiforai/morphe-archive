.class public final synthetic Lcom/appsflyer/internal/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/appsflyer/internal/AFb1tSDK;


# direct methods
.method public synthetic constructor <init>(Lcom/appsflyer/internal/AFb1tSDK;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/appsflyer/internal/d;->a:Lcom/appsflyer/internal/AFb1tSDK;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/appsflyer/internal/d;->a:Lcom/appsflyer/internal/AFb1tSDK;

    invoke-static {p0}, Lcom/appsflyer/internal/AFb1tSDK;->a(Lcom/appsflyer/internal/AFb1tSDK;)V

    return-void
.end method
