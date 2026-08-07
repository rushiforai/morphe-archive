.class public Ll/vo4$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vo4;
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


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/jgc0;->k:I

    .line 5
    .line 6
    iput v0, p0, Ll/vo4$a;->a:I

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/vo4$a;->b:Z

    .line 10
    .line 11
    const/high16 v0, -0x40800000    # -1.0f

    .line 12
    .line 13
    iput v0, p0, Ll/vo4$a;->c:F

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Ll/vo4$a;->d:Z

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Ll/vo4$a;->e:Ll/y20;

    .line 20
    .line 21
    return-void
.end method

.method public static b()Ll/vo4$a;
    .locals 1

    .line 1
    new-instance v0, Ll/vo4$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vo4$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a()Ll/rq2;
    .locals 2

    .line 1
    new-instance v0, Ll/vo4;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/vo4;-><init>(Ll/wo4;)V

    .line 5
    .line 6
    .line 7
    iget v1, p0, Ll/vo4$a;->c:F

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/rq2;->i(F)Ll/rq2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-boolean v1, p0, Ll/vo4$a;->b:Z

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/rq2;->j(Z)Ll/rq2;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-boolean v1, p0, Ll/vo4$a;->d:Z

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/rq2;->k(Z)Ll/rq2;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Ll/vo4$a;->e:Ll/y20;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/rq2;->m(Ll/y20;)Ll/rq2;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget p0, p0, Ll/vo4$a;->a:I

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ll/rq2;->l(I)Ll/rq2;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public c(F)Ll/vo4$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/vo4$a;->c:F

    .line 2
    .line 3
    return-object p0
.end method
