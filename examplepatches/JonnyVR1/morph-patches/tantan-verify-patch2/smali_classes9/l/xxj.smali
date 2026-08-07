.class public Ll/xxj;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xxj$a;
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ll/zxj;

.field public final c:Ll/zxj;

.field public final d:Ljava/lang/String;

.field public e:Z

.field public f:Ll/xxj$a;

.field public g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/zxj;Ll/zxj;Ljava/lang/String;)V
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
    iput-object v0, p0, Ll/xxj;->a:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/xxj;->e:Z

    .line 13
    .line 14
    iput-object p1, p0, Ll/xxj;->b:Ll/zxj;

    .line 15
    .line 16
    iput-object p2, p0, Ll/xxj;->c:Ll/zxj;

    .line 17
    .line 18
    iput-object p3, p0, Ll/xxj;->d:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public static b(ZZZ)Ll/xxj;
    .locals 2

    .line 1
    new-instance v0, Ll/xxj$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/xxj$a;-><init>(ZZZ)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ll/xxj;

    .line 7
    .line 8
    invoke-static {}, Ll/zxj;->c()Ll/zxj;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {}, Ll/zxj;->c()Ll/zxj;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    const-string v1, ""

    .line 17
    .line 18
    invoke-direct {p0, p1, p2, v1}, Ll/xxj;-><init>(Ll/zxj;Ll/zxj;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/xxj;->k(Ll/xxj$a;)V

    .line 22
    .line 23
    .line 24
    return-object p0
.end method


# virtual methods
.method public a()Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/xxj;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v1, :cond_2

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ljava/lang/Integer;

    .line 19
    .line 20
    iget-object v3, p0, Ll/xxj;->b:Ll/zxj;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    invoke-virtual {v3, v4}, Ll/zxj;->b(I)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    return v2

    .line 33
    :cond_1
    iget-object v2, p0, Ll/xxj;->c:Ll/zxj;

    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {v2, v1}, Ll/zxj;->b(I)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_2
    return v2
.end method

.method public c()Ll/xxj$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxj;->f:Ll/xxj$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ll/zxj;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxj;->b:Ll/zxj;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ll/zxj;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxj;->c:Ll/zxj;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxj;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxj;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/xxj;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public i()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xxj;->g()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "voiceLiveMain"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xxj;->g()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "voiceLiveVice"

    .line 18
    .line 19
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxj;->b:Ll/zxj;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/zxj;->h()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public k(Ll/xxj$a;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/xxj;->f:Ll/xxj$a;

    .line 2
    .line 3
    iget-object v0, p0, Ll/xxj;->b:Ll/zxj;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/zxj;->i(Ll/xxj$a;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Ll/xxj;->c:Ll/zxj;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/zxj;->i(Ll/xxj$a;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public l(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xxj;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/xxj;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method public n(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xxj;->a:Ljava/util/List;

    .line 2
    .line 3
    iget-object v0, p0, Ll/xxj;->b:Ll/zxj;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/zxj;->j(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Ll/xxj;->c:Ll/zxj;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/zxj;->j(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method
