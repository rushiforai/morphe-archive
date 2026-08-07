.class public Lrx/internal/util/ScalarSynchronousObservable$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/util/ScalarSynchronousObservable$b;->a(Ll/x20;)Ll/kcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Ll/f2e0$a;

.field public final synthetic c:Lrx/internal/util/ScalarSynchronousObservable$b;


# direct methods
.method public constructor <init>(Lrx/internal/util/ScalarSynchronousObservable$b;Ll/x20;Ll/f2e0$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/util/ScalarSynchronousObservable$b$a;->c:Lrx/internal/util/ScalarSynchronousObservable$b;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/internal/util/ScalarSynchronousObservable$b$a;->a:Ll/x20;

    .line 4
    .line 5
    iput-object p3, p0, Lrx/internal/util/ScalarSynchronousObservable$b$a;->b:Ll/f2e0$a;

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
    :try_start_0
    iget-object v0, p0, Lrx/internal/util/ScalarSynchronousObservable$b$a;->a:Ll/x20;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/x20;->call()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lrx/internal/util/ScalarSynchronousObservable$b$a;->b:Ll/f2e0$a;

    .line 7
    .line 8
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    iget-object p0, p0, Lrx/internal/util/ScalarSynchronousObservable$b$a;->b:Ll/f2e0$a;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 16
    .line 17
    .line 18
    throw v0
.end method
