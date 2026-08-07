.class public final Ll/f7x0;
.super Landroid/database/ContentObserver;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/x4x0;


# direct methods
.method public constructor <init>(Ll/x4x0;Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f7x0;->a:Ll/x4x0;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-direct {p0, p1}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final onChange(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f7x0;->a:Ll/x4x0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/x4x0;->b(Ll/x4x0;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
