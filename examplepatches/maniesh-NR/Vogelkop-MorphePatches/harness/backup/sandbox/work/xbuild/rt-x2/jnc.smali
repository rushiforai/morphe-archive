.class public final enum Ljnc;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Ljnc;",
        ">;"
    }
.end annotation

.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Linc;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Ll4c;

.field public static final enum b:Ljnc;

.field public static final enum c:Ljnc;

.field public static final enum d:Ljnc;

.field public static final enum e:Ljnc;

.field public static final enum f:Ljnc;

.field public static final synthetic g:[Ljnc;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Ljnc;

    const-string v1, "NOT_STARTED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljnc;->b:Ljnc;

    new-instance v1, Ljnc;

    const-string v2, "IN_PROGRESS"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ljnc;->c:Ljnc;

    new-instance v2, Ljnc;

    const-string v3, "FINISHED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Ljnc;->d:Ljnc;

    new-instance v3, Ljnc;

    const-string v4, "CANCELLED"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Ljnc;->e:Ljnc;

    new-instance v4, Ljnc;

    const-string v5, "DELAYED"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v5, Ljnc;

    const-string v6, "INTERRUPTED"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Ljnc;->f:Ljnc;

    new-instance v6, Ljnc;

    const-string v7, "DELETED"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array/range {v0 .. v6}, [Ljnc;

    move-result-object v0

    sput-object v0, Ljnc;->g:[Ljnc;

    new-instance v0, Lh58;

    new-instance v0, Linc;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ljnc;->Companion:Linc;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lfza;

    const/16 v2, 0x12

    invoke-direct {v1, v2}, Lfza;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    sput-object v0, Ljnc;->a:Ll4c;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ljnc;
    .registers 2

    const-class v0, Ljnc;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ljnc;

    return-object p0
.end method

.method public static values()[Ljnc;
    .registers 1

    sget-object v0, Ljnc;->g:[Ljnc;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljnc;

    return-object v0
.end method
