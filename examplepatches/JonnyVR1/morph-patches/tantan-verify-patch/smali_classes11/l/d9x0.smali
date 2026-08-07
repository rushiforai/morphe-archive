.class public final synthetic Ll/d9x0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v5x0;


# static fields
.field public static final synthetic a:Ll/d9x0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/d9x0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/d9x0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/d9x0;->a:Ll/d9x0;

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
    .locals 0

    .line 1
    check-cast p1, Ll/k9x0;

    .line 2
    .line 3
    new-instance p0, Ll/x8x0;

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-direct {p0, p2}, Ll/x8x0;-><init>(Ll/w8x0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/x8x0;->c(Ll/k9x0;)Ll/x8x0;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ll/k9x0;->c()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-static {p1}, Ll/xfx0;->c(I)Ll/xfx0;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Ll/x8x0;->b(Ll/xfx0;)Ll/x8x0;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p2}, Ll/x8x0;->a(Ljava/lang/Integer;)Ll/x8x0;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/x8x0;->d()Ll/z8x0;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method
