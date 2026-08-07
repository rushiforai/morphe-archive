.class public final Ll/xwu0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/cxu0;

.field public final b:Ljava/util/concurrent/Executor;

.field public final c:Ljava/util/Map;


# direct methods
.method public constructor <init>(Ll/cxu0;Ljava/util/concurrent/Executor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xwu0;->a:Ll/cxu0;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/cxu0;->g()Ljava/util/Map;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/xwu0;->c:Ljava/util/Map;

    .line 11
    .line 12
    iput-object p2, p0, Ll/xwu0;->b:Ljava/util/concurrent/Executor;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic b(Ll/xwu0;)Ll/cxu0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xwu0;->a:Ll/cxu0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic c(Ll/xwu0;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xwu0;->c:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic d(Ll/xwu0;)Ljava/util/concurrent/Executor;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xwu0;->b:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final a()Ll/wwu0;
    .locals 1

    .line 1
    new-instance v0, Ll/wwu0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wwu0;-><init>(Ll/xwu0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/wwu0;->a(Ll/wwu0;)Ll/wwu0;

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public final e()V
    .locals 2

    .line 1
    sget-object v0, Ll/sgs0;->bb:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/xwu0;->a()Ll/wwu0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v0, "action"

    .line 25
    .line 26
    const-string v1, "pecr"

    .line 27
    .line 28
    invoke-virtual {p0, v0, v1}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/wwu0;->g()V

    .line 32
    .line 33
    .line 34
    return-void
.end method
