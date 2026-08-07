.class public final Lcom/google/android/exoplayer2/n$k$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/n$k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Landroid/net/Uri;

.field public b:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:I

.field public e:I

.field public f:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/net/Uri;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/google/android/exoplayer2/n$k$a;->a:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/n$k;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/google/android/exoplayer2/n$k;->a:Landroid/net/Uri;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$k$a;->a:Landroid/net/Uri;

    .line 7
    .line 8
    iget-object v0, p1, Lcom/google/android/exoplayer2/n$k;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$k$a;->b:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/google/android/exoplayer2/n$k;->c:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$k$a;->c:Ljava/lang/String;

    .line 15
    .line 16
    iget v0, p1, Lcom/google/android/exoplayer2/n$k;->d:I

    .line 17
    .line 18
    iput v0, p0, Lcom/google/android/exoplayer2/n$k$a;->d:I

    .line 19
    .line 20
    iget v0, p1, Lcom/google/android/exoplayer2/n$k;->e:I

    .line 21
    .line 22
    iput v0, p0, Lcom/google/android/exoplayer2/n$k$a;->e:I

    .line 23
    .line 24
    iget-object v0, p1, Lcom/google/android/exoplayer2/n$k;->f:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/google/android/exoplayer2/n$k$a;->f:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/google/android/exoplayer2/n$k;->g:Ljava/lang/String;

    .line 29
    .line 30
    iput-object p1, p0, Lcom/google/android/exoplayer2/n$k$a;->g:Ljava/lang/String;

    .line 31
    .line 32
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/n$k;Lcom/google/android/exoplayer2/n$a;)V
    .locals 0

    .line 35
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/n$k$a;-><init>(Lcom/google/android/exoplayer2/n$k;)V

    return-void
.end method

.method public static synthetic a(Lcom/google/android/exoplayer2/n$k$a;)Lcom/google/android/exoplayer2/n$j;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/n$k$a;->j()Lcom/google/android/exoplayer2/n$j;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/google/android/exoplayer2/n$k$a;)Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/n$k$a;->a:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/google/android/exoplayer2/n$k$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/n$k$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/google/android/exoplayer2/n$k$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/n$k$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/google/android/exoplayer2/n$k$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/n$k$a;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Lcom/google/android/exoplayer2/n$k$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/n$k$a;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Lcom/google/android/exoplayer2/n$k$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/n$k$a;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Lcom/google/android/exoplayer2/n$k$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/n$k$a;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public i()Lcom/google/android/exoplayer2/n$k;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/n$k;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/google/android/exoplayer2/n$k;-><init>(Lcom/google/android/exoplayer2/n$k$a;Lcom/google/android/exoplayer2/n$a;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public final j()Lcom/google/android/exoplayer2/n$j;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/n$j;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/google/android/exoplayer2/n$j;-><init>(Lcom/google/android/exoplayer2/n$k$a;Lcom/google/android/exoplayer2/n$a;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public k(Ljava/lang/String;)Lcom/google/android/exoplayer2/n$k$a;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/n$k$a;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Ljava/lang/String;)Lcom/google/android/exoplayer2/n$k$a;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/n$k$a;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Ljava/lang/String;)Lcom/google/android/exoplayer2/n$k$a;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/n$k$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Ljava/lang/String;)Lcom/google/android/exoplayer2/n$k$a;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/n$k$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public o(I)Lcom/google/android/exoplayer2/n$k$a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/n$k$a;->e:I

    .line 2
    .line 3
    return-object p0
.end method

.method public p(I)Lcom/google/android/exoplayer2/n$k$a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/n$k$a;->d:I

    .line 2
    .line 3
    return-object p0
.end method
