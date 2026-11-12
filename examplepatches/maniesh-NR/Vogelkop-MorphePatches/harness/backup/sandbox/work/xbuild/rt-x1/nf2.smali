.class public final enum Lnf2;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lnf2;

.field public static final enum c:Lnf2;

.field public static final enum d:Lnf2;

.field public static final enum e:Lnf2;

.field public static final enum f:Lnf2;

.field public static final enum g:Lnf2;

.field public static final enum h:Lnf2;

.field public static final enum i:Lnf2;

.field public static final enum j:Lnf2;

.field public static final enum k:Lnf2;

.field public static final enum l:Lnf2;

.field public static final enum m:Lnf2;

.field public static final enum n:Lnf2;

.field public static final synthetic o:[Lnf2;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 16

    new-instance v0, Lnf2;

    const-string v1, "ADDRESS"

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3}, Lnf2;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lnf2;->b:Lnf2;

    new-instance v1, Lnf2;

    const-string v4, "NAME"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2}, Lnf2;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lnf2;->c:Lnf2;

    move v4, v2

    new-instance v2, Lnf2;

    const-string v6, "PHONE"

    invoke-direct {v2, v6, v3, v4}, Lnf2;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lnf2;->d:Lnf2;

    new-instance v3, Lnf2;

    const-string v6, "EMAIL_ADDRESS"

    const/4 v7, 0x3

    const/16 v8, 0x10

    invoke-direct {v3, v6, v7, v8}, Lnf2;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lnf2;->e:Lnf2;

    move v6, v4

    new-instance v4, Lnf2;

    const-string v7, "IMPP"

    const/4 v9, 0x4

    invoke-direct {v4, v7, v9, v8}, Lnf2;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lnf2;->f:Lnf2;

    move v7, v5

    new-instance v5, Lnf2;

    const-string v8, "PASSWORD"

    const/4 v10, 0x5

    invoke-direct {v5, v8, v10, v7}, Lnf2;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lnf2;->g:Lnf2;

    move v7, v6

    new-instance v6, Lnf2;

    const-string v8, "USERNAME"

    const/4 v10, 0x6

    const/16 v11, 0x8

    invoke-direct {v6, v8, v10, v11}, Lnf2;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lnf2;->h:Lnf2;

    move v8, v7

    new-instance v7, Lnf2;

    const-string v10, "CREDIT_CARD"

    const/4 v12, 0x7

    invoke-direct {v7, v10, v12, v9}, Lnf2;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lnf2;->i:Lnf2;

    move v9, v8

    new-instance v8, Lnf2;

    const-string v10, "GENDER"

    invoke-direct {v8, v10, v11, v9}, Lnf2;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lnf2;->j:Lnf2;

    move v10, v9

    new-instance v9, Lnf2;

    const-string v11, "BIRTHDAY"

    const/16 v12, 0x9

    invoke-direct {v9, v11, v12, v10}, Lnf2;-><init>(Ljava/lang/String;II)V

    sput-object v9, Lnf2;->k:Lnf2;

    move v11, v10

    new-instance v10, Lnf2;

    const-string v12, "SIGNUP_USERNAME"

    const/16 v13, 0xa

    invoke-direct {v10, v12, v13, v11}, Lnf2;-><init>(Ljava/lang/String;II)V

    sput-object v10, Lnf2;->l:Lnf2;

    move v12, v11

    new-instance v11, Lnf2;

    const-string v13, "SIGNUP_PASSWORD"

    const/16 v14, 0xb

    invoke-direct {v11, v13, v14, v12}, Lnf2;-><init>(Ljava/lang/String;II)V

    sput-object v11, Lnf2;->m:Lnf2;

    move v13, v12

    new-instance v12, Lnf2;

    const-string v14, "OTHER"

    const/16 v15, 0xc

    invoke-direct {v12, v14, v15, v13}, Lnf2;-><init>(Ljava/lang/String;II)V

    sput-object v12, Lnf2;->n:Lnf2;

    filled-new-array/range {v0 .. v12}, [Lnf2;

    move-result-object v0

    sput-object v0, Lnf2;->o:[Lnf2;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p3, p0, Lnf2;->a:B

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnf2;
    .registers 2

    const-class v0, Lnf2;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnf2;

    return-object p0
.end method

.method public static values()[Lnf2;
    .registers 1

    sget-object v0, Lnf2;->o:[Lnf2;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnf2;

    return-object v0
.end method
