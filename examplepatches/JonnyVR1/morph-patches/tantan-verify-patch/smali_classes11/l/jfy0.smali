.class public final Ll/jfy0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/h0y0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/cit0;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/h0y0;

    .line 5
    .line 6
    invoke-direct {v0, p1, p2}, Ll/h0y0;-><init>(Landroid/content/Context;Ll/cit0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/jfy0;->a:Ll/h0y0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a(Ll/q9y0;)Ll/jfy0;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jfy0;->a:Ll/h0y0;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/h0y0;->q:Z

    .line 4
    .line 5
    xor-int/lit8 v1, v1, 0x1

    .line 6
    .line 7
    invoke-static {v1}, Ll/lev0;->f(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/zyx0;

    .line 14
    .line 15
    invoke-direct {v1, p1}, Ll/zyx0;-><init>(Ll/q9y0;)V

    .line 16
    .line 17
    .line 18
    iput-object v1, v0, Ll/h0y0;->f:Ll/fpw0;

    .line 19
    .line 20
    return-object p0
.end method

.method public final b(Ll/t5z0;)Ll/jfy0;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jfy0;->a:Ll/h0y0;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/h0y0;->q:Z

    .line 4
    .line 5
    xor-int/lit8 v1, v1, 0x1

    .line 6
    .line 7
    invoke-static {v1}, Ll/lev0;->f(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/d0y0;

    .line 14
    .line 15
    invoke-direct {v1, p1}, Ll/d0y0;-><init>(Ll/t5z0;)V

    .line 16
    .line 17
    .line 18
    iput-object v1, v0, Ll/h0y0;->e:Ll/fpw0;

    .line 19
    .line 20
    return-object p0
.end method

.method public final c()Ll/mfy0;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jfy0;->a:Ll/h0y0;

    .line 2
    .line 3
    iget-boolean v0, p0, Ll/h0y0;->q:Z

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    xor-int/2addr v0, v1

    .line 7
    invoke-static {v0}, Ll/lev0;->f(Z)V

    .line 8
    .line 9
    .line 10
    iput-boolean v1, p0, Ll/h0y0;->q:Z

    .line 11
    .line 12
    new-instance v0, Ll/mfy0;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/mfy0;-><init>(Ll/h0y0;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method
