.class public Ll/le3$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/le3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:I
    .annotation build Landroidx/annotation/StyleRes;
    .end annotation
.end field

.field public b:Z

.field public c:F

.field public d:Z

.field public e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/view/Window;",
            ">;"
        }
    .end annotation
.end field

.field public f:J

.field public g:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/jgc0;->k:I

    .line 5
    .line 6
    iput v0, p0, Ll/le3$a;->a:I

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/le3$a;->b:Z

    .line 10
    .line 11
    const/high16 v0, -0x40800000    # -1.0f

    .line 12
    .line 13
    iput v0, p0, Ll/le3$a;->c:F

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Ll/le3$a;->d:Z

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Ll/le3$a;->e:Ll/y20;

    .line 20
    .line 21
    const-wide/16 v0, 0xdc

    .line 22
    .line 23
    iput-wide v0, p0, Ll/le3$a;->f:J

    .line 24
    .line 25
    const-wide/16 v0, 0xb4

    .line 26
    .line 27
    iput-wide v0, p0, Ll/le3$a;->g:J

    .line 28
    .line 29
    return-void
.end method

.method public static b()Ll/le3$a;
    .locals 1

    .line 1
    new-instance v0, Ll/le3$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/le3$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a()Ll/rq2;
    .locals 6

    .line 1
    new-instance v0, Ll/le3;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/le3;-><init>(Ll/me3;)V

    .line 5
    .line 6
    .line 7
    iget-wide v1, p0, Ll/le3$a;->f:J

    .line 8
    .line 9
    const-wide/16 v3, 0x0

    .line 10
    .line 11
    cmp-long v5, v1, v3

    .line 12
    .line 13
    if-lez v5, :cond_0

    .line 14
    .line 15
    invoke-static {v0, v1, v2}, Ll/le3;->s(Ll/le3;J)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-wide v1, p0, Ll/le3$a;->g:J

    .line 19
    .line 20
    cmp-long v3, v1, v3

    .line 21
    .line 22
    if-lez v3, :cond_1

    .line 23
    .line 24
    invoke-static {v0, v1, v2}, Ll/le3;->r(Ll/le3;J)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget v1, p0, Ll/le3$a;->c:F

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/rq2;->i(F)Ll/rq2;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-boolean v1, p0, Ll/le3$a;->b:Z

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/rq2;->j(Z)Ll/rq2;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-boolean v1, p0, Ll/le3$a;->d:Z

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ll/rq2;->k(Z)Ll/rq2;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p0, Ll/le3$a;->e:Ll/y20;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ll/rq2;->m(Ll/y20;)Ll/rq2;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget p0, p0, Ll/le3$a;->a:I

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Ll/rq2;->l(I)Ll/rq2;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

.method public c(F)Ll/le3$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/le3$a;->c:F

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Z)Ll/le3$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/le3$a;->b:Z

    .line 2
    .line 3
    return-object p0
.end method
