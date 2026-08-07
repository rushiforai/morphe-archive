.class public final Lcom/google/android/exoplayer2/source/t$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/t;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:Ll/g6c$a;

.field public b:Lcom/google/android/exoplayer2/upstream/c;

.field public c:Z

.field public d:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/g6c$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Ll/g6c$a;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/t$b;->a:Ll/g6c$a;

    .line 11
    .line 12
    new-instance p1, Lcom/google/android/exoplayer2/upstream/b;

    .line 13
    .line 14
    invoke-direct {p1}, Lcom/google/android/exoplayer2/upstream/b;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/t$b;->b:Lcom/google/android/exoplayer2/upstream/c;

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/source/t$b;->c:Z

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/exoplayer2/n$k;J)Lcom/google/android/exoplayer2/source/t;
    .locals 10

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/source/t;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/t$b;->e:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/t$b;->a:Ll/g6c$a;

    .line 6
    .line 7
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/t$b;->b:Lcom/google/android/exoplayer2/upstream/c;

    .line 8
    .line 9
    iget-boolean v7, p0, Lcom/google/android/exoplayer2/source/t$b;->c:Z

    .line 10
    .line 11
    iget-object v8, p0, Lcom/google/android/exoplayer2/source/t$b;->d:Ljava/lang/Object;

    .line 12
    .line 13
    const/4 v9, 0x0

    .line 14
    move-object v2, p1

    .line 15
    move-wide v4, p2

    .line 16
    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer2/source/t;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer2/n$k;Ll/g6c$a;JLcom/google/android/exoplayer2/upstream/c;ZLjava/lang/Object;Lcom/google/android/exoplayer2/source/t$a;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public b(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/t$b;
    .locals 0
    .param p1    # Lcom/google/android/exoplayer2/upstream/c;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    new-instance p1, Lcom/google/android/exoplayer2/upstream/b;

    .line 5
    .line 6
    invoke-direct {p1}, Lcom/google/android/exoplayer2/upstream/b;-><init>()V

    .line 7
    .line 8
    .line 9
    :goto_0
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/t$b;->b:Lcom/google/android/exoplayer2/upstream/c;

    .line 10
    .line 11
    return-object p0
.end method
