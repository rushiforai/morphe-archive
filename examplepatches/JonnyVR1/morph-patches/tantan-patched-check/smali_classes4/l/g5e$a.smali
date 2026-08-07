.class public Ll/g5e$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/g5e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/g5e;


# direct methods
.method public constructor <init>(Ll/g5e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g5e$a;->a:Ll/g5e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Landroid/os/StatFs;

    .line 3
    .line 4
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-direct {v1, v2}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    invoke-virtual {v1}, Landroid/os/StatFs;->getBlockSizeLong()J

    .line 20
    .line 21
    .line 22
    move-result-wide v4

    .line 23
    mul-long/2addr v2, v4

    .line 24
    invoke-static {}, Ll/g5e;->a()J

    .line 25
    .line 26
    .line 27
    move-result-wide v4

    .line 28
    div-long/2addr v2, v4

    .line 29
    iget-object v1, p0, Ll/g5e$a;->a:Ll/g5e;

    .line 30
    .line 31
    invoke-static {v1}, Ll/g5e;->b(Ll/g5e;)Ll/g5e$b;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget-object v1, v1, Ll/g5e$b;->e:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_1

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    check-cast v4, Ll/fpp0;

    .line 52
    .line 53
    iget-wide v5, v4, Ll/fpp0;->a:J

    .line 54
    .line 55
    cmp-long v5, v2, v5

    .line 56
    .line 57
    if-gtz v5, :cond_0

    .line 58
    .line 59
    move-object v0, v4

    .line 60
    :cond_1
    if-eqz v0, :cond_2

    .line 61
    .line 62
    iget-object v1, p0, Ll/g5e$a;->a:Ll/g5e;

    .line 63
    .line 64
    invoke-static {v1}, Ll/g5e;->b(Ll/g5e;)Ll/g5e$b;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iget-object v1, v1, Ll/g5e$b;->f:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-eqz v4, :cond_2

    .line 79
    .line 80
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    check-cast v4, Ll/f5e;

    .line 85
    .line 86
    iget-object v5, v0, Ll/fpp0;->c:Lcom/tantanapp/beatles/file/diskusage/WarningLevel;

    .line 87
    .line 88
    invoke-interface {v4, v2, v3, v5}, Ll/f5e;->a(JLcom/tantanapp/beatles/file/diskusage/WarningLevel;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :catch_0
    :cond_2
    if-nez v0, :cond_3

    .line 93
    .line 94
    sget-object v0, Ll/fpp0;->e:Ll/fpp0;

    .line 95
    .line 96
    :cond_3
    iget-wide v0, v0, Ll/fpp0;->b:J

    .line 97
    .line 98
    invoke-static {p0, v0, v1}, Ll/u21;->c(Ljava/lang/Runnable;J)V

    .line 99
    .line 100
    .line 101
    return-void
.end method
