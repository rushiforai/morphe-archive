.class public final synthetic Lcom/google/common/util/concurrent/UncaughtExceptionHandlers$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/util/concurrent/UncaughtExceptionHandlers$RuntimeWrapper;


# instance fields
.field public final synthetic f$0:Ljava/lang/Runtime;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runtime;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/util/concurrent/UncaughtExceptionHandlers$0;->f$0:Ljava/lang/Runtime;

    return-void
.end method


# virtual methods
.method public final exit(I)V
    .registers 2

    .line 0
    iget-object p0, p0, Lcom/google/common/util/concurrent/UncaughtExceptionHandlers$0;->f$0:Ljava/lang/Runtime;

    invoke-virtual {p0, p1}, Ljava/lang/Runtime;->exit(I)V

    return-void
.end method
