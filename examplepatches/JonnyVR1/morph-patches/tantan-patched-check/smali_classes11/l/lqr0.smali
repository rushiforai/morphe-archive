.class public final Ll/lqr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tor0;


# instance fields
.field public final a:Ll/eqr0;

.field public final b:[J

.field public final c:Ljava/util/Map;

.field public final d:Ljava/util/Map;

.field public final e:Ljava/util/Map;


# direct methods
.method public constructor <init>(Ll/eqr0;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lqr0;->a:Ll/eqr0;

    .line 5
    .line 6
    iput-object p3, p0, Ll/lqr0;->d:Ljava/util/Map;

    .line 7
    .line 8
    iput-object p4, p0, Ll/lqr0;->e:Ljava/util/Map;

    .line 9
    .line 10
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iput-object p2, p0, Ll/lqr0;->c:Ljava/util/Map;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/eqr0;->h()[J

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Ll/lqr0;->b:[J

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final e(I)J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/lqr0;->b:[J

    .line 2
    .line 3
    aget-wide v0, p0, p1

    .line 4
    .line 5
    return-wide v0
.end method

.method public final f(J)Ljava/util/List;
    .locals 6

    .line 1
    iget-object v3, p0, Ll/lqr0;->c:Ljava/util/Map;

    .line 2
    .line 3
    iget-object v4, p0, Ll/lqr0;->d:Ljava/util/Map;

    .line 4
    .line 5
    iget-object v5, p0, Ll/lqr0;->e:Ljava/util/Map;

    .line 6
    .line 7
    iget-object v0, p0, Ll/lqr0;->a:Ll/eqr0;

    .line 8
    .line 9
    move-wide v1, p1

    .line 10
    invoke-virtual/range {v0 .. v5}, Ll/eqr0;->e(JLjava/util/Map;Ljava/util/Map;Ljava/util/Map;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final zza()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lqr0;->b:[J

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method
