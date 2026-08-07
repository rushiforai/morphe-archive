.class public final Ll/ku10$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ku10;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:Ll/e0l;

.field public final b:Ll/z1d0;


# direct methods
.method public constructor <init>(Ll/e0l;Ll/z1d0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ku10$b;->a:Ll/e0l;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ku10$b;->b:Ll/z1d0;

    .line 7
    .line 8
    return-void
.end method

.method public static a(Ll/e0l;Ll/z1d0;)Ll/ku10$b;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_4

    .line 3
    .line 4
    if-eqz p0, :cond_1

    .line 5
    .line 6
    const-string v1, "Content-Type"

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Ll/e0l;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string p0, "Unexpected header: Content-Type"

    .line 16
    .line 17
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_1
    :goto_0
    if-eqz p0, :cond_3

    .line 22
    .line 23
    const-string v1, "Content-Length"

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Ll/e0l;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_2
    const-string p0, "Unexpected header: Content-Length"

    .line 33
    .line 34
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-object v0

    .line 38
    :cond_3
    :goto_1
    new-instance v0, Ll/ku10$b;

    .line 39
    .line 40
    invoke-direct {v0, p0, p1}, Ll/ku10$b;-><init>(Ll/e0l;Ll/z1d0;)V

    .line 41
    .line 42
    .line 43
    return-object v0

    .line 44
    :cond_4
    const-string p0, "body == null"

    .line 45
    .line 46
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-object v0
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;)Ll/ku10$b;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-static {p0, v0, p1}, Ll/ku10$b;->c(Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ll/ku10$b;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static c(Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ll/ku10$b;
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "form-data; name="

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, p0}, Ll/ku10;->a(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const-string p0, "; filename="

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-static {v0, p1}, Ll/ku10;->a(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    new-instance p0, Ll/e0l$a;

    .line 24
    .line 25
    invoke-direct {p0}, Ll/e0l$a;-><init>()V

    .line 26
    .line 27
    .line 28
    const-string p1, "Content-Disposition"

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, p1, v0}, Ll/e0l$a;->d(Ljava/lang/String;Ljava/lang/String;)Ll/e0l$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/e0l$a;->e()Ll/e0l;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p0, p2}, Ll/ku10$b;->a(Ll/e0l;Ll/z1d0;)Ll/ku10$b;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_1
    const-string p0, "name == null"

    .line 48
    .line 49
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x0

    .line 53
    return-object p0
.end method
