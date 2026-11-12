.class public final enum Lvhp;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lvhp;

.field public static final synthetic c:[Lvhp;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lvhp;

    invoke-direct {v0}, Lvhp;-><init>()V

    sput-object v0, Lvhp;->b:Lvhp;

    filled-new-array {v0}, [Lvhp;

    move-result-object v0

    sput-object v0, Lvhp;->c:[Lvhp;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    const-string v0, "ADS"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    const-string v0, "http.axx"

    iput-object v0, p0, Lvhp;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lvhp;
    .registers 2

    const-class v0, Lvhp;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lvhp;

    return-object p0
.end method

.method public static values()[Lvhp;
    .registers 1

    sget-object v0, Lvhp;->c:[Lvhp;

    invoke-virtual {v0}, [Lvhp;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lvhp;

    return-object v0
.end method
