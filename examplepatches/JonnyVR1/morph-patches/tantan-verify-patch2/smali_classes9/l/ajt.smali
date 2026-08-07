.class public final Ll/ajt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ajt$a;
    }
.end annotation


# instance fields
.field public final a:Ll/ajt$a;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Z

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:J

.field public i:J

.field public j:I

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ajt$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ajt$a;-><init>(Ll/ajt;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ajt;->a:Ll/ajt$a;

    .line 10
    .line 11
    const-string v0, "live"

    .line 12
    .line 13
    iput-object v0, p0, Ll/ajt;->d:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Ll/ajt;->e:Z

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput-object v1, p0, Ll/ajt;->g:Ljava/lang/String;

    .line 20
    .line 21
    const-wide/16 v1, 0x0

    .line 22
    .line 23
    iput-wide v1, p0, Ll/ajt;->h:J

    .line 24
    .line 25
    iput-wide v1, p0, Ll/ajt;->i:J

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    iput v1, p0, Ll/ajt;->j:I

    .line 29
    .line 30
    const-string v1, ""

    .line 31
    .line 32
    iput-object v1, p0, Ll/ajt;->k:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, p0, Ll/ajt;->l:Ljava/lang/String;

    .line 35
    .line 36
    iput-boolean v0, p0, Ll/ajt;->m:Z

    .line 37
    .line 38
    iput-object p1, p0, Ll/ajt;->b:Ljava/lang/String;

    .line 39
    .line 40
    iput-object p1, p0, Ll/ajt;->c:Ljava/lang/String;

    .line 41
    .line 42
    return-void
.end method

.method public static bridge synthetic a(Ll/ajt;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ajt;->c:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/ajt;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ajt;->m:Z

    return p0
.end method


# virtual methods
.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ajt;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ajt;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ajt;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ajt;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ajt;->g:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public final h()Ll/ajt$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ajt;->a:Ll/ajt$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ajt;->i:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public j()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ajt;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public k()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ajt;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()V
    .locals 1

    .line 1
    iget v0, p0, Ll/ajt;->j:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Ll/ajt;->j:I

    .line 6
    .line 7
    return-void
.end method

.method public m(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ajt;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public n(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ajt;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public o(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ajt;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public p(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ajt;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method public q(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ajt;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public r(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ajt;->g:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iput-object p1, p0, Ll/ajt;->g:Ljava/lang/String;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public s(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ajt;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public t(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ajt;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method public u(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ajt;->i:J

    .line 2
    .line 3
    return-void
.end method

.method public v(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ajt;->h:J

    .line 2
    .line 3
    return-void
.end method

.method public w(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ajt;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public x()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ajt;->e:Z

    .line 2
    .line 3
    return p0
.end method
