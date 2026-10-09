.class public final synthetic Le/e/a/CachePlayback$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/CachePlayback;"
    method = "lambda$start$1"
    proto = "(Ljava/net/Socket;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/net/Socket;


# direct methods
.method public synthetic constructor <init>(Ljava/net/Socket;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CachePlayback$0;->f$0:Ljava/net/Socket;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/CachePlayback$0;->f$0:Ljava/net/Socket;

    invoke-static {v0}, Le/e/a/CachePlayback;->lambda$start$1(Ljava/net/Socket;)V

    return-void
.end method
