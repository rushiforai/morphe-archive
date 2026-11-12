.class public final Lu4l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# static fields
.field public static final f:Lrxh;


# instance fields
.field public a:I

.field public final b:Ljava/util/LinkedHashMap;

.field public c:I

.field public final d:Lt4l;

.field public final e:Li7f;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lrxh;

    const v1, 0x7f140813

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    sput-object v0, Lu4l;->f:Lrxh;

    return-void
.end method

.method public constructor <init>(Lumi;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lu4l;->b:Ljava/util/LinkedHashMap;

    new-instance v0, Lt4l;

    new-instance v1, Llrk;

    const/4 v7, 0x0

    const/4 v8, 0x2

    const/4 v2, 0x1

    const-class v4, Lu4l;

    const-string v5, "applyLoaded"

    const-string v6, "applyLoaded(Lcom/opera/android/browser/TabGroupRep$PersistentState;)V"

    move-object v3, p0

    invoke-direct/range {v1 .. v8}, Llrk;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct {v0, p1, v1}, Lt4l;-><init>(Lumi;Llrk;)V

    iput-object v0, v3, Lu4l;->d:Lt4l;

    new-instance p0, Li7f;

    invoke-direct {p0}, Li7f;-><init>()V

    iput-object p0, v3, Lu4l;->e:Li7f;

    invoke-virtual {v0}, Lldk;->h()V

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lp4l;

    iget-object p0, p0, Lu4l;->e:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lp4l;

    iget-object p0, p0, Lu4l;->e:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(I)Lm4l;
    .registers 9

    iget-object v0, p0, Lu4l;->d:Lt4l;

    invoke-virtual {v0}, Lldk;->i()V

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lu4l;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_51

    new-instance v1, Lm4l;

    iget v3, p0, Lu4l;->c:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lu4l;->c:I

    sget-object v4, Lm4l;->Companion:Ll4l;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Lm4l;->d:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    rem-int/2addr v3, v4

    xor-int v5, v3, v4

    neg-int v6, v3

    or-int/2addr v6, v3

    and-int/2addr v5, v6

    shr-int/lit8 v5, v5, 0x1f

    and-int/2addr v4, v5

    add-int/2addr v3, v4

    const/4 v4, 0x0

    invoke-direct {v1, p1, v4, v3}, Lm4l;-><init>(ILjava/lang/String;I)V

    invoke-virtual {v0}, Lldk;->i()V

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Ls4l;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v2

    iget p0, p0, Lu4l;->c:I

    invoke-direct {p1, v2, p0}, Ls4l;-><init>(Ljava/util/List;I)V

    invoke-virtual {v0, p1}, Lldk;->g(Ljava/lang/Object;)V

    return-object v1

    :cond_51
    check-cast v1, Lm4l;

    return-object v1
.end method

.method public final b(Lm4l;)V
    .registers 6

    iget v0, p1, Lm4l;->a:I

    invoke-virtual {p0, v0}, Lu4l;->a(I)Lm4l;

    move-result-object v1

    invoke-virtual {p1, v1}, Lm4l;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4a

    iget-object v1, p0, Lu4l;->d:Lt4l;

    invoke-virtual {v1}, Lldk;->i()V

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v2, p0, Lu4l;->b:Ljava/util/LinkedHashMap;

    invoke-interface {v2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ls4l;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v2

    iget v3, p0, Lu4l;->c:I

    invoke-direct {v0, v2, v3}, Ls4l;-><init>(Ljava/util/List;I)V

    invoke-virtual {v1, v0}, Lldk;->g(Ljava/lang/Object;)V

    iget v0, p0, Lu4l;->a:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lu4l;->a:I

    iget-object p0, p0, Lu4l;->e:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_3a
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4a

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lp4l;

    invoke-interface {v0, p1}, Lp4l;->a(Lm4l;)V

    goto :goto_3a

    :cond_4a
    return-void
.end method
