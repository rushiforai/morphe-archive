.class Ll/n410$m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/spw;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/n410;->D0(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/n410;


# direct methods
.method public constructor <init>(Ll/n410;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n410$m;->a:Ll/n410;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFail(ILjava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/n410$m;->a:Ll/n410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/n410;->R(Ll/n410;)Ll/jpw;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/n410$m;->a:Ll/n410;

    .line 10
    .line 11
    invoke-static {v0}, Ll/n410;->R(Ll/n410;)Ll/jpw;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/n410$m;->a:Ll/n410;

    .line 16
    .line 17
    invoke-static {v1}, Ll/n410;->S(Ll/n410;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    add-int/2addr v1, p1

    .line 22
    new-instance v2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v3, "render failed\uff1a"

    .line 25
    .line 26
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-interface {v0, v1, p1, v2}, Ll/jpw;->a(IILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object v0, p0, Ll/n410$m;->a:Ll/n410;

    .line 40
    .line 41
    invoke-static {v0}, Ll/n410;->T(Ll/n410;)Ll/apw;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Ll/n410$m;->a:Ll/n410;

    .line 48
    .line 49
    invoke-static {v0}, Ll/n410;->T(Ll/n410;)Ll/apw;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v1, p0, Ll/n410$m;->a:Ll/n410;

    .line 54
    .line 55
    invoke-static {v1}, Ll/n410;->S(Ll/n410;)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    add-int/2addr v1, p1

    .line 60
    invoke-interface {v0, v1, p2}, Ll/apw;->onError(ILjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    const-string v1, "["

    .line 66
    .line 67
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Ll/n410$m;->a:Ll/n410;

    .line 71
    .line 72
    invoke-static {p0}, Ll/n410;->S(Ll/n410;)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    add-int/2addr p0, p1

    .line 77
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string p0, "]"

    .line 81
    .line 82
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    const-string p1, "EditProcess"

    .line 93
    .line 94
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method
