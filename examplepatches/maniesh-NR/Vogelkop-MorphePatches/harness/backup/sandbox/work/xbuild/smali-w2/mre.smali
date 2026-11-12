.class public final Lmre;
.super Lmsh;
.source "SourceFile"


# instance fields
.field public final D:Lw9h;


# direct methods
.method public constructor <init>(Ljava/lang/String;JJLw9h;Lp12;Lqre;)V
    .registers 38

    move-object/from16 v0, p6

    sget-object v5, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    const/16 v27, 0x0

    const/16 v28, 0x0

    const-string v2, ""

    const/4 v4, 0x0

    const/4 v6, 0x4

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const-string v21, ""

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    move-object v7, v5

    move-object v8, v5

    move-object/from16 v1, p0

    move-object/from16 v3, p1

    move-wide/from16 v11, p2

    move-wide/from16 v13, p4

    move-object/from16 v22, p7

    move-object/from16 v26, p8

    invoke-direct/range {v1 .. v28}, Lmsh;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;ILandroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;IIILjava/util/ArrayList;Ljava/lang/String;Lp12;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Lqre;Lxlg;Lnb8;)V

    iput-object v0, v1, Lmre;->D:Lw9h;

    move-object/from16 v1, p8

    iget-object v1, v1, Lqre;->b:Lyqe;

    if-nez v1, :cond_3c

    const/4 v1, 0x1

    goto :goto_3d

    :cond_3c
    const/4 v1, 0x2

    :goto_3d
    iget-object v0, v0, Lw9h;->j:Lsa2;

    iput v1, v0, Lsa2;->b:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eqz p1, :cond_15

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lmre;

    if-ne v0, v1, :cond_15

    check-cast p1, Lmre;

    iget-object p0, p0, Lmre;->D:Lw9h;

    iget-object p1, p1, Lmre;->D:Lw9h;

    invoke-virtual {p0, p1}, Lw9h;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_15
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lmre;->D:Lw9h;

    iget-object p0, p0, Lw9h;->a:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    return p0
.end method
