.class public final enum Lg7j;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum f:Lg7j;

.field public static final enum g:Lg7j;

.field public static final h:Lg7j;

.field public static final synthetic i:[Lg7j;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:Ljava/lang/String;

.field public final e:I


# direct methods
.method static constructor <clinit>()V
    .registers 16

    new-instance v0, Lg7j;

    const-string v6, "blue"

    const/4 v7, 0x5

    const-string v1, "BLUE"

    const/4 v2, 0x0

    const v3, 0x7f04006c

    const v4, 0x7f040063

    const v5, 0x7f04005a

    invoke-direct/range {v0 .. v7}, Lg7j;-><init>(Ljava/lang/String;IIIILjava/lang/String;I)V

    new-instance v1, Lg7j;

    const-string v7, "red"

    const/4 v8, 0x6

    const-string v2, "RED"

    const/4 v3, 0x1

    const v4, 0x7f040073

    const v5, 0x7f04006a

    const v6, 0x7f040061

    invoke-direct/range {v1 .. v8}, Lg7j;-><init>(Ljava/lang/String;IIIILjava/lang/String;I)V

    new-instance v2, Lg7j;

    const-string v8, "grey"

    const/16 v9, 0x8

    const-string v3, "GREY"

    const/4 v4, 0x2

    const v5, 0x7f04006e

    const v6, 0x7f040065

    const v7, 0x7f04005c

    invoke-direct/range {v2 .. v9}, Lg7j;-><init>(Ljava/lang/String;IIIILjava/lang/String;I)V

    new-instance v3, Lg7j;

    const-string v9, "green"

    const/4 v10, 0x7

    const-string v4, "GREEN"

    const/4 v5, 0x3

    const v6, 0x7f04006d

    const v7, 0x7f040064

    const v8, 0x7f04005b

    invoke-direct/range {v3 .. v10}, Lg7j;-><init>(Ljava/lang/String;IIIILjava/lang/String;I)V

    new-instance v4, Lg7j;

    const-string v10, "purple"

    const/4 v11, 0x3

    const-string v5, "PURPLE"

    const/4 v6, 0x4

    const v7, 0x7f040072

    const v8, 0x7f040069

    const v9, 0x7f040060

    invoke-direct/range {v4 .. v11}, Lg7j;-><init>(Ljava/lang/String;IIIILjava/lang/String;I)V

    new-instance v5, Lg7j;

    const-string v11, "orange"

    const/4 v12, 0x2

    const-string v6, "ORANGE"

    const/4 v7, 0x5

    const v8, 0x7f040071

    const v9, 0x7f040068

    const v10, 0x7f04005f

    invoke-direct/range {v5 .. v12}, Lg7j;-><init>(Ljava/lang/String;IIIILjava/lang/String;I)V

    new-instance v6, Lg7j;

    const-string v12, "one"

    const/4 v13, 0x1

    const-string v7, "ONE"

    const/4 v8, 0x6

    const v9, 0x7f040070

    const v10, 0x7f040067

    const v11, 0x7f04005e

    invoke-direct/range {v6 .. v13}, Lg7j;-><init>(Ljava/lang/String;IIIILjava/lang/String;I)V

    new-instance v7, Lg7j;

    const-string v13, "teal"

    const/4 v14, 0x4

    const-string v8, "TEAL"

    const/4 v9, 0x7

    const v10, 0x7f040074

    const v11, 0x7f04006b

    const v12, 0x7f040062

    invoke-direct/range {v7 .. v14}, Lg7j;-><init>(Ljava/lang/String;IIIILjava/lang/String;I)V

    sput-object v7, Lg7j;->f:Lg7j;

    new-instance v8, Lg7j;

    const-string v14, "khaki"

    const/4 v15, -0x1

    const-string v9, "KHAKI"

    const/16 v10, 0x8

    const v11, 0x7f04006f

    const v12, 0x7f040066

    const v13, 0x7f04005d

    invoke-direct/range {v8 .. v15}, Lg7j;-><init>(Ljava/lang/String;IIIILjava/lang/String;I)V

    sput-object v8, Lg7j;->g:Lg7j;

    filled-new-array/range {v0 .. v8}, [Lg7j;

    move-result-object v0

    sput-object v0, Lg7j;->i:[Lg7j;

    sput-object v6, Lg7j;->h:Lg7j;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIIILjava/lang/String;I)V
    .registers 8

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lg7j;->a:I

    iput p4, p0, Lg7j;->b:I

    iput p5, p0, Lg7j;->c:I

    iput-object p6, p0, Lg7j;->d:Ljava/lang/String;

    iput p7, p0, Lg7j;->e:I

    return-void
.end method

.method public static d(Ljava/lang/String;)Lg7j;
    .registers 6

    invoke-static {}, Lg7j;->values()[Lg7j;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v1, :cond_16

    aget-object v3, v0, v2

    iget-object v4, v3, Lg7j;->d:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13

    return-object v3

    :cond_13
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_16
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lg7j;
    .registers 2

    const-class v0, Lg7j;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lg7j;

    return-object p0
.end method

.method public static values()[Lg7j;
    .registers 1

    sget-object v0, Lg7j;->i:[Lg7j;

    invoke-virtual {v0}, [Lg7j;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lg7j;

    return-object v0
.end method
