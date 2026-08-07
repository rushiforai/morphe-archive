.class public Ll/vow$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field private final a:Ll/qow;

.field private b:I

.field private c:I

.field private d:I

.field private e:Z

.field private f:I

.field private g:Ljava/lang/String;

.field private h:Lcom/mm/mediasdk/RecorderConstants$RenderModelType;

.field private i:I


# direct methods
.method public constructor <init>(Ll/qow;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/vow$b;->b:I

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    iput v1, p0, Ll/vow$b;->c:I

    .line 9
    .line 10
    iput v0, p0, Ll/vow$b;->d:I

    .line 11
    .line 12
    iput-boolean v0, p0, Ll/vow$b;->e:Z

    .line 13
    .line 14
    iput v0, p0, Ll/vow$b;->f:I

    .line 15
    .line 16
    const-string v1, "face240"

    .line 17
    .line 18
    iput-object v1, p0, Ll/vow$b;->g:Ljava/lang/String;

    .line 19
    .line 20
    sget-object v1, Lcom/mm/mediasdk/RecorderConstants$RenderModelType;->JAVA_FILTER_BEAUTY_JAVA_3DRENDING:Lcom/mm/mediasdk/RecorderConstants$RenderModelType;

    .line 21
    .line 22
    iput-object v1, p0, Ll/vow$b;->h:Lcom/mm/mediasdk/RecorderConstants$RenderModelType;

    .line 23
    .line 24
    iput v0, p0, Ll/vow$b;->i:I

    .line 25
    .line 26
    iput-object p1, p0, Ll/vow$b;->a:Ll/qow;

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic a(Ll/vow$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/vow$b;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ll/vow$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/vow$b;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Ll/vow$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/vow$b;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d(Ll/vow$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/vow$b;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Ll/vow$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/vow$b;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Ll/vow$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vow$b;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Ll/vow$b;)Lcom/mm/mediasdk/RecorderConstants$RenderModelType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vow$b;->h:Lcom/mm/mediasdk/RecorderConstants$RenderModelType;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Ll/vow$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/vow$b;->i:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public i()Ll/vow;
    .locals 3

    .line 1
    new-instance v0, Ll/vow;

    .line 2
    .line 3
    iget-object v1, p0, Ll/vow$b;->a:Ll/qow;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, p0, v2}, Ll/vow;-><init>(Ll/qow;Ll/vow$b;Ll/vow$a;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method
