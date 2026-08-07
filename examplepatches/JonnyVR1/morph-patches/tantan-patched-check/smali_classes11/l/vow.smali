.class public Ll/vow;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/vow$b;
    }
.end annotation


# instance fields
.field private final a:Ll/qow;

.field private final b:I

.field private final c:I

.field private final d:I

.field private e:Z

.field private final f:Z

.field private g:Ljava/lang/String;

.field private h:Lcom/mm/mediasdk/RecorderConstants$RenderModelType;

.field private i:I


# direct methods
.method private constructor <init>(Ll/qow;Ll/vow$b;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/vow;->e:Z

    .line 6
    .line 7
    const-string v1, "default"

    .line 8
    .line 9
    iput-object v1, p0, Ll/vow;->g:Ljava/lang/String;

    .line 10
    .line 11
    sget-object v1, Lcom/mm/mediasdk/RecorderConstants$RenderModelType;->JAVA_FILTER_BEAUTY_JAVA_3DRENDING:Lcom/mm/mediasdk/RecorderConstants$RenderModelType;

    .line 12
    .line 13
    iput-object v1, p0, Ll/vow;->h:Lcom/mm/mediasdk/RecorderConstants$RenderModelType;

    .line 14
    .line 15
    iput-object p1, p0, Ll/vow;->a:Ll/qow;

    .line 16
    .line 17
    invoke-static {p2}, Ll/vow$b;->a(Ll/vow$b;)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput p1, p0, Ll/vow;->b:I

    .line 22
    .line 23
    invoke-static {p2}, Ll/vow$b;->b(Ll/vow$b;)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iput p1, p0, Ll/vow;->c:I

    .line 28
    .line 29
    invoke-static {p2}, Ll/vow$b;->c(Ll/vow$b;)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput p1, p0, Ll/vow;->d:I

    .line 34
    .line 35
    invoke-static {p2}, Ll/vow$b;->d(Ll/vow$b;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iput-boolean p1, p0, Ll/vow;->e:Z

    .line 40
    .line 41
    invoke-static {p2}, Ll/vow$b;->e(Ll/vow$b;)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_0

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    :cond_0
    iput-boolean v0, p0, Ll/vow;->f:Z

    .line 49
    .line 50
    invoke-static {p2}, Ll/vow$b;->f(Ll/vow$b;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iput-object p1, p0, Ll/vow;->g:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {p2}, Ll/vow$b;->g(Ll/vow$b;)Lcom/mm/mediasdk/RecorderConstants$RenderModelType;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iput-object p1, p0, Ll/vow;->h:Lcom/mm/mediasdk/RecorderConstants$RenderModelType;

    .line 61
    .line 62
    invoke-static {p2}, Ll/vow$b;->h(Ll/vow$b;)I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    iput p1, p0, Ll/vow;->i:I

    .line 67
    .line 68
    return-void
.end method

.method public synthetic constructor <init>(Ll/qow;Ll/vow$b;Ll/vow$a;)V
    .locals 0

    .line 69
    invoke-direct {p0, p1, p2}, Ll/vow;-><init>(Ll/qow;Ll/vow$b;)V

    return-void
.end method


# virtual methods
.method public a()Ll/qow;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vow;->a:Ll/qow;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/vow;->e:Z

    .line 2
    .line 3
    return p0
.end method
