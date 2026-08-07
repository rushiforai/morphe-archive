.class public Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->b(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/utl;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;


# direct methods
.method public constructor <init>(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;Ll/utl;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$a;->c:Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$a;->a:Ll/utl;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$a;->a:Ll/utl;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {v0, p0}, Ll/utl;->a(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
