.class public final synthetic Ll/i0x0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v5x0;


# static fields
.field public static final synthetic a:Ll/i0x0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/i0x0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/i0x0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/i0x0;->a:Ll/i0x0;

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
    check-cast p1, Ll/o0x0;

    .line 2
    .line 3
    sget-object p0, Ll/j0x0;->a:Ll/v6x0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/o0x0;->b()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/16 p2, 0x18

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    if-eq p0, p2, :cond_0

    .line 13
    .line 14
    new-instance p0, Ll/yzw0;

    .line 15
    .line 16
    invoke-direct {p0, v0}, Ll/yzw0;-><init>(Ll/xzw0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/yzw0;->c(Ll/o0x0;)Ll/yzw0;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/yzw0;->a(Ljava/lang/Integer;)Ll/yzw0;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ll/o0x0;->b()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-static {p1}, Ll/xfx0;->c(I)Ll/xfx0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Ll/yzw0;->b(Ll/xfx0;)Ll/yzw0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/yzw0;->d()Ll/a0x0;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_0
    const-string p0, "192 bit AES GCM Parameters are not valid"

    .line 42
    .line 43
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-object v0
.end method
