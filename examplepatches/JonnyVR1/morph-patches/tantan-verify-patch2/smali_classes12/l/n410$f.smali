.class Ll/n410$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/imomo/momo/mediaencoder/FFBgChanger$OnBgChangerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/n410;->E0()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Ll/n410;


# direct methods
.method public constructor <init>(Ll/n410;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n410$f;->b:Ll/n410;

    .line 2
    .line 3
    iput-wide p2, p0, Ll/n410$f;->a:J

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onError(I)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/n410$f;->b:Ll/n410;

    .line 2
    .line 3
    invoke-static {p1}, Ll/n410;->R(Ll/n410;)Ll/jpw;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "BgChanger running error"

    .line 8
    .line 9
    const/16 v1, 0x1f45

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/n410$f;->b:Ll/n410;

    .line 14
    .line 15
    invoke-static {p1}, Ll/n410;->R(Ll/n410;)Ll/jpw;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v2, p0, Ll/n410$f;->b:Ll/n410;

    .line 20
    .line 21
    invoke-static {v2}, Ll/n410;->S(Ll/n410;)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    add-int/2addr v2, v1

    .line 26
    invoke-interface {p1, v2, v1, v0}, Ll/jpw;->a(IILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p1, p0, Ll/n410$f;->b:Ll/n410;

    .line 30
    .line 31
    invoke-static {p1}, Ll/n410;->T(Ll/n410;)Ll/apw;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Ll/n410$f;->b:Ll/n410;

    .line 38
    .line 39
    invoke-static {p1}, Ll/n410;->T(Ll/n410;)Ll/apw;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p0, p0, Ll/n410$f;->b:Ll/n410;

    .line 44
    .line 45
    invoke-static {p0}, Ll/n410;->S(Ll/n410;)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    add-int/2addr p0, v1

    .line 50
    invoke-interface {p1, p0, v0}, Ll/apw;->onError(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    const-string p0, "EditProcess"

    .line 54
    .line 55
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public onProgress(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n410$f;->b:Ll/n410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/n410;->g(Ll/n410;)Ll/kpw;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/n410$f;->b:Ll/n410;

    .line 10
    .line 11
    invoke-static {v0}, Ll/n410;->g(Ll/n410;)Ll/kpw;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    int-to-float v1, p1

    .line 16
    invoke-interface {v0, v1}, Ll/kpw;->onProcessProgress(F)V

    .line 17
    .line 18
    .line 19
    :cond_0
    const/16 v0, 0x64

    .line 20
    .line 21
    if-ne p1, v0, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Ll/n410$f;->b:Ll/n410;

    .line 24
    .line 25
    invoke-static {p1}, Ll/n410;->g(Ll/n410;)Ll/kpw;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Ll/n410$f;->b:Ll/n410;

    .line 32
    .line 33
    invoke-static {p1}, Ll/n410;->g(Ll/n410;)Ll/kpw;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Ll/n410$f;->b:Ll/n410;

    .line 40
    .line 41
    iget-wide v0, p0, Ll/n410$f;->a:J

    .line 42
    .line 43
    invoke-static {p1, v0, v1}, Ll/n410;->Q(Ll/n410;J)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/n410$f;->b:Ll/n410;

    .line 47
    .line 48
    invoke-static {p0}, Ll/n410;->g(Ll/n410;)Ll/kpw;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-interface {p0}, Ll/kpw;->a()V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method
