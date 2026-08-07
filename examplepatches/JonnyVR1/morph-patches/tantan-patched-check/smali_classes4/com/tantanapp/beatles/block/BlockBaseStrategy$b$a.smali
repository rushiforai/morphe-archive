.class public Lcom/tantanapp/beatles/block/BlockBaseStrategy$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

.field public final synthetic b:Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;


# direct methods
.method public constructor <init>(Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b$a;->b:Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b$a;->a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b$a;->b:Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b$a;->a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->p(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
