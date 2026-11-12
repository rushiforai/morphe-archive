.class public final Lfmk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Laf3;

.field public final b:Ljava/util/Map;

.field public final c:Lode;

.field public final d:Ljava/util/HashSet;

.field public final e:Ljvg;

.field public f:Lzzh;


# direct methods
.method public constructor <init>(Laf3;Ljava/util/Map;Ljvg;Lauj;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p4, Lode;

    new-instance v0, Lylk;

    new-instance v1, Lcmk;

    const/16 v2, 0x13

    sget-object v3, Lemk;->a:Lemk;

    invoke-direct {v1, v3, v2}, Ln1;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1, v3}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p4, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p4, p0, Lfmk;->c:Lode;

    new-instance p4, Ljava/util/HashSet;

    invoke-direct {p4}, Ljava/util/HashSet;-><init>()V

    iput-object p4, p0, Lfmk;->d:Ljava/util/HashSet;

    iput-object p1, p0, Lfmk;->a:Laf3;

    iput-object p2, p0, Lfmk;->b:Ljava/util/Map;

    iput-object p3, p0, Lfmk;->e:Ljvg;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object v0, p0, Lfmk;->c:Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lylk;

    new-instance v1, Ljava/util/HashSet;

    iget-object p0, p0, Lfmk;->d:Ljava/util/HashSet;

    invoke-direct {v1, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_16
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_26

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/api/Callback;

    invoke-interface {v1, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_16

    :cond_26
    return-void
.end method

.method public final b()V
    .registers 7

    iget-object v0, p0, Lfmk;->f:Lzzh;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lzzh;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Lzzh;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lfmk;->f:Lzzh;

    iget-object v0, p0, Lfmk;->b:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    iget-object v1, p0, Lfmk;->f:Lzzh;

    iget-object p0, p0, Lfmk;->a:Laf3;

    iget-boolean v2, p0, Laf3;->h:Z

    if-nez v2, :cond_2c

    new-instance p0, Lv3h;

    new-instance v0, Lw3h;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sget-object v2, Ly3h;->b:Ly3h;

    invoke-direct {p0, v0, v2}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, p0}, Lzzh;->run(Ljava/lang/Object;)V

    return-void

    :cond_2c
    new-instance v2, Lcz8;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v0, p0, Laf3;->b:Lumi;

    new-instance v4, Lb94;

    const/4 v5, 0x0

    invoke-direct {v4, v0, v1, v5}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v2, v3, v4}, Lcz8;-><init>(Ljava/util/ArrayList;Lb94;)V

    invoke-virtual {p0, v2}, Laf3;->e(Lbg1;)V

    return-void
.end method
