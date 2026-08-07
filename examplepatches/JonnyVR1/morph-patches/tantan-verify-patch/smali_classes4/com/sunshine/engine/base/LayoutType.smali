.class public final enum Lcom/sunshine/engine/base/LayoutType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sunshine/engine/base/LayoutType$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sunshine/engine/base/LayoutType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sunshine/engine/base/LayoutType;

.field public static final enum bottom:Lcom/sunshine/engine/base/LayoutType;

.field public static final enum center:Lcom/sunshine/engine/base/LayoutType;

.field public static final enum match_height:Lcom/sunshine/engine/base/LayoutType;

.field public static final enum top:Lcom/sunshine/engine/base/LayoutType;


# instance fields
.field private final callback:Lcom/sunshine/engine/base/LayoutType$a;

.field private final text:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lcom/sunshine/engine/base/LayoutType;

    .line 2
    .line 3
    new-instance v1, Lcom/sunshine/engine/base/n;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/sunshine/engine/base/n;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "center"

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    invoke-direct {v0, v2, v3, v2, v1}, Lcom/sunshine/engine/base/LayoutType;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/sunshine/engine/base/LayoutType$a;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/sunshine/engine/base/LayoutType;->center:Lcom/sunshine/engine/base/LayoutType;

    .line 15
    .line 16
    new-instance v1, Lcom/sunshine/engine/base/LayoutType;

    .line 17
    .line 18
    new-instance v2, Lcom/sunshine/engine/base/o;

    .line 19
    .line 20
    invoke-direct {v2}, Lcom/sunshine/engine/base/o;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v3, "top"

    .line 24
    .line 25
    const/4 v4, 0x1

    .line 26
    invoke-direct {v1, v3, v4, v3, v2}, Lcom/sunshine/engine/base/LayoutType;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/sunshine/engine/base/LayoutType$a;)V

    .line 27
    .line 28
    .line 29
    sput-object v1, Lcom/sunshine/engine/base/LayoutType;->top:Lcom/sunshine/engine/base/LayoutType;

    .line 30
    .line 31
    new-instance v2, Lcom/sunshine/engine/base/LayoutType;

    .line 32
    .line 33
    new-instance v3, Lcom/sunshine/engine/base/p;

    .line 34
    .line 35
    invoke-direct {v3}, Lcom/sunshine/engine/base/p;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string v4, "bottom"

    .line 39
    .line 40
    const/4 v5, 0x2

    .line 41
    invoke-direct {v2, v4, v5, v4, v3}, Lcom/sunshine/engine/base/LayoutType;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/sunshine/engine/base/LayoutType$a;)V

    .line 42
    .line 43
    .line 44
    sput-object v2, Lcom/sunshine/engine/base/LayoutType;->bottom:Lcom/sunshine/engine/base/LayoutType;

    .line 45
    .line 46
    new-instance v3, Lcom/sunshine/engine/base/LayoutType;

    .line 47
    .line 48
    new-instance v4, Lcom/sunshine/engine/base/q;

    .line 49
    .line 50
    invoke-direct {v4}, Lcom/sunshine/engine/base/q;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v5, "match_height"

    .line 54
    .line 55
    const/4 v6, 0x3

    .line 56
    invoke-direct {v3, v5, v6, v5, v4}, Lcom/sunshine/engine/base/LayoutType;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/sunshine/engine/base/LayoutType$a;)V

    .line 57
    .line 58
    .line 59
    sput-object v3, Lcom/sunshine/engine/base/LayoutType;->match_height:Lcom/sunshine/engine/base/LayoutType;

    .line 60
    .line 61
    filled-new-array {v0, v1, v2, v3}, [Lcom/sunshine/engine/base/LayoutType;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Lcom/sunshine/engine/base/LayoutType;->$VALUES:[Lcom/sunshine/engine/base/LayoutType;

    .line 66
    .line 67
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Lcom/sunshine/engine/base/LayoutType$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/sunshine/engine/base/LayoutType$a;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/sunshine/engine/base/LayoutType;->text:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p4, p0, Lcom/sunshine/engine/base/LayoutType;->callback:Lcom/sunshine/engine/base/LayoutType$a;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/sunshine/engine/base/a;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->j:Ll/fz0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/sunshine/engine/base/a;->i:Ll/fz0;

    .line 4
    .line 5
    iget v1, p0, Ll/fz0;->g:I

    .line 6
    .line 7
    iget v2, v0, Ll/fz0;->g:I

    .line 8
    .line 9
    sub-int/2addr v1, v2

    .line 10
    iget p0, p0, Ll/fz0;->d:I

    .line 11
    .line 12
    add-int/2addr v1, p0

    .line 13
    iput v1, v0, Ll/fz0;->d:I

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic b(Lcom/sunshine/engine/base/a;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->i:Ll/fz0;

    .line 2
    .line 3
    iget v0, v0, Ll/fz0;->g:I

    .line 4
    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    mul-float/2addr v0, v1

    .line 9
    iget-object v1, p0, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 10
    .line 11
    iget-object v1, v1, Ll/drf0;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v1, Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    int-to-float v1, v1

    .line 20
    div-float/2addr v0, v1

    .line 21
    iput v0, p0, Lcom/sunshine/engine/base/a;->g:F

    .line 22
    .line 23
    iget-object v1, p0, Lcom/sunshine/engine/base/a;->j:Ll/fz0;

    .line 24
    .line 25
    iget-object v2, p0, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 26
    .line 27
    iget-object v2, v2, Ll/drf0;->a:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v2, Ljava/lang/Integer;

    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    int-to-float v2, v2

    .line 36
    mul-float/2addr v0, v2

    .line 37
    float-to-int v0, v0

    .line 38
    iput v0, v1, Ll/fz0;->f:I

    .line 39
    .line 40
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->j:Ll/fz0;

    .line 41
    .line 42
    iget v1, p0, Lcom/sunshine/engine/base/a;->g:F

    .line 43
    .line 44
    iget-object v2, p0, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 45
    .line 46
    iget-object v2, v2, Ll/drf0;->b:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v2, Ljava/lang/Integer;

    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    int-to-float v2, v2

    .line 55
    mul-float/2addr v1, v2

    .line 56
    float-to-int v1, v1

    .line 57
    iput v1, v0, Ll/fz0;->g:I

    .line 58
    .line 59
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->j:Ll/fz0;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/sunshine/engine/base/a;->i:Ll/fz0;

    .line 62
    .line 63
    iget v1, p0, Ll/fz0;->f:I

    .line 64
    .line 65
    iget v2, v0, Ll/fz0;->f:I

    .line 66
    .line 67
    sub-int/2addr v1, v2

    .line 68
    div-int/lit8 v1, v1, 0x2

    .line 69
    .line 70
    iget v2, p0, Ll/fz0;->b:I

    .line 71
    .line 72
    add-int/2addr v1, v2

    .line 73
    iput v1, v0, Ll/fz0;->b:I

    .line 74
    .line 75
    iget p0, p0, Ll/fz0;->d:I

    .line 76
    .line 77
    iput p0, v0, Ll/fz0;->d:I

    .line 78
    .line 79
    return-void
.end method

.method public static synthetic f(Lcom/sunshine/engine/base/a;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->j:Ll/fz0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/sunshine/engine/base/a;->i:Ll/fz0;

    .line 4
    .line 5
    iget v1, p0, Ll/fz0;->g:I

    .line 6
    .line 7
    iget v2, v0, Ll/fz0;->g:I

    .line 8
    .line 9
    sub-int/2addr v1, v2

    .line 10
    div-int/lit8 v1, v1, 0x2

    .line 11
    .line 12
    iget p0, p0, Ll/fz0;->d:I

    .line 13
    .line 14
    add-int/2addr v1, p0

    .line 15
    iput v1, v0, Ll/fz0;->d:I

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic g(Lcom/sunshine/engine/base/a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->j:Ll/fz0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/sunshine/engine/base/a;->i:Ll/fz0;

    .line 4
    .line 5
    iget p0, p0, Ll/fz0;->d:I

    .line 6
    .line 7
    iput p0, v0, Ll/fz0;->d:I

    .line 8
    .line 9
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sunshine/engine/base/LayoutType;
    .locals 1

    .line 1
    const-class v0, Lcom/sunshine/engine/base/LayoutType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/sunshine/engine/base/LayoutType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/sunshine/engine/base/LayoutType;
    .locals 1

    .line 1
    sget-object v0, Lcom/sunshine/engine/base/LayoutType;->$VALUES:[Lcom/sunshine/engine/base/LayoutType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/sunshine/engine/base/LayoutType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/sunshine/engine/base/LayoutType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public resize(Lcom/sunshine/engine/base/a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sunshine/engine/base/LayoutType;->callback:Lcom/sunshine/engine/base/LayoutType$a;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/sunshine/engine/base/LayoutType$a;->a(Lcom/sunshine/engine/base/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sunshine/engine/base/LayoutType;->text:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
