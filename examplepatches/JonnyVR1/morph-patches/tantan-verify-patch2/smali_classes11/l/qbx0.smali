.class public final Ll/qbx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation build Landroidx/annotation/WorkerThread;
.end annotation


# instance fields
.field public final a:Ll/ncx0;

.field public final b:I

.field public final c:Ljava/lang/Throwable;

.field public final d:[B

.field public final e:Ljava/lang/String;

.field public final f:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/ncx0;ILjava/lang/Throwable;[BLjava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/ncx0;",
            "I",
            "Ljava/lang/Throwable;",
            "[B",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, Ll/qbx0;->a:Ll/ncx0;

    .line 8
    .line 9
    iput p3, p0, Ll/qbx0;->b:I

    .line 10
    .line 11
    iput-object p4, p0, Ll/qbx0;->c:Ljava/lang/Throwable;

    .line 12
    .line 13
    iput-object p5, p0, Ll/qbx0;->d:[B

    .line 14
    .line 15
    iput-object p1, p0, Ll/qbx0;->e:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p6, p0, Ll/qbx0;->f:Ljava/util/Map;

    .line 18
    .line 19
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ll/ncx0;ILjava/lang/Throwable;[BLjava/util/Map;Ll/jdx0;)V
    .locals 0

    .line 20
    invoke-direct/range {p0 .. p6}, Ll/qbx0;-><init>(Ljava/lang/String;Ll/ncx0;ILjava/lang/Throwable;[BLjava/util/Map;)V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/qbx0;->a:Ll/ncx0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/qbx0;->e:Ljava/lang/String;

    .line 4
    .line 5
    iget v2, p0, Ll/qbx0;->b:I

    .line 6
    .line 7
    iget-object v3, p0, Ll/qbx0;->c:Ljava/lang/Throwable;

    .line 8
    .line 9
    iget-object v4, p0, Ll/qbx0;->d:[B

    .line 10
    .line 11
    iget-object v5, p0, Ll/qbx0;->f:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface/range {v0 .. v5}, Ll/ncx0;->a(Ljava/lang/String;ILjava/lang/Throwable;[BLjava/util/Map;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
