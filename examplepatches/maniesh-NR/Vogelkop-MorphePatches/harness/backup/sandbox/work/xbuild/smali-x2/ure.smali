.class public final Lure;
.super Lmsh;
.source "SourceFile"


# instance fields
.field public final D:Ljava/util/List;

.field public final E:J

.field public final F:J

.field public final G:I

.field public final H:I

.field public final I:I

.field public final J:I

.field public final K:Landroid/net/Uri;

.field public final L:I

.field public final M:Lw9h;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;IIILjava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;JJIIIILandroid/net/Uri;ILw9h;Lp12;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Lqre;)V
    .registers 63

    const/4 v0, 0x0

    move-object/from16 v1, p18

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/net/Uri;

    sget-object v6, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/4 v5, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    move-wide/from16 v10, p7

    move-wide/from16 v12, p9

    move-object/from16 v14, p11

    move-object/from16 v15, p12

    move/from16 v16, p13

    move/from16 v17, p14

    move/from16 v18, p15

    move-object/from16 v19, p16

    move-object/from16 v20, p17

    move-object/from16 v21, p30

    move-object/from16 v22, p31

    move-object/from16 v23, p32

    move-object/from16 v24, p33

    move-object/from16 v25, p34

    invoke-direct/range {v0 .. v27}, Lmsh;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;ILandroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;IIILjava/util/ArrayList;Ljava/lang/String;Lp12;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Lqre;Lxlg;Lnb8;)V

    invoke-static/range {p18 .. p18}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lure;->D:Ljava/util/List;

    move-wide/from16 v1, p19

    iput-wide v1, v0, Lure;->E:J

    move-wide/from16 v1, p21

    iput-wide v1, v0, Lure;->F:J

    move/from16 v1, p23

    iput v1, v0, Lure;->G:I

    move/from16 v1, p24

    iput v1, v0, Lure;->H:I

    move/from16 v1, p25

    iput v1, v0, Lure;->I:I

    move/from16 v1, p26

    iput v1, v0, Lure;->J:I

    move-object/from16 v1, p27

    iput-object v1, v0, Lure;->K:Landroid/net/Uri;

    move/from16 v1, p28

    iput v1, v0, Lure;->L:I

    move-object/from16 v1, p29

    iput-object v1, v0, Lure;->M:Lw9h;

    if-eqz v1, :cond_77

    move-object/from16 v0, p34

    iget-object v0, v0, Lqre;->b:Lyqe;

    if-nez v0, :cond_72

    const/4 v0, 0x1

    goto :goto_73

    :cond_72
    const/4 v0, 0x2

    :goto_73
    iget-object v1, v1, Lw9h;->j:Lsa2;

    iput v0, v1, Lsa2;->b:I

    :cond_77
    return-void
.end method
