.class public final Lcom/google/android/exoplayer2/source/o$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/k;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final c:Ll/g6c$a;

.field public d:Lcom/google/android/exoplayer2/source/m$a;

.field public e:Ll/zde;

.field public f:Lcom/google/android/exoplayer2/upstream/c;

.field public g:I


# direct methods
.method public constructor <init>(Ll/g6c$a;Lcom/google/android/exoplayer2/source/m$a;)V
    .locals 6

    .line 1
    new-instance v3, Lcom/google/android/exoplayer2/drm/a;

    .line 2
    .line 3
    invoke-direct {v3}, Lcom/google/android/exoplayer2/drm/a;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v4, Lcom/google/android/exoplayer2/upstream/b;

    .line 7
    .line 8
    invoke-direct {v4}, Lcom/google/android/exoplayer2/upstream/b;-><init>()V

    .line 9
    .line 10
    .line 11
    const/high16 v5, 0x100000

    .line 12
    .line 13
    move-object v0, p0

    .line 14
    move-object v1, p1

    .line 15
    move-object v2, p2

    .line 16
    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer2/source/o$b;-><init>(Ll/g6c$a;Lcom/google/android/exoplayer2/source/m$a;Ll/zde;Lcom/google/android/exoplayer2/upstream/c;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Ll/g6c$a;Lcom/google/android/exoplayer2/source/m$a;Ll/zde;Lcom/google/android/exoplayer2/upstream/c;I)V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/o$b;->c:Ll/g6c$a;

    .line 23
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/o$b;->d:Lcom/google/android/exoplayer2/source/m$a;

    .line 24
    iput-object p3, p0, Lcom/google/android/exoplayer2/source/o$b;->e:Ll/zde;

    .line 25
    iput-object p4, p0, Lcom/google/android/exoplayer2/source/o$b;->f:Lcom/google/android/exoplayer2/upstream/c;

    .line 26
    iput p5, p0, Lcom/google/android/exoplayer2/source/o$b;->g:I

    return-void
.end method

.method public constructor <init>(Ll/g6c$a;Ll/esf;)V
    .locals 1

    .line 20
    new-instance v0, Ll/z4b0;

    invoke-direct {v0, p2}, Ll/z4b0;-><init>(Ll/esf;)V

    invoke-direct {p0, p1, v0}, Lcom/google/android/exoplayer2/source/o$b;-><init>(Ll/g6c$a;Lcom/google/android/exoplayer2/source/m$a;)V

    return-void
.end method

.method public static synthetic e(Ll/esf;Ll/bf80;)Lcom/google/android/exoplayer2/source/m;
    .locals 0

    .line 1
    new-instance p1, Ll/fj3;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/fj3;-><init>(Ll/esf;)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method


# virtual methods
.method public bridge synthetic a(Ll/zde;)Lcom/google/android/exoplayer2/source/i$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/o$b;->g(Ll/zde;)Lcom/google/android/exoplayer2/source/o$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic b(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/i$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/o$b;->h(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/o$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic c(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/source/i;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/o$b;->f(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/source/o;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/source/o;
    .locals 9

    .line 1
    iget-object v0, p1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/google/android/exoplayer2/source/o;

    .line 7
    .line 8
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/o$b;->c:Ll/g6c$a;

    .line 9
    .line 10
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/o$b;->d:Lcom/google/android/exoplayer2/source/m$a;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/o$b;->e:Ll/zde;

    .line 13
    .line 14
    invoke-interface {v0, p1}, Ll/zde;->a(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/drm/c;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/o$b;->f:Lcom/google/android/exoplayer2/upstream/c;

    .line 19
    .line 20
    iget v7, p0, Lcom/google/android/exoplayer2/source/o$b;->g:I

    .line 21
    .line 22
    const/4 v8, 0x0

    .line 23
    move-object v2, p1

    .line 24
    invoke-direct/range {v1 .. v8}, Lcom/google/android/exoplayer2/source/o;-><init>(Lcom/google/android/exoplayer2/n;Ll/g6c$a;Lcom/google/android/exoplayer2/source/m$a;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/upstream/c;ILcom/google/android/exoplayer2/source/o$a;)V

    .line 25
    .line 26
    .line 27
    return-object v1
.end method

.method public g(Ll/zde;)Lcom/google/android/exoplayer2/source/o$b;
    .locals 1

    .line 1
    const-string v0, "MediaSource.Factory#setDrmSessionManagerProvider no longer handles null by instantiating a new DefaultDrmSessionManagerProvider. Explicitly construct and pass an instance in order to retain the old behavior."

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/w11;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/zde;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/o$b;->e:Ll/zde;

    .line 10
    .line 11
    return-object p0
.end method

.method public h(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/o$b;
    .locals 1

    .line 1
    const-string v0, "MediaSource.Factory#setLoadErrorHandlingPolicy no longer handles null by instantiating a new DefaultLoadErrorHandlingPolicy. Explicitly construct and pass an instance in order to retain the old behavior."

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/w11;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/google/android/exoplayer2/upstream/c;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/o$b;->f:Lcom/google/android/exoplayer2/upstream/c;

    .line 10
    .line 11
    return-object p0
.end method
