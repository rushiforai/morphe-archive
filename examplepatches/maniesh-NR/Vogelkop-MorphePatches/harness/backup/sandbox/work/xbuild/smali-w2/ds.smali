.class public final enum Lds;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final b:Lzpa;

.field public static final enum c:Lds;

.field public static final enum d:Lds;

.field public static final enum e:Lds;

.field public static final enum f:Lds;

.field public static final enum g:Lds;

.field public static final synthetic h:[Lds;

.field public static final synthetic i:Lh58;


# instance fields
.field public final a:La26;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lds;

    const/4 v1, 0x0

    sget-object v2, Lg4a;->p:Lg4a;

    const-string v3, "GRID"

    invoke-direct {v0, v3, v1, v2}, Lds;-><init>(Ljava/lang/String;ILa26;)V

    sput-object v0, Lds;->c:Lds;

    new-instance v1, Lds;

    sget-object v2, Lg4a;->o:Lg4a;

    const-string v3, "LIST"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v2}, Lds;-><init>(Ljava/lang/String;ILa26;)V

    sput-object v1, Lds;->d:Lds;

    new-instance v3, Lds;

    const-string v4, "MANUAL_ADD"

    const/4 v5, 0x2

    invoke-direct {v3, v4, v5, v2}, Lds;-><init>(Ljava/lang/String;ILa26;)V

    sput-object v3, Lds;->e:Lds;

    new-instance v4, Lds;

    const-string v5, "HEADER"

    const/4 v6, 0x3

    invoke-direct {v4, v5, v6, v2}, Lds;-><init>(Ljava/lang/String;ILa26;)V

    sput-object v4, Lds;->f:Lds;

    new-instance v5, Lds;

    const-string v6, "EMPTY"

    const/4 v7, 0x4

    invoke-direct {v5, v6, v7, v2}, Lds;-><init>(Ljava/lang/String;ILa26;)V

    sput-object v5, Lds;->g:Lds;

    filled-new-array {v0, v1, v3, v4, v5}, [Lds;

    move-result-object v0

    sput-object v0, Lds;->h:[Lds;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lds;->i:Lh58;

    new-instance v0, Lzpa;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Lzpa;-><init>(B)V

    sput-object v0, Lds;->b:Lzpa;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILa26;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lds;->a:La26;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lds;
    .registers 2

    const-class v0, Lds;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lds;

    return-object p0
.end method

.method public static values()[Lds;
    .registers 1

    sget-object v0, Lds;->h:[Lds;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lds;

    return-object v0
.end method
