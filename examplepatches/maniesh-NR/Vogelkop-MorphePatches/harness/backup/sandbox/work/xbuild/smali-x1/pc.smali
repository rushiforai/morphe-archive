.class public final enum Lpc;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum A:Lpc;

.field public static final synthetic B:[Lpc;

.field public static final synthetic C:Lh58;

.field public static final enum d:Lpc;

.field public static final enum e:Lpc;

.field public static final enum f:Lpc;

.field public static final enum g:Lpc;

.field public static final enum h:Lpc;

.field public static final enum i:Lpc;

.field public static final enum j:Lpc;

.field public static final enum k:Lpc;

.field public static final enum l:Lpc;

.field public static final enum m:Lpc;

.field public static final enum n:Lpc;

.field public static final enum o:Lpc;

.field public static final enum p:Lpc;

.field public static final enum q:Lpc;

.field public static final enum r:Lpc;

.field public static final enum s:Lpc;

.field public static final enum t:Lpc;

.field public static final enum u:Lpc;

.field public static final enum v:Lpc;

.field public static final enum w:Lpc;

.field public static final enum x:Lpc;

.field public static final enum y:Lpc;

.field public static final enum z:Lpc;


# instance fields
.field public final a:Lxc;

.field public final b:Z

.field public final c:Lhs0;


# direct methods
.method static constructor <clinit>()V
    .registers 44

    new-instance v0, Lpc;

    sget-object v3, Lxc;->g:Lxc;

    const/4 v4, 0x1

    sget-object v5, Lhs0;->c:Lhs0;

    const-string v1, "BACK"

    const/4 v2, 0x0

    invoke-direct/range {v0 .. v5}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v0, Lpc;->d:Lpc;

    new-instance v1, Lpc;

    sget-object v4, Lxc;->h:Lxc;

    const/4 v5, 0x1

    sget-object v6, Lhs0;->i:Lhs0;

    const-string v2, "FORWARD"

    const/4 v3, 0x1

    invoke-direct/range {v1 .. v6}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v1, Lpc;->e:Lpc;

    new-instance v2, Lpc;

    const/4 v6, 0x1

    sget-object v7, Lhs0;->j:Lhs0;

    const-string v3, "FORWARD_OR_RELOAD"

    move-object v5, v4

    const/4 v4, 0x2

    invoke-direct/range {v2 .. v7}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v2, Lpc;->f:Lpc;

    new-instance v3, Lpc;

    sget-object v6, Lxc;->i:Lxc;

    const/4 v7, 0x1

    sget-object v8, Lhs0;->r:Lhs0;

    const-string v4, "RELOAD"

    const/4 v5, 0x3

    invoke-direct/range {v3 .. v8}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v3, Lpc;->g:Lpc;

    new-instance v4, Lpc;

    sget-object v8, Lxc;->j:Lxc;

    move-object v7, v8

    const/4 v8, 0x1

    sget-object v9, Lhs0;->l:Lhs0;

    const-string v5, "HOME"

    const/4 v6, 0x4

    invoke-direct/range {v4 .. v9}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v4, Lpc;->h:Lpc;

    new-instance v5, Lpc;

    const/4 v9, 0x1

    sget-object v10, Lhs0;->m:Lhs0;

    const-string v6, "HOME_OR_SEARCH"

    move-object v8, v7

    const/4 v7, 0x5

    invoke-direct/range {v5 .. v10}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    move-object v11, v5

    move-object v7, v8

    sput-object v11, Lpc;->i:Lpc;

    new-instance v12, Lpc;

    sget-object v15, Lxc;->k:Lxc;

    const/16 v16, 0x1

    sget-object v17, Lhs0;->s:Lhs0;

    const-string v13, "SEARCH"

    const/4 v14, 0x6

    invoke-direct/range {v12 .. v17}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v12, Lpc;->j:Lpc;

    new-instance v8, Lpc;

    sget-object v16, Lxc;->l:Lxc;

    const/16 v17, 0x1

    sget-object v18, Lhs0;->u:Lhs0;

    const-string v14, "TAB_GALLERY"

    const/4 v15, 0x7

    move-object v13, v8

    invoke-direct/range {v13 .. v18}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v13, Lpc;->k:Lpc;

    new-instance v9, Lpc;

    sget-object v17, Lxc;->m:Lxc;

    const/16 v18, 0x1

    sget-object v19, Lhs0;->o:Lhs0;

    const-string v15, "MAIN_MENU"

    const/16 v16, 0x8

    move-object v14, v9

    invoke-direct/range {v14 .. v19}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v14, Lpc;->l:Lpc;

    new-instance v10, Lpc;

    sget-object v18, Lxc;->n:Lxc;

    const/16 v19, 0x1

    sget-object v20, Lhs0;->b:Lhs0;

    const-string v16, "ARIA"

    const/16 v17, 0x9

    move-object v15, v10

    invoke-direct/range {v15 .. v20}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v15, Lpc;->m:Lpc;

    new-instance v16, Lpc;

    sget-object v19, Lxc;->o:Lxc;

    const/16 v20, 0x1

    sget-object v21, Lhs0;->d:Lhs0;

    const-string v17, "BOOKMARKS"

    const/16 v18, 0xa

    invoke-direct/range {v16 .. v21}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    new-instance v17, Lpc;

    sget-object v20, Lxc;->p:Lxc;

    const/16 v21, 0x0

    sget-object v22, Lhs0;->e:Lhs0;

    const-string v18, "CRYPTO_WALLET"

    const/16 v19, 0xb

    invoke-direct/range {v17 .. v22}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    new-instance v18, Lpc;

    sget-object v21, Lxc;->q:Lxc;

    const/16 v22, 0x1

    sget-object v23, Lhs0;->f:Lhs0;

    const-string v19, "DOWNLOADS"

    const/16 v20, 0xc

    invoke-direct/range {v18 .. v23}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    new-instance v19, Lpc;

    sget-object v22, Lxc;->r:Lxc;

    const/16 v23, 0x1

    sget-object v24, Lhs0;->g:Lhs0;

    const-string v20, "EXIT"

    const/16 v21, 0xd

    invoke-direct/range {v19 .. v24}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    new-instance v20, Lpc;

    sget-object v23, Lxc;->s:Lxc;

    const/16 v24, 0x1

    sget-object v25, Lhs0;->h:Lhs0;

    const-string v21, "FLOW"

    const/16 v22, 0xe

    invoke-direct/range {v20 .. v25}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v20, Lpc;->n:Lpc;

    new-instance v21, Lpc;

    sget-object v24, Lxc;->t:Lxc;

    const/16 v25, 0x1

    sget-object v26, Lhs0;->k:Lhs0;

    const-string v22, "HISTORY"

    const/16 v23, 0xf

    invoke-direct/range {v21 .. v26}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    new-instance v22, Lpc;

    sget-object v25, Lxc;->u:Lxc;

    const/16 v26, 0x1

    sget-object v27, Lhs0;->n:Lhs0;

    const-string v23, "LIVE_SCORES"

    const/16 v24, 0x10

    invoke-direct/range {v22 .. v27}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v22, Lpc;->o:Lpc;

    new-instance v23, Lpc;

    sget-object v26, Lxc;->v:Lxc;

    const/16 v27, 0x1

    sget-object v28, Lhs0;->p:Lhs0;

    const-string v24, "OFFLINE_PAGES"

    const/16 v25, 0x11

    invoke-direct/range {v23 .. v28}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    new-instance v24, Lpc;

    sget-object v27, Lxc;->w:Lxc;

    const/16 v28, 0x1

    sget-object v29, Lhs0;->q:Lhs0;

    const-string v25, "PASSWORDS"

    const/16 v26, 0x12

    invoke-direct/range {v24 .. v29}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    new-instance v25, Lpc;

    sget-object v28, Lxc;->x:Lxc;

    const/16 v29, 0x1

    sget-object v30, Lhs0;->t:Lhs0;

    const-string v26, "SETTINGS"

    const/16 v27, 0x13

    invoke-direct/range {v25 .. v30}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    new-instance v26, Lpc;

    sget-object v29, Lxc;->y:Lxc;

    const/16 v30, 0x0

    const/16 v31, 0x0

    const-string v27, "CUSTOMIZE_BOTTOM_BAR"

    const/16 v28, 0x14

    invoke-direct/range {v26 .. v31}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v26, Lpc;->p:Lpc;

    new-instance v27, Lpc;

    sget-object v30, Lxc;->z:Lxc;

    const/16 v31, 0x0

    const/16 v32, 0x0

    const-string v28, "NEW_BOOKMARK"

    const/16 v29, 0x15

    invoke-direct/range {v27 .. v32}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v27, Lpc;->q:Lpc;

    new-instance v28, Lpc;

    sget-object v31, Lxc;->A:Lxc;

    const/16 v32, 0x0

    const/16 v33, 0x0

    const-string v29, "CLEAR_HISTORY"

    const/16 v30, 0x16

    invoke-direct/range {v28 .. v33}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v28, Lpc;->r:Lpc;

    new-instance v29, Lpc;

    sget-object v32, Lxc;->B:Lxc;

    const/16 v33, 0x0

    const/16 v34, 0x0

    const-string v30, "ARIA_NEW_CHAT"

    const/16 v31, 0x17

    invoke-direct/range {v29 .. v34}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    new-instance v30, Lpc;

    sget-object v33, Lxc;->C:Lxc;

    const/16 v34, 0x0

    const/16 v35, 0x0

    const-string v31, "ARIA_TALK"

    const/16 v32, 0x18

    invoke-direct/range {v30 .. v35}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v30, Lpc;->s:Lpc;

    new-instance v31, Lpc;

    sget-object v34, Lxc;->D:Lxc;

    const/16 v35, 0x0

    const/16 v36, 0x0

    const-string v32, "ARIA_CHATS"

    const/16 v33, 0x19

    invoke-direct/range {v31 .. v36}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v31, Lpc;->t:Lpc;

    new-instance v32, Lpc;

    sget-object v35, Lxc;->E:Lxc;

    const/16 v36, 0x0

    const/16 v37, 0x0

    const-string v33, "ARIA_CHAT"

    const/16 v34, 0x1a

    invoke-direct/range {v32 .. v37}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v32, Lpc;->u:Lpc;

    new-instance v33, Lpc;

    sget-object v36, Lxc;->G:Lxc;

    const/16 v37, 0x0

    const/16 v38, 0x0

    const-string v34, "VOICE_SEARCH"

    const/16 v35, 0x1b

    invoke-direct/range {v33 .. v38}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v33, Lpc;->v:Lpc;

    new-instance v5, Lpc;

    const/4 v9, 0x1

    sget-object v10, Lhs0;->v:Lhs0;

    const-string v6, "HOME_OR_ARIA_OR_SEARCH"

    move-object v8, v7

    const/16 v7, 0x1c

    invoke-direct/range {v5 .. v10}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v5, Lpc;->w:Lpc;

    new-instance v34, Lpc;

    sget-object v37, Lxc;->I:Lxc;

    const/16 v38, 0x1

    sget-object v39, Lhs0;->w:Lhs0;

    const-string v35, "MINIPAY"

    const/16 v36, 0x1d

    invoke-direct/range {v34 .. v39}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    new-instance v35, Lpc;

    sget-object v38, Lxc;->M:Lxc;

    const/16 v39, 0x1

    sget-object v40, Lhs0;->x:Lhs0;

    const-string v36, "REWARDS"

    const/16 v37, 0x1e

    invoke-direct/range {v35 .. v40}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v35, Lpc;->x:Lpc;

    new-instance v36, Lpc;

    sget-object v39, Lxc;->H:Lxc;

    const/16 v40, 0x0

    const/16 v41, 0x0

    const-string v37, "SCAN_QR"

    const/16 v38, 0x1f

    invoke-direct/range {v36 .. v41}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v36, Lpc;->y:Lpc;

    new-instance v37, Lpc;

    sget-object v40, Lxc;->F:Lxc;

    const/16 v41, 0x0

    const/16 v42, 0x0

    const-string v38, "AI_MODE"

    const/16 v39, 0x20

    invoke-direct/range {v37 .. v42}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v37, Lpc;->z:Lpc;

    new-instance v38, Lpc;

    sget-object v41, Lxc;->N:Lxc;

    const/16 v42, 0x0

    const/16 v43, 0x0

    const-string v39, "PRIVATE"

    const/16 v40, 0x21

    invoke-direct/range {v38 .. v43}, Lpc;-><init>(Ljava/lang/String;ILxc;ZLhs0;)V

    sput-object v38, Lpc;->A:Lpc;

    move-object v6, v11

    move-object v7, v12

    move-object v8, v13

    move-object v9, v14

    move-object v10, v15

    move-object/from16 v11, v16

    move-object/from16 v12, v17

    move-object/from16 v13, v18

    move-object/from16 v14, v19

    move-object/from16 v15, v20

    move-object/from16 v16, v21

    move-object/from16 v17, v22

    move-object/from16 v18, v23

    move-object/from16 v19, v24

    move-object/from16 v20, v25

    move-object/from16 v21, v26

    move-object/from16 v22, v27

    move-object/from16 v23, v28

    move-object/from16 v24, v29

    move-object/from16 v25, v30

    move-object/from16 v26, v31

    move-object/from16 v27, v32

    move-object/from16 v28, v33

    move-object/from16 v30, v34

    move-object/from16 v31, v35

    move-object/from16 v32, v36

    move-object/from16 v33, v37

    move-object/from16 v34, v38

    move-object/from16 v29, v5

    move-object v5, v4

    move-object v4, v3

    move-object v3, v2

    move-object v2, v1

    move-object v1, v0

    filled-new-array/range {v1 .. v34}, [Lpc;

    move-result-object v0

    sput-object v0, Lpc;->B:[Lpc;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lpc;->C:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILxc;ZLhs0;)V
    .registers 6

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lpc;->a:Lxc;

    iput-boolean p4, p0, Lpc;->b:Z

    iput-object p5, p0, Lpc;->c:Lhs0;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lpc;
    .registers 2

    const-class v0, Lpc;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lpc;

    return-object p0
.end method

.method public static values()[Lpc;
    .registers 1

    sget-object v0, Lpc;->B:[Lpc;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lpc;

    return-object v0
.end method
