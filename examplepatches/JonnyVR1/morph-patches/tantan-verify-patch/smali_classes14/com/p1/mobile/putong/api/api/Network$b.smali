.class public Lcom/p1/mobile/putong/api/api/Network$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/api/api/Network;->smAntiFraudInit(Ljava/util/TreeMap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/Thread;

.field public final synthetic b:Landroid/os/Handler;

.field public final synthetic c:Lcom/p1/mobile/putong/api/api/Network;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/api/api/Network;Ljava/lang/Thread;Landroid/os/Handler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/api/api/Network$b;->c:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/api/api/Network$b;->a:Ljava/lang/Thread;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/api/api/Network$b;->b:Landroid/os/Handler;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/Network$b;->a:Ljava/lang/Thread;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/Network$b;->b:Landroid/os/Handler;

    .line 7
    .line 8
    const-wide/16 v1, 0x64

    .line 9
    .line 10
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method
