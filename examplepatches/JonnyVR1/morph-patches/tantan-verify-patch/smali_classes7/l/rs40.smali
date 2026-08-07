.class public Ll/rs40;
.super Ll/gnl;
.source "SourceFile"


# static fields
.field public static final e:Ljava/util/ResourceBundle;


# instance fields
.field public a:Ll/qs40;

.field public b:Ljava/io/PrintWriter;

.field public c:Z

.field public d:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "javax.servlet.http.LocalStrings"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/ResourceBundle;->getBundle(Ljava/lang/String;)Ljava/util/ResourceBundle;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/rs40;->e:Ljava/util/ResourceBundle;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ljavax/servlet/http/HttpServletResponse;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gnl;-><init>(Ljavax/servlet/http/HttpServletResponse;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/qs40;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/qs40;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/rs40;->a:Ll/qs40;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/rs40;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/rs40;->b:Ljava/io/PrintWriter;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/rs40;->a:Ll/qs40;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/qs40;->k()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0, v0}, Ll/rs40;->setContentLength(I)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public getOutputStream()Ll/ese0;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rs40;->b:Ljava/io/PrintWriter;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/rs40;->d:Z

    .line 7
    .line 8
    iget-object p0, p0, Ll/rs40;->a:Ll/qs40;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    sget-object p0, Ll/rs40;->e:Ljava/util/ResourceBundle;

    .line 12
    .line 13
    const-string v0, "err.ise.getOutputStream"

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public getWriter()Ljava/io/PrintWriter;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/rs40;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/rs40;->b:Ljava/io/PrintWriter;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/io/OutputStreamWriter;

    .line 10
    .line 11
    iget-object v1, p0, Ll/rs40;->a:Ll/qs40;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/mse0;->getCharacterEncoding()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-direct {v0, v1, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Ljava/io/PrintWriter;

    .line 21
    .line 22
    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Ll/rs40;->b:Ljava/io/PrintWriter;

    .line 26
    .line 27
    :cond_0
    iget-object p0, p0, Ll/rs40;->b:Ljava/io/PrintWriter;

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_1
    sget-object p0, Ll/rs40;->e:Ljava/util/ResourceBundle;

    .line 31
    .line 32
    const-string v0, "err.ise.getWriter"

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return-object p0
.end method

.method public setContentLength(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/mse0;->setContentLength(I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Ll/rs40;->c:Z

    .line 6
    .line 7
    return-void
.end method
