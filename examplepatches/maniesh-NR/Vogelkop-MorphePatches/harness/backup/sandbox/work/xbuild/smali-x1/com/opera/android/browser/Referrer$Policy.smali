.class public final enum Lcom/opera/android/browser/Referrer$Policy;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/opera/android/browser/Referrer$Policy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/opera/android/browser/Referrer$Policy;

.field public static final enum ALWAYS:Lcom/opera/android/browser/Referrer$Policy;

.field public static final enum DEFAULT:Lcom/opera/android/browser/Referrer$Policy;

.field public static final enum NEVER:Lcom/opera/android/browser/Referrer$Policy;

.field public static final enum NO_REFERRER_WHEN_DOWNGRADE:Lcom/opera/android/browser/Referrer$Policy;

.field public static final enum ORIGIN:Lcom/opera/android/browser/Referrer$Policy;

.field public static final enum ORIGIN_WHEN_CROSSORIGIN:Lcom/opera/android/browser/Referrer$Policy;

.field public static final enum SAME_ORIGIN:Lcom/opera/android/browser/Referrer$Policy;

.field public static final enum STRICT_ORIGIN:Lcom/opera/android/browser/Referrer$Policy;

.field public static final enum STRICT_ORIGIN_WHEN_CROSSORIGIN:Lcom/opera/android/browser/Referrer$Policy;


# direct methods
.method private static synthetic $values()[Lcom/opera/android/browser/Referrer$Policy;
    .registers 9

    sget-object v0, Lcom/opera/android/browser/Referrer$Policy;->ALWAYS:Lcom/opera/android/browser/Referrer$Policy;

    sget-object v1, Lcom/opera/android/browser/Referrer$Policy;->DEFAULT:Lcom/opera/android/browser/Referrer$Policy;

    sget-object v2, Lcom/opera/android/browser/Referrer$Policy;->NEVER:Lcom/opera/android/browser/Referrer$Policy;

    sget-object v3, Lcom/opera/android/browser/Referrer$Policy;->ORIGIN:Lcom/opera/android/browser/Referrer$Policy;

    sget-object v4, Lcom/opera/android/browser/Referrer$Policy;->ORIGIN_WHEN_CROSSORIGIN:Lcom/opera/android/browser/Referrer$Policy;

    sget-object v5, Lcom/opera/android/browser/Referrer$Policy;->NO_REFERRER_WHEN_DOWNGRADE:Lcom/opera/android/browser/Referrer$Policy;

    sget-object v6, Lcom/opera/android/browser/Referrer$Policy;->STRICT_ORIGIN_WHEN_CROSSORIGIN:Lcom/opera/android/browser/Referrer$Policy;

    sget-object v7, Lcom/opera/android/browser/Referrer$Policy;->SAME_ORIGIN:Lcom/opera/android/browser/Referrer$Policy;

    sget-object v8, Lcom/opera/android/browser/Referrer$Policy;->STRICT_ORIGIN:Lcom/opera/android/browser/Referrer$Policy;

    filled-new-array/range {v0 .. v8}, [Lcom/opera/android/browser/Referrer$Policy;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lcom/opera/android/browser/Referrer$Policy;

    const-string v1, "ALWAYS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/opera/android/browser/Referrer$Policy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/opera/android/browser/Referrer$Policy;->ALWAYS:Lcom/opera/android/browser/Referrer$Policy;

    new-instance v0, Lcom/opera/android/browser/Referrer$Policy;

    const-string v1, "DEFAULT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/opera/android/browser/Referrer$Policy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/opera/android/browser/Referrer$Policy;->DEFAULT:Lcom/opera/android/browser/Referrer$Policy;

    new-instance v0, Lcom/opera/android/browser/Referrer$Policy;

    const-string v1, "NEVER"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/opera/android/browser/Referrer$Policy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/opera/android/browser/Referrer$Policy;->NEVER:Lcom/opera/android/browser/Referrer$Policy;

    new-instance v0, Lcom/opera/android/browser/Referrer$Policy;

    const-string v1, "ORIGIN"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/opera/android/browser/Referrer$Policy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/opera/android/browser/Referrer$Policy;->ORIGIN:Lcom/opera/android/browser/Referrer$Policy;

    new-instance v0, Lcom/opera/android/browser/Referrer$Policy;

    const-string v1, "ORIGIN_WHEN_CROSSORIGIN"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/opera/android/browser/Referrer$Policy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/opera/android/browser/Referrer$Policy;->ORIGIN_WHEN_CROSSORIGIN:Lcom/opera/android/browser/Referrer$Policy;

    new-instance v0, Lcom/opera/android/browser/Referrer$Policy;

    const-string v1, "NO_REFERRER_WHEN_DOWNGRADE"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/opera/android/browser/Referrer$Policy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/opera/android/browser/Referrer$Policy;->NO_REFERRER_WHEN_DOWNGRADE:Lcom/opera/android/browser/Referrer$Policy;

    new-instance v0, Lcom/opera/android/browser/Referrer$Policy;

    const-string v1, "STRICT_ORIGIN_WHEN_CROSSORIGIN"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/opera/android/browser/Referrer$Policy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/opera/android/browser/Referrer$Policy;->STRICT_ORIGIN_WHEN_CROSSORIGIN:Lcom/opera/android/browser/Referrer$Policy;

    new-instance v0, Lcom/opera/android/browser/Referrer$Policy;

    const-string v1, "SAME_ORIGIN"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/opera/android/browser/Referrer$Policy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/opera/android/browser/Referrer$Policy;->SAME_ORIGIN:Lcom/opera/android/browser/Referrer$Policy;

    new-instance v0, Lcom/opera/android/browser/Referrer$Policy;

    const-string v1, "STRICT_ORIGIN"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/opera/android/browser/Referrer$Policy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/opera/android/browser/Referrer$Policy;->STRICT_ORIGIN:Lcom/opera/android/browser/Referrer$Policy;

    invoke-static {}, Lcom/opera/android/browser/Referrer$Policy;->$values()[Lcom/opera/android/browser/Referrer$Policy;

    move-result-object v0

    sput-object v0, Lcom/opera/android/browser/Referrer$Policy;->$VALUES:[Lcom/opera/android/browser/Referrer$Policy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/opera/android/browser/Referrer$Policy;
    .registers 2

    const-class v0, Lcom/opera/android/browser/Referrer$Policy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/opera/android/browser/Referrer$Policy;

    return-object p0
.end method

.method public static values()[Lcom/opera/android/browser/Referrer$Policy;
    .registers 1

    sget-object v0, Lcom/opera/android/browser/Referrer$Policy;->$VALUES:[Lcom/opera/android/browser/Referrer$Policy;

    invoke-virtual {v0}, [Lcom/opera/android/browser/Referrer$Policy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/opera/android/browser/Referrer$Policy;

    return-object v0
.end method
