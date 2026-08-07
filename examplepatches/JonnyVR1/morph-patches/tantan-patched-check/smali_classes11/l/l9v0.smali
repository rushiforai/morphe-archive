.class public final Ll/l9v0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/h9v0;

.field public final b:Ll/xvw0;


# direct methods
.method public constructor <init>(Ll/h9v0;Ll/xvw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l9v0;->a:Ll/h9v0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/l9v0;->b:Ll/xvw0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ll/kbw0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l9v0;->a:Ll/h9v0;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/j9v0;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/j9v0;-><init>(Ll/h9v0;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/l9v0;->b:Ll/xvw0;

    .line 12
    .line 13
    invoke-interface {v0, v1}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/k9v0;

    .line 18
    .line 19
    invoke-direct {v1, p0, p1}, Ll/k9v0;-><init>(Ll/l9v0;Ll/kbw0;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/l9v0;->b:Ll/xvw0;

    .line 23
    .line 24
    invoke-static {v0, v1, p0}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
