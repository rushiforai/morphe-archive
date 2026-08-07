.class public final synthetic Ll/joa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Media;

.field public final synthetic c:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final synthetic d:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;Lcom/p1/mobile/putong/data/Media;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/joa0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;

    iput-object p2, p0, Ll/joa0;->b:Lcom/p1/mobile/putong/data/Media;

    iput-object p3, p0, Ll/joa0;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    iput-object p4, p0, Ll/joa0;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/joa0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;

    iget-object v1, p0, Ll/joa0;->b:Lcom/p1/mobile/putong/data/Media;

    iget-object v2, p0, Ll/joa0;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object p0, p0, Ll/joa0;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->g0(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;Lcom/p1/mobile/putong/data/Media;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
