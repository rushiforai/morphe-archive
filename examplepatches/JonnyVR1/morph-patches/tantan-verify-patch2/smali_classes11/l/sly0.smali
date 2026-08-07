.class public final Ll/sly0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ncx0;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/hmy0;

.field public final synthetic c:Lcom/google/android/gms/measurement/internal/j;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/j;Ljava/lang/String;Ll/hmy0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/sly0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Ll/sly0;->b:Ll/hmy0;

    .line 4
    .line 5
    iput-object p1, p0, Ll/sly0;->c:Lcom/google/android/gms/measurement/internal/j;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;ILjava/lang/Throwable;[BLjava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
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
    move-object p1, p0

    .line 2
    iget-object p0, p1, Ll/sly0;->c:Lcom/google/android/gms/measurement/internal/j;

    .line 3
    .line 4
    move-object p5, p1

    .line 5
    iget-object p1, p5, Ll/sly0;->a:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p5, p5, Ll/sly0;->b:Ll/hmy0;

    .line 8
    .line 9
    invoke-virtual/range {p0 .. p5}, Lcom/google/android/gms/measurement/internal/j;->w(Ljava/lang/String;ILjava/lang/Throwable;[BLl/hmy0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
