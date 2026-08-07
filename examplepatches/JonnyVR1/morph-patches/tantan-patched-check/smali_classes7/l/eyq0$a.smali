.class Ll/eyq0$a;
.super Ll/eyq0$d;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/eyq0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field d:Ljava/io/File;

.field final synthetic e:I

.field final synthetic f:Ljava/util/Date;

.field final synthetic g:Ljava/util/Date;

.field final synthetic h:Ljava/lang/String;

.field final synthetic i:Ljava/lang/String;

.field final synthetic j:Z

.field final synthetic k:Ll/eyq0;


# direct methods
.method public constructor <init>(Ll/eyq0;ILjava/util/Date;Ljava/util/Date;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eyq0$a;->k:Ll/eyq0;

    .line 2
    .line 3
    iput p2, p0, Ll/eyq0$a;->e:I

    .line 4
    .line 5
    iput-object p3, p0, Ll/eyq0$a;->f:Ljava/util/Date;

    .line 6
    .line 7
    iput-object p4, p0, Ll/eyq0$a;->g:Ljava/util/Date;

    .line 8
    .line 9
    iput-object p5, p0, Ll/eyq0$a;->h:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p6, p0, Ll/eyq0$a;->i:Ljava/lang/String;

    .line 12
    .line 13
    iput-boolean p7, p0, Ll/eyq0$a;->j:Z

    .line 14
    .line 15
    invoke-direct {p0, p1}, Ll/eyq0$d;-><init>(Ll/eyq0;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public b()V
    .locals 5

    .line 1
    :try_start_0
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, Ll/eyq0$a;->k:Ll/eyq0;

    .line 9
    .line 10
    invoke-static {v2}, Ll/eyq0;->a(Ll/eyq0;)Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, "/.logcache"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Ll/e6r0;->b(Ljava/io/File;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    new-instance v1, Ll/dyq0;

    .line 50
    .line 51
    invoke-direct {v1}, Ll/dyq0;-><init>()V

    .line 52
    .line 53
    .line 54
    iget v2, p0, Ll/eyq0$a;->e:I

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Ll/dyq0;->d(I)V

    .line 57
    .line 58
    .line 59
    iget-object v2, p0, Ll/eyq0$a;->k:Ll/eyq0;

    .line 60
    .line 61
    invoke-static {v2}, Ll/eyq0;->a(Ll/eyq0;)Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iget-object v3, p0, Ll/eyq0$a;->f:Ljava/util/Date;

    .line 66
    .line 67
    iget-object v4, p0, Ll/eyq0$a;->g:Ljava/util/Date;

    .line 68
    .line 69
    invoke-virtual {v1, v2, v3, v4, v0}, Ll/dyq0;->a(Landroid/content/Context;Ljava/util/Date;Ljava/util/Date;Ljava/io/File;)Ljava/io/File;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iput-object v0, p0, Ll/eyq0$a;->d:Ljava/io/File;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    .line 75
    :catch_0
    :cond_1
    :goto_0
    return-void
.end method

.method public c()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/eyq0$a;->d:Ljava/io/File;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/eyq0$a;->k:Ll/eyq0;

    .line 12
    .line 13
    invoke-static {v0}, Ll/eyq0;->b(Ll/eyq0;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/eyq0$e;

    .line 18
    .line 19
    iget-object v2, p0, Ll/eyq0$a;->k:Ll/eyq0;

    .line 20
    .line 21
    iget-object v3, p0, Ll/eyq0$a;->h:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v4, p0, Ll/eyq0$a;->i:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v5, p0, Ll/eyq0$a;->d:Ljava/io/File;

    .line 26
    .line 27
    iget-boolean v6, p0, Ll/eyq0$a;->j:Z

    .line 28
    .line 29
    invoke-direct/range {v1 .. v6}, Ll/eyq0$e;-><init>(Ll/eyq0;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Z)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object p0, p0, Ll/eyq0$a;->k:Ll/eyq0;

    .line 36
    .line 37
    const-wide/16 v0, 0x0

    .line 38
    .line 39
    invoke-static {p0, v0, v1}, Ll/eyq0;->h(Ll/eyq0;J)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
