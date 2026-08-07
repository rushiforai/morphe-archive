.class public final synthetic Ll/ox0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ox0;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p2, p0, Ll/ox0;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ox0;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object p0, p0, Ll/ox0;->b:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    invoke-static {v0, p0, p1}, Ll/tx0;->b(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/VerificationCenter;)V

    return-void
.end method
