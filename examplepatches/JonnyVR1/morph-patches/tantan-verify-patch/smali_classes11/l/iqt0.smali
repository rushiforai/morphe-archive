.class public final Ll/iqt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hrw0;


# instance fields
.field public final a:Ll/ont0;

.field public b:Ll/s5u0;

.field public c:Ll/kgr0;


# direct methods
.method public synthetic constructor <init>(Ll/ont0;Ll/hqt0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/iqt0;->a:Ll/ont0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final synthetic a(Ll/kgr0;)Ll/hrw0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/iqt0;->c:Ll/kgr0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic b(Ll/s5u0;)Ll/hrw0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/iqt0;->b:Ll/s5u0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzc()Ll/rix0;
    .locals 11

    .line 1
    iget-object v0, p0, Ll/iqt0;->b:Ll/s5u0;

    .line 2
    .line 3
    const-class v1, Ll/s5u0;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/iqt0;->c:Ll/kgr0;

    .line 9
    .line 10
    const-class v1, Ll/kgr0;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 13
    .line 14
    .line 15
    new-instance v2, Ll/kqt0;

    .line 16
    .line 17
    iget-object v4, p0, Ll/iqt0;->c:Ll/kgr0;

    .line 18
    .line 19
    new-instance v5, Ll/b1u0;

    .line 20
    .line 21
    invoke-direct {v5}, Ll/b1u0;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v6, Ll/lxu0;

    .line 25
    .line 26
    invoke-direct {v6}, Ll/lxu0;-><init>()V

    .line 27
    .line 28
    .line 29
    iget-object v7, p0, Ll/iqt0;->b:Ll/s5u0;

    .line 30
    .line 31
    iget-object v3, p0, Ll/iqt0;->a:Ll/ont0;

    .line 32
    .line 33
    const/4 v9, 0x0

    .line 34
    const/4 v10, 0x0

    .line 35
    const/4 v8, 0x0

    .line 36
    invoke-direct/range {v2 .. v10}, Ll/kqt0;-><init>(Ll/ont0;Ll/kgr0;Ll/b1u0;Ll/lxu0;Ll/s5u0;Ll/c4w0;Ll/z2w0;Ll/jqt0;)V

    .line 37
    .line 38
    .line 39
    return-object v2
.end method
