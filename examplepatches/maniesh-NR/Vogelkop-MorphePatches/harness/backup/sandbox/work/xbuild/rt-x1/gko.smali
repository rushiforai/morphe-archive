.class public final enum Lgko;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final c:Ltmj;

.field public static final d:Ljava/util/EnumSet;

.field public static final enum e:Lgko;

.field public static final enum f:Lgko;

.field public static final enum g:Lgko;

.field public static final enum h:Lgko;

.field public static final enum i:Lgko;

.field public static final enum j:Lgko;

.field public static final enum k:Lgko;

.field public static final enum l:Lgko;

.field public static final enum m:Lgko;

.field public static final enum n:Lgko;

.field public static final enum o:Lgko;

.field public static final enum p:Lgko;

.field public static final enum q:Lgko;

.field public static final enum r:Lgko;

.field public static final synthetic s:[Lgko;

.field public static final synthetic t:Lh58;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/util/Set;


# direct methods
.method static constructor <clinit>()V
    .registers 19

    new-instance v0, Lgko;

    const-string v1, "CLOSE"

    const/4 v2, 0x0

    const-string v3, "close"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lgko;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;)V

    new-instance v1, Lgko;

    const-string v2, "eventJSON"

    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    const/4 v3, 0x1

    const-string v5, "createCalendarEvent"

    const-string v6, "CREATE_CALENDAR_EVENT"

    invoke-direct {v1, v6, v3, v5, v2}, Lgko;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;)V

    sput-object v1, Lgko;->e:Lgko;

    new-instance v2, Lgko;

    const/4 v3, 0x2

    const-string v5, "expand"

    const-string v6, "EXPAND"

    invoke-direct {v2, v6, v3, v5, v4}, Lgko;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;)V

    sput-object v2, Lgko;->f:Lgko;

    new-instance v3, Lgko;

    const/4 v5, 0x3

    const-string v6, "open"

    const-string v7, "OPEN"

    invoke-direct {v3, v7, v5, v6, v4}, Lgko;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;)V

    sput-object v3, Lgko;->g:Lgko;

    new-instance v5, Lgko;

    const-string v6, "url"

    invoke-static {v6}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v7

    const/4 v8, 0x4

    const-string v9, "playVideo"

    const-string v10, "PLAY_VIDEO"

    invoke-direct {v5, v10, v8, v9, v7}, Lgko;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;)V

    sput-object v5, Lgko;->h:Lgko;

    move-object v7, v5

    new-instance v5, Lgko;

    const/4 v8, 0x5

    const-string v9, "resize"

    const-string v10, "RESIZE"

    invoke-direct {v5, v10, v8, v9, v4}, Lgko;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;)V

    sput-object v5, Lgko;->i:Lgko;

    move-object v8, v6

    new-instance v6, Lgko;

    const-string v9, "allowOrientationChange"

    const-string v10, "forceOrientation"

    filled-new-array {v9, v10}, [Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v9

    const/4 v10, 0x6

    const-string v11, "setOrientationProperties"

    const-string v12, "SET_ORIENTATION_PROPERTIES"

    invoke-direct {v6, v12, v10, v11, v9}, Lgko;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;)V

    sput-object v6, Lgko;->j:Lgko;

    move-object v9, v7

    new-instance v7, Lgko;

    const-string v14, "customClosePosition"

    const-string v15, "allowOffscreen"

    const-string v10, "width"

    const-string v11, "height"

    const-string v12, "offsetX"

    const-string v13, "offsetY"

    filled-new-array/range {v10 .. v15}, [Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v10

    const/4 v11, 0x7

    const-string v12, "setResizeProperties"

    const-string v13, "SET_RESIZE_PROPERTIES"

    invoke-direct {v7, v13, v11, v12, v10}, Lgko;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;)V

    sput-object v7, Lgko;->k:Lgko;

    move-object v10, v8

    new-instance v8, Lgko;

    invoke-static {v10}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v11

    const/16 v12, 0x8

    const-string v13, "storePicture"

    const-string v14, "STORE_PICTURE"

    invoke-direct {v8, v14, v12, v13, v11}, Lgko;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;)V

    sput-object v8, Lgko;->l:Lgko;

    move-object v11, v9

    new-instance v9, Lgko;

    const-string v12, "useCustomClose"

    invoke-static {v12}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v13

    const-string v14, "USE_CUSTOM_CLOSE"

    const/16 v15, 0x9

    invoke-direct {v9, v14, v15, v12, v13}, Lgko;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;)V

    sput-object v9, Lgko;->m:Lgko;

    move-object v12, v10

    new-instance v10, Lgko;

    const/16 v13, 0xa

    const-string v14, "blockAd"

    const-string v15, "BLOCK_AD"

    invoke-direct {v10, v15, v13, v14, v4}, Lgko;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;)V

    sput-object v10, Lgko;->n:Lgko;

    move-object v13, v11

    new-instance v11, Lgko;

    const/16 v14, 0xb

    const-string v15, "enableBackButton"

    move-object/from16 v16, v0

    const-string v0, "ENABLE_BACK_BUTTON"

    invoke-direct {v11, v0, v14, v15, v4}, Lgko;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;)V

    sput-object v11, Lgko;->o:Lgko;

    move-object v0, v12

    new-instance v12, Lgko;

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    const/16 v14, 0xc

    const-string v15, "openPrivacy"

    const-string v4, "OPEN_PRIVACY"

    invoke-direct {v12, v4, v14, v15, v0}, Lgko;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;)V

    sput-object v12, Lgko;->p:Lgko;

    move-object v4, v13

    new-instance v13, Lgko;

    const-string v0, "evt"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    const/16 v14, 0xd

    const-string v15, "reportEvent"

    move-object/from16 v17, v1

    const-string v1, "REPORT_EVENT"

    invoke-direct {v13, v1, v14, v15, v0}, Lgko;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;)V

    sput-object v13, Lgko;->q:Lgko;

    new-instance v14, Lgko;

    const/16 v0, 0xe

    const-string v1, "rewardGranted"

    const-string v15, "REWARD_GRANTED"

    move-object/from16 v18, v2

    const/4 v2, 0x0

    invoke-direct {v14, v15, v0, v1, v2}, Lgko;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;)V

    sput-object v14, Lgko;->r:Lgko;

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    filled-new-array/range {v0 .. v14}, [Lgko;

    move-result-object v0

    sput-object v0, Lgko;->s:[Lgko;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lgko;->t:Lh58;

    new-instance v0, Ltmj;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Ltmj;-><init>(B)V

    sput-object v0, Lgko;->c:Ltmj;

    invoke-static {v3, v10, v12, v13}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    sput-object v0, Lgko;->d:Ljava/util/EnumSet;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lgko;->a:Ljava/lang/String;

    iput-object p4, p0, Lgko;->b:Ljava/util/Set;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lgko;
    .registers 2

    const-class v0, Lgko;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lgko;

    return-object p0
.end method

.method public static values()[Lgko;
    .registers 1

    sget-object v0, Lgko;->s:[Lgko;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lgko;

    return-object v0
.end method
