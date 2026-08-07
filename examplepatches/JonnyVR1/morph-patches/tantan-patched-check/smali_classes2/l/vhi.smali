.class public Ll/vhi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/z06;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z06<",
            "Ll/n0f;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ll/yk90;

.field public c:J

.field public d:I

.field public e:Ll/vr3;


# direct methods
.method public constructor <init>(Ll/z06;Ll/yk90;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/n0f;",
            ">;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vhi;->a:Ll/z06;

    .line 5
    .line 6
    iput-object p2, p0, Ll/vhi;->b:Ll/yk90;

    .line 7
    .line 8
    const-wide/16 p1, 0x0

    .line 9
    .line 10
    iput-wide p1, p0, Ll/vhi;->c:J

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()Ll/z06;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/z06<",
            "Ll/n0f;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vhi;->a:Ll/z06;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ll/yk90;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vhi;->b:Ll/yk90;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/vhi;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public d()Ll/cl90;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vhi;->b:Ll/yk90;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/yk90;->n()Ll/cl90;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/vhi;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public f()Ll/vr3;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vhi;->e:Ll/vr3;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vhi;->b:Ll/yk90;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/request/ImageRequest;->w()Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public h(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/vhi;->c:J

    .line 2
    .line 3
    return-void
.end method
