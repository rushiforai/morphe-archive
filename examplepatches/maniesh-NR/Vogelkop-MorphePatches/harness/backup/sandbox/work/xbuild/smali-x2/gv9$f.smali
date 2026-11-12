.class public final enum Lgv9$f;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lgv9;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "f"
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lgv9$f;

.field public static final enum BUILD_MESSAGE_INFO:Lgv9$f;

.field public static final enum GET_DEFAULT_INSTANCE:Lgv9$f;

.field public static final enum GET_MEMOIZED_IS_INITIALIZED:Lgv9$f;

.field public static final enum GET_PARSER:Lgv9$f;

.field public static final enum NEW_BUILDER:Lgv9$f;

.field public static final enum NEW_MUTABLE_INSTANCE:Lgv9$f;

.field public static final enum SET_MEMOIZED_IS_INITIALIZED:Lgv9$f;


# direct methods
.method private static synthetic $values()[Lgv9$f;
    .registers 7

    sget-object v0, Lgv9$f;->GET_MEMOIZED_IS_INITIALIZED:Lgv9$f;

    sget-object v1, Lgv9$f;->SET_MEMOIZED_IS_INITIALIZED:Lgv9$f;

    sget-object v2, Lgv9$f;->BUILD_MESSAGE_INFO:Lgv9$f;

    sget-object v3, Lgv9$f;->NEW_MUTABLE_INSTANCE:Lgv9$f;

    sget-object v4, Lgv9$f;->NEW_BUILDER:Lgv9$f;

    sget-object v5, Lgv9$f;->GET_DEFAULT_INSTANCE:Lgv9$f;

    sget-object v6, Lgv9$f;->GET_PARSER:Lgv9$f;

    filled-new-array/range {v0 .. v6}, [Lgv9$f;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lgv9$f;

    const-string v1, "GET_MEMOIZED_IS_INITIALIZED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lgv9$f;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lgv9$f;->GET_MEMOIZED_IS_INITIALIZED:Lgv9$f;

    new-instance v0, Lgv9$f;

    const-string v1, "SET_MEMOIZED_IS_INITIALIZED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lgv9$f;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lgv9$f;->SET_MEMOIZED_IS_INITIALIZED:Lgv9$f;

    new-instance v0, Lgv9$f;

    const-string v1, "BUILD_MESSAGE_INFO"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lgv9$f;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lgv9$f;->BUILD_MESSAGE_INFO:Lgv9$f;

    new-instance v0, Lgv9$f;

    const-string v1, "NEW_MUTABLE_INSTANCE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lgv9$f;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lgv9$f;->NEW_MUTABLE_INSTANCE:Lgv9$f;

    new-instance v0, Lgv9$f;

    const-string v1, "NEW_BUILDER"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lgv9$f;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lgv9$f;->NEW_BUILDER:Lgv9$f;

    new-instance v0, Lgv9$f;

    const-string v1, "GET_DEFAULT_INSTANCE"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lgv9$f;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lgv9$f;->GET_DEFAULT_INSTANCE:Lgv9$f;

    new-instance v0, Lgv9$f;

    const-string v1, "GET_PARSER"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lgv9$f;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lgv9$f;->GET_PARSER:Lgv9$f;

    invoke-static {}, Lgv9$f;->$values()[Lgv9$f;

    move-result-object v0

    sput-object v0, Lgv9$f;->$VALUES:[Lgv9$f;

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

.method public static valueOf(Ljava/lang/String;)Lgv9$f;
    .registers 2

    const-class v0, Lgv9$f;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lgv9$f;

    return-object p0
.end method

.method public static values()[Lgv9$f;
    .registers 1

    sget-object v0, Lgv9$f;->$VALUES:[Lgv9$f;

    invoke-virtual {v0}, [Lgv9$f;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lgv9$f;

    return-object v0
.end method
