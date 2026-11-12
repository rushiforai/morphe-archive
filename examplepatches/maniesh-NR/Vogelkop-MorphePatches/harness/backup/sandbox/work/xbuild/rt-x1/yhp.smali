.class public final Lyhp;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Laip;

.field public b:J

.field public c:Z


# direct methods
.method public constructor <init>(Laip;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyhp;->a:Laip;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 7

    iget-boolean v0, p0, Lyhp;->c:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lyhp;->c:Z

    iget-object p0, p0, Lyhp;->a:Laip;

    iget-object v1, p0, Laip;->c:Lwhp;

    sget v2, Lfip;->e:I

    sub-int/2addr v2, v0

    sput v2, Lfip;->e:I

    invoke-virtual {p0}, Laip;->e()V

    iget-object v2, p0, Laip;->b:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    iget-object v3, p0, Laip;->j:[B

    const/4 v4, 0x0

    if-eqz v3, :cond_25

    iput-object v4, p0, Laip;->g:Lyhp;

    invoke-static {v1}, Lfip;->d(Lwhp;)V

    :cond_23
    :goto_23
    move-object p0, v4

    goto :goto_46

    :cond_25
    iget v3, p0, Laip;->i:I

    const/4 v5, 0x2

    if-ge v3, v5, :cond_46

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_46

    iput-object v4, p0, Laip;->g:Lyhp;

    sget-object v2, Lfip;->d:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Laip;->e()V

    sget-boolean p0, Lfip;->f:Z

    if-nez p0, :cond_23

    sput-boolean v0, Lfip;->f:Z

    sget-object p0, Lfip;->h:Lkoj;

    invoke-static {p0}, Lgxo;->c(Ljava/lang/Runnable;)V

    goto :goto_23

    :cond_46
    :goto_46
    if-eqz p0, :cond_4b

    invoke-virtual {p0}, Laip;->g()V

    :cond_4b
    invoke-static {}, Lfip;->e()V

    return-void
.end method
