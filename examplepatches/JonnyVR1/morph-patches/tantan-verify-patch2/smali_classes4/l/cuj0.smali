.class public final synthetic Ll/cuj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/duj0;

.field public final synthetic b:Ll/bmq;

.field public final synthetic c:Ljava/lang/Thread;

.field public final synthetic d:Ljava/lang/Throwable;

.field public final synthetic e:Z

.field public final synthetic f:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public synthetic constructor <init>(Ll/duj0;Ll/bmq;Ljava/lang/Thread;Ljava/lang/Throwable;ZLjava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cuj0;->a:Ll/duj0;

    iput-object p2, p0, Ll/cuj0;->b:Ll/bmq;

    iput-object p3, p0, Ll/cuj0;->c:Ljava/lang/Thread;

    iput-object p4, p0, Ll/cuj0;->d:Ljava/lang/Throwable;

    iput-boolean p5, p0, Ll/cuj0;->e:Z

    iput-object p6, p0, Ll/cuj0;->f:Ljava/util/concurrent/CountDownLatch;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/cuj0;->a:Ll/duj0;

    iget-object v1, p0, Ll/cuj0;->b:Ll/bmq;

    iget-object v2, p0, Ll/cuj0;->c:Ljava/lang/Thread;

    iget-object v3, p0, Ll/cuj0;->d:Ljava/lang/Throwable;

    iget-boolean v4, p0, Ll/cuj0;->e:Z

    iget-object v5, p0, Ll/cuj0;->f:Ljava/util/concurrent/CountDownLatch;

    invoke-static/range {v0 .. v5}, Ll/duj0;->a(Ll/duj0;Ll/bmq;Ljava/lang/Thread;Ljava/lang/Throwable;ZLjava/util/concurrent/CountDownLatch;)V

    return-void
.end method
