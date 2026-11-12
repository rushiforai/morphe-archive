.class public final enum Lo29;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lo29;

.field public static final enum c:Lo29;

.field public static final enum d:Lo29;

.field public static final enum e:Lo29;

.field public static final enum f:Lo29;

.field public static final enum g:Lo29;

.field public static final enum h:Lo29;

.field public static final enum i:Lo29;

.field public static final enum j:Lo29;

.field public static final enum k:Lo29;

.field public static final enum l:Lo29;

.field public static final enum m:Lo29;

.field public static final enum n:Lo29;

.field public static final enum o:Lo29;

.field public static final enum p:Lo29;

.field public static final synthetic q:[Lo29;


# instance fields
.field public final a:Lcsh;


# direct methods
.method static constructor <clinit>()V
    .registers 18

    new-instance v0, Lo29;

    const-string v1, "audio"

    const-string v2, "application"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v3

    const-string v4, "AUDIO"

    const/4 v5, 0x0

    invoke-direct {v0, v4, v3, v5}, Lo29;-><init>(Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v0, Lo29;->b:Lo29;

    new-instance v3, Lo29;

    const/4 v4, 0x1

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v5, "AUDIO_PLAYLIST"

    invoke-direct {v3, v5, v1, v4}, Lo29;-><init>(Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v3, Lo29;->c:Lo29;

    new-instance v1, Lo29;

    const-string v4, "video"

    filled-new-array {v4, v2}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "VIDEO"

    const/4 v6, 0x2

    invoke-direct {v1, v5, v4, v6}, Lo29;-><init>(Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v1, Lo29;->d:Lo29;

    move-object v4, v1

    move-object v1, v3

    new-instance v3, Lo29;

    const/4 v5, 0x3

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v6

    const-string v7, "VIDEO_STREAM_DASH"

    invoke-direct {v3, v7, v6, v5}, Lo29;-><init>(Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v3, Lo29;->e:Lo29;

    move-object v5, v4

    new-instance v4, Lo29;

    const/4 v6, 0x4

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v7

    const-string v8, "VIDEO_STREAM_HLS"

    invoke-direct {v4, v8, v7, v6}, Lo29;-><init>(Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v4, Lo29;->f:Lo29;

    move-object v6, v5

    new-instance v5, Lo29;

    const/4 v7, 0x5

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v8

    const-string v9, "APP"

    invoke-direct {v5, v9, v8, v7}, Lo29;-><init>(Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v5, Lo29;->g:Lo29;

    move-object v7, v6

    new-instance v6, Lo29;

    const-string v8, "text"

    filled-new-array {v8}, [Ljava/lang/String;

    move-result-object v9

    const-string v10, "TEXT"

    const/4 v11, 0x6

    invoke-direct {v6, v10, v9, v11}, Lo29;-><init>(Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v6, Lo29;->h:Lo29;

    move-object v9, v7

    new-instance v7, Lo29;

    const/4 v10, 0x7

    filled-new-array {v8, v2}, [Ljava/lang/String;

    move-result-object v11

    const-string v12, "HTML"

    invoke-direct {v7, v12, v11, v10}, Lo29;-><init>(Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v7, Lo29;->i:Lo29;

    new-instance v10, Lo29;

    const/16 v11, 0x8

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v12

    const-string v13, "PDF"

    invoke-direct {v10, v13, v12, v11}, Lo29;-><init>(Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v10, Lo29;->j:Lo29;

    move-object v11, v9

    new-instance v9, Lo29;

    const-string v12, "image"

    filled-new-array {v12}, [Ljava/lang/String;

    move-result-object v12

    const-string v13, "IMAGE"

    const/16 v14, 0x9

    invoke-direct {v9, v13, v12, v14}, Lo29;-><init>(Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v9, Lo29;->k:Lo29;

    move-object v12, v10

    new-instance v10, Lo29;

    const/16 v13, 0xa

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v14

    const-string v15, "ARCHIVE"

    invoke-direct {v10, v15, v14, v13}, Lo29;-><init>(Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v10, Lo29;->l:Lo29;

    move-object v13, v11

    new-instance v11, Lo29;

    const-string v14, "multipart"

    const-string v15, "message"

    filled-new-array {v14, v15}, [Ljava/lang/String;

    move-result-object v14

    const-string v15, "MHTML"

    move-object/from16 v16, v0

    const/16 v0, 0xb

    invoke-direct {v11, v15, v14, v0}, Lo29;-><init>(Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v11, Lo29;->m:Lo29;

    move-object v0, v12

    new-instance v12, Lo29;

    const/16 v14, 0xc

    filled-new-array {v8, v2}, [Ljava/lang/String;

    move-result-object v2

    const-string v8, "DOCUMENT"

    invoke-direct {v12, v8, v2, v14}, Lo29;-><init>(Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v12, Lo29;->n:Lo29;

    move-object v2, v13

    new-instance v13, Lo29;

    const-string v8, ""

    filled-new-array {v8}, [Ljava/lang/String;

    move-result-object v14

    const-string v15, "NONE"

    move-object/from16 v17, v0

    const/16 v0, 0xd

    invoke-direct {v13, v15, v14, v0}, Lo29;-><init>(Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v13, Lo29;->o:Lo29;

    new-instance v14, Lo29;

    const/16 v0, 0xe

    filled-new-array {v8}, [Ljava/lang/String;

    move-result-object v8

    const-string v15, "VIDEO_OR_AUDIO"

    invoke-direct {v14, v15, v8, v0}, Lo29;-><init>(Ljava/lang/String;[Ljava/lang/String;I)V

    sput-object v14, Lo29;->p:Lo29;

    move-object/from16 v0, v16

    move-object/from16 v8, v17

    filled-new-array/range {v0 .. v14}, [Lo29;

    move-result-object v0

    sput-object v0, Lo29;->q:[Lo29;

    return-void
.end method

.method public varargs constructor <init>(Ljava/lang/String;[Ljava/lang/String;I)V
    .registers 6

    invoke-direct {p0, p1, p3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    const-string p1, "initialCapacity"

    const/4 p3, 0x4

    invoke-static {p3, p1}, Lscd;->q(ILjava/lang/String;)V

    new-array p1, p3, [Ljava/lang/Object;

    array-length v0, p2

    invoke-static {v0, p2}, Lc09;->e(I[Ljava/lang/Object;)V

    invoke-static {p3, v0}, Lw0b;->b(II)I

    move-result v1

    if-le v1, p3, :cond_19

    invoke-static {p1, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    :cond_19
    const/4 p3, 0x0

    invoke-static {p2, p3, p1, p3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-static {v0, p1}, Lh1b;->o(I[Ljava/lang/Object;)Lcsh;

    move-result-object p1

    iput-object p1, p0, Lo29;->a:Lcsh;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lo29;
    .registers 2

    const-class v0, Lo29;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lo29;

    return-object p0
.end method

.method public static values()[Lo29;
    .registers 1

    sget-object v0, Lo29;->q:[Lo29;

    invoke-virtual {v0}, [Lo29;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lo29;

    return-object v0
.end method


# virtual methods
.method public final d()Z
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 v0, 0x1

    if-eqz p0, :cond_14

    if-eq p0, v0, :cond_14

    const/4 v1, 0x2

    if-eq p0, v1, :cond_14

    const/4 v1, 0x3

    if-eq p0, v1, :cond_14

    const/4 v1, 0x4

    if-eq p0, v1, :cond_14

    const/4 p0, 0x0

    return p0

    :cond_14
    return v0
.end method
