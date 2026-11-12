.class public final enum Lqhj;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final e:Lr16;

.field public static final synthetic f:[Lqhj;


# instance fields
.field public final a:Lqwf;

.field public final b:I

.field public final c:I

.field public final d:Luk0;


# direct methods
.method static constructor <clinit>()V
    .registers 21

    new-instance v0, Lqhj;

    const v5, 0x7f0805d3

    sget-object v6, Luk0;->m:Luk0;

    const-string v1, "READER_MODE"

    const/4 v2, 0x0

    sget-object v3, Lqwf;->o:Lqwf;

    const v4, 0x7f140da0

    invoke-direct/range {v0 .. v6}, Lqhj;-><init>(Ljava/lang/String;ILqwf;IILuk0;)V

    new-instance v1, Lqhj;

    const v6, 0x7f0805f4

    sget-object v7, Luk0;->d:Luk0;

    const-string v2, "SHARE"

    const/4 v3, 0x1

    sget-object v4, Lqwf;->d:Lqwf;

    const v5, 0x7f1412bd

    invoke-direct/range {v1 .. v7}, Lqhj;-><init>(Ljava/lang/String;ILqwf;IILuk0;)V

    new-instance v2, Lqhj;

    const v7, 0x7f0805d4

    sget-object v8, Luk0;->c:Luk0;

    const-string v3, "RELOAD"

    const/4 v4, 0x2

    sget-object v5, Lqwf;->c:Lqwf;

    const v6, 0x7f1412b9

    invoke-direct/range {v2 .. v8}, Lqhj;-><init>(Ljava/lang/String;ILqwf;IILuk0;)V

    new-instance v3, Lqhj;

    const v8, 0x7f08061b

    sget-object v9, Luk0;->e:Luk0;

    const-string v4, "TRANSLATE"

    const/4 v5, 0x3

    sget-object v6, Lqwf;->e:Lqwf;

    const v7, 0x7f140a3c

    invoke-direct/range {v3 .. v9}, Lqhj;-><init>(Ljava/lang/String;ILqwf;IILuk0;)V

    new-instance v4, Lqhj;

    const v9, 0x7f080426

    sget-object v10, Luk0;->q:Luk0;

    const-string v5, "AI_ASSISTANT_SUMMARIZE"

    const/4 v6, 0x4

    sget-object v7, Lqwf;->u:Lqwf;

    const v8, 0x7f140155

    invoke-direct/range {v4 .. v10}, Lqhj;-><init>(Ljava/lang/String;ILqwf;IILuk0;)V

    new-instance v5, Lqhj;

    const v10, 0x7f0803ec

    sget-object v11, Luk0;->r:Luk0;

    const-string v6, "AI_ASSISTANT_ASK_AI"

    const/4 v7, 0x5

    sget-object v8, Lqwf;->y:Lqwf;

    const v9, 0x7f1401dc

    invoke-direct/range {v5 .. v11}, Lqhj;-><init>(Ljava/lang/String;ILqwf;IILuk0;)V

    new-instance v6, Lqhj;

    const v11, 0x7f080558

    sget-object v12, Luk0;->n:Luk0;

    const-string v7, "SEND_TO_MY_FLOW"

    const/4 v8, 0x6

    sget-object v9, Lqwf;->p:Lqwf;

    const v10, 0x7f140f33

    invoke-direct/range {v6 .. v12}, Lqhj;-><init>(Ljava/lang/String;ILqwf;IILuk0;)V

    new-instance v7, Lqhj;

    const v12, 0x7f0805fa

    sget-object v13, Luk0;->i:Luk0;

    const-string v8, "ADD_SPEED_DIAL"

    const/4 v9, 0x7

    sget-object v10, Lqwf;->k:Lqwf;

    const v11, 0x7f1400e7

    invoke-direct/range {v7 .. v13}, Lqhj;-><init>(Ljava/lang/String;ILqwf;IILuk0;)V

    new-instance v8, Lqhj;

    const v13, 0x7f0804e2

    sget-object v14, Luk0;->j:Luk0;

    const-string v9, "ADD_BOOKMARK"

    const/16 v10, 0x8

    sget-object v11, Lqwf;->l:Lqwf;

    const v12, 0x7f1400e2

    invoke-direct/range {v8 .. v14}, Lqhj;-><init>(Ljava/lang/String;ILqwf;IILuk0;)V

    new-instance v9, Lqhj;

    const v14, 0x7f0804e9

    sget-object v15, Luk0;->l:Luk0;

    const-string v10, "ADD_TO_HOMESCREEN"

    const/16 v11, 0x9

    sget-object v12, Lqwf;->n:Lqwf;

    const v13, 0x7f1400e5

    invoke-direct/range {v9 .. v15}, Lqhj;-><init>(Ljava/lang/String;ILqwf;IILuk0;)V

    new-instance v10, Lqhj;

    const v15, 0x7f0805a4

    sget-object v16, Luk0;->k:Luk0;

    const-string v11, "ADD_OFFLINE_PAGE"

    const/16 v12, 0xa

    sget-object v13, Lqwf;->m:Lqwf;

    const v14, 0x7f1400e6

    invoke-direct/range {v10 .. v16}, Lqhj;-><init>(Ljava/lang/String;ILqwf;IILuk0;)V

    new-instance v11, Lqhj;

    const v16, 0x7f080541

    sget-object v17, Luk0;->h:Luk0;

    const-string v12, "DESKTOP_SITE"

    const/16 v13, 0xb

    sget-object v14, Lqwf;->j:Lqwf;

    const v15, 0x7f140572

    invoke-direct/range {v11 .. v17}, Lqhj;-><init>(Ljava/lang/String;ILqwf;IILuk0;)V

    new-instance v12, Lqhj;

    const v17, 0x7f080554

    sget-object v18, Luk0;->f:Luk0;

    const-string v13, "FIND_IN_PAGE"

    const/16 v14, 0xc

    sget-object v15, Lqwf;->f:Lqwf;

    const v16, 0x7f140a2c

    invoke-direct/range {v12 .. v18}, Lqhj;-><init>(Ljava/lang/String;ILqwf;IILuk0;)V

    new-instance v13, Lqhj;

    const v18, 0x7f080543

    sget-object v19, Luk0;->g:Luk0;

    const-string v14, "SAVE_AS_PDF"

    const/16 v15, 0xd

    sget-object v16, Lqwf;->g:Lqwf;

    const v17, 0x7f140a3a

    invoke-direct/range {v13 .. v19}, Lqhj;-><init>(Ljava/lang/String;ILqwf;IILuk0;)V

    new-instance v14, Lqhj;

    const v19, 0x7f080639

    sget-object v20, Luk0;->o:Luk0;

    const-string v15, "SNAPSHOT"

    const/16 v16, 0xe

    sget-object v17, Lqwf;->q:Lqwf;

    const v18, 0x7f141256

    invoke-direct/range {v14 .. v20}, Lqhj;-><init>(Ljava/lang/String;ILqwf;IILuk0;)V

    filled-new-array/range {v0 .. v14}, [Lqhj;

    move-result-object v0

    sput-object v0, Lqhj;->f:[Lqhj;

    new-instance v0, Lh58;

    new-instance v0, Lr16;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lqhj;->e:Lr16;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILqwf;IILuk0;)V
    .registers 7

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lqhj;->a:Lqwf;

    iput p4, p0, Lqhj;->b:I

    iput p5, p0, Lqhj;->c:I

    iput-object p6, p0, Lqhj;->d:Luk0;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lqhj;
    .registers 2

    const-class v0, Lqhj;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lqhj;

    return-object p0
.end method

.method public static values()[Lqhj;
    .registers 1

    sget-object v0, Lqhj;->f:[Lqhj;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lqhj;

    return-object v0
.end method
