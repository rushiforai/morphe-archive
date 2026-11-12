.class public final enum Lv2b;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lv2b;

.field public static final enum c:Lv2b;

.field public static final synthetic d:[Lv2b;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lv2b;

    const/4 v1, 0x0

    const-string v2, "bookmarks"

    const-string v3, "BOOKMARKS"

    invoke-direct {v0, v3, v1, v2}, Lv2b;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lv2b;->b:Lv2b;

    new-instance v1, Lv2b;

    const/4 v2, 0x1

    const-string v3, "passwords"

    const-string v4, "PASSWORDS"

    invoke-direct {v1, v4, v2, v3}, Lv2b;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lv2b;->c:Lv2b;

    filled-new-array {v0, v1}, [Lv2b;

    move-result-object v0

    sput-object v0, Lv2b;->d:[Lv2b;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lv2b;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lv2b;
    .registers 2

    const-class v0, Lv2b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lv2b;

    return-object p0
.end method

.method public static values()[Lv2b;
    .registers 1

    sget-object v0, Lv2b;->d:[Lv2b;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lv2b;

    return-object v0
.end method
