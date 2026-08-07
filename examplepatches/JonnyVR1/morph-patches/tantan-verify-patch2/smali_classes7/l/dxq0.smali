.class public Ll/dxq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z1r0;
.implements Ll/d2r0;


# instance fields
.field private a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dxq0;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/g2r0;)V
    .locals 0

    .line 33
    iget-object p0, p0, Ll/dxq0;->a:Landroid/content/Context;

    invoke-static {p0}, Ll/kxq0;->a(Landroid/content/Context;)V

    return-void
.end method

.method public a(Ll/w0r0;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/w0r0;->a()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "PING"

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/w0r0;->c()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/dxq0;->a:Landroid/content/Context;

    .line 22
    .line 23
    invoke-static {p0}, Ll/kxq0;->h(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object p0, p0, Ll/dxq0;->a:Landroid/content/Context;

    .line 28
    .line 29
    invoke-static {p0}, Ll/kxq0;->a(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public a(Ll/g2r0;)Z
    .locals 0

    .line 34
    const/4 p0, 0x1

    return p0
.end method
