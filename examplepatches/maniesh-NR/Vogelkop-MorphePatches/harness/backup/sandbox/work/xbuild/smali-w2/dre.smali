.class public final Ldre;
.super Lmsh;
.source "SourceFile"


# instance fields
.field public final D:Llog;


# direct methods
.method public constructor <init>(Ljava/lang/String;JJLlog;Lp12;Lqre;)V
    .registers 37

    sget-object v4, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    const/16 v26, 0x0

    const/16 v27, 0x0

    const-string v1, ""

    const/4 v3, 0x0

    const/4 v5, 0x4

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    move-object v6, v4

    move-object v7, v4

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move-wide/from16 v10, p2

    move-wide/from16 v12, p4

    move-object/from16 v21, p7

    move-object/from16 v25, p8

    invoke-direct/range {v0 .. v27}, Lmsh;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;ILandroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;IIILjava/util/ArrayList;Ljava/lang/String;Lp12;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Lqre;Lxlg;Lnb8;)V

    move-object/from16 v1, p6

    iput-object v1, v0, Ldre;->D:Llog;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    if-eqz p1, :cond_1d

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ldre;

    if-ne v0, v1, :cond_1d

    check-cast p1, Ldre;

    iget-object p0, p0, Ldre;->D:Llog;

    iget-object p0, p0, Llog;->b:Ljava/lang/String;

    iget-object p1, p1, Ldre;->D:Llog;

    iget-object p1, p1, Llog;->b:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_1d
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Ldre;->D:Llog;

    iget-object p0, p0, Llog;->b:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    return p0
.end method
