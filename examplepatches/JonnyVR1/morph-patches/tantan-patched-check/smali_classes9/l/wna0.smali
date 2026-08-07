.class public final synthetic Ll/wna0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final synthetic b:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wna0;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    iput-object p2, p0, Ll/wna0;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wna0;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object p0, p0, Ll/wna0;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->a0(Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/lang/Throwable;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
