.class public Ll/vn50$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/vn50;->j(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/concurrent/atomic/AtomicReference;

.field public final synthetic b:Ll/vn50$d;

.field public final synthetic c:Ll/vn50;


# direct methods
.method public constructor <init>(Ll/vn50;Ljava/util/concurrent/atomic/AtomicReference;Ll/vn50$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vn50$a;->c:Ll/vn50;

    .line 2
    .line 3
    iput-object p2, p0, Ll/vn50$a;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 4
    .line 5
    iput-object p3, p0, Ll/vn50$a;->b:Ll/vn50$d;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vn50$a;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/vn50$c;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/gcg0;->unsubscribe()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ll/vn50$a;->b:Ll/vn50$d;

    .line 15
    .line 16
    iget-object p0, p0, Ll/vn50$d;->b:Ljava/util/Collection;

    .line 17
    .line 18
    invoke-static {p0}, Ll/vn50;->k(Ljava/util/Collection;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
