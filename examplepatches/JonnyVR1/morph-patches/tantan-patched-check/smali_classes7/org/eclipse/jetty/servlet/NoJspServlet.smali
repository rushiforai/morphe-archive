.class public Lorg/eclipse/jetty/servlet/NoJspServlet;
.super Ljavax/servlet/http/HttpServlet;
.source "SourceFile"


# instance fields
.field private _warned:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljavax/servlet/http/HttpServlet;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public doGet(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean p1, p0, Lorg/eclipse/jetty/servlet/NoJspServlet;->_warned:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljavax/servlet/GenericServlet;->getServletContext()Ll/ase0;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "No JSP support.  Check that JSP jars are in lib/jsp and that the JSP option has been specified to start.jar"

    .line 10
    .line 11
    invoke-interface {p1, v0}, Ll/ase0;->log(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Lorg/eclipse/jetty/servlet/NoJspServlet;->_warned:Z

    .line 16
    .line 17
    const/16 p0, 0x1f4

    .line 18
    .line 19
    const-string p1, "JSP support not configured"

    .line 20
    .line 21
    invoke-interface {p2, p0, p1}, Ljavax/servlet/http/HttpServletResponse;->sendError(ILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
