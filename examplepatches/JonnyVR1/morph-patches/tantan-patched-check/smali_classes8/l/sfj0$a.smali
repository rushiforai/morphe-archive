.class public Ll/sfj0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/sfj0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field public static final e:Ljava/lang/Object;

.field public static f:I

.field public static g:Ll/sfj0$a;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/Object;

.field public c:Ll/sfj0$a;

.field public volatile d:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/sfj0$a;->e:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/sfj0$a;->d:Z

    .line 6
    .line 7
    return-void
.end method

.method public static bridge synthetic a(Ll/sfj0$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sfj0$a;->a:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/sfj0$a;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sfj0$a;->b:Ljava/lang/Object;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/sfj0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sfj0$a;->j()V

    return-void
.end method

.method public static e()Ll/sfj0$a;
    .locals 3

    .line 1
    sget-object v0, Ll/sfj0$a;->e:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/sfj0$a;->g:Ll/sfj0$a;

    .line 5
    .line 6
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    sget-object v1, Ll/sfj0$a;->g:Ll/sfj0$a;

    .line 13
    .line 14
    iget-object v2, v1, Ll/sfj0$a;->c:Ll/sfj0$a;

    .line 15
    .line 16
    sput-object v2, Ll/sfj0$a;->g:Ll/sfj0$a;

    .line 17
    .line 18
    sget v2, Ll/sfj0$a;->f:I

    .line 19
    .line 20
    add-int/lit8 v2, v2, -0x1

    .line 21
    .line 22
    sput v2, Ll/sfj0$a;->f:I

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    iput-object v2, v1, Ll/sfj0$a;->c:Ll/sfj0$a;

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    iput-boolean v2, v1, Ll/sfj0$a;->d:Z

    .line 29
    .line 30
    monitor-exit v0

    .line 31
    return-object v1

    .line 32
    :catchall_0
    move-exception v1

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    new-instance v0, Ll/sfj0$a;

    .line 36
    .line 37
    invoke-direct {v0}, Ll/sfj0$a;-><init>()V

    .line 38
    .line 39
    .line 40
    return-object v0

    .line 41
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    throw v1
.end method

.method public static f(Ljava/lang/String;I)Ll/sfj0$a;
    .locals 1

    .line 1
    invoke-static {}, Ll/sfj0$a;->e()Ll/sfj0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/sfj0$a;->d(Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Ll/sfj0$a;->l(I)Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static g(Ljava/lang/String;J)Ll/sfj0$a;
    .locals 1

    .line 1
    invoke-static {}, Ll/sfj0$a;->e()Ll/sfj0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/sfj0$a;->d(Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1, p2}, Ll/sfj0$a;->m(J)Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;
    .locals 1

    .line 1
    invoke-static {}, Ll/sfj0$a;->e()Ll/sfj0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/sfj0$a;->d(Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Ll/sfj0$a;->n(Ljava/lang/String;)Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static i(Ljava/lang/String;Z)Ll/sfj0$a;
    .locals 1

    .line 1
    invoke-static {}, Ll/sfj0$a;->e()Ll/sfj0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/sfj0$a;->d(Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Ll/sfj0$a;->o(Z)Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public d(Ljava/lang/String;)Ll/sfj0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sfj0$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/sfj0$a;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/sfj0$a;->k()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final k()V
    .locals 4

    .line 1
    sget-object v0, Ll/sfj0$a;->e:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/sfj0$a;->d:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v1, 0x1

    .line 13
    iput-boolean v1, p0, Ll/sfj0$a;->d:Z

    .line 14
    .line 15
    sget v2, Ll/sfj0$a;->f:I

    .line 16
    .line 17
    const/16 v3, 0xa

    .line 18
    .line 19
    if-ge v2, v3, :cond_1

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    iput-object v3, p0, Ll/sfj0$a;->a:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v3, p0, Ll/sfj0$a;->b:Ljava/lang/Object;

    .line 25
    .line 26
    sget-object v3, Ll/sfj0$a;->g:Ll/sfj0$a;

    .line 27
    .line 28
    iput-object v3, p0, Ll/sfj0$a;->c:Ll/sfj0$a;

    .line 29
    .line 30
    sput-object p0, Ll/sfj0$a;->g:Ll/sfj0$a;

    .line 31
    .line 32
    add-int/2addr v2, v1

    .line 33
    sput v2, Ll/sfj0$a;->f:I

    .line 34
    .line 35
    :cond_1
    monitor-exit v0

    .line 36
    return-void

    .line 37
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    throw p0
.end method

.method public l(I)Ll/sfj0$a;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/sfj0$a;->b:Ljava/lang/Object;

    .line 6
    .line 7
    return-object p0
.end method

.method public m(J)Ll/sfj0$a;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/sfj0$a;->b:Ljava/lang/Object;

    .line 6
    .line 7
    return-object p0
.end method

.method public n(Ljava/lang/String;)Ll/sfj0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sfj0$a;->b:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Z)Ll/sfj0$a;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/sfj0$a;->b:Ljava/lang/Object;

    .line 6
    .line 7
    return-object p0
.end method
