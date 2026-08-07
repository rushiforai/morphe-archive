.class public Ll/th50;
.super Ll/xi5;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/th50$a;
    }
.end annotation


# instance fields
.field public a:Ll/jxd0;

.field public b:Ll/wyd0;

.field public c:Ll/th50$a;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/xi5;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jxd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "haveLoadConfigFromNet_V1"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 14
    .line 15
    invoke-interface {v2}, Ll/bn5;->userId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/th50;->a:Ll/jxd0;

    .line 32
    .line 33
    new-instance v0, Ll/wyd0;

    .line 34
    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v2, "haveLoadVersion_V1"

    .line 38
    .line 39
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 43
    .line 44
    invoke-interface {v2}, Ll/bn5;->userId()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-string v2, ""

    .line 56
    .line 57
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Ll/th50;->b:Ll/wyd0;

    .line 61
    .line 62
    new-instance v0, Ll/th50$a;

    .line 63
    .line 64
    const-string v1, "oms_data"

    .line 65
    .line 66
    const-string v2, "_v8"

    .line 67
    .line 68
    const-string v3, "3.1.0"

    .line 69
    .line 70
    invoke-direct {v0, v3, v1, v2}, Ll/th50$a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Ll/th50;->c:Ll/th50$a;

    .line 74
    .line 75
    return-void
.end method

.method public static bridge synthetic x(Ll/th50;)Ll/jxd0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/th50;->a:Ll/jxd0;

    return-object p0
.end method

.method public static bridge synthetic y(Ll/th50;)Ll/wyd0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/th50;->b:Ll/wyd0;

    return-object p0
.end method


# virtual methods
.method public z()Ll/th50$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/th50;->c:Ll/th50$a;

    .line 2
    .line 3
    return-object p0
.end method
