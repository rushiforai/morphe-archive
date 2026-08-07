.class public final Ll/mru0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/g6u0;

.field public final b:Ll/d8u0;

.field public final c:Ll/q8u0;

.field public final d:Ll/i9u0;

.field public final e:Ll/jcu0;

.field public final f:Ll/q6w0;

.field public final g:Ll/t6w0;


# direct methods
.method public constructor <init>(Ll/g6u0;Ll/d8u0;Ll/q8u0;Ll/i9u0;Ll/jcu0;Ll/q6w0;Ll/t6w0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mru0;->a:Ll/g6u0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/mru0;->b:Ll/d8u0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/mru0;->c:Ll/q8u0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/mru0;->d:Ll/i9u0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/mru0;->e:Ll/jcu0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/mru0;->f:Ll/q6w0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/mru0;->g:Ll/t6w0;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a(Ll/qru0;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/mru0;->b:Ll/d8u0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/qru0;->b(Ll/qru0;)Ll/dru0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    new-instance v6, Ll/lru0;

    .line 11
    .line 12
    invoke-direct {v6, v0}, Ll/lru0;-><init>(Ll/d8u0;)V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Ll/mru0;->a:Ll/g6u0;

    .line 16
    .line 17
    iget-object v3, p0, Ll/mru0;->c:Ll/q8u0;

    .line 18
    .line 19
    iget-object v4, p0, Ll/mru0;->d:Ll/i9u0;

    .line 20
    .line 21
    iget-object v5, p0, Ll/mru0;->e:Ll/jcu0;

    .line 22
    .line 23
    invoke-virtual/range {v1 .. v6}, Ll/dru0;->i(Ll/har0;Ll/yns0;Ll/joy0;Ll/aos0;Ll/rar0;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/mru0;->f:Ll/q6w0;

    .line 27
    .line 28
    iget-object p0, p0, Ll/mru0;->g:Ll/t6w0;

    .line 29
    .line 30
    invoke-virtual {p1, v0, p0}, Ll/qru0;->e(Ll/q6w0;Ll/t6w0;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
