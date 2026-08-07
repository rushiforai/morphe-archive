.class public final Ll/xfx0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/wfx0;


# direct methods
.method public constructor <init>(Ll/wfx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xfx0;->a:Ll/wfx0;

    .line 5
    .line 6
    return-void
.end method

.method public static b([BLl/ayw0;)Ll/xfx0;
    .locals 0

    .line 1
    new-instance p1, Ll/xfx0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/wfx0;->b([B)Ll/wfx0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {p1, p0}, Ll/xfx0;-><init>(Ll/wfx0;)V

    .line 8
    .line 9
    .line 10
    return-object p1
.end method

.method public static c(I)Ll/xfx0;
    .locals 1

    .line 1
    new-instance v0, Ll/xfx0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/j7x0;->b(I)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/wfx0;->b([B)Ll/wfx0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {v0, p0}, Ll/xfx0;-><init>(Ll/wfx0;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xfx0;->a:Ll/wfx0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wfx0;->a()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final d(Ll/ayw0;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xfx0;->a:Ll/wfx0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wfx0;->c()[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
