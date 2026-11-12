.class public final Ldyk;
.super Lj93;
.source "SourceFile"


# instance fields
.field public final d:Ld8j;

.field public final e:Lzxk;

.field public final f:Ldb;

.field public final g:Lxb;

.field public final h:Ld7h;

.field public final i:Lzwk;

.field public final j:Lkxk;

.field public final k:Lbf9;

.field public final l:Lxc9;

.field public final m:Lsom;

.field public final n:Lode;

.field public final o:Lw4i;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Ld8j;Lzxk;Ldb;Lxb;Ld7h;Lzwk;Lkxk;Lbf9;Lxc9;Lsom;)V
    .registers 12

    invoke-direct {p0, p1, p2}, Lj93;-><init>(Lcom/opera/android/settings/SettingsManager;Ld8j;)V

    iput-object p2, p0, Ldyk;->d:Ld8j;

    iput-object p3, p0, Ldyk;->e:Lzxk;

    iput-object p4, p0, Ldyk;->f:Ldb;

    iput-object p5, p0, Ldyk;->g:Lxb;

    iput-object p6, p0, Ldyk;->h:Ld7h;

    iput-object p7, p0, Ldyk;->i:Lzwk;

    iput-object p8, p0, Ldyk;->j:Lkxk;

    iput-object p9, p0, Ldyk;->k:Lbf9;

    iput-object p10, p0, Ldyk;->l:Lxc9;

    iput-object p11, p0, Ldyk;->m:Lsom;

    new-instance p1, Lode;

    invoke-direct {p1}, Lekc;-><init>()V

    iput-object p1, p0, Ldyk;->n:Lode;

    new-instance p1, Lw4i;

    const/16 p2, 0x14

    invoke-direct {p1, p0, p2}, Lw4i;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Ldyk;->o:Lw4i;

    iget-object p0, p5, Lxb;->e:Ljze;

    invoke-virtual {p0, p1}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public final e()V
    .registers 2

    iget-object v0, p0, Ldyk;->g:Lxb;

    iget-object v0, v0, Lxb;->e:Ljze;

    iget-object p0, p0, Ldyk;->o:Lw4i;

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    return-void
.end method

.method public final f()Ld8j;
    .registers 1

    iget-object p0, p0, Ldyk;->d:Ld8j;

    return-object p0
.end method

.method public final g()V
    .registers 4

    new-instance v0, Lz4k;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lz4k;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Ldyk;->j:Lkxk;

    iget-object p0, p0, Lkxk;->g:Ldu3;

    invoke-virtual {p0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqim;

    iget-object p0, p0, Lqim;->d:Lnej;

    new-instance v1, Log5;

    const/4 v2, 0x5

    invoke-direct {v1, v0, v2}, Log5;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, v1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method
