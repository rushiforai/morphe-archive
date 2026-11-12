.class public final enum Lzlg;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lzlg;

.field public static final enum b:Lzlg;

.field public static final enum c:Lzlg;

.field public static final enum d:Lzlg;

.field public static final enum e:Lzlg;

.field public static final synthetic f:[Lzlg;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lzlg;

    const-string v1, "PAUSE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzlg;->a:Lzlg;

    new-instance v1, Lzlg;

    const-string v2, "PLAY"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lzlg;->b:Lzlg;

    new-instance v2, Lzlg;

    const-string v3, "NEXT"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lzlg;->c:Lzlg;

    new-instance v3, Lzlg;

    const-string v4, "PREVIOUS"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lzlg;->d:Lzlg;

    new-instance v4, Lzlg;

    const-string v5, "SPEED"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v5, Lzlg;

    const-string v6, "CLOSE"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lzlg;->e:Lzlg;

    filled-new-array/range {v0 .. v5}, [Lzlg;

    move-result-object v0

    sput-object v0, Lzlg;->f:[Lzlg;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lzlg;
    .registers 2

    const-class v0, Lzlg;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lzlg;

    return-object p0
.end method

.method public static values()[Lzlg;
    .registers 1

    sget-object v0, Lzlg;->f:[Lzlg;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lzlg;

    return-object v0
.end method
