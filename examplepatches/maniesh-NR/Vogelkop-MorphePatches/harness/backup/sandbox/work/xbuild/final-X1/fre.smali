.class public final Lfre;
.super Lmsh;
.source "SourceFile"


# instance fields
.field public final D:Ljb8;


# direct methods
.method public constructor <init>(JJLp12;Lqre;Ljb8;)V
    .registers 37

    move-object/from16 v0, p7

    iget-object v2, v0, Ljb8;->a:Ljava/lang/String;

    iget-object v1, v0, Ljb8;->j:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    sget-object v7, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    const/16 v27, 0x0

    const/16 v28, 0x0

    const-string v3, "banner"

    const/4 v4, 0x0

    const/4 v6, 0x2

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    move-object v8, v7

    move-object/from16 v1, p0

    move-wide/from16 v11, p1

    move-wide/from16 v13, p3

    move-object/from16 v22, p5

    move-object/from16 v26, p6

    invoke-direct/range {v1 .. v28}, Lmsh;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;ILandroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;IIILjava/util/ArrayList;Ljava/lang/String;Lp12;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Lqre;Lxlg;Lnb8;)V

    iput-object v0, v1, Lfre;->D:Ljb8;

    return-void
.end method
