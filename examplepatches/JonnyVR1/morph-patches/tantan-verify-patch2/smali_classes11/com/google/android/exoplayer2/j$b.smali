.class public final Lcom/google/android/exoplayer2/j$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/q$c;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ll/n8f0;

.field public final c:I

.field public final d:J


# direct methods
.method public constructor <init>(Ljava/util/List;Ll/n8f0;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/q$c;",
            ">;",
            "Ll/n8f0;",
            "IJ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/exoplayer2/j$b;->a:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/exoplayer2/j$b;->b:Ll/n8f0;

    .line 7
    .line 8
    iput p3, p0, Lcom/google/android/exoplayer2/j$b;->c:I

    .line 9
    .line 10
    iput-wide p4, p0, Lcom/google/android/exoplayer2/j$b;->d:J

    .line 11
    .line 12
    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/List;Ll/n8f0;IJLcom/google/android/exoplayer2/j$a;)V
    .locals 0

    .line 13
    invoke-direct/range {p0 .. p5}, Lcom/google/android/exoplayer2/j$b;-><init>(Ljava/util/List;Ll/n8f0;IJ)V

    return-void
.end method

.method public static synthetic a(Lcom/google/android/exoplayer2/j$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/j$b;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Lcom/google/android/exoplayer2/j$b;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j$b;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/google/android/exoplayer2/j$b;)Ll/n8f0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/j$b;->b:Ll/n8f0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/google/android/exoplayer2/j$b;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/j$b;->d:J

    .line 2
    .line 3
    return-wide v0
.end method
