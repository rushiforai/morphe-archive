.class public final enum Lcom/hellogroup/mk/core/log/core/MKLogSource;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/hellogroup/mk/core/log/core/MKLogSource;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0008\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u0011\u0010\u0005\u001a\u00020\u00068F\u00a2\u0006\u0006\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nj\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/hellogroup/mk/core/log/core/MKLogSource;",
        "",
        "value",
        "",
        "(Ljava/lang/String;II)V",
        "stringValue",
        "",
        "getStringValue",
        "()Ljava/lang/String;",
        "getValue",
        "()I",
        "NATIVE",
        "JS",
        "MWC",
        "MKCore_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/hellogroup/mk/core/log/core/MKLogSource;

.field public static final enum JS:Lcom/hellogroup/mk/core/log/core/MKLogSource;

.field public static final enum MWC:Lcom/hellogroup/mk/core/log/core/MKLogSource;

.field public static final enum NATIVE:Lcom/hellogroup/mk/core/log/core/MKLogSource;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/hellogroup/mk/core/log/core/MKLogSource;

    .line 2
    .line 3
    const-string v1, "NATIVE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/hellogroup/mk/core/log/core/MKLogSource;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/hellogroup/mk/core/log/core/MKLogSource;->NATIVE:Lcom/hellogroup/mk/core/log/core/MKLogSource;

    .line 10
    .line 11
    new-instance v1, Lcom/hellogroup/mk/core/log/core/MKLogSource;

    .line 12
    .line 13
    const-string v2, "JS"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/hellogroup/mk/core/log/core/MKLogSource;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/hellogroup/mk/core/log/core/MKLogSource;->JS:Lcom/hellogroup/mk/core/log/core/MKLogSource;

    .line 20
    .line 21
    new-instance v2, Lcom/hellogroup/mk/core/log/core/MKLogSource;

    .line 22
    .line 23
    const-string v3, "MWC"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/hellogroup/mk/core/log/core/MKLogSource;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/hellogroup/mk/core/log/core/MKLogSource;->MWC:Lcom/hellogroup/mk/core/log/core/MKLogSource;

    .line 30
    .line 31
    filled-new-array {v0, v1, v2}, [Lcom/hellogroup/mk/core/log/core/MKLogSource;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcom/hellogroup/mk/core/log/core/MKLogSource;->$VALUES:[Lcom/hellogroup/mk/core/log/core/MKLogSource;

    .line 36
    .line 37
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/hellogroup/mk/core/log/core/MKLogSource;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/hellogroup/mk/core/log/core/MKLogSource;
    .locals 1

    const-class v0, Lcom/hellogroup/mk/core/log/core/MKLogSource;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/mk/core/log/core/MKLogSource;

    return-object p0
.end method

.method public static values()[Lcom/hellogroup/mk/core/log/core/MKLogSource;
    .locals 1

    sget-object v0, Lcom/hellogroup/mk/core/log/core/MKLogSource;->$VALUES:[Lcom/hellogroup/mk/core/log/core/MKLogSource;

    invoke-virtual {v0}, [Lcom/hellogroup/mk/core/log/core/MKLogSource;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/hellogroup/mk/core/log/core/MKLogSource;

    return-object v0
.end method


# virtual methods
.method public final getStringValue()Ljava/lang/String;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Ll/qkw;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-ne p0, v0, :cond_0

    .line 17
    .line 18
    const-string p0, "mwc"

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-static {}, Ll/nbr;->a()V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0

    .line 26
    :cond_1
    const-string p0, "js"

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_2
    const-string p0, "native"

    .line 30
    .line 31
    return-object p0
.end method

.method public final getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/hellogroup/mk/core/log/core/MKLogSource;->value:I

    .line 2
    .line 3
    return p0
.end method
