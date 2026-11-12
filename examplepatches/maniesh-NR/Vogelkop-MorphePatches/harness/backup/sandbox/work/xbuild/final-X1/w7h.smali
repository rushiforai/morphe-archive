.class public final Lw7h;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/app/Activity;

.field public final b:Lumi;

.field public final c:Lcom/opera/android/settings/SettingsManager;

.field public final d:Lcom/opera/android/Lazy;

.field public final e:Lxnh;

.field public final f:Lpyl;

.field public final g:Ljava/util/HashMap;

.field public final h:Ljava/util/HashMap;

.field public final i:Ljava/util/HashMap;

.field public final j:Luwh;

.field public final k:Lnn7;

.field public final l:Lzy9;

.field public final m:Li5o;

.field public final n:Li3j;

.field public final o:Lwy;

.field public final p:Lzv9;

.field public final q:Lgy;

.field public final r:Ljava/util/HashSet;

.field public final s:Lr9g;

.field public final t:Lcom/opera/android/Lazy;

.field public final u:Lcom/opera/android/Lazy;

.field public final v:Lesk;

.field public final w:Lqfb;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lumi;Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/Lazy;Lxnh;Luwh;Lnn7;Lzy9;Li5o;Lwy;Lwjh;Lzv9;Lx5f;Lgy;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lesk;)V
    .registers 20

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lw7h;->g:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lw7h;->h:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lw7h;->i:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lw7h;->r:Ljava/util/HashSet;

    new-instance v0, Lqfb;

    const/16 v1, 0x19

    invoke-direct {v0, p0, v1}, Lqfb;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lw7h;->w:Lqfb;

    iput-object p1, p0, Lw7h;->a:Landroid/app/Activity;

    iput-object p2, p0, Lw7h;->b:Lumi;

    iput-object p3, p0, Lw7h;->c:Lcom/opera/android/settings/SettingsManager;

    iput-object p4, p0, Lw7h;->d:Lcom/opera/android/Lazy;

    iput-object p5, p0, Lw7h;->e:Lxnh;

    move-object/from16 p1, p16

    iput-object p1, p0, Lw7h;->u:Lcom/opera/android/Lazy;

    move-object/from16 p1, p17

    iput-object p1, p0, Lw7h;->v:Lesk;

    new-instance p1, Lpyl;

    invoke-direct {p1, p11, p13}, Lpyl;-><init>(Lwjh;Lx5f;)V

    iput-object p1, p0, Lw7h;->f:Lpyl;

    iput-object p6, p0, Lw7h;->j:Luwh;

    iput-object p7, p0, Lw7h;->k:Lnn7;

    iput-object p8, p0, Lw7h;->l:Lzy9;

    iput-object p9, p0, Lw7h;->m:Li5o;

    iget-object p1, p10, Lwy;->h:Li3j;

    iput-object p1, p0, Lw7h;->n:Li3j;

    iput-object p10, p0, Lw7h;->o:Lwy;

    iput-object p12, p0, Lw7h;->p:Lzv9;

    new-instance p1, Lr9g;

    const/16 p2, 0xc

    invoke-direct {p1, p0, p2}, Lr9g;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lw7h;->s:Lr9g;

    move-object/from16 p1, p14

    iput-object p1, p0, Lw7h;->q:Lgy;

    move-object/from16 p1, p15

    iput-object p1, p0, Lw7h;->t:Lcom/opera/android/Lazy;

    return-void
.end method


# virtual methods
.method public final a(Ldl;)Lbz;
    .registers 10

    new-instance v0, Lcz;

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p1, Ldl;->c:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p1, Ldl;->d:Ljava/util/SortedSet;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p1, Ldl;->e:Ljava/util/SortedSet;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-class v2, Ldl;

    invoke-direct {v0, v2, v1}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v1, p0, Lw7h;->g:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_3f

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_40

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3f
    const/4 v2, 0x0

    :cond_40
    check-cast v2, Lbz;

    if-nez v2, :cond_66

    new-instance v2, Laye;

    new-instance v3, Lyxe;

    new-instance v4, Lxd3;

    new-instance v5, Lueg;

    iget-object v6, p0, Lw7h;->o:Lwy;

    iget-object v7, p0, Lw7h;->s:Lr9g;

    invoke-direct {v5, p1, v6, v7}, Lueg;-><init>(Ldl;Lwy;Lr9g;)V

    invoke-direct {v4, v5}, Lxd3;-><init>(Lueg;)V

    iget-object p0, p0, Lw7h;->k:Lnn7;

    invoke-direct {v3, v4, p0}, Lyxe;-><init>(Lxd3;Lnn7;)V

    invoke-direct {v2, v3}, Laye;-><init>(Lyxe;)V

    new-instance p0, Ljava/lang/ref/WeakReference;

    invoke-direct {p0, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_66
    return-object v2
.end method

.method public final b(Lcz;)Lr68;
    .registers 4

    iget-object v0, p0, Lw7h;->i:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lr68;

    if-nez v1, :cond_14

    new-instance v1, Lr68;

    iget-object p0, p0, Lw7h;->e:Lxnh;

    invoke-direct {v1, p0}, Lr68;-><init>(Lxnh;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_14
    return-object v1
.end method
