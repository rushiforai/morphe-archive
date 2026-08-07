.class public final Ll/shg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/gip/core/ISudListenerGetMGInfo;


# instance fields
.field public final synthetic a:Ll/dng0;


# direct methods
.method public constructor <init>(Ll/dng0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/shg0;->a:Ll/dng0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onFailure(ILjava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Ll/dng0;->i:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "preload getMGInfo failure retCode="

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, " retMsg="

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/shg0;->a:Ll/dng0;

    .line 29
    .line 30
    invoke-virtual {p0, p1, p2}, Ll/dng0;->a(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final onSuccess(Ltech/sud/gip/core/GameInfo;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/shg0;->a:Ll/dng0;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/dng0;->c:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/16 v1, -0x2774

    .line 9
    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    const-string p0, "gameInfo is null"

    .line 13
    .line 14
    invoke-virtual {v0, v1, p0}, Ll/dng0;->a(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iget v2, p1, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 19
    .line 20
    const/4 v3, 0x1

    .line 21
    if-ne v3, v2, :cond_4

    .line 22
    .line 23
    sget-object v0, Ll/dng0;->i:Ljava/lang/String;

    .line 24
    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v2, "preload getMGInfo success "

    .line 28
    .line 29
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/shg0;->a:Ll/dng0;

    .line 47
    .line 48
    iget-object v0, p0, Ll/dng0;->d:Ll/glg0;

    .line 49
    .line 50
    iget v1, p1, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 51
    .line 52
    new-instance v2, Ll/xhg0;

    .line 53
    .line 54
    invoke-direct {v2, p0, p1}, Ll/xhg0;-><init>(Ll/dng0;Ltech/sud/gip/core/GameInfo;)V

    .line 55
    .line 56
    .line 57
    if-ne v3, v1, :cond_2

    .line 58
    .line 59
    iget-object p0, v0, Ll/glg0;->a:Ll/ilg0;

    .line 60
    .line 61
    invoke-virtual {p0, v1, v2}, Ll/tog0;->b(ILl/elg0;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    const/4 p0, 0x5

    .line 66
    if-ne p0, v1, :cond_3

    .line 67
    .line 68
    iget-object p0, v0, Ll/glg0;->b:Ll/ksg0;

    .line 69
    .line 70
    invoke-virtual {p0, v1, v2}, Ll/tog0;->b(ILl/elg0;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 75
    .line 76
    .line 77
    new-instance p0, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    const-string p1, "\u4e0d\u652f\u6301engine="

    .line 80
    .line 81
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {v2, p0}, Ll/xhg0;->a(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    const-string v2, "This sdk not support engine="

    .line 98
    .line 99
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget p1, p1, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 103
    .line 104
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string p1, " of game runtime."

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {v0, v1, p0}, Ll/dng0;->a(ILjava/lang/String;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method
