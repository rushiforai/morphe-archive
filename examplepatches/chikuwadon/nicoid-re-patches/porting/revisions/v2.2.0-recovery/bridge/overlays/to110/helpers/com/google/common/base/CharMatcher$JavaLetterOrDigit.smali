.class final Lcom/google/common/base/CharMatcher$JavaLetterOrDigit;
.super Lcom/google/common/base/CharMatcher;
.source "CharMatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/CharMatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "JavaLetterOrDigit"
.end annotation


# static fields
.field static final INSTANCE:Lcom/google/common/base/CharMatcher;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 1405
    new-instance v0, Lcom/google/common/base/CharMatcher$JavaLetterOrDigit;

    invoke-direct {v0}, Lcom/google/common/base/CharMatcher$JavaLetterOrDigit;-><init>()V

    sput-object v0, Lcom/google/common/base/CharMatcher$JavaLetterOrDigit;->INSTANCE:Lcom/google/common/base/CharMatcher;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 1403
    invoke-direct {p0}, Lcom/google/common/base/CharMatcher;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "character"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1403
    check-cast p1, Ljava/lang/Character;

    invoke-super {p0, p1}, Lcom/google/common/base/CharMatcher;->apply(Ljava/lang/Character;)Z

    move-result p0

    return p0
.end method

.method public matches(C)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "c"
        }
    .end annotation

    .line 1409
    invoke-static {p1}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 1414
    const-string p0, "CharMatcher.javaLetterOrDigit()"

    return-object p0
.end method
