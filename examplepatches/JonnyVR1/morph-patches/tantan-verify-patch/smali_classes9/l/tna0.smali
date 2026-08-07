.class public final synthetic Ll/tna0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;

.field public final synthetic b:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final synthetic c:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tna0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;

    iput-object p2, p0, Ll/tna0;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    iput-object p3, p0, Ll/tna0;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tna0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;

    iget-object v1, p0, Ll/tna0;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object p0, p0, Ll/tna0;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->X(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;Lcom/p1/mobile/putong/data/Media;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
