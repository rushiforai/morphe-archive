.class public Ljavax/servlet/UnavailableException;
.super Ljavax/servlet/ServletException;
.source "SourceFile"


# instance fields
.field private permanent:Z

.field private seconds:I

.field private servlet:Ll/yre0;


# direct methods
.method public constructor <init>(ILl/yre0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p3}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ljavax/servlet/UnavailableException;->servlet:Ll/yre0;

    .line 5
    .line 6
    if-gtz p1, :cond_0

    .line 7
    .line 8
    const/4 p1, -0x1

    .line 9
    iput p1, p0, Ljavax/servlet/UnavailableException;->seconds:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iput p1, p0, Ljavax/servlet/UnavailableException;->seconds:I

    .line 13
    .line 14
    :goto_0
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Ljavax/servlet/UnavailableException;->permanent:Z

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Ljavax/servlet/UnavailableException;->permanent:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;)V

    if-gtz p2, :cond_0

    const/4 p1, -0x1

    .line 24
    iput p1, p0, Ljavax/servlet/UnavailableException;->seconds:I

    goto :goto_0

    .line 25
    :cond_0
    iput p2, p0, Ljavax/servlet/UnavailableException;->seconds:I

    :goto_0
    const/4 p1, 0x0

    .line 26
    iput-boolean p1, p0, Ljavax/servlet/UnavailableException;->permanent:Z

    return-void
.end method

.method public constructor <init>(Ll/yre0;Ljava/lang/String;)V
    .locals 0

    .line 18
    invoke-direct {p0, p2}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;)V

    .line 19
    iput-object p1, p0, Ljavax/servlet/UnavailableException;->servlet:Ll/yre0;

    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Ljavax/servlet/UnavailableException;->permanent:Z

    return-void
.end method


# virtual methods
.method public getServlet()Ll/yre0;
    .locals 0

    .line 1
    iget-object p0, p0, Ljavax/servlet/UnavailableException;->servlet:Ll/yre0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUnavailableSeconds()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ljavax/servlet/UnavailableException;->permanent:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Ljavax/servlet/UnavailableException;->seconds:I

    .line 8
    .line 9
    return p0
.end method

.method public isPermanent()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ljavax/servlet/UnavailableException;->permanent:Z

    .line 2
    .line 3
    return p0
.end method
