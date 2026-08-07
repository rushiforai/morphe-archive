.class public final Lcom/google/android/exoplayer2/upstream/a$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/upstream/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public a:Landroid/net/Uri;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:J

.field public c:I

.field public d:[B
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public f:J

.field public g:J

.field public h:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:I

.field public j:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 46
    iput v0, p0, Lcom/google/android/exoplayer2/upstream/a$b;->c:I

    .line 47
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    iput-object v0, p0, Lcom/google/android/exoplayer2/upstream/a$b;->e:Ljava/util/Map;

    const-wide/16 v0, -0x1

    .line 48
    iput-wide v0, p0, Lcom/google/android/exoplayer2/upstream/a$b;->g:J

    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/upstream/a;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/google/android/exoplayer2/upstream/a;->a:Landroid/net/Uri;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/google/android/exoplayer2/upstream/a$b;->a:Landroid/net/Uri;

    .line 7
    .line 8
    iget-wide v0, p1, Lcom/google/android/exoplayer2/upstream/a;->b:J

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/google/android/exoplayer2/upstream/a$b;->b:J

    .line 11
    .line 12
    iget v0, p1, Lcom/google/android/exoplayer2/upstream/a;->c:I

    .line 13
    .line 14
    iput v0, p0, Lcom/google/android/exoplayer2/upstream/a$b;->c:I

    .line 15
    .line 16
    iget-object v0, p1, Lcom/google/android/exoplayer2/upstream/a;->d:[B

    .line 17
    .line 18
    iput-object v0, p0, Lcom/google/android/exoplayer2/upstream/a$b;->d:[B

    .line 19
    .line 20
    iget-object v0, p1, Lcom/google/android/exoplayer2/upstream/a;->e:Ljava/util/Map;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/google/android/exoplayer2/upstream/a$b;->e:Ljava/util/Map;

    .line 23
    .line 24
    iget-wide v0, p1, Lcom/google/android/exoplayer2/upstream/a;->g:J

    .line 25
    .line 26
    iput-wide v0, p0, Lcom/google/android/exoplayer2/upstream/a$b;->f:J

    .line 27
    .line 28
    iget-wide v0, p1, Lcom/google/android/exoplayer2/upstream/a;->h:J

    .line 29
    .line 30
    iput-wide v0, p0, Lcom/google/android/exoplayer2/upstream/a$b;->g:J

    .line 31
    .line 32
    iget-object v0, p1, Lcom/google/android/exoplayer2/upstream/a;->i:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/google/android/exoplayer2/upstream/a$b;->h:Ljava/lang/String;

    .line 35
    .line 36
    iget v0, p1, Lcom/google/android/exoplayer2/upstream/a;->j:I

    .line 37
    .line 38
    iput v0, p0, Lcom/google/android/exoplayer2/upstream/a$b;->i:I

    .line 39
    .line 40
    iget-object p1, p1, Lcom/google/android/exoplayer2/upstream/a;->k:Ljava/lang/Object;

    .line 41
    .line 42
    iput-object p1, p0, Lcom/google/android/exoplayer2/upstream/a$b;->j:Ljava/lang/Object;

    .line 43
    .line 44
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/upstream/a;Lcom/google/android/exoplayer2/upstream/a$a;)V
    .locals 0

    .line 49
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/upstream/a$b;-><init>(Lcom/google/android/exoplayer2/upstream/a;)V

    return-void
.end method


# virtual methods
.method public a()Lcom/google/android/exoplayer2/upstream/a;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/google/android/exoplayer2/upstream/a$b;->a:Landroid/net/Uri;

    .line 4
    .line 5
    const-string v2, "The uri must be set."

    .line 6
    .line 7
    invoke-static {v1, v2}, Ll/w11;->j(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    new-instance v3, Lcom/google/android/exoplayer2/upstream/a;

    .line 11
    .line 12
    iget-object v4, v0, Lcom/google/android/exoplayer2/upstream/a$b;->a:Landroid/net/Uri;

    .line 13
    .line 14
    iget-wide v5, v0, Lcom/google/android/exoplayer2/upstream/a$b;->b:J

    .line 15
    .line 16
    iget v7, v0, Lcom/google/android/exoplayer2/upstream/a$b;->c:I

    .line 17
    .line 18
    iget-object v8, v0, Lcom/google/android/exoplayer2/upstream/a$b;->d:[B

    .line 19
    .line 20
    iget-object v9, v0, Lcom/google/android/exoplayer2/upstream/a$b;->e:Ljava/util/Map;

    .line 21
    .line 22
    iget-wide v10, v0, Lcom/google/android/exoplayer2/upstream/a$b;->f:J

    .line 23
    .line 24
    iget-wide v12, v0, Lcom/google/android/exoplayer2/upstream/a$b;->g:J

    .line 25
    .line 26
    iget-object v14, v0, Lcom/google/android/exoplayer2/upstream/a$b;->h:Ljava/lang/String;

    .line 27
    .line 28
    iget v15, v0, Lcom/google/android/exoplayer2/upstream/a$b;->i:I

    .line 29
    .line 30
    iget-object v0, v0, Lcom/google/android/exoplayer2/upstream/a$b;->j:Ljava/lang/Object;

    .line 31
    .line 32
    const/16 v17, 0x0

    .line 33
    .line 34
    move-object/from16 v16, v0

    .line 35
    .line 36
    invoke-direct/range {v3 .. v17}, Lcom/google/android/exoplayer2/upstream/a;-><init>(Landroid/net/Uri;JI[BLjava/util/Map;JJLjava/lang/String;ILjava/lang/Object;Lcom/google/android/exoplayer2/upstream/a$a;)V

    .line 37
    .line 38
    .line 39
    return-object v3
.end method

.method public b(I)Lcom/google/android/exoplayer2/upstream/a$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/upstream/a$b;->i:I

    .line 2
    .line 3
    return-object p0
.end method

.method public c([B)Lcom/google/android/exoplayer2/upstream/a$b;
    .locals 0
    .param p1    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/upstream/a$b;->d:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public d(I)Lcom/google/android/exoplayer2/upstream/a$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/upstream/a$b;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/util/Map;)Lcom/google/android/exoplayer2/upstream/a$b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/android/exoplayer2/upstream/a$b;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/upstream/a$b;->e:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ljava/lang/String;)Lcom/google/android/exoplayer2/upstream/a$b;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/upstream/a$b;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(J)Lcom/google/android/exoplayer2/upstream/a$b;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/google/android/exoplayer2/upstream/a$b;->g:J

    .line 2
    .line 3
    return-object p0
.end method

.method public h(J)Lcom/google/android/exoplayer2/upstream/a$b;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/google/android/exoplayer2/upstream/a$b;->f:J

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Landroid/net/Uri;)Lcom/google/android/exoplayer2/upstream/a$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/upstream/a$b;->a:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ljava/lang/String;)Lcom/google/android/exoplayer2/upstream/a$b;
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/google/android/exoplayer2/upstream/a$b;->a:Landroid/net/Uri;

    .line 6
    .line 7
    return-object p0
.end method
