.class public final Lxho;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public A:Ljava/io/File;

.field public final B:Ljava/lang/String;

.field public C:Ljava/lang/String;

.field public D:Ljava/lang/String;

.field public E:Z

.field public F:J

.field public G:Leyi;

.field public H:Ljava/lang/String;

.field public I:Ljava/lang/String;

.field public J:Ljava/lang/String;

.field public K:Ljava/lang/String;

.field public L:Ljava/lang/String;

.field public M:Ljava/lang/String;

.field public N:Ljava/lang/String;

.field public O:Ljava/lang/String;

.field public P:Ljava/lang/String;

.field public Q:Ljava/lang/String;

.field public R:Ljava/lang/String;

.field public S:Ljava/lang/String;

.field public T:Ljava/lang/String;

.field public U:Ljava/lang/String;

.field public V:Z

.field public final W:Ljava/lang/String;

.field public final X:Ljava/lang/String;

.field public final Y:I

.field public Z:I

.field public a:Lw06;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Z

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public final m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:Ljava/util/ArrayList;

.field public p:Ljava/util/ArrayList;

.field public q:Ljava/lang/String;

.field public r:Ljava/lang/String;

.field public s:Ljava/lang/String;

.field public t:Ljava/util/HashMap;

.field public u:Ljava/lang/String;

.field public v:Ljava/lang/String;

.field public w:Ljava/lang/String;

.field public x:Ljava/util/ArrayList;

.field public y:Ljava/lang/String;

.field public z:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lw06;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxho;->a:Lw06;

    iput-object p2, p0, Lxho;->b:Ljava/lang/String;

    iput-object p3, p0, Lxho;->c:Ljava/lang/String;

    sget-object p2, Lw06;->i:Lw06;

    if-ne p1, p2, :cond_10

    iput-object p4, p0, Lxho;->l:Ljava/lang/String;

    goto :goto_3b

    :cond_10
    sget-object p2, Lw06;->u:Lw06;

    if-ne p1, p2, :cond_3b

    iput-object p4, p0, Lxho;->m:Ljava/lang/String;

    new-instance p1, Ldgo;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Ldgo;-><init>(Ljava/lang/Object;B)V

    new-instance p2, Lh9o;

    const/16 p3, 0x16

    invoke-direct {p2, p3}, Lh9o;-><init>(B)V

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_3b

    invoke-static {p4}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_3b

    sget-object p3, Lgxo;->c:Lgxo;

    new-instance v0, Lh4m;

    const/16 v1, 0xd

    invoke-direct {v0, p4, p2, p1, v1}, Lh4m;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p3, v0}, Lgxo;->b(Ljava/lang/Runnable;)V

    :cond_3b
    :goto_3b
    iput-object p5, p0, Lxho;->d:Ljava/lang/String;

    iput-object p6, p0, Lxho;->e:Ljava/lang/String;

    iput-boolean p7, p0, Lxho;->f:Z

    iput-object p8, p0, Lxho;->g:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lw06;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 12

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxho;->a:Lw06;

    iput-object p2, p0, Lxho;->b:Ljava/lang/String;

    iput-object p3, p0, Lxho;->c:Ljava/lang/String;

    iput-object p4, p0, Lxho;->d:Ljava/lang/String;

    iput-object p5, p0, Lxho;->e:Ljava/lang/String;

    iput-boolean p6, p0, Lxho;->f:Z

    iput-object p7, p0, Lxho;->g:Ljava/lang/String;

    iput-object p8, p0, Lxho;->B:Ljava/lang/String;

    iput-object p9, p0, Lxho;->W:Ljava/lang/String;

    iput-object p10, p0, Lxho;->X:Ljava/lang/String;

    iput p11, p0, Lxho;->Y:I

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 7

    iget-object v0, p0, Lxho;->s:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    return v1

    :cond_a
    iget-object v0, p0, Lxho;->A:Ljava/io/File;

    if-nez v0, :cond_17

    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lxho;->s:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lxho;->A:Ljava/io/File;

    :cond_17
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lxho;->A:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    iget-wide v4, p0, Lxho;->F:J

    cmp-long p0, v2, v4

    if-nez p0, :cond_2b

    const/4 p0, 0x1

    return p0

    :cond_2b
    return v1
.end method
