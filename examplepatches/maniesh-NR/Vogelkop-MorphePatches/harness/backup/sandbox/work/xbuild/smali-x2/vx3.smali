.class public final Lvx3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Llqm;

.field public b:I

.field public c:I

.field public d:I

.field public e:Ln3l;

.field public f:Z

.field public g:I

.field public h:Lcom/opera/android/browser/TabInfo;

.field public i:Lv4l;

.field public j:I

.field public k:Lwx3;

.field public l:Lsqh;

.field public m:Z

.field public n:Z

.field public o:B

.field public final p:Ljava/util/ArrayList;

.field public q:Z

.field public r:Z

.field public s:Z


# direct methods
.method public constructor <init>(Llqm;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    iput v0, p0, Lvx3;->b:I

    const/4 v0, 0x3

    iput v0, p0, Lvx3;->c:I

    iput v0, p0, Lvx3;->d:I

    sget-object v0, Ln3l;->d:Ln3l;

    iput-object v0, p0, Lvx3;->e:Ln3l;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lvx3;->f:Z

    const/high16 v1, -0x80000000

    iput v1, p0, Lvx3;->g:I

    sget-object v1, Lv4l;->d:Lv4l;

    iput-object v1, p0, Lvx3;->i:Lv4l;

    const/4 v1, -0x1

    iput v1, p0, Lvx3;->j:I

    sget-object v1, Lwx3;->Ho:Lpsp;

    iput-object v1, p0, Lvx3;->k:Lwx3;

    const/4 v1, 0x0

    iput-byte v1, p0, Lvx3;->o:B

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lvx3;->p:Ljava/util/ArrayList;

    iput-boolean v0, p0, Lvx3;->r:Z

    iput-object p1, p0, Lvx3;->a:Llqm;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 2

    if-eqz p1, :cond_4

    const/4 p1, 0x3

    goto :goto_5

    :cond_4
    const/4 p1, 0x1

    :goto_5
    iput p1, p0, Lvx3;->d:I

    return-void
.end method

.method public final b(Ljava/lang/String;Z)V
    .registers 4

    new-instance v0, Lyx3;

    invoke-direct {v0, p1, p2}, Lyx3;-><init>(Ljava/lang/String;Z)V

    iget-object p0, p0, Lvx3;->p:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final c(Z)V
    .registers 2

    if-eqz p1, :cond_4

    const/4 p1, 0x1

    goto :goto_5

    :cond_4
    const/4 p1, 0x2

    :goto_5
    iput p1, p0, Lvx3;->b:I

    return-void
.end method

.method public final d(Z)V
    .registers 2

    if-eqz p1, :cond_5

    sget-object p1, Ln3l;->e:Ln3l;

    goto :goto_7

    :cond_5
    sget-object p1, Ln3l;->d:Ln3l;

    :goto_7
    iput-object p1, p0, Lvx3;->e:Ln3l;

    return-void
.end method

.method public final e(Z)V
    .registers 2

    if-eqz p1, :cond_4

    const/4 p1, 0x2

    goto :goto_5

    :cond_4
    const/4 p1, 0x3

    :goto_5
    iput p1, p0, Lvx3;->c:I

    return-void
.end method
