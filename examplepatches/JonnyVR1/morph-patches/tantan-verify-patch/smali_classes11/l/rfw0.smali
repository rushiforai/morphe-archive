.class public final Ll/rfw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ufw0;


# static fields
.field public static final f:Ll/rfw0;


# instance fields
.field public final a:Ll/sgw0;

.field public b:Ljava/util/Date;

.field public c:Z

.field public final d:Ll/vfw0;

.field public e:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/rfw0;

    .line 2
    .line 3
    new-instance v1, Ll/vfw0;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/vfw0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/rfw0;-><init>(Ll/vfw0;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Ll/rfw0;->f:Ll/rfw0;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Ll/vfw0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/sgw0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/sgw0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/rfw0;->a:Ll/sgw0;

    .line 10
    .line 11
    iput-object p1, p0, Ll/rfw0;->d:Ll/vfw0;

    .line 12
    .line 13
    return-void
.end method

.method public static b()Ll/rfw0;
    .locals 1

    .line 1
    sget-object v0, Ll/rfw0;->f:Ll/rfw0;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public final a(Z)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/rfw0;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    new-instance v0, Ljava/util/Date;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/rfw0;->b:Ljava/util/Date;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    :cond_0
    iput-object v0, p0, Ll/rfw0;->b:Ljava/util/Date;

    .line 23
    .line 24
    iget-boolean v0, p0, Ll/rfw0;->c:Z

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-static {}, Ll/tfw0;->a()Ll/tfw0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/tfw0;->b()Ljava/util/Collection;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Ll/kfw0;

    .line 51
    .line 52
    invoke-virtual {v1}, Ll/kfw0;->g()Ll/kgw0;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {p0}, Ll/rfw0;->c()Ljava/util/Date;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v1, v2}, Ll/kgw0;->e(Ljava/util/Date;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    iput-boolean p1, p0, Ll/rfw0;->e:Z

    .line 65
    .line 66
    return-void
.end method

.method public final c()Ljava/util/Date;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rfw0;->b:Ljava/util/Date;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/Date;->clone()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/util/Date;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public final d(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-boolean v0, p0, Ll/rfw0;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/rfw0;->d:Ll/vfw0;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/vfw0;->d(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/rfw0;->d:Ll/vfw0;

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Ll/vfw0;->e(Ll/ufw0;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/rfw0;->d:Ll/vfw0;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/vfw0;->f()V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/rfw0;->d:Ll/vfw0;

    .line 21
    .line 22
    iget-boolean p1, p1, Ll/vfw0;->b:Z

    .line 23
    .line 24
    iput-boolean p1, p0, Ll/rfw0;->e:Z

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    iput-boolean p1, p0, Ll/rfw0;->c:Z

    .line 28
    .line 29
    :cond_0
    return-void
.end method
