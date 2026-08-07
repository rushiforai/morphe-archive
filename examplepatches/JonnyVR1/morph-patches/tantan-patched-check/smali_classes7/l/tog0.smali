.class public abstract Ll/tog0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/olg0;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Ll/tog0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "SudGIP "

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Ll/olg0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/hlg0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/hlg0;-><init>(Ll/tog0;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/tog0;->a:Ll/olg0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public abstract a()Ll/vgg0;
.end method

.method public final b(ILl/elg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tog0;->e()Ll/vyg0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/vyg0;->c:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Ll/vyg0;->a:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Ll/vyg0;->b:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    :cond_1
    if-nez p0, :cond_2

    .line 39
    .line 40
    const-string p0, "sdkCoreCfg url_arm64_v8a version key cannot be empty"

    .line 41
    .line 42
    invoke-interface {p2, p0}, Ll/elg0;->a(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    invoke-static {}, Ll/rsg0;->a()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-interface {p2, p0}, Ll/elg0;->b(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public abstract c(JLjava/lang/Object;Ll/isg0;)V
.end method

.method public abstract d(Ljava/lang/Object;)Z
.end method

.method public abstract e()Ll/vyg0;
.end method
