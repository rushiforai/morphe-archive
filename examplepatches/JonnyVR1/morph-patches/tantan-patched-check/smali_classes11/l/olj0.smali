.class public final Ll/olj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mdg0;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/klj0;

.field public final b:[J

.field public final c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/nlj0;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/llj0;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/klj0;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/klj0;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/nlj0;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/llj0;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/olj0;->a:Ll/klj0;

    .line 5
    .line 6
    iput-object p3, p0, Ll/olj0;->d:Ljava/util/Map;

    .line 7
    .line 8
    iput-object p4, p0, Ll/olj0;->e:Ljava/util/Map;

    .line 9
    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget-object p2, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 18
    .line 19
    :goto_0
    iput-object p2, p0, Ll/olj0;->c:Ljava/util/Map;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/klj0;->j()[J

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/olj0;->b:[J

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public a(I)J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/olj0;->b:[J

    .line 2
    .line 3
    aget-wide v0, p0, p1

    .line 4
    .line 5
    return-wide v0
.end method

.method public b()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/olj0;->b:[J

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method

.method public f(J)I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/olj0;->b:[J

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, p1, p2, v1, v1}, Ll/bmk0;->e([JJZZ)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iget-object p0, p0, Ll/olj0;->b:[J

    .line 9
    .line 10
    array-length p0, p0

    .line 11
    if-ge p1, p0, :cond_0

    .line 12
    .line 13
    return p1

    .line 14
    :cond_0
    const/4 p0, -0x1

    .line 15
    return p0
.end method

.method public g(J)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Ll/myb;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/olj0;->a:Ll/klj0;

    .line 2
    .line 3
    iget-object v3, p0, Ll/olj0;->c:Ljava/util/Map;

    .line 4
    .line 5
    iget-object v4, p0, Ll/olj0;->d:Ljava/util/Map;

    .line 6
    .line 7
    iget-object v5, p0, Ll/olj0;->e:Ljava/util/Map;

    .line 8
    .line 9
    move-wide v1, p1

    .line 10
    invoke-virtual/range {v0 .. v5}, Ll/klj0;->h(JLjava/util/Map;Ljava/util/Map;Ljava/util/Map;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
