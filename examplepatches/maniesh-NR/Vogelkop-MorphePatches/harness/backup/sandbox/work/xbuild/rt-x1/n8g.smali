.class public final enum Ln8g;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final c:La36;

.field public static final enum d:Ln8g;

.field public static final enum e:Ln8g;

.field public static final enum f:Ln8g;

.field public static final synthetic g:[Ln8g;

.field public static final synthetic h:Lh58;


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .registers 11

    new-instance v0, Ln8g;

    const v1, 0x7f0a0240

    const v2, 0x7f06027f

    const/4 v3, 0x0

    const-string v4, "BLUE"

    invoke-direct {v0, v3, v1, v2, v4}, Ln8g;-><init>(IIILjava/lang/String;)V

    new-instance v1, Ln8g;

    const v2, 0x7f0a0244

    const v3, 0x7f06028d

    const/4 v4, 0x1

    const-string v5, "ORANGE"

    invoke-direct {v1, v4, v2, v3, v5}, Ln8g;-><init>(IIILjava/lang/String;)V

    new-instance v2, Ln8g;

    const v3, 0x7f0a024b

    const v4, 0x7f06028f

    const/4 v5, 0x2

    const-string v6, "PINK"

    invoke-direct {v2, v5, v3, v4, v6}, Ln8g;-><init>(IIILjava/lang/String;)V

    sput-object v2, Ln8g;->d:Ln8g;

    new-instance v3, Ln8g;

    const v4, 0x7f0a0243

    const v5, 0x7f060286

    const/4 v6, 0x3

    const-string v7, "GREEN"

    invoke-direct {v3, v6, v4, v5, v7}, Ln8g;-><init>(IIILjava/lang/String;)V

    new-instance v4, Ln8g;

    const v5, 0x7f0a024c

    const v6, 0x7f060291

    const/4 v7, 0x4

    const-string v8, "PURPLE"

    invoke-direct {v4, v7, v5, v6, v8}, Ln8g;-><init>(IIILjava/lang/String;)V

    new-instance v5, Ln8g;

    const v6, 0x7f0a024d

    const v7, 0x7f060296

    const/4 v8, 0x5

    const-string v9, "WHITE"

    invoke-direct {v5, v8, v6, v7, v9}, Ln8g;-><init>(IIILjava/lang/String;)V

    sput-object v5, Ln8g;->e:Ln8g;

    new-instance v6, Ln8g;

    const v7, 0x7f0a023f

    const v8, 0x7f06027e

    const/4 v9, 0x6

    const-string v10, "BLACK"

    invoke-direct {v6, v9, v7, v8, v10}, Ln8g;-><init>(IIILjava/lang/String;)V

    sput-object v6, Ln8g;->f:Ln8g;

    filled-new-array/range {v0 .. v6}, [Ln8g;

    move-result-object v0

    sput-object v0, Ln8g;->g:[Ln8g;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Ln8g;->h:Lh58;

    new-instance v0, La36;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ln8g;->c:La36;

    return-void
.end method

.method public constructor <init>(IIILjava/lang/String;)V
    .registers 5

    invoke-direct {p0, p4, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p2, p0, Ln8g;->a:I

    iput p3, p0, Ln8g;->b:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ln8g;
    .registers 2

    const-class v0, Ln8g;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ln8g;

    return-object p0
.end method

.method public static values()[Ln8g;
    .registers 1

    sget-object v0, Ln8g;->g:[Ln8g;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ln8g;

    return-object v0
.end method
