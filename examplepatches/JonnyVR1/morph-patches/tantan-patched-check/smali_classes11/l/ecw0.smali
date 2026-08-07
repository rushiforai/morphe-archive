.class public abstract Ll/ecw0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ll/hpr;


# instance fields
.field public final a:Ll/xvw0;

.field public final b:Ljava/util/concurrent/ScheduledExecutorService;

.field public final c:Ll/fcw0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    sput-object v0, Ll/ecw0;->d:Ll/hpr;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ll/xvw0;Ljava/util/concurrent/ScheduledExecutorService;Ll/fcw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ecw0;->a:Ll/xvw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ecw0;->b:Ljava/util/concurrent/ScheduledExecutorService;

    .line 7
    .line 8
    iput-object p3, p0, Ll/ecw0;->c:Ll/fcw0;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic c(Ll/ecw0;)Ll/fcw0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ecw0;->c:Ll/fcw0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic d()Ll/hpr;
    .locals 1

    .line 1
    sget-object v0, Ll/ecw0;->d:Ll/hpr;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic e(Ll/ecw0;)Ll/xvw0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ecw0;->a:Ll/xvw0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic g(Ll/ecw0;)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ecw0;->b:Ljava/util/concurrent/ScheduledExecutorService;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final varargs a(Ljava/lang/Object;[Ll/hpr;)Ll/pbw0;
    .locals 2

    .line 1
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    new-instance v0, Ll/pbw0;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, p0, p1, p2, v1}, Ll/pbw0;-><init>(Ll/ecw0;Ljava/lang/Object;Ljava/util/List;Ll/obw0;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public final b(Ljava/lang/Object;Ll/hpr;)Ll/dcw0;
    .locals 8

    .line 1
    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v5

    .line 5
    new-instance v0, Ll/dcw0;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const/4 v7, 0x0

    .line 9
    move-object v6, p2

    .line 10
    move-object v1, p0

    .line 11
    move-object v2, p1

    .line 12
    move-object v4, p2

    .line 13
    invoke-direct/range {v0 .. v7}, Ll/dcw0;-><init>(Ll/ecw0;Ljava/lang/Object;Ljava/lang/String;Ll/hpr;Ljava/util/List;Ll/hpr;Ll/ccw0;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public abstract f(Ljava/lang/Object;)Ljava/lang/String;
.end method
