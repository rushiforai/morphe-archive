.class public abstract Lcom/immomo/moment/mediautils/e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/moment/mediautils/e$b;,
        Lcom/immomo/moment/mediautils/e$a;
    }
.end annotation


# instance fields
.field a:Lcom/immomo/moment/mediautils/e$a;

.field b:Lcom/immomo/moment/mediautils/e$b;

.field c:I

.field d:I

.field e:I

.field f:I

.field g:I

.field h:I

.field i:I

.field j:I

.field k:I

.field l:I

.field protected m:Z

.field n:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/e;->m:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/immomo/moment/mediautils/e;->n:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public abstract a()V
.end method

.method public abstract b(Ll/ad60;)V
.end method

.method public abstract c(Ll/ad60;)V
.end method

.method public d(III)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/e;->j:I

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/moment/mediautils/e;->k:I

    .line 4
    .line 5
    iput p3, p0, Lcom/immomo/moment/mediautils/e;->l:I

    .line 6
    .line 7
    return-void
.end method

.method public e(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/e;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method public f(Lcom/immomo/moment/mediautils/e$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/e;->a:Lcom/immomo/moment/mediautils/e$a;

    .line 2
    .line 3
    return-void
.end method

.method public g(Lcom/immomo/moment/mediautils/e$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/e;->b:Lcom/immomo/moment/mediautils/e$b;

    .line 2
    .line 3
    return-void
.end method

.method public h(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/e;->n:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 7
    .line 8
    const-string p1, "SetMediaOutputUrl parameter is null"

    .line 9
    .line 10
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    throw p0
.end method

.method public i(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/e;->i:I

    .line 2
    .line 3
    return-void
.end method

.method public j(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/e;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public k(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/e;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public l(IIII)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/e;->c:I

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/moment/mediautils/e;->d:I

    .line 4
    .line 5
    iput p3, p0, Lcom/immomo/moment/mediautils/e;->e:I

    .line 6
    .line 7
    iput p4, p0, Lcom/immomo/moment/mediautils/e;->f:I

    .line 8
    .line 9
    return-void
.end method

.method public abstract m()Z
.end method

.method public abstract n()V
.end method
