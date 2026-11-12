.class public final Lvan;
.super Ldca;
.source "SourceFile"


# instance fields
.field public final e:Ljava/util/ArrayList;

.field public final f:Ltxi;


# direct methods
.method public constructor <init>(JLrzj;Ljava/util/ArrayList;Ltxi;)V
    .registers 6

    invoke-direct {p0, p3, p1, p2}, Ldca;-><init>(Lcom/opera/api/Callback;J)V

    iput-object p4, p0, Lvan;->e:Ljava/util/ArrayList;

    iput-object p5, p0, Lvan;->f:Ltxi;

    return-void
.end method


# virtual methods
.method public final c(Ljava/util/List;Landroid/util/LongSparseArray;J)Ljava/lang/Object;
    .registers 10

    new-instance p3, Ljava/util/HashMap;

    iget-object p4, p0, Lvan;->e:Ljava/util/ArrayList;

    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-direct {p3, v0}, Ljava/util/HashMap;-><init>(I)V

    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_10
    if-ge v1, v0, :cond_24

    invoke-virtual {p4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Ljava/lang/String;

    const-wide/16 v3, 0x0

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {p3, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_10

    :cond_24
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_28
    :goto_28
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_76

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lwan;

    invoke-static {p4}, Ldca;->a(Lwan;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-wide v0, p4, Lwan;->a:J

    invoke-virtual {p2, v0, v1}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lrqm;

    if-eqz p4, :cond_28

    iget-object p4, p4, Lrqm;->b:Ljava/lang/String;

    iget-object v0, p0, Lvan;->f:Ltxi;

    iget-object v0, v0, Ltxi;->b:Ljava/lang/Object;

    check-cast v0, Leq6;

    iget-object v0, v0, Leq6;->a:Ljava/lang/Object;

    check-cast v0, Lrr8;

    invoke-virtual {v0}, Lldk;->i()V

    iget-object v0, v0, Lrr8;->l:Ljava/util/HashMap;

    invoke-virtual {v0, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0, p4}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    if-eqz v0, :cond_28

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p3, p4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_28

    :cond_76
    return-object p3
.end method
