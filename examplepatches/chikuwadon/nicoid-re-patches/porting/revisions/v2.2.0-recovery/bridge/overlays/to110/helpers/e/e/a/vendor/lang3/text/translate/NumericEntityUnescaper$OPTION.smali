.class public final enum Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;",
        ">;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final synthetic $VALUES:[Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

.field public static final enum errorIfNoSemiColon:Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

.field public static final enum semiColonOptional:Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

.field public static final enum semiColonRequired:Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;


# direct methods
.method private static synthetic $values()[Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;
    .registers 3

    .line 47
    sget-object v0, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;->semiColonRequired:Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    sget-object v1, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;->semiColonOptional:Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    sget-object v2, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;->errorIfNoSemiColon:Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    filled-new-array {v0, v1, v2}, [Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 53
    new-instance v0, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    const-string v1, "semiColonRequired"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;-><init>(Ljava/lang/String;I)V

    sput-object v0, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;->semiColonRequired:Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    .line 58
    new-instance v0, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    const-string v1, "semiColonOptional"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;-><init>(Ljava/lang/String;I)V

    sput-object v0, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;->semiColonOptional:Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    .line 63
    new-instance v0, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    const-string v1, "errorIfNoSemiColon"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;-><init>(Ljava/lang/String;I)V

    sput-object v0, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;->errorIfNoSemiColon:Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    .line 47
    invoke-static {}, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;->$values()[Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    move-result-object v0

    sput-object v0, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;->$VALUES:[Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 48
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;
    .registers 2

    .line 47
    const-class v0, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    return-object p0
.end method

.method public static values()[Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;
    .registers 1

    .line 47
    sget-object v0, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;->$VALUES:[Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    invoke-virtual {v0}, [Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    return-object v0
.end method
