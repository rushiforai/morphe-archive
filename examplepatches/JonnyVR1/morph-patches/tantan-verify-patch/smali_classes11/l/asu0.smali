.class public final Ll/asu0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/g6u0;

.field public final b:Ll/d8u0;

.field public final c:Ll/q8u0;

.field public final d:Ll/i9u0;

.field public final e:Ll/jcu0;

.field public final f:Ll/egu0;


# direct methods
.method public constructor <init>(Ll/g6u0;Ll/d8u0;Ll/q8u0;Ll/i9u0;Ll/jcu0;Ll/egu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/asu0;->a:Ll/g6u0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/asu0;->b:Ll/d8u0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/asu0;->c:Ll/q8u0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/asu0;->d:Ll/i9u0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/asu0;->e:Ll/jcu0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/asu0;->f:Ll/egu0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a(Ll/bsu0;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/asu0;->b:Ll/d8u0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsu0;->a(Ll/bsu0;)Ll/yru0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    new-instance v6, Ll/zru0;

    .line 11
    .line 12
    invoke-direct {v6, v0}, Ll/zru0;-><init>(Ll/d8u0;)V

    .line 13
    .line 14
    .line 15
    iget-object v7, p0, Ll/asu0;->f:Ll/egu0;

    .line 16
    .line 17
    iget-object v2, p0, Ll/asu0;->a:Ll/g6u0;

    .line 18
    .line 19
    iget-object v3, p0, Ll/asu0;->c:Ll/q8u0;

    .line 20
    .line 21
    iget-object v4, p0, Ll/asu0;->d:Ll/i9u0;

    .line 22
    .line 23
    iget-object v5, p0, Ll/asu0;->e:Ll/jcu0;

    .line 24
    .line 25
    invoke-virtual/range {v1 .. v7}, Ll/yru0;->k(Ll/har0;Ll/yns0;Ll/joy0;Ll/aos0;Ll/rar0;Ll/ggu0;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
