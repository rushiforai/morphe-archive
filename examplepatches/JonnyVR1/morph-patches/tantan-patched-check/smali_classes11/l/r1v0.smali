.class public final Ll/r1v0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ll/n4u0;

.field public c:Ll/n4u0;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/h9s0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ll/n4u0;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-direct {p2, v0}, Ll/n4u0;-><init>(Ll/h9s0;)V

    .line 8
    .line 9
    .line 10
    iput-object p2, p0, Ll/r1v0;->b:Ll/n4u0;

    .line 11
    .line 12
    iput-object p2, p0, Ll/r1v0;->c:Ll/n4u0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/r1v0;->a:Ljava/lang/String;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;F)Ll/r1v0;
    .locals 1

    .line 1
    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ll/z5t0;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-direct {p2, v0}, Ll/z5t0;-><init>(Ll/h9s0;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/r1v0;->c:Ll/n4u0;

    .line 12
    .line 13
    iput-object p2, v0, Ll/n4u0;->c:Ll/n4u0;

    .line 14
    .line 15
    iput-object p2, p0, Ll/r1v0;->c:Ll/n4u0;

    .line 16
    .line 17
    iput-object p1, p2, Ll/n4u0;->b:Ljava/lang/Object;

    .line 18
    .line 19
    const-string p1, "confidence"

    .line 20
    .line 21
    iput-object p1, p2, Ll/n4u0;->a:Ljava/lang/String;

    .line 22
    .line 23
    return-object p0
.end method

.method public final b(Ljava/lang/String;Ljava/lang/Object;)Ll/r1v0;
    .locals 1

    .line 1
    new-instance p1, Ll/n4u0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p1, v0}, Ll/n4u0;-><init>(Ll/h9s0;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/r1v0;->c:Ll/n4u0;

    .line 8
    .line 9
    iput-object p1, v0, Ll/n4u0;->c:Ll/n4u0;

    .line 10
    .line 11
    iput-object p1, p0, Ll/r1v0;->c:Ll/n4u0;

    .line 12
    .line 13
    iput-object p2, p1, Ll/n4u0;->b:Ljava/lang/Object;

    .line 14
    .line 15
    const-string p2, "languageTag"

    .line 16
    .line 17
    iput-object p2, p1, Ll/n4u0;->a:Ljava/lang/String;

    .line 18
    .line 19
    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const/16 v1, 0x20

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/r1v0;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const/16 v1, 0x7b

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/r1v0;->b:Ll/n4u0;

    .line 19
    .line 20
    iget-object p0, p0, Ll/n4u0;->c:Ll/n4u0;

    .line 21
    .line 22
    const-string v1, ""

    .line 23
    .line 24
    :goto_0
    if-eqz p0, :cond_2

    .line 25
    .line 26
    iget-object v2, p0, Ll/n4u0;->b:Ljava/lang/Object;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/n4u0;->a:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const/16 v1, 0x3d

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    :cond_0
    if-eqz v2, :cond_1

    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {v1}, Ljava/util/Arrays;->deepToString([Ljava/lang/Object;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    add-int/lit8 v2, v2, -0x1

    .line 68
    .line 69
    const/4 v3, 0x1

    .line 70
    invoke-virtual {v0, v1, v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    :goto_1
    iget-object p0, p0, Ll/n4u0;->c:Ll/n4u0;

    .line 78
    .line 79
    const-string v1, ", "

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    const/16 p0, 0x7d

    .line 83
    .line 84
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0
.end method
