.class public Ll/vg50;
.super Ll/jr2;
.source "SourceFile"


# static fields
.field private static c:Ll/vg50;


# instance fields
.field private b:Ll/epf0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/vg50;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vg50;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/vg50;->c:Ll/vg50;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jr2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/dqd;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/dqd;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/vg50;->b:Ll/epf0;

    .line 10
    .line 11
    return-void
.end method

.method public static g()Ll/vg50;
    .locals 1

    .line 1
    sget-object v0, Ll/vg50;->c:Ll/vg50;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/String;Ll/h2d0;Ll/x1d0;)Ll/ry3;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Ll/x1d0;->k()Ll/rnl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/rnl;->m()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/rnl;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p2, v0}, Ll/h2d0;->e(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, v1}, Ll/h2d0;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/vg50;->b()Ll/epf0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, v1}, Ll/epf0;->d(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    if-eqz p2, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/vg50;->b()Ll/epf0;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0, v1}, Ll/epf0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p2, v0}, Ll/h2d0;->c(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    new-instance v2, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v3, "host: "

    .line 47
    .line 48
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, " -> "

    .line 55
    .line 56
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v1, "OkHttpRequestBuilder"

    .line 67
    .line 68
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 69
    .line 70
    .line 71
    :cond_1
    invoke-super {p0, p1, p2, p3}, Ll/jr2;->a(Ljava/lang/String;Ll/h2d0;Ll/x1d0;)Ll/ry3;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0
.end method

.method public b()Ll/epf0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vg50;->b:Ll/epf0;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vg50;->b()Ll/epf0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/epf0;->a(Ljava/lang/String;Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
