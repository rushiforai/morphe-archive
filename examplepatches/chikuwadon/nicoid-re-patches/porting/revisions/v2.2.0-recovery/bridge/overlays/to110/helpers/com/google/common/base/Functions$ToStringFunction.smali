.class final enum Lcom/google/common/base/Functions$ToStringFunction;
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
    name = "ToStringFunction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/common/base/Functions$ToStringFunction;",
        ">;",
        "Lcom/google/common/base/Function<",
        "Ljava/lang/Object;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/common/base/Functions$ToStringFunction;

.field public static final enum INSTANCE:Lcom/google/common/base/Functions$ToStringFunction;


# direct methods
.method private static synthetic $values()[Lcom/google/common/base/Functions$ToStringFunction;
    .registers 1

    .line 72
    sget-object v0, Lcom/google/common/base/Functions$ToStringFunction;->INSTANCE:Lcom/google/common/base/Functions$ToStringFunction;

    filled-new-array {v0}, [Lcom/google/common/base/Functions$ToStringFunction;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 73
    new-instance v0, Lcom/google/common/base/Functions$ToStringFunction;

    const-string v1, "INSTANCE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/common/base/Functions$ToStringFunction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/base/Functions$ToStringFunction;->INSTANCE:Lcom/google/common/base/Functions$ToStringFunction;

    .line 72
    invoke-static {}, Lcom/google/common/base/Functions$ToStringFunction;->$values()[Lcom/google/common/base/Functions$ToStringFunction;

    move-result-object v0

    sput-object v0, Lcom/google/common/base/Functions$ToStringFunction;->$VALUES:[Lcom/google/common/base/Functions$ToStringFunction;

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

    .line 72
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/common/base/Functions$ToStringFunction;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 72
    const-class v0, Lcom/google/common/base/Functions$ToStringFunction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/common/base/Functions$ToStringFunction;

    return-object p0
.end method

.method public static values()[Lcom/google/common/base/Functions$ToStringFunction;
    .registers 1

    .line 72
    sget-object v0, Lcom/google/common/base/Functions$ToStringFunction;->$VALUES:[Lcom/google/common/base/Functions$ToStringFunction;

    invoke-virtual {v0}, [Lcom/google/common/base/Functions$ToStringFunction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/common/base/Functions$ToStringFunction;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "o"
        }
    .end annotation

    .line 72
    invoke-virtual {p0, p1}, Lcom/google/common/base/Functions$ToStringFunction;->apply(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public apply(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 77
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 83
    const-string p0, "Functions.toStringFunction()"

    return-object p0
.end method
