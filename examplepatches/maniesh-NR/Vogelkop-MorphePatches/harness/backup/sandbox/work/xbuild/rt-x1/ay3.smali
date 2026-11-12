.class public final Lay3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Llqm;

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:Ln3l;

.field public final f:Z

.field public final g:Lcom/opera/android/browser/TabInfo;

.field public final h:Lv4l;

.field public final i:I

.field public final j:I

.field public final k:Lwx3;

.field public final l:Lsqh;

.field public final m:Z

.field public final n:Z

.field public final o:B

.field public final p:Z

.field public final q:Z

.field public final r:Z

.field public final s:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lvx3;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lvx3;->a:Llqm;

    iput-object v0, p0, Lay3;->a:Llqm;

    iget v0, p1, Lvx3;->b:I

    iput v0, p0, Lay3;->b:I

    iget v0, p1, Lvx3;->c:I

    iput v0, p0, Lay3;->c:I

    iget v0, p1, Lvx3;->d:I

    iput v0, p0, Lay3;->d:I

    iget-object v0, p1, Lvx3;->e:Ln3l;

    iput-object v0, p0, Lay3;->e:Ln3l;

    iget-boolean v0, p1, Lvx3;->f:Z

    iput-boolean v0, p0, Lay3;->f:Z

    iget-object v0, p1, Lvx3;->h:Lcom/opera/android/browser/TabInfo;

    iput-object v0, p0, Lay3;->g:Lcom/opera/android/browser/TabInfo;

    iget-object v0, p1, Lvx3;->i:Lv4l;

    iput-object v0, p0, Lay3;->h:Lv4l;

    iget v0, p1, Lvx3;->g:I

    iput v0, p0, Lay3;->i:I

    iget v0, p1, Lvx3;->j:I

    iput v0, p0, Lay3;->j:I

    iget-object v0, p1, Lvx3;->k:Lwx3;

    iput-object v0, p0, Lay3;->k:Lwx3;

    iget-object v0, p1, Lvx3;->l:Lsqh;

    iput-object v0, p0, Lay3;->l:Lsqh;

    iget-boolean v0, p1, Lvx3;->m:Z

    iput-boolean v0, p0, Lay3;->m:Z

    iget-boolean v0, p1, Lvx3;->n:Z

    iput-boolean v0, p0, Lay3;->n:Z

    iget-byte v0, p1, Lvx3;->o:B

    iput-byte v0, p0, Lay3;->o:B

    iget-boolean v0, p1, Lvx3;->q:Z

    iput-boolean v0, p0, Lay3;->p:Z

    iget-boolean v0, p1, Lvx3;->r:Z

    iput-boolean v0, p0, Lay3;->q:Z

    iget-boolean v0, p1, Lvx3;->s:Z

    iput-boolean v0, p0, Lay3;->r:Z

    iget-object p1, p1, Lvx3;->p:Ljava/util/ArrayList;

    iput-object p1, p0, Lay3;->s:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_56

    return-void

    :cond_56
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    throw p0
.end method

.method public static a(Ljava/lang/String;Llqm;Z)Lvx3;
    .registers 4

    new-instance v0, Lvx3;

    invoke-direct {v0, p1}, Lvx3;-><init>(Llqm;)V

    new-instance p1, Lyx3;

    invoke-direct {p1, p0, p2}, Lyx3;-><init>(Ljava/lang/String;Z)V

    iget-object p0, v0, Lvx3;->p:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
