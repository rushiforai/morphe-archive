.class public Ll/ag60;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final m:Ljava/lang/String;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/ag60;->m:Ljava/lang/String;

    .line 12
    .line 13
    return-void

    .line 14
    nop

    .line 15
    :array_0
    .array-data 1
        0x6t
        0x50t
        0x7t
        0x1t
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/ag60;->a:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Ll/ag60;->b:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v0, p0, Ll/ag60;->c:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Ll/ag60;->d:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v0, p0, Ll/ag60;->e:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v0, p0, Ll/ag60;->f:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v0, p0, Ll/ag60;->g:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v0, p0, Ll/ag60;->h:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v0, p0, Ll/ag60;->i:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v0, p0, Ll/ag60;->j:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v0, p0, Ll/ag60;->k:Ljava/lang/String;

    .line 26
    .line 27
    invoke-direct {p0, p1}, Ll/ag60;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Ll/ag60;->a:Ljava/lang/String;

    .line 32
    .line 33
    invoke-direct {p0, p2}, Ll/ag60;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Ll/ag60;->b:Ljava/lang/String;

    .line 38
    .line 39
    invoke-direct {p0, p3}, Ll/ag60;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Ll/ag60;->c:Ljava/lang/String;

    .line 44
    .line 45
    invoke-direct {p0, p4}, Ll/ag60;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Ll/ag60;->d:Ljava/lang/String;

    .line 50
    .line 51
    invoke-direct {p0, p5}, Ll/ag60;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Ll/ag60;->e:Ljava/lang/String;

    .line 56
    .line 57
    invoke-direct {p0, p6}, Ll/ag60;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iput-object p1, p0, Ll/ag60;->f:Ljava/lang/String;

    .line 62
    .line 63
    invoke-direct {p0, p7}, Ll/ag60;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iput-object p1, p0, Ll/ag60;->g:Ljava/lang/String;

    .line 68
    .line 69
    iput-wide p8, p0, Ll/ag60;->l:J

    .line 70
    .line 71
    return-void
.end method

.method private a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/ag60;->m:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    return-object p1
.end method


# virtual methods
.method public b(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ag60;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public c(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ag60;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ag60;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public e(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ag60;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
