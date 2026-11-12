.class public final enum Lhff;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lhff;",
        ">;"
    }
.end annotation

.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lgff;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Ll4c;

.field public static final enum b:Lhff;

.field public static final enum c:Lhff;

.field public static final enum d:Lhff;

.field public static final synthetic e:[Lhff;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lhff;

    const-string v1, "NETWORK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lhff;->b:Lhff;

    new-instance v1, Lhff;

    const-string v2, "FALLBACK_CONFIG_MISMATCH"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lhff;->c:Lhff;

    new-instance v2, Lhff;

    const-string v3, "FALLBACK_NO_DATA"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lhff;->d:Lhff;

    filled-new-array {v0, v1, v2}, [Lhff;

    move-result-object v0

    sput-object v0, Lhff;->e:[Lhff;

    new-instance v0, Lh58;

    new-instance v0, Lgff;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lhff;->Companion:Lgff;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lvme;

    const/16 v2, 0x16

    invoke-direct {v1, v2}, Lvme;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    sput-object v0, Lhff;->a:Ll4c;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lhff;
    .registers 2

    const-class v0, Lhff;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lhff;

    return-object p0
.end method

.method public static values()[Lhff;
    .registers 1

    sget-object v0, Lhff;->e:[Lhff;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lhff;

    return-object v0
.end method
