.class public abstract Ldca;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Lcom/opera/api/Callback;

.field public c:Ljava/util/List;

.field public d:Ljava/util/List;


# direct methods
.method public constructor <init>(Lcom/opera/api/Callback;J)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p2, p0, Ldca;->a:J

    iput-object p1, p0, Ldca;->b:Lcom/opera/api/Callback;

    return-void
.end method

.method public static a(Lwan;)Z
    .registers 4

    iget p0, p0, Lwan;->c:I

    and-int/lit16 v0, p0, 0xff

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-eq v0, v1, :cond_17

    const/4 v1, 0x4

    if-eq v0, v1, :cond_17

    const/16 v1, 0xa

    if-eq v0, v1, :cond_17

    const/high16 v0, 0x20000000

    and-int/2addr p0, v0

    if-nez p0, :cond_15

    return v2

    :cond_15
    const/4 p0, 0x1

    return p0

    :cond_17
    return v2
.end method


# virtual methods
.method public final b()V
    .registers 18

    move-object/from16 v0, p0

    iget-object v1, v0, Ldca;->c:Ljava/util/List;

    if-eqz v1, :cond_6a

    iget-object v1, v0, Ldca;->d:Ljava/util/List;

    if-eqz v1, :cond_6a

    new-instance v1, Landroid/util/LongSparseArray;

    iget-object v2, v0, Ldca;->c:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Landroid/util/LongSparseArray;-><init>(I)V

    iget-object v2, v0, Ldca;->c:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lrqm;

    iget-object v4, v3, Lrqm;->g:Ljava/lang/String;

    iget-object v5, v3, Lrqm;->b:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_57

    iget-object v4, v3, Lrqm;->g:Ljava/lang/String;

    sget-object v5, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v4}, Laik;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lwqm;->e:[Ljava/lang/String;

    invoke-static {v4, v5}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iget-wide v7, v3, Lrqm;->a:J

    new-instance v6, Lrqm;

    iget-object v9, v3, Lrqm;->b:Ljava/lang/String;

    iget-object v10, v3, Lrqm;->c:Ljava/lang/String;

    iget-object v11, v3, Lrqm;->d:Ljava/lang/String;

    iget-object v12, v3, Lrqm;->e:Ljava/lang/String;

    iget-object v13, v3, Lrqm;->f:Ljava/lang/String;

    iget-wide v3, v3, Lrqm;->h:J

    move-wide v15, v3

    invoke-direct/range {v6 .. v16}, Lrqm;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {v1, v7, v8, v6}, Landroid/util/LongSparseArray;->append(JLjava/lang/Object;)V

    goto :goto_1b

    :cond_57
    iget-wide v4, v3, Lrqm;->a:J

    invoke-virtual {v1, v4, v5, v3}, Landroid/util/LongSparseArray;->append(JLjava/lang/Object;)V

    goto :goto_1b

    :cond_5d
    iget-object v2, v0, Ldca;->d:Ljava/util/List;

    iget-wide v3, v0, Ldca;->a:J

    invoke-virtual {v0, v2, v1, v3, v4}, Ldca;->c(Ljava/util/List;Landroid/util/LongSparseArray;J)Ljava/lang/Object;

    move-result-object v1

    iget-object v0, v0, Ldca;->b:Lcom/opera/api/Callback;

    invoke-interface {v0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_6a
    return-void
.end method

.method public abstract c(Ljava/util/List;Landroid/util/LongSparseArray;J)Ljava/lang/Object;
.end method
