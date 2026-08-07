.class public Ll/qs40;
.super Ll/ese0;
.source "SourceFile"


# static fields
.field public static b:Ljava/util/ResourceBundle;


# instance fields
.field public a:I


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
    sput-object v0, Ll/qs40;->b:Ljava/util/ResourceBundle;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ese0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/qs40;->a:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public k()I
    .locals 0

    .line 1
    iget p0, p0, Ll/qs40;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public write(I)V
    .locals 0

    .line 21
    iget p1, p0, Ll/qs40;->a:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Ll/qs40;->a:I

    return-void
.end method

.method public write([BII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    if-ltz p3, :cond_0

    .line 2
    .line 3
    iget p1, p0, Ll/qs40;->a:I

    .line 4
    .line 5
    add-int/2addr p1, p3

    .line 6
    iput p1, p0, Ll/qs40;->a:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget-object p0, Ll/qs40;->b:Ljava/util/ResourceBundle;

    .line 10
    .line 11
    const-string p1, "err.io.negativelength"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
