.class public final Lj5k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/Set;

.field public final b:Ljava/util/ArrayDeque;

.field public final c:Ldl;

.field public final d:Lbz;

.field public final synthetic e:Lk5k;


# direct methods
.method public constructor <init>(Lk5k;Ldl;Lbz;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lj5k;->e:Lk5k;

    new-instance p1, Ljava/util/WeakHashMap;

    invoke-direct {p1}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {p1}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object p1

    iput-object p1, p0, Lj5k;->a:Ljava/util/Set;

    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Lj5k;->b:Ljava/util/ArrayDeque;

    iput-object p2, p0, Lj5k;->c:Ldl;

    iput-object p3, p0, Lj5k;->d:Lbz;

    return-void
.end method


# virtual methods
.method public final a(Lyz;Lmq;Ltxi;)Z
    .registers 11

    iget-object v0, p0, Lj5k;->e:Lk5k;

    iget-object v1, v0, Lk5k;->g:Leu8;

    const/4 v2, 0x0

    if-eqz v1, :cond_11

    sget-object v1, Liq;->a:Liq;

    invoke-virtual {p1, v1}, Lyz;->d(Liq;)Z

    move-result v1

    if-nez v1, :cond_11

    move v0, v2

    goto :goto_1b

    :cond_11
    iget-object v0, v0, Lk5k;->d:Lwy;

    iget-object v0, v0, Lwy;->f:Lzy9;

    iget-object v1, p0, Lj5k;->c:Ldl;

    invoke-virtual {v0, v1, p2, p1, v2}, Lzy9;->H(Ldl;Lmq;Lyz;Z)Z

    move-result v0

    :goto_1b
    if-nez v0, :cond_1e

    return v2

    :cond_1e
    iget-object v0, p2, Lmq;->i:Llq;

    iput-object v0, p2, Lmq;->j:Llq;

    sget-object v0, Llq;->d:Llq;

    iput-object v0, p2, Lmq;->i:Llq;

    new-instance v1, Lll4;

    const/4 v6, 0x2

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v1 .. v6}, Lll4;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    const/4 p0, 0x1

    return p0
.end method
