.class public final synthetic Le/e/a/CastRelay$Session$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/CastRelay$Session;"
    method = "lambda$accept$0"
    proto = "(Ljava/lang/Object;Ljava/net/Socket;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Le/e/a/CastRelay$Session;

.field public final synthetic f$1:Ljava/lang/Object;

.field public final synthetic f$2:Ljava/net/Socket;


# direct methods
.method public synthetic constructor <init>(Le/e/a/CastRelay$Session;Ljava/lang/Object;Ljava/net/Socket;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CastRelay$Session$0;->f$0:Le/e/a/CastRelay$Session;

    iput-object p2, p0, Le/e/a/CastRelay$Session$0;->f$1:Ljava/lang/Object;

    iput-object p3, p0, Le/e/a/CastRelay$Session$0;->f$2:Ljava/net/Socket;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/CastRelay$Session$0;->f$0:Le/e/a/CastRelay$Session;

    iget-object v1, p0, Le/e/a/CastRelay$Session$0;->f$1:Ljava/lang/Object;

    iget-object v2, p0, Le/e/a/CastRelay$Session$0;->f$2:Ljava/net/Socket;

    invoke-virtual {v0, v1, v2}, Le/e/a/CastRelay$Session;->lambda$accept$0$e-e-a-CastRelay$Session(Ljava/lang/Object;Ljava/net/Socket;)V

    return-void
.end method
