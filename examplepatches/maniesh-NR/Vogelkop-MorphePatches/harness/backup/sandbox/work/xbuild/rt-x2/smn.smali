.class public final synthetic Lsmn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:Lks3;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:F

.field public final synthetic d:F

.field public final synthetic e:Llkn;


# direct methods
.method public synthetic constructor <init>(Lks3;Ljava/lang/String;FFLlkn;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsmn;->a:Lks3;

    iput-object p2, p0, Lsmn;->b:Ljava/lang/String;

    iput p3, p0, Lsmn;->c:F

    iput p4, p0, Lsmn;->d:F

    iput-object p5, p0, Lsmn;->e:Llkn;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 13

    check-cast p1, Lgkn;

    if-nez p1, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lsmn;->a:Lks3;

    iget-object v1, v0, Lks3;->a:Ljava/lang/Object;

    check-cast v1, Lekn;

    iget-object v2, v0, Lks3;->f:Ljava/lang/Object;

    move-object v5, v2

    check-cast v5, Landroid/graphics/Rect;

    iget-object v2, p0, Lsmn;->e:Llkn;

    iget-object v2, v2, Llkn;->i:Lzjn;

    iget v8, v2, Lzjn;->a:F

    iget v9, v2, Lzjn;->b:F

    iget v10, v2, Lzjn;->c:F

    iget-object v2, v1, Lekn;->b:Ldkn;

    invoke-virtual {v2}, Lldk;->i()V

    new-instance v3, Lckn;

    iget-object v4, p0, Lsmn;->b:Ljava/lang/String;

    iget v6, p0, Lsmn;->c:F

    iget v7, p0, Lsmn;->d:F

    invoke-direct/range {v3 .. v10}, Lckn;-><init>(Ljava/lang/String;Landroid/graphics/Rect;FFFFF)V

    iget-object p0, v1, Lekn;->a:Lyp9;

    invoke-virtual {p0, v3}, Lyp9;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Lgkn;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_40

    invoke-virtual {p0, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0}, Lrbd;->i(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    invoke-virtual {v2, p0}, Lldk;->g(Ljava/lang/Object;)V

    :cond_40
    iget-object p0, v0, Lks3;->h:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {v0, p1}, Lks3;->i(Lgkn;)Lrmn;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void
.end method
