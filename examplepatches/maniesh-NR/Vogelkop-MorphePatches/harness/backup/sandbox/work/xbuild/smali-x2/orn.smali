.class public final enum Lorn;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lorn;

.field public static final enum c:Lorn;

.field public static final enum d:Lorn;

.field public static final enum e:Lorn;

.field public static final enum f:Lorn;

.field public static final enum g:Lorn;

.field public static final enum h:Lorn;

.field public static final synthetic i:[Lorn;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 12

    new-instance v0, Lorn;

    const/4 v1, 0x0

    const-string v2, "text"

    const-string v3, "TEXT"

    invoke-direct {v0, v3, v1, v2}, Lorn;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorn;->b:Lorn;

    new-instance v1, Lorn;

    const/4 v2, 0x1

    const-string v3, "voice"

    const-string v4, "VOICE"

    invoke-direct {v1, v4, v2, v3}, Lorn;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Lorn;

    const/4 v3, 0x2

    const-string v4, "prompt_summarize"

    const-string v5, "PROMPT_SUMMARIZE"

    invoke-direct {v2, v5, v3, v4}, Lorn;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lorn;->c:Lorn;

    new-instance v3, Lorn;

    const/4 v4, 0x3

    const-string v5, "prompt_tell_me_more"

    const-string v6, "PROMPT_TELL_ME_MORE"

    invoke-direct {v3, v6, v4, v5}, Lorn;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lorn;->d:Lorn;

    new-instance v4, Lorn;

    const/4 v5, 0x4

    const-string v6, "conversation_chip"

    const-string v7, "CONVERSATION_CHIP"

    invoke-direct {v4, v7, v5, v6}, Lorn;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v4, Lorn;->e:Lorn;

    new-instance v5, Lorn;

    const/4 v6, 0x5

    const-string v7, "text_with_file"

    const-string v8, "TEXT_WITH_FILE"

    invoke-direct {v5, v8, v6, v7}, Lorn;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Lorn;->f:Lorn;

    new-instance v6, Lorn;

    const/4 v7, 0x6

    const-string v8, "voice_with_file"

    const-string v9, "VOICE_WITH_FILE"

    invoke-direct {v6, v9, v7, v8}, Lorn;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v7, Lorn;

    const/4 v8, 0x7

    const-string v9, "explain_image"

    const-string v10, "EXPLAIN_IMAGE"

    invoke-direct {v7, v10, v8, v9}, Lorn;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v7, Lorn;->g:Lorn;

    new-instance v8, Lorn;

    const/16 v9, 0x8

    const-string v10, "conversation_chip_image"

    const-string v11, "CONVERSATION_CHIP_IMAGE"

    invoke-direct {v8, v11, v9, v10}, Lorn;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v8, Lorn;->h:Lorn;

    filled-new-array/range {v0 .. v8}, [Lorn;

    move-result-object v0

    sput-object v0, Lorn;->i:[Lorn;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lorn;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorn;
    .registers 2

    const-class v0, Lorn;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorn;

    return-object p0
.end method

.method public static values()[Lorn;
    .registers 1

    sget-object v0, Lorn;->i:[Lorn;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorn;

    return-object v0
.end method
