.class public Ll/ixg0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public final b:Ll/vfg0;

.field public volatile c:Z

.field public volatile d:Z

.field public volatile e:Z

.field public volatile f:Z

.field public volatile g:Z

.field public volatile h:Z

.field public volatile i:Ljava/lang/Exception;


# direct methods
.method public constructor <init>(Ll/vfg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ixg0;->b:Ll/vfg0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()Ll/vfg0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ixg0;->b:Ll/vfg0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-static {}, Ll/fig0;->a()V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0
.end method

.method public final b(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/ixg0;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    instance-of v0, p1, LSudchar/Sudnew;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iput-boolean v1, p0, Ll/ixg0;->c:Z

    .line 12
    .line 13
    iput-object p1, p0, Ll/ixg0;->i:Ljava/lang/Exception;

    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    instance-of v0, p1, LSudchar/Sudcase;

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iput-boolean v1, p0, Ll/ixg0;->e:Z

    .line 21
    .line 22
    iput-object p1, p0, Ll/ixg0;->i:Ljava/lang/Exception;

    .line 23
    .line 24
    return-void

    .line 25
    :cond_2
    sget-object v0, LSudchar/Sudif;->Suddo:LSudchar/Sudif;

    .line 26
    .line 27
    if-ne p1, v0, :cond_3

    .line 28
    .line 29
    iput-boolean v1, p0, Ll/ixg0;->g:Z

    .line 30
    .line 31
    return-void

    .line 32
    :cond_3
    instance-of v0, p1, LSudchar/Sudint;

    .line 33
    .line 34
    if-eqz v0, :cond_4

    .line 35
    .line 36
    iput-boolean v1, p0, Ll/ixg0;->h:Z

    .line 37
    .line 38
    iput-object p1, p0, Ll/ixg0;->i:Ljava/lang/Exception;

    .line 39
    .line 40
    return-void

    .line 41
    :cond_4
    sget-object v0, LSudchar/Sudfor;->Suddo:LSudchar/Sudfor;

    .line 42
    .line 43
    if-eq p1, v0, :cond_5

    .line 44
    .line 45
    iput-boolean v1, p0, Ll/ixg0;->f:Z

    .line 46
    .line 47
    iput-object p1, p0, Ll/ixg0;->i:Ljava/lang/Exception;

    .line 48
    .line 49
    instance-of p0, p1, Ljava/net/SocketException;

    .line 50
    .line 51
    if-nez p0, :cond_5

    .line 52
    .line 53
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    :cond_5
    :goto_0
    return-void
.end method

.method public final c()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ixg0;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/ixg0;->d:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/ixg0;->e:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-boolean v0, p0, Ll/ixg0;->f:Z

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-boolean v0, p0, Ll/ixg0;->g:Z

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-boolean p0, p0, Ll/ixg0;->h:Z

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method
