.class public Ll/zmg;
.super Ll/m4;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/m4;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/wul;)Z
    .locals 0

    .line 1
    sget p2, Ll/ksg;->a:I

    .line 2
    .line 3
    invoke-static {}, Ll/ymg;->f()Ll/ymg;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    invoke-virtual {p3}, Ll/ymg;->e()I

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    if-ge p2, p3, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-static {}, Ll/ymg;->f()Ll/ymg;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2, p1, p0}, Ll/ymg;->c(Lcom/p1/mobile/android/app/Act;Ll/uul;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method
