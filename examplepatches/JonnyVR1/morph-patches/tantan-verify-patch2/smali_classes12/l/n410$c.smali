.class Ll/n410$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/spw;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/n410;->F0(Ljava/lang/String;)Z
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
    iput-object p1, p0, Ll/n410$c;->a:Ll/n410;

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
    .locals 3

    .line 1
    iget-object v0, p0, Ll/n410$c;->a:Ll/n410;

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
    iget-object v0, p0, Ll/n410$c;->a:Ll/n410;

    .line 10
    .line 11
    invoke-static {v0}, Ll/n410;->R(Ll/n410;)Ll/jpw;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/n410$c;->a:Ll/n410;

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
    const-string v2, "encoder error!!!"

    .line 23
    .line 24
    invoke-interface {v0, v1, p1, v2}, Ll/jpw;->a(IILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Ll/n410$c;->a:Ll/n410;

    .line 28
    .line 29
    invoke-static {v0}, Ll/n410;->T(Ll/n410;)Ll/apw;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Ll/n410$c;->a:Ll/n410;

    .line 36
    .line 37
    invoke-static {v0}, Ll/n410;->T(Ll/n410;)Ll/apw;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p0, Ll/n410$c;->a:Ll/n410;

    .line 42
    .line 43
    invoke-static {v1}, Ll/n410;->S(Ll/n410;)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    add-int/2addr v1, p1

    .line 48
    invoke-interface {v0, v1, p2}, Ll/apw;->onError(ILjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v1, "["

    .line 54
    .line 55
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Ll/n410$c;->a:Ll/n410;

    .line 59
    .line 60
    invoke-static {p0}, Ll/n410;->S(Ll/n410;)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    add-int/2addr p0, p1

    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string p0, "]"

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string p1, "media"

    .line 81
    .line 82
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method
