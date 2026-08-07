.class public final Ll/sut0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


# instance fields
.field public final synthetic a:Ll/vut0;


# direct methods
.method public constructor <init>(Ll/vut0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sut0;->a:Ll/vut0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/sut0;->a:Ll/vut0;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ll/vut0;->g(Ll/vut0;Ljava/util/Map;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p1, p0, Ll/sut0;->a:Ll/vut0;

    .line 11
    .line 12
    invoke-static {p1}, Ll/vut0;->b(Ll/vut0;)Ljava/util/concurrent/Executor;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance p2, Ll/rut0;

    .line 17
    .line 18
    invoke-direct {p2, p0}, Ll/rut0;-><init>(Ll/sut0;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p1, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
