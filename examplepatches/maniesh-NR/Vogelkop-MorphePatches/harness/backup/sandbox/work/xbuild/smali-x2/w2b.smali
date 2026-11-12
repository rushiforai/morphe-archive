.class public final enum Lw2b;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final b:Lhv5;

.field public static final enum c:Lw2b;

.field public static final enum d:Lw2b;

.field public static final enum e:Lw2b;

.field public static final synthetic f:[Lw2b;

.field public static final synthetic g:Lh58;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lw2b;

    const/4 v1, 0x0

    const-string v2, "bookmarks_menu"

    const-string v3, "BOOKMARKS_MENU"

    invoke-direct {v0, v3, v1, v2}, Lw2b;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lw2b;->c:Lw2b;

    new-instance v1, Lw2b;

    const/4 v2, 0x1

    const-string v3, "passwords_menu"

    const-string v4, "PASSWORDS_MENU"

    invoke-direct {v1, v4, v2, v3}, Lw2b;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lw2b;->d:Lw2b;

    new-instance v2, Lw2b;

    const/4 v3, 0x2

    const-string v4, "deeplink"

    const-string v5, "DEEP_LINK"

    invoke-direct {v2, v5, v3, v4}, Lw2b;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lw2b;->e:Lw2b;

    filled-new-array {v0, v1, v2}, [Lw2b;

    move-result-object v0

    sput-object v0, Lw2b;->f:[Lw2b;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lw2b;->g:Lh58;

    new-instance v0, Lhv5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lw2b;->b:Lhv5;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lw2b;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lw2b;
    .registers 2

    const-class v0, Lw2b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lw2b;

    return-object p0
.end method

.method public static values()[Lw2b;
    .registers 1

    sget-object v0, Lw2b;->f:[Lw2b;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lw2b;

    return-object v0
.end method
