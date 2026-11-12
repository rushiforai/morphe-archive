.class public final enum Lmsn;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lmsn;

.field public static final enum b:Lmsn;

.field public static final enum c:Lmsn;

.field public static final enum d:Lmsn;

.field public static final enum e:Lmsn;

.field public static final enum f:Lmsn;

.field public static final synthetic g:[Lmsn;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lmsn;

    const-string v1, "SUBMIT_TEXT_DISABLED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lmsn;->a:Lmsn;

    new-instance v1, Lmsn;

    const-string v2, "SUBMIT_TEXT_ENABLED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lmsn;->b:Lmsn;

    new-instance v2, Lmsn;

    const-string v3, "VOICE_INPUT_DISABLED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lmsn;->c:Lmsn;

    new-instance v3, Lmsn;

    const-string v4, "VOICE_INPUT_ENABLED"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lmsn;->d:Lmsn;

    new-instance v4, Lmsn;

    const-string v5, "VOICE_INPUT_ACTIVE"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lmsn;->e:Lmsn;

    new-instance v5, Lmsn;

    const-string v6, "STOP_RESPONSE"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lmsn;->f:Lmsn;

    filled-new-array/range {v0 .. v5}, [Lmsn;

    move-result-object v0

    sput-object v0, Lmsn;->g:[Lmsn;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lmsn;
    .registers 2

    const-class v0, Lmsn;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lmsn;

    return-object p0
.end method

.method public static values()[Lmsn;
    .registers 1

    sget-object v0, Lmsn;->g:[Lmsn;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lmsn;

    return-object v0
.end method
