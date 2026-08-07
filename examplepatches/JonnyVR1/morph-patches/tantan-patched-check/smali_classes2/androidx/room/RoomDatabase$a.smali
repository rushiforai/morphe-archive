.class public Landroidx/room/RoomDatabase$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/room/RoomDatabase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroidx/room/RoomDatabase;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00ae\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010!\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010#\n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0016\u0018\u0000*\u0008\u0008\u0000\u0010\u0002*\u00020\u00012\u00020\u0003B)\u0008\u0000\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0006\u0012\u0008\u0010\t\u001a\u0004\u0018\u00010\u0008\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u001f\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u00002\u0008\u0010\r\u001a\u0004\u0018\u00010\u000cH\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ)\u0010\u0013\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u00002\u0012\u0010\u0012\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00110\u0010\"\u00020\u0011H\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0015\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0000H\u0016\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u001d\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010\u0018\u001a\u00020\u0017H\u0016\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ\u0015\u0010\u001b\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0000H\u0016\u00a2\u0006\u0004\u0008\u001b\u0010\u0016J\u001d\u0010\u001e\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u00002\u0006\u0010\u001d\u001a\u00020\u001cH\u0016\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ\u000f\u0010 \u001a\u00028\u0000H\u0016\u00a2\u0006\u0004\u0008 \u0010!R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001e\u0010\"R\u001a\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010#R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00088\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010$R\u001a\u0010\'\u001a\u0008\u0012\u0004\u0012\u00020\u001c0%8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008 \u0010&R\u0018\u0010*\u001a\u0004\u0018\u00010(8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010)R\u001a\u0010+\u001a\u0008\u0012\u0004\u0012\u00020\u00030%8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000e\u0010&R\u001c\u0010-\u001a\u0008\u0012\u0004\u0012\u00020,0%8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0019\u0010&R\u0018\u00100\u001a\u0004\u0018\u00010\u00178\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008.\u0010/R\u0018\u00102\u001a\u0004\u0018\u00010\u00178\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00081\u0010/R\u0018\u0010\r\u001a\u0004\u0018\u00010\u000c8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00083\u00104R\u0016\u00108\u001a\u0002058\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00086\u00107R\u0016\u0010<\u001a\u0002098\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008:\u0010;R\u0018\u0010@\u001a\u0004\u0018\u00010=8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008>\u0010?R\u0016\u0010B\u001a\u0002058\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008A\u00107R\u0016\u0010D\u001a\u0002058\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008C\u00107R\u0016\u0010H\u001a\u00020E8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008F\u0010GR\u0018\u0010L\u001a\u0004\u0018\u00010I8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008J\u0010KR\u0014\u0010P\u001a\u00020M8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008N\u0010OR\u001c\u0010U\u001a\u0008\u0012\u0004\u0012\u00020R0Q8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008S\u0010TR\u001e\u0010W\u001a\n\u0012\u0004\u0012\u00020R\u0018\u00010Q8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008V\u0010TR\u0018\u0010Y\u001a\u0004\u0018\u00010\u00088\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008X\u0010$R\u0018\u0010]\u001a\u0004\u0018\u00010Z8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008[\u0010\\R\u001e\u0010b\u001a\n\u0012\u0004\u0012\u00020_\u0018\u00010^8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008`\u0010a\u00a8\u0006c"
    }
    d2 = {
        "Landroidx/room/RoomDatabase$a;",
        "Landroidx/room/RoomDatabase;",
        "T",
        "",
        "Landroid/content/Context;",
        "context",
        "Ljava/lang/Class;",
        "klass",
        "",
        "name",
        "<init>",
        "(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)V",
        "Ll/o7h0$c;",
        "factory",
        "f",
        "(Ll/o7h0$c;)Landroidx/room/RoomDatabase$a;",
        "",
        "Ll/ua00;",
        "migrations",
        "b",
        "([Ll/ua00;)Landroidx/room/RoomDatabase$a;",
        "c",
        "()Landroidx/room/RoomDatabase$a;",
        "Ljava/util/concurrent/Executor;",
        "executor",
        "g",
        "(Ljava/util/concurrent/Executor;)Landroidx/room/RoomDatabase$a;",
        "e",
        "Landroidx/room/RoomDatabase$b;",
        "callback",
        "a",
        "(Landroidx/room/RoomDatabase$b;)Landroidx/room/RoomDatabase$a;",
        "d",
        "()Landroidx/room/RoomDatabase;",
        "Landroid/content/Context;",
        "Ljava/lang/Class;",
        "Ljava/lang/String;",
        "",
        "Ljava/util/List;",
        "callbacks",
        "Landroidx/room/RoomDatabase$e;",
        "Landroidx/room/RoomDatabase$e;",
        "prepackagedDatabaseCallback",
        "typeConverters",
        "Ll/bj1;",
        "autoMigrationSpecs",
        "h",
        "Ljava/util/concurrent/Executor;",
        "queryExecutor",
        "i",
        "transactionExecutor",
        "j",
        "Ll/o7h0$c;",
        "",
        "k",
        "Z",
        "allowMainThreadQueries",
        "Landroidx/room/RoomDatabase$JournalMode;",
        "l",
        "Landroidx/room/RoomDatabase$JournalMode;",
        "journalMode",
        "Landroid/content/Intent;",
        "m",
        "Landroid/content/Intent;",
        "multiInstanceInvalidationIntent",
        "n",
        "requireMigration",
        "o",
        "allowDestructiveMigrationOnDowngrade",
        "",
        "p",
        "J",
        "autoCloseTimeout",
        "Ljava/util/concurrent/TimeUnit;",
        "q",
        "Ljava/util/concurrent/TimeUnit;",
        "autoCloseTimeUnit",
        "Landroidx/room/RoomDatabase$d;",
        "r",
        "Landroidx/room/RoomDatabase$d;",
        "migrationContainer",
        "",
        "",
        "s",
        "Ljava/util/Set;",
        "migrationsNotRequiredFrom",
        "t",
        "migrationStartAndEndVersions",
        "u",
        "copyFromAssetPath",
        "Ljava/io/File;",
        "v",
        "Ljava/io/File;",
        "copyFromFile",
        "Ljava/util/concurrent/Callable;",
        "Ljava/io/InputStream;",
        "w",
        "Ljava/util/concurrent/Callable;",
        "copyFromInputStream",
        "room-runtime_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final a:Landroid/content/Context;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final c:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/room/RoomDatabase$b;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public e:Landroidx/room/RoomDatabase$e;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/bj1;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public h:Ljava/util/concurrent/Executor;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public i:Ljava/util/concurrent/Executor;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public j:Ll/o7h0$c;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public k:Z

.field public l:Landroidx/room/RoomDatabase$JournalMode;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public m:Landroid/content/Intent;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public n:Z

.field public o:Z

.field public p:J

.field public q:Ljava/util/concurrent/TimeUnit;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public final r:Landroidx/room/RoomDatabase$d;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public s:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public t:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public u:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public v:Ljava/io/File;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public w:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable<",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Class;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Landroidx/room/RoomDatabase$a;->a:Landroid/content/Context;

    .line 11
    .line 12
    iput-object p2, p0, Landroidx/room/RoomDatabase$a;->b:Ljava/lang/Class;

    .line 13
    .line 14
    iput-object p3, p0, Landroidx/room/RoomDatabase$a;->c:Ljava/lang/String;

    .line 15
    .line 16
    new-instance p1, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Landroidx/room/RoomDatabase$a;->d:Ljava/util/List;

    .line 22
    .line 23
    new-instance p1, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Landroidx/room/RoomDatabase$a;->f:Ljava/util/List;

    .line 29
    .line 30
    new-instance p1, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Landroidx/room/RoomDatabase$a;->g:Ljava/util/List;

    .line 36
    .line 37
    sget-object p1, Landroidx/room/RoomDatabase$JournalMode;->AUTOMATIC:Landroidx/room/RoomDatabase$JournalMode;

    .line 38
    .line 39
    iput-object p1, p0, Landroidx/room/RoomDatabase$a;->l:Landroidx/room/RoomDatabase$JournalMode;

    .line 40
    .line 41
    const/4 p1, 0x1

    .line 42
    iput-boolean p1, p0, Landroidx/room/RoomDatabase$a;->n:Z

    .line 43
    .line 44
    const-wide/16 p1, -0x1

    .line 45
    .line 46
    iput-wide p1, p0, Landroidx/room/RoomDatabase$a;->p:J

    .line 47
    .line 48
    new-instance p1, Landroidx/room/RoomDatabase$d;

    .line 49
    .line 50
    invoke-direct {p1}, Landroidx/room/RoomDatabase$d;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object p1, p0, Landroidx/room/RoomDatabase$a;->r:Landroidx/room/RoomDatabase$d;

    .line 54
    .line 55
    new-instance p1, Ljava/util/LinkedHashSet;

    .line 56
    .line 57
    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object p1, p0, Landroidx/room/RoomDatabase$a;->s:Ljava/util/Set;

    .line 61
    .line 62
    return-void
.end method


# virtual methods
.method public a(Landroidx/room/RoomDatabase$b;)Landroidx/room/RoomDatabase$a;
    .locals 1
    .param p1    # Landroidx/room/RoomDatabase$b;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/room/RoomDatabase$b;",
            ")",
            "Landroidx/room/RoomDatabase$a<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/room/RoomDatabase$a;->d:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public varargs b([Ll/ua00;)Landroidx/room/RoomDatabase$a;
    .locals 5
    .param p1    # [Ll/ua00;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ll/ua00;",
            ")",
            "Landroidx/room/RoomDatabase$a<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/room/RoomDatabase$a;->t:Ljava/util/Set;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/util/HashSet;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Landroidx/room/RoomDatabase$a;->t:Ljava/util/Set;

    .line 14
    .line 15
    :cond_0
    array-length v0, p1

    .line 16
    const/4 v1, 0x0

    .line 17
    :goto_0
    if-ge v1, v0, :cond_1

    .line 18
    .line 19
    aget-object v2, p1, v1

    .line 20
    .line 21
    iget-object v3, p0, Landroidx/room/RoomDatabase$a;->t:Ljava/util/Set;

    .line 22
    .line 23
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    iget v4, v2, Ll/ua00;->a:I

    .line 27
    .line 28
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    iget-object v3, p0, Landroidx/room/RoomDatabase$a;->t:Ljava/util/Set;

    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    iget v2, v2, Ll/ua00;->b:I

    .line 41
    .line 42
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    add-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    iget-object v0, p0, Landroidx/room/RoomDatabase$a;->r:Landroidx/room/RoomDatabase$d;

    .line 53
    .line 54
    array-length v1, p1

    .line 55
    invoke-static {p1, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, [Ll/ua00;

    .line 60
    .line 61
    invoke-virtual {v0, p1}, Landroidx/room/RoomDatabase$d;->b([Ll/ua00;)V

    .line 62
    .line 63
    .line 64
    return-object p0
.end method

.method public c()Landroidx/room/RoomDatabase$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/room/RoomDatabase$a<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/room/RoomDatabase$a;->k:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public d()Landroidx/room/RoomDatabase;
    .locals 23
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Landroidx/room/RoomDatabase$a;->h:Ljava/util/concurrent/Executor;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    iget-object v2, v0, Landroidx/room/RoomDatabase$a;->i:Ljava/util/concurrent/Executor;

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/ez0;->f()Ljava/util/concurrent/Executor;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, v0, Landroidx/room/RoomDatabase$a;->i:Ljava/util/concurrent/Executor;

    .line 16
    .line 17
    iput-object v1, v0, Landroidx/room/RoomDatabase$a;->h:Ljava/util/concurrent/Executor;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v2, v0, Landroidx/room/RoomDatabase$a;->i:Ljava/util/concurrent/Executor;

    .line 23
    .line 24
    if-nez v2, :cond_1

    .line 25
    .line 26
    iput-object v1, v0, Landroidx/room/RoomDatabase$a;->i:Ljava/util/concurrent/Executor;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    if-nez v1, :cond_2

    .line 30
    .line 31
    iget-object v1, v0, Landroidx/room/RoomDatabase$a;->i:Ljava/util/concurrent/Executor;

    .line 32
    .line 33
    iput-object v1, v0, Landroidx/room/RoomDatabase$a;->h:Ljava/util/concurrent/Executor;

    .line 34
    .line 35
    :cond_2
    :goto_0
    iget-object v1, v0, Landroidx/room/RoomDatabase$a;->t:Ljava/util/Set;

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    if-eqz v1, :cond_4

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-eqz v3, :cond_4

    .line 52
    .line 53
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    check-cast v3, Ljava/lang/Number;

    .line 58
    .line 59
    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    iget-object v4, v0, Landroidx/room/RoomDatabase$a;->s:Ljava/util/Set;

    .line 64
    .line 65
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    if-nez v4, :cond_3

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_3
    const-string v0, "Inconsistency detected. A Migration was supplied to addMigration(Migration... migrations) that has a start or end version equal to a start version supplied to fallbackToDestructiveMigrationFrom(int... startVersions). Start version: "

    .line 77
    .line 78
    invoke-static {v0, v3}, Ll/plk0;->a(Ljava/lang/String;I)V

    .line 79
    .line 80
    .line 81
    return-object v2

    .line 82
    :cond_4
    iget-object v1, v0, Landroidx/room/RoomDatabase$a;->j:Ll/o7h0$c;

    .line 83
    .line 84
    if-nez v1, :cond_5

    .line 85
    .line 86
    new-instance v1, Ll/l8j;

    .line 87
    .line 88
    invoke-direct {v1}, Ll/l8j;-><init>()V

    .line 89
    .line 90
    .line 91
    :cond_5
    const-string v3, "Required value was null."

    .line 92
    .line 93
    if-eqz v1, :cond_11

    .line 94
    .line 95
    iget-wide v4, v0, Landroidx/room/RoomDatabase$a;->p:J

    .line 96
    .line 97
    const-wide/16 v6, 0x0

    .line 98
    .line 99
    cmp-long v4, v4, v6

    .line 100
    .line 101
    if-lez v4, :cond_9

    .line 102
    .line 103
    iget-object v4, v0, Landroidx/room/RoomDatabase$a;->c:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz v4, :cond_8

    .line 106
    .line 107
    new-instance v4, Ll/re1;

    .line 108
    .line 109
    iget-wide v5, v0, Landroidx/room/RoomDatabase$a;->p:J

    .line 110
    .line 111
    iget-object v7, v0, Landroidx/room/RoomDatabase$a;->q:Ljava/util/concurrent/TimeUnit;

    .line 112
    .line 113
    if-eqz v7, :cond_7

    .line 114
    .line 115
    iget-object v8, v0, Landroidx/room/RoomDatabase$a;->h:Ljava/util/concurrent/Executor;

    .line 116
    .line 117
    if-eqz v8, :cond_6

    .line 118
    .line 119
    invoke-direct {v4, v5, v6, v7, v8}, Ll/re1;-><init>(JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/Executor;)V

    .line 120
    .line 121
    .line 122
    new-instance v5, Ll/se1;

    .line 123
    .line 124
    invoke-direct {v5, v1, v4}, Ll/se1;-><init>(Ll/o7h0$c;Ll/re1;)V

    .line 125
    .line 126
    .line 127
    move-object v1, v5

    .line 128
    goto :goto_2

    .line 129
    :cond_6
    invoke-static {v3}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    return-object v2

    .line 133
    :cond_7
    invoke-static {v3}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    return-object v2

    .line 137
    :cond_8
    const-string v0, "Cannot create auto-closing database for an in-memory database."

    .line 138
    .line 139
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    return-object v2

    .line 143
    :cond_9
    :goto_2
    iget-object v4, v0, Landroidx/room/RoomDatabase$a;->u:Ljava/lang/String;

    .line 144
    .line 145
    if-nez v4, :cond_a

    .line 146
    .line 147
    iget-object v5, v0, Landroidx/room/RoomDatabase$a;->v:Ljava/io/File;

    .line 148
    .line 149
    if-nez v5, :cond_a

    .line 150
    .line 151
    iget-object v5, v0, Landroidx/room/RoomDatabase$a;->w:Ljava/util/concurrent/Callable;

    .line 152
    .line 153
    if-eqz v5, :cond_e

    .line 154
    .line 155
    :cond_a
    iget-object v5, v0, Landroidx/room/RoomDatabase$a;->c:Ljava/lang/String;

    .line 156
    .line 157
    if-eqz v5, :cond_10

    .line 158
    .line 159
    const/4 v5, 0x0

    .line 160
    const/4 v6, 0x1

    .line 161
    if-nez v4, :cond_b

    .line 162
    .line 163
    move v7, v5

    .line 164
    goto :goto_3

    .line 165
    :cond_b
    move v7, v6

    .line 166
    :goto_3
    iget-object v8, v0, Landroidx/room/RoomDatabase$a;->v:Ljava/io/File;

    .line 167
    .line 168
    if-nez v8, :cond_c

    .line 169
    .line 170
    move v9, v5

    .line 171
    goto :goto_4

    .line 172
    :cond_c
    move v9, v6

    .line 173
    :goto_4
    iget-object v10, v0, Landroidx/room/RoomDatabase$a;->w:Ljava/util/concurrent/Callable;

    .line 174
    .line 175
    if-nez v10, :cond_d

    .line 176
    .line 177
    goto :goto_5

    .line 178
    :cond_d
    move v5, v6

    .line 179
    :goto_5
    add-int/2addr v7, v9

    .line 180
    add-int/2addr v7, v5

    .line 181
    if-ne v7, v6, :cond_f

    .line 182
    .line 183
    new-instance v5, Ll/gtd0;

    .line 184
    .line 185
    invoke-direct {v5, v4, v8, v10, v1}, Ll/gtd0;-><init>(Ljava/lang/String;Ljava/io/File;Ljava/util/concurrent/Callable;Ll/o7h0$c;)V

    .line 186
    .line 187
    .line 188
    move-object v1, v5

    .line 189
    :cond_e
    move-object v6, v1

    .line 190
    goto :goto_6

    .line 191
    :cond_f
    const-string v0, "More than one of createFromAsset(), createFromInputStream(), and createFromFile() were called on this Builder, but the database can only be created using one of the three configurations."

    .line 192
    .line 193
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    return-object v2

    .line 197
    :cond_10
    const-string v0, "Cannot create from asset or file for an in-memory database."

    .line 198
    .line 199
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    return-object v2

    .line 203
    :cond_11
    move-object v6, v2

    .line 204
    :goto_6
    move-object v1, v3

    .line 205
    if-eqz v6, :cond_14

    .line 206
    .line 207
    new-instance v3, Landroidx/room/b;

    .line 208
    .line 209
    iget-object v4, v0, Landroidx/room/RoomDatabase$a;->a:Landroid/content/Context;

    .line 210
    .line 211
    iget-object v5, v0, Landroidx/room/RoomDatabase$a;->c:Ljava/lang/String;

    .line 212
    .line 213
    iget-object v7, v0, Landroidx/room/RoomDatabase$a;->r:Landroidx/room/RoomDatabase$d;

    .line 214
    .line 215
    iget-object v8, v0, Landroidx/room/RoomDatabase$a;->d:Ljava/util/List;

    .line 216
    .line 217
    iget-boolean v9, v0, Landroidx/room/RoomDatabase$a;->k:Z

    .line 218
    .line 219
    iget-object v10, v0, Landroidx/room/RoomDatabase$a;->l:Landroidx/room/RoomDatabase$JournalMode;

    .line 220
    .line 221
    invoke-virtual {v10, v4}, Landroidx/room/RoomDatabase$JournalMode;->resolve$room_runtime_release(Landroid/content/Context;)Landroidx/room/RoomDatabase$JournalMode;

    .line 222
    .line 223
    .line 224
    move-result-object v10

    .line 225
    iget-object v11, v0, Landroidx/room/RoomDatabase$a;->h:Ljava/util/concurrent/Executor;

    .line 226
    .line 227
    if-eqz v11, :cond_13

    .line 228
    .line 229
    iget-object v12, v0, Landroidx/room/RoomDatabase$a;->i:Ljava/util/concurrent/Executor;

    .line 230
    .line 231
    if-eqz v12, :cond_12

    .line 232
    .line 233
    iget-object v13, v0, Landroidx/room/RoomDatabase$a;->m:Landroid/content/Intent;

    .line 234
    .line 235
    iget-boolean v14, v0, Landroidx/room/RoomDatabase$a;->n:Z

    .line 236
    .line 237
    iget-boolean v15, v0, Landroidx/room/RoomDatabase$a;->o:Z

    .line 238
    .line 239
    iget-object v1, v0, Landroidx/room/RoomDatabase$a;->s:Ljava/util/Set;

    .line 240
    .line 241
    iget-object v2, v0, Landroidx/room/RoomDatabase$a;->u:Ljava/lang/String;

    .line 242
    .line 243
    move-object/from16 v16, v1

    .line 244
    .line 245
    iget-object v1, v0, Landroidx/room/RoomDatabase$a;->v:Ljava/io/File;

    .line 246
    .line 247
    move-object/from16 v18, v1

    .line 248
    .line 249
    iget-object v1, v0, Landroidx/room/RoomDatabase$a;->w:Ljava/util/concurrent/Callable;

    .line 250
    .line 251
    move-object/from16 v19, v1

    .line 252
    .line 253
    iget-object v1, v0, Landroidx/room/RoomDatabase$a;->e:Landroidx/room/RoomDatabase$e;

    .line 254
    .line 255
    move-object/from16 v20, v1

    .line 256
    .line 257
    iget-object v1, v0, Landroidx/room/RoomDatabase$a;->f:Ljava/util/List;

    .line 258
    .line 259
    move-object/from16 v21, v1

    .line 260
    .line 261
    iget-object v1, v0, Landroidx/room/RoomDatabase$a;->g:Ljava/util/List;

    .line 262
    .line 263
    move-object/from16 v22, v1

    .line 264
    .line 265
    move-object/from16 v17, v2

    .line 266
    .line 267
    invoke-direct/range {v3 .. v22}, Landroidx/room/b;-><init>(Landroid/content/Context;Ljava/lang/String;Ll/o7h0$c;Landroidx/room/RoomDatabase$d;Ljava/util/List;ZLandroidx/room/RoomDatabase$JournalMode;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Landroid/content/Intent;ZZLjava/util/Set;Ljava/lang/String;Ljava/io/File;Ljava/util/concurrent/Callable;Landroidx/room/RoomDatabase$e;Ljava/util/List;Ljava/util/List;)V

    .line 268
    .line 269
    .line 270
    iget-object v0, v0, Landroidx/room/RoomDatabase$a;->b:Ljava/lang/Class;

    .line 271
    .line 272
    const-string v1, "_Impl"

    .line 273
    .line 274
    invoke-static {v0, v1}, Landroidx/room/g;->b(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    check-cast v0, Landroidx/room/RoomDatabase;

    .line 279
    .line 280
    invoke-virtual {v0, v3}, Landroidx/room/RoomDatabase;->init(Landroidx/room/b;)V

    .line 281
    .line 282
    .line 283
    return-object v0

    .line 284
    :cond_12
    invoke-static {v1}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    return-object v2

    .line 288
    :cond_13
    invoke-static {v1}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    return-object v2

    .line 292
    :cond_14
    invoke-static {v1}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    return-object v2
.end method

.method public e()Landroidx/room/RoomDatabase$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/room/RoomDatabase$a<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Landroidx/room/RoomDatabase$a;->n:Z

    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Landroidx/room/RoomDatabase$a;->o:Z

    .line 6
    .line 7
    return-object p0
.end method

.method public f(Ll/o7h0$c;)Landroidx/room/RoomDatabase$a;
    .locals 0
    .param p1    # Ll/o7h0$c;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/o7h0$c;",
            ")",
            "Landroidx/room/RoomDatabase$a<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/room/RoomDatabase$a;->j:Ll/o7h0$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Ljava/util/concurrent/Executor;)Landroidx/room/RoomDatabase$a;
    .locals 0
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Landroidx/room/RoomDatabase$a<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/room/RoomDatabase$a;->h:Ljava/util/concurrent/Executor;

    .line 5
    .line 6
    return-object p0
.end method
