.class public final enum Lxpk;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final b:Ltmj;

.field public static final enum c:Lxpk;

.field public static final enum d:Lxpk;

.field public static final enum e:Lxpk;

.field public static final enum f:Lxpk;

.field public static final enum g:Lxpk;

.field public static final enum h:Lxpk;

.field public static final enum i:Lxpk;

.field public static final enum j:Lxpk;

.field public static final synthetic k:[Lxpk;

.field public static final synthetic l:Lh58;


# instance fields
.field public final a:Lu1b;


# direct methods
.method static constructor <clinit>()V
    .registers 16

    new-instance v0, Lxpk;

    const/16 v1, 0xe

    filled-new-array {v1}, [I

    move-result-object v1

    const/4 v2, 0x0

    const-string v3, "COPY"

    invoke-direct {v0, v2, v3, v1}, Lxpk;-><init>(ILjava/lang/String;[I)V

    sput-object v0, Lxpk;->c:Lxpk;

    new-instance v1, Lxpk;

    const/16 v2, 0xc

    const/16 v3, 0xd

    filled-new-array {v2, v3}, [I

    move-result-object v2

    const/4 v3, 0x1

    const-string v4, "PASTE"

    invoke-direct {v1, v3, v4, v2}, Lxpk;-><init>(ILjava/lang/String;[I)V

    sput-object v1, Lxpk;->d:Lxpk;

    new-instance v2, Lxpk;

    const/16 v3, 0x21

    filled-new-array {v3}, [I

    move-result-object v3

    const/4 v4, 0x2

    const-string v5, "NTP"

    invoke-direct {v2, v4, v5, v3}, Lxpk;-><init>(ILjava/lang/String;[I)V

    new-instance v3, Lxpk;

    const/16 v4, 0xf

    filled-new-array {v4}, [I

    move-result-object v4

    const/4 v12, 0x3

    const-string v5, "SPEED_DIALS"

    invoke-direct {v3, v12, v5, v4}, Lxpk;-><init>(ILjava/lang/String;[I)V

    new-instance v4, Lxpk;

    const/16 v5, 0x8

    filled-new-array {v5}, [I

    move-result-object v6

    const/4 v7, 0x4

    const-string v8, "SEARCH"

    invoke-direct {v4, v7, v8, v6}, Lxpk;-><init>(ILjava/lang/String;[I)V

    move v6, v5

    new-instance v5, Lxpk;

    const/16 v7, 0xb

    filled-new-array {v7}, [I

    move-result-object v8

    const/4 v9, 0x5

    const-string v10, "RECENT"

    invoke-direct {v5, v9, v10, v8}, Lxpk;-><init>(ILjava/lang/String;[I)V

    sput-object v5, Lxpk;->e:Lxpk;

    move v8, v6

    new-instance v6, Lxpk;

    const/16 v9, 0xa

    filled-new-array {v9}, [I

    move-result-object v10

    const/4 v11, 0x6

    const-string v13, "TRENDING"

    invoke-direct {v6, v11, v13, v10}, Lxpk;-><init>(ILjava/lang/String;[I)V

    sput-object v6, Lxpk;->f:Lxpk;

    move v10, v7

    new-instance v7, Lxpk;

    const/16 v11, 0x1e

    const/16 v13, 0x1f

    const/16 v14, 0x1b

    const/16 v15, 0x1c

    filled-new-array {v14, v15, v11, v13}, [I

    move-result-object v11

    const/4 v13, 0x7

    const-string v14, "AI_FILE_UPLOAD_PROMPT_SUGGESTIONS"

    invoke-direct {v7, v13, v14, v11}, Lxpk;-><init>(ILjava/lang/String;[I)V

    move v11, v8

    new-instance v8, Lxpk;

    const/16 v13, 0x19

    filled-new-array {v13}, [I

    move-result-object v13

    const-string v14, "CHAT_SUGGESTIONS"

    invoke-direct {v8, v11, v14, v13}, Lxpk;-><init>(ILjava/lang/String;[I)V

    sput-object v8, Lxpk;->g:Lxpk;

    move v11, v9

    new-instance v9, Lxpk;

    const/16 v13, 0x1a

    filled-new-array {v13}, [I

    move-result-object v13

    const/16 v14, 0x9

    const-string v15, "RECENT_AI_ACTIVITY"

    invoke-direct {v9, v14, v15, v13}, Lxpk;-><init>(ILjava/lang/String;[I)V

    sput-object v9, Lxpk;->h:Lxpk;

    move v13, v10

    new-instance v10, Lxpk;

    const/16 v14, 0x13

    new-array v14, v14, [I

    fill-array-data v14, :array_da

    const-string v15, "OTHERS"

    invoke-direct {v10, v11, v15, v14}, Lxpk;-><init>(ILjava/lang/String;[I)V

    sput-object v10, Lxpk;->i:Lxpk;

    new-instance v11, Lxpk;

    const/16 v14, 0x14

    filled-new-array {v14}, [I

    move-result-object v14

    const-string v15, "SETTINGS"

    invoke-direct {v11, v13, v15, v14}, Lxpk;-><init>(ILjava/lang/String;[I)V

    sput-object v11, Lxpk;->j:Lxpk;

    filled-new-array/range {v0 .. v11}, [Lxpk;

    move-result-object v0

    sput-object v0, Lxpk;->k:[Lxpk;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lxpk;->l:Lh58;

    new-instance v0, Ltmj;

    invoke-direct {v0, v12}, Ltmj;-><init>(B)V

    sput-object v0, Lxpk;->b:Ltmj;

    return-void

    :array_da
    .array-data 4
        0x0
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x7
        0x9
        0x10
        0x22
        0x11
        0x12
        0x13
        0x15
        0x16
        0x17
        0x18
        0x20
    .end array-data
.end method

.method public varargs constructor <init>(ILjava/lang/String;[I)V
    .registers 4

    invoke-direct {p0, p2, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    invoke-static {p3}, Lb82;->l([I)[Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p1}, Lu1b;->r([Ljava/lang/Object;)Lu1b;

    move-result-object p1

    iput-object p1, p0, Lxpk;->a:Lu1b;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lxpk;
    .registers 2

    const-class v0, Lxpk;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lxpk;

    return-object p0
.end method

.method public static values()[Lxpk;
    .registers 1

    sget-object v0, Lxpk;->k:[Lxpk;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lxpk;

    return-object v0
.end method
