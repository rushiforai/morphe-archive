.class public final Ll/zjx0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:J

.field public c:Z

.field public d:J

.field public final synthetic e:Ll/ajx0;


# direct methods
.method public constructor <init>(Ll/ajx0;Ljava/lang/String;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zjx0;->e:Ll/ajx0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Ll/zjx0;->a:Ljava/lang/String;

    .line 10
    .line 11
    iput-wide p3, p0, Ll/zjx0;->b:J

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a()J
    .locals 4
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/zjx0;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/zjx0;->c:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/zjx0;->e:Ll/ajx0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/ajx0;->D()Landroid/content/SharedPreferences;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/zjx0;->a:Ljava/lang/String;

    .line 15
    .line 16
    iget-wide v2, p0, Ll/zjx0;->b:J

    .line 17
    .line 18
    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    iput-wide v0, p0, Ll/zjx0;->d:J

    .line 23
    .line 24
    :cond_0
    iget-wide v0, p0, Ll/zjx0;->d:J

    .line 25
    .line 26
    return-wide v0
.end method

.method public final b(J)V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zjx0;->e:Ll/ajx0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ajx0;->D()Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/zjx0;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {v0, v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 14
    .line 15
    .line 16
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 17
    .line 18
    .line 19
    iput-wide p1, p0, Ll/zjx0;->d:J

    .line 20
    .line 21
    return-void
.end method
