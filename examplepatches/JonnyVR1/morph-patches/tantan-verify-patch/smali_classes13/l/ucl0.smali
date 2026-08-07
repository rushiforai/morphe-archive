.class public Ll/ucl0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/bam;

.field public b:Ll/bam;

.field public c:Ll/bam;

.field public d:Ll/it5;

.field public e:Ll/ht5;

.field public f:Ll/bam$e;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/ucl0;->a:Ll/bam;

    .line 6
    .line 7
    iput-object v0, p0, Ll/ucl0;->b:Ll/bam;

    .line 8
    .line 9
    iput-object v0, p0, Ll/ucl0;->c:Ll/bam;

    .line 10
    .line 11
    new-instance v1, Ll/it5;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/it5;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ll/ucl0;->d:Ll/it5;

    .line 17
    .line 18
    new-instance v1, Ll/ht5;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/ht5;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ll/ucl0;->e:Ll/ht5;

    .line 24
    .line 25
    iput-object v0, p0, Ll/ucl0;->f:Ll/bam$e;

    .line 26
    .line 27
    return-void
.end method

.method public static c()Ll/ucl0;
    .locals 1

    .line 1
    new-instance v0, Ll/ucl0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ucl0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public final a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ucl0;->g:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const-string p0, "You should invoke method \'withOrigin()\' before this"

    .line 11
    .line 12
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final b()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ucl0;->c:Ll/bam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "You should invoke method \'withCompress(boolean soft)\' before this"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public d()Z
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/ucl0;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ucl0;->f:Ll/bam$e;

    .line 5
    .line 6
    iget-object v1, p0, Ll/ucl0;->c:Ll/bam;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v2, p0, Ll/ucl0;->h:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v3, p0, Ll/ucl0;->e:Ll/ht5;

    .line 13
    .line 14
    iget-object p0, p0, Ll/ucl0;->d:Ll/it5;

    .line 15
    .line 16
    invoke-interface {v1, v2, v3, p0, v0}, Ll/bam;->b(Ljava/lang/String;Ll/ht5;Ll/it5;Ll/bam$e;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_0
    iget-object v2, p0, Ll/ucl0;->h:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, p0, Ll/ucl0;->e:Ll/ht5;

    .line 24
    .line 25
    iget-object v4, p0, Ll/ucl0;->d:Ll/it5;

    .line 26
    .line 27
    const/4 v7, 0x0

    .line 28
    const/4 v8, 0x0

    .line 29
    const/4 v5, 0x0

    .line 30
    const/4 v6, 0x0

    .line 31
    invoke-interface/range {v1 .. v8}, Ll/bam;->a(Ljava/lang/String;Ll/ht5;Ll/it5;Ll/bam$c;Ll/bam$d;Ll/bam$a;Ll/bam$b;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method public e(Ll/bam$e;)Ll/ucl0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ucl0;->f:Ll/bam$e;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Z)Ll/ucl0;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ucl0;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ucl0;->g:Ljava/lang/String;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    new-instance p1, Ll/fuf;

    .line 9
    .line 10
    invoke-direct {p1, v0}, Ll/fuf;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/ucl0;->c:Ll/bam;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    new-instance p1, Ll/frx;

    .line 17
    .line 18
    invoke-direct {p1, v0}, Ll/frx;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Ll/ucl0;->c:Ll/bam;

    .line 22
    .line 23
    return-object p0
.end method

.method public g(Ljava/lang/String;)Ll/ucl0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ucl0;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ll/ht5;)Ll/ucl0;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/ucl0;->e:Ll/ht5;

    .line 4
    .line 5
    :cond_0
    return-object p0
.end method

.method public i(Ljava/lang/String;)Ll/ucl0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ucl0;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ll/it5;)Ll/ucl0;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/ucl0;->d:Ll/it5;

    .line 4
    .line 5
    :cond_0
    return-object p0
.end method
