.class final enum Lcom/google/common/base/Functions$IdentityFunction;
.super Ljava/lang/Enum;
.source "Functions.java"

# interfaces
.implements Lcom/google/common/base/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/Functions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "IdentityFunction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/common/base/Functions$IdentityFunction;",
        ">;",
        "Lcom/google/common/base/Function<",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/common/base/Functions$IdentityFunction;

.field public static final enum INSTANCE:Lcom/google/common/base/Functions$IdentityFunction;


# direct methods
.method private static synthetic $values()[Lcom/google/common/base/Functions$IdentityFunction;
    .registers 1

    .line 100
    sget-object v0, Lcom/google/common/base/Functions$IdentityFunction;->INSTANCE:Lcom/google/common/base/Functions$IdentityFunction;

    filled-new-array {v0}, [Lcom/google/common/base/Functions$IdentityFunction;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 101
    new-instance v0, Lcom/google/common/base/Functions$IdentityFunction;

    const-string v1, "INSTANCE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/common/base/Functions$IdentityFunction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/base/Functions$IdentityFunction;->INSTANCE:Lcom/google/common/base/Functions$IdentityFunction;

    .line 100
    invoke-static {}, Lcom/google/common/base/Functions$IdentityFunction;->$values()[Lcom/google/common/base/Functions$IdentityFunction;

    move-result-object v0

    sput-object v0, Lcom/google/common/base/Functions$IdentityFunction;->$VALUES:[Lcom/google/common/base/Functions$IdentityFunction;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "$enum$name",
            "$enum$ordinal"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 100
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/common/base/Functions$IdentityFunction;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 100
    const-class v0, Lcom/google/common/base/Functions$IdentityFunction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/common/base/Functions$IdentityFunction;

    return-object p0
.end method

.method public static values()[Lcom/google/common/base/Functions$IdentityFunction;
    .registers 1

    .line 100
    sget-object v0, Lcom/google/common/base/Functions$IdentityFunction;->$VALUES:[Lcom/google/common/base/Functions$IdentityFunction;

    invoke-virtual {v0}, [Lcom/google/common/base/Functions$IdentityFunction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/common/base/Functions$IdentityFunction;

    return-object v0
.end method


# virtual methods
.method public apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 110
    const-string p0, "Functions.identity()"

    return-object p0
.end method
