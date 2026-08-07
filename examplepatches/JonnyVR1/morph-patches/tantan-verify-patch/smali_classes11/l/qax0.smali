.class public final Ll/qax0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/ArrayList;

.field public b:Ll/nax0;

.field public c:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/qax0;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    sget-object v0, Ll/nax0;->b:Ll/nax0;

    .line 12
    .line 13
    iput-object v0, p0, Ll/qax0;->b:Ll/nax0;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Ll/qax0;->c:Ljava/lang/Integer;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a(Ll/zww0;ILjava/lang/String;Ljava/lang/String;)Ll/qax0;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/qax0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/wax0;

    .line 6
    .line 7
    const/4 v6, 0x0

    .line 8
    move-object v2, p1

    .line 9
    move v3, p2

    .line 10
    move-object v4, p3

    .line 11
    move-object v5, p4

    .line 12
    invoke-direct/range {v1 .. v6}, Ll/wax0;-><init>(Ll/zww0;ILjava/lang/String;Ljava/lang/String;Ll/vax0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    const-string p0, "addEntry cannot be called after build()"

    .line 20
    .line 21
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public final b(Ll/nax0;)Ll/qax0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qax0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Ll/qax0;->b:Ll/nax0;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, "setAnnotations cannot be called after build()"

    .line 9
    .line 10
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public final c(I)Ll/qax0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qax0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Ll/qax0;->c:Ljava/lang/Integer;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "setPrimaryKeyId cannot be called after build()"

    .line 13
    .line 14
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public final d()Ll/yax0;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/qax0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    iget-object v0, p0, Ll/qax0;->c:Ljava/lang/Integer;

    .line 7
    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v2, p0, Ll/qax0;->a:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    const/4 v4, 0x0

    .line 21
    :cond_0
    if-ge v4, v3, :cond_1

    .line 22
    .line 23
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    check-cast v5, Ll/wax0;

    .line 28
    .line 29
    invoke-virtual {v5}, Ll/wax0;->a()I

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    add-int/lit8 v4, v4, 0x1

    .line 34
    .line 35
    if-ne v5, v0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const-string p0, "primary key ID is not present in entries"

    .line 39
    .line 40
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-object v1

    .line 44
    :cond_2
    :goto_0
    new-instance v0, Ll/yax0;

    .line 45
    .line 46
    iget-object v2, p0, Ll/qax0;->b:Ll/nax0;

    .line 47
    .line 48
    iget-object v3, p0, Ll/qax0;->a:Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    iget-object v4, p0, Ll/qax0;->c:Ljava/lang/Integer;

    .line 55
    .line 56
    invoke-direct {v0, v2, v3, v4, v1}, Ll/yax0;-><init>(Ll/nax0;Ljava/util/List;Ljava/lang/Integer;Ll/xax0;)V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Ll/qax0;->a:Ljava/util/ArrayList;

    .line 60
    .line 61
    return-object v0

    .line 62
    :cond_3
    const-string p0, "cannot call build() twice"

    .line 63
    .line 64
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-object v1
.end method
