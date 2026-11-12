.class public final Lbp8;
.super Laqi;
.source "SourceFile"

# interfaces
.implements Lnq;


# instance fields
.field public final u:Lap8;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lyo;Ljava/lang/String;Ldl;Lbp;Li3j;Lap;)V
    .registers 22

    const-string v6, "ID String"

    const-string v9, "Call to action text"

    const-string v1, "Native Ad"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, ""

    move-object v0, p0

    move-object v2, p1

    move-object/from16 v10, p2

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    move-object/from16 v11, p5

    move-object/from16 v12, p6

    move-object/from16 v13, p7

    invoke-direct/range {v0 .. v13}, Laqi;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ldl;Ljava/lang/String;Lyo;Lbp;Li3j;Lap;)V

    sget-object p1, Lap8;->b:Lwu5;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static/range {p3 .. p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_29

    sget-object p1, Lap8;->c:Lap8;

    goto :goto_49

    :cond_29
    sget-object p1, Lap8;->e:Lh58;

    invoke-static {p1, p1}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object p1

    :cond_2f
    invoke-virtual {p1}, Lw4;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_47

    invoke-virtual {p1}, Lw4;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lap8;

    iget-object v2, v1, Lap8;->a:Ljava/lang/String;

    move-object/from16 v7, p3

    invoke-virtual {v2, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2f

    move-object p1, v1

    goto :goto_49

    :cond_47
    sget-object p1, Lap8;->c:Lap8;

    :goto_49
    iput-object p1, p0, Lbp8;->u:Lap8;

    return-void
.end method


# virtual methods
.method public final a(Ldl;Lkm;Lk8;Lkq;Ljava/util/List;)Lmq;
    .registers 13

    new-instance v0, Lro8;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lro8;-><init>(Lbp8;Ldl;Lkm;Lk8;Lkq;Ljava/util/List;)V

    return-object v0
.end method

.method public final e()Lv50;
    .registers 1

    sget-object p0, Lv50;->n:Lv50;

    return-object p0
.end method

.method public final n()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lyz;->a:Ljava/lang/String;

    return-object p0
.end method
