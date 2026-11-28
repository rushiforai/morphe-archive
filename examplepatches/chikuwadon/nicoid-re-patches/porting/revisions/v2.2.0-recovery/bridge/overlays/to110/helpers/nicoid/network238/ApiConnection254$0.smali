.class public final synthetic Lnicoid/network238/ApiConnection254$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/okhttp3/Interceptor;


# instance fields
.field public final synthetic f$0:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/ApiConnection254$0;->f$0:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method


# virtual methods
.method public final intercept(Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Response;
    .registers 3

    .line 0
    iget-object v0, p0, Lnicoid/network238/ApiConnection254$0;->f$0:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-static {v0, p1}, Lnicoid/network238/ApiConnection254;->lambda$connect$0(Ljava/util/concurrent/atomic/AtomicBoolean;Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Response;

    move-result-object p1

    return-object p1
.end method
