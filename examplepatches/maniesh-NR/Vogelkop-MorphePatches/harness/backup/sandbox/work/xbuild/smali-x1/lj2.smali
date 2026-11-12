.class public abstract Llj2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzy9;

.field public final b:Lob;

.field public final c:Lode;

.field public final d:Lh42;

.field public e:I

.field public f:I

.field public g:I

.field public h:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lzy9;

    invoke-direct {v0, p0}, Lzy9;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Llj2;->a:Lzy9;

    new-instance v0, Lob;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lob;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Llj2;->b:Lob;

    const/4 v0, 0x0

    iput v0, p0, Llj2;->g:I

    iput v0, p0, Llj2;->f:I

    iput-boolean v0, p0, Llj2;->h:Z

    const/4 v0, 0x3

    iput v0, p0, Llj2;->e:I

    new-instance v0, Lode;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Llj2;->c:Lode;

    invoke-static {v0}, Lb8h;->d(Lekc;)Lh42;

    move-result-object v0

    iput-object v0, p0, Llj2;->d:Lh42;

    return-void
.end method


# virtual methods
.method public a()V
    .registers 1

    return-void
.end method

.method public final b(Landroid/content/Context;Ljava/lang/Runnable;)V
    .registers 5

    iget v0, p0, Llj2;->e:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_9

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_9
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Llj2;->d(I)V

    iget-object v0, p0, Llj2;->a:Lzy9;

    invoke-virtual {p0, p1, v0, p2}, Llj2;->c(Landroid/content/Context;Lzy9;Ljava/lang/Runnable;)V

    return-void
.end method

.method public abstract c(Landroid/content/Context;Lzy9;Ljava/lang/Runnable;)V
.end method

.method public final d(I)V
    .registers 3

    iput p1, p0, Llj2;->e:I

    const/4 v0, 0x1

    if-eq p1, v0, :cond_6

    const/4 v0, 0x0

    :cond_6
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iget-object p0, p0, Llj2;->c:Lode;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
