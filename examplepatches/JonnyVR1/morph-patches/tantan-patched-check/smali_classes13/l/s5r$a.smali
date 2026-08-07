.class Ll/s5r$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/thd$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/s5r;->C(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ll/s5r;->p(Z)Z

    .line 3
    .line 4
    .line 5
    sget-object p0, Ll/s5r;->y:Ll/gb1;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/16 v0, 0xc

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-interface {p0, v2, v0, v1}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 14
    .line 15
    .line 16
    :cond_0
    const-string p0, "HUOHL_KtvPlayer"

    .line 17
    .line 18
    const-string v0, "***********************\u4f34\u594f\u6587\u4ef6\u89e3\u7801OK: "

    .line 19
    .line 20
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ll/s5r;->i(Z)Z

    .line 3
    .line 4
    .line 5
    sget-object p0, Ll/s5r;->y:Ll/gb1;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/16 v0, 0xb

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-interface {p0, v2, v0, v1}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 14
    .line 15
    .line 16
    :cond_0
    const-string p0, "HUOHL_KtvPlayer"

    .line 17
    .line 18
    const-string v0, "***********************\u4f34\u594f\u6587\u4ef6\u5f00\u59cb\u89e3\u7801: "

    .line 19
    .line 20
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public c(J)V
    .locals 1

    .line 1
    invoke-static {p1, p2}, Ll/s5r;->f(J)J

    .line 2
    .line 3
    .line 4
    sget-object p0, Ll/s5r;->y:Ll/gb1;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/16 v0, 0xa

    .line 9
    .line 10
    long-to-int p1, p1

    .line 11
    const/4 p2, 0x0

    .line 12
    invoke-interface {p0, p2, v0, p1}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 13
    .line 14
    .line 15
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string p1, "***********************\u89e3\u7801 \u83b7\u53d6\u4f34\u594f\u65f6\u957f: "

    .line 18
    .line 19
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/s5r;->e()J

    .line 23
    .line 24
    .line 25
    move-result-wide p1

    .line 26
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "HUOHL_KtvPlayer"

    .line 34
    .line 35
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public d(ILjava/lang/String;)V
    .locals 1

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ll/s5r;->q(Z)Z

    .line 3
    .line 4
    .line 5
    sget-object p0, Ll/s5r;->y:Ll/gb1;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/16 p1, 0x19

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-interface {p0, v0, p1, p2}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
