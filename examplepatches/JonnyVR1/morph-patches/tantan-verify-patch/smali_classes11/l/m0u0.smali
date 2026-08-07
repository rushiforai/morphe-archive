.class public final Ll/m0u0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/joy0;


# instance fields
.field public final a:Ll/d8u0;

.field public final b:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final c:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>(Ll/d8u0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/m0u0;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    .line 12
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/m0u0;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 18
    .line 19
    iput-object p1, p0, Ll/m0u0;->a:Ll/d8u0;

    .line 20
    .line 21
    return-void
.end method

.method private final b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m0u0;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/m0u0;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/m0u0;->a:Ll/d8u0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/d8u0;->zza()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method


# virtual methods
.method public final M6()V
    .locals 0

    .line 1
    return-void
.end method

.method public final O()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/m0u0;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final P2()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m0u0;->a:Ll/d8u0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/d8u0;->zzc()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final a()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m0u0;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final g7()V
    .locals 0

    .line 1
    return-void
.end method

.method public final m4()V
    .locals 0

    .line 1
    return-void
.end method

.method public final m5(I)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/m0u0;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/m0u0;->b()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
