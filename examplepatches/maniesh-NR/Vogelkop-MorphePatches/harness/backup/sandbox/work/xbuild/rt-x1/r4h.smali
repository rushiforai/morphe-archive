.class public final Lr4h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Lnp1;

.field public b:Z

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:Z


# direct methods
.method public constructor <init>(Lnp1;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lr4h;->a:Lnp1;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-boolean v0, p0, Lr4h;->g:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    iput-boolean v0, p0, Lr4h;->g:Z

    iget-object v0, p0, Lr4h;->a:Lnp1;

    const/16 v1, 0x2710

    invoke-virtual {v0, v1}, Lnp1;->f(I)V

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final b()V
    .registers 7

    iget-boolean v0, p0, Lr4h;->b:Z

    if-eqz v0, :cond_7

    const/16 v0, 0x5f

    goto :goto_9

    :cond_7
    const/16 v0, 0x3c

    :goto_9
    iget v1, p0, Lr4h;->e:I

    const/16 v2, 0x64

    mul-int/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget v4, p0, Lr4h;->e:I

    const/4 v5, 0x5

    invoke-static {v3, v4, v5, v1}, Lz1m;->d(IIII)I

    move-result v1

    iget v3, p0, Lr4h;->d:I

    invoke-static {v3, v2, v5, v1}, Lv0g;->h(IIII)I

    move-result v1

    const/16 v2, 0x12c

    invoke-static {v1, v2, v0}, Lcs5;->t(III)I

    move-result v0

    const/4 v1, 0x0

    iput v1, p0, Lr4h;->d:I

    iput v0, p0, Lr4h;->e:I

    const-wide/16 v1, 0xc8

    invoke-static {p0, v1, v2}, Lvml;->d(Ljava/lang/Runnable;J)V

    iget v1, p0, Lr4h;->f:I

    if-eq v0, v1, :cond_3a

    iput v0, p0, Lr4h;->f:I

    iget-object p0, p0, Lr4h;->a:Lnp1;

    invoke-virtual {p0, v0}, Lnp1;->f(I)V

    :cond_3a
    return-void
.end method

.method public final run()V
    .registers 1

    invoke-virtual {p0}, Lr4h;->b()V

    return-void
.end method
