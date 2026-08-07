.class public final Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public a:Ll/utl;

.field public b:Ljava/lang/String;

.field public c:I

.field public d:J

.field public e:J


# direct methods
.method public constructor <init>(Ll/utl;JJLjava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$b;->a:Ll/utl;

    .line 5
    .line 6
    iput-object p6, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$b;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput p7, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$b;->c:I

    .line 9
    .line 10
    iput-wide p2, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$b;->d:J

    .line 11
    .line 12
    iput-wide p4, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$b;->e:J

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    new-instance v0, Ll/m4j;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$b;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget v2, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$b;->c:I

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/m4j;-><init>(Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$b;->a:Ll/utl;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$b;->b:Ljava/lang/String;

    .line 13
    .line 14
    invoke-interface {v1, v0, p0}, Ll/utl;->b(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
