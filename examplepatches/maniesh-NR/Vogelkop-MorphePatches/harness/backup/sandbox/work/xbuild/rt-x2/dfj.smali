.class public final enum Ldfj;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Ldfj;",
        ">;"
    }
.end annotation

.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lcfj;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Ll4c;

.field public static final enum b:Ldfj;

.field public static final enum c:Ldfj;

.field public static final enum d:Ldfj;

.field public static final enum e:Ldfj;

.field public static final enum f:Ldfj;

.field public static final enum g:Ldfj;

.field public static final synthetic h:[Ldfj;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Ldfj;

    const-string v1, "IN_PROGRESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ldfj;->b:Ldfj;

    new-instance v1, Ldfj;

    const-string v2, "FINISHED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ldfj;->c:Ldfj;

    new-instance v2, Ldfj;

    const-string v3, "ERROR_PROCESSING"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Ldfj;->d:Ldfj;

    new-instance v3, Ldfj;

    const-string v4, "ERROR_TOO_LONG"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Ldfj;->e:Ldfj;

    new-instance v4, Ldfj;

    const-string v5, "ERROR_NOT_SUPPORTED"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Ldfj;->f:Ldfj;

    new-instance v5, Ldfj;

    const-string v6, "ERROR_MIME_DOES_NOT_MATCH"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Ldfj;->g:Ldfj;

    filled-new-array/range {v0 .. v5}, [Ldfj;

    move-result-object v0

    sput-object v0, Ldfj;->h:[Ldfj;

    new-instance v0, Lh58;

    new-instance v0, Lcfj;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ldfj;->Companion:Lcfj;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lgzh;

    const/16 v2, 0x18

    invoke-direct {v1, v2}, Lgzh;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    sput-object v0, Ldfj;->a:Ll4c;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ldfj;
    .registers 2

    const-class v0, Ldfj;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ldfj;

    return-object p0
.end method

.method public static values()[Ldfj;
    .registers 1

    sget-object v0, Ldfj;->h:[Ldfj;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ldfj;

    return-object v0
.end method
