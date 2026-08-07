.class public final synthetic Lcom/appsflyer/internal/n0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/appsflyer/internal/AFj1xSDK;

.field public final synthetic b:Landroid/hardware/SensorEvent;


# direct methods
.method public synthetic constructor <init>(Lcom/appsflyer/internal/AFj1xSDK;Landroid/hardware/SensorEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/appsflyer/internal/n0;->a:Lcom/appsflyer/internal/AFj1xSDK;

    iput-object p2, p0, Lcom/appsflyer/internal/n0;->b:Landroid/hardware/SensorEvent;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/n0;->a:Lcom/appsflyer/internal/AFj1xSDK;

    iget-object p0, p0, Lcom/appsflyer/internal/n0;->b:Landroid/hardware/SensorEvent;

    invoke-static {v0, p0}, Lcom/appsflyer/internal/AFj1xSDK;->a(Lcom/appsflyer/internal/AFj1xSDK;Landroid/hardware/SensorEvent;)V

    return-void
.end method
