.class public final synthetic Ll/qyw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v5x0;


# static fields
.field public static final synthetic a:Ll/qyw0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/qyw0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qyw0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/qyw0;->a:Ll/qyw0;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ll/lxw0;Ljava/lang/Integer;)Ll/xww0;
    .locals 1

    .line 1
    check-cast p1, Ll/xyw0;

    .line 2
    .line 3
    sget-object p0, Ll/ryw0;->a:Ll/v6x0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/xyw0;->b()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/16 p2, 0x10

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    if-eq p0, p2, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/xyw0;->b()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/16 p2, 0x20

    .line 19
    .line 20
    if-ne p0, p2, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string p0, "AES key size must be 16 or 32 bytes"

    .line 24
    .line 25
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_1
    :goto_0
    new-instance p0, Ll/lyw0;

    .line 30
    .line 31
    invoke-direct {p0, v0}, Ll/lyw0;-><init>(Ll/kyw0;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/lyw0;->d(Ll/xyw0;)Ll/lyw0;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ll/lyw0;->c(Ljava/lang/Integer;)Ll/lyw0;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ll/xyw0;->b()I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    invoke-static {p2}, Ll/xfx0;->c(I)Ll/xfx0;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-virtual {p0, p2}, Ll/lyw0;->a(Ll/xfx0;)Ll/lyw0;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1}, Ll/xyw0;->c()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-static {p1}, Ll/xfx0;->c(I)Ll/xfx0;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Ll/lyw0;->b(Ll/xfx0;)Ll/lyw0;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/lyw0;->e()Ll/nyw0;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method
