.class public final Ll/qcv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcv0;


# instance fields
.field public final a:Ll/pcv0;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final b:Ll/eow0;


# direct methods
.method public constructor <init>(Ll/pcv0;Ll/eow0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qcv0;->a:Ll/pcv0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/qcv0;->b:Ll/eow0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ll/b7w0;Ll/q6w0;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qcv0;->a:Ll/pcv0;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/pcv0;->a(Ll/b7w0;Ll/q6w0;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final b(Ll/b7w0;Ll/q6w0;)Ll/hpr;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qcv0;->a:Ll/pcv0;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2}, Ll/pcv0;->b(Ll/b7w0;Ll/q6w0;)Ll/hpr;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Ll/qcv0;->b:Ll/eow0;

    .line 8
    .line 9
    sget-object p2, Ll/oct0;->a:Ll/xvw0;

    .line 10
    .line 11
    invoke-static {p1, p0, p2}, Ll/pvw0;->m(Ll/hpr;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
