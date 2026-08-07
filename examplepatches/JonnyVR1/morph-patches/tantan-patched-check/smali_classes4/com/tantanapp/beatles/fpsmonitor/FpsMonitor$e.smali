.class public Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# static fields
.field private static INSTANCE:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;-><init>(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$a;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$e;->INSTANCE:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a()Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$e;->INSTANCE:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 2
    .line 3
    return-object v0
.end method
