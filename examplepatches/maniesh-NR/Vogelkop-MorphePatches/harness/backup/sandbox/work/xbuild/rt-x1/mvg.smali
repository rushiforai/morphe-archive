.class public final Lmvg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/util/ArrayList;

.field public final g:Ljava/util/ArrayList;

.field public h:I


# direct methods
.method public constructor <init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;I)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lmvg;->a:I

    iput p2, p0, Lmvg;->b:I

    const-string p1, "organic"

    if-nez p3, :cond_c

    move-object p3, p1

    :cond_c
    iput-object p3, p0, Lmvg;->c:Ljava/lang/String;

    if-nez p4, :cond_11

    move-object p4, p1

    :cond_11
    iput-object p4, p0, Lmvg;->d:Ljava/lang/String;

    if-nez p5, :cond_16

    move-object p5, p1

    :cond_16
    iput-object p5, p0, Lmvg;->e:Ljava/lang/String;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Lmvg;->f:Ljava/util/ArrayList;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Lmvg;->g:Ljava/util/ArrayList;

    iput p8, p0, Lmvg;->h:I

    return-void
.end method

.method public static a(Lorb;)Lmvg;
    .registers 13

    const-string v0, "navigations"

    invoke-virtual {p0, v0}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v0

    iget-object v1, p0, Lorb;->a:Lorg/json/JSONObject;

    new-instance v8, Ljava/util/ArrayList;

    iget-object v2, v0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    invoke-direct {v8, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_19
    if-ge v4, v2, :cond_38

    invoke-virtual {v0, v4}, Lvpb;->c(I)Lorb;

    move-result-object v5

    iget-object v5, v5, Lorb;->a:Lorg/json/JSONObject;

    new-instance v6, Llvg;

    const-string v7, "from"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    const-string v9, "to"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-direct {v6, v7, v5}, Llvg;-><init>(II)V

    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_19

    :cond_38
    const-string v0, "carousel_items"

    invoke-virtual {p0, v0}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v0

    iget-object v2, v0, Lvpb;->a:Lorg/json/JSONArray;

    new-instance v9, Ljava/util/ArrayList;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    invoke-direct {v9, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    :goto_4d
    if-ge v3, v2, :cond_6c

    invoke-virtual {v0, v3}, Lvpb;->c(I)Lorb;

    move-result-object v4

    iget-object v4, v4, Lorb;->a:Lorg/json/JSONObject;

    new-instance v5, Lkvg;

    const-string v6, "item"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    const-string v7, "duration"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v10

    invoke-direct {v5, v6, v10, v11}, Lkvg;-><init>(IJ)V

    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_4d

    :cond_6c
    new-instance v2, Lmvg;

    const-string v0, "entry_point"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    const-string v0, "first_view"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    const-string v0, "campaign"

    const-string v5, ""

    invoke-virtual {p0, v0, v5}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v6, "source"

    invoke-virtual {p0, v6, v5}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "target"

    invoke-virtual {p0, v7, v5}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string p0, "exit_reason"

    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10

    move-object v5, v0

    invoke-direct/range {v2 .. v10}, Lmvg;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;I)V

    return-object v2
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_4e

    instance-of v0, p1, Lmvg;

    if-eqz v0, :cond_4c

    check-cast p1, Lmvg;

    iget v0, p0, Lmvg;->a:I

    iget v1, p1, Lmvg;->a:I

    if-ne v0, v1, :cond_4c

    iget v0, p0, Lmvg;->b:I

    iget v1, p1, Lmvg;->b:I

    if-ne v0, v1, :cond_4c

    iget-object v0, p0, Lmvg;->c:Ljava/lang/String;

    iget-object v1, p1, Lmvg;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lmvg;->d:Ljava/lang/String;

    iget-object v1, p1, Lmvg;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lmvg;->e:Ljava/lang/String;

    iget-object v1, p1, Lmvg;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lmvg;->f:Ljava/util/ArrayList;

    iget-object v1, p1, Lmvg;->f:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lmvg;->g:Ljava/util/ArrayList;

    iget-object v1, p1, Lmvg;->g:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget p0, p0, Lmvg;->h:I

    iget p1, p1, Lmvg;->h:I

    if-eq p0, p1, :cond_4e

    :cond_4c
    const/4 p0, 0x0

    return p0

    :cond_4e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 10

    iget v0, p0, Lmvg;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v0, p0, Lmvg;->b:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v0, p0, Lmvg;->h:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    iget-object v3, p0, Lmvg;->c:Ljava/lang/String;

    iget-object v4, p0, Lmvg;->d:Ljava/lang/String;

    iget-object v5, p0, Lmvg;->e:Ljava/lang/String;

    iget-object v6, p0, Lmvg;->f:Ljava/util/ArrayList;

    iget-object v7, p0, Lmvg;->g:Ljava/util/ArrayList;

    filled-new-array/range {v1 .. v8}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
