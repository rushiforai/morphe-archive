.class public Ljavax/servlet/ServletRequestEvent;
.super Ljava/util/EventObject;
.source "SourceFile"


# instance fields
.field private final transient request:Ll/gse0;


# direct methods
.method public constructor <init>(Ll/ase0;Ll/gse0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ljavax/servlet/ServletRequestEvent;->request:Ll/gse0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getServletContext()Ll/ase0;
    .locals 0

    .line 1
    invoke-super {p0}, Ljava/util/EventObject;->getSource()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/ase0;

    .line 6
    .line 7
    return-object p0
.end method

.method public getServletRequest()Ll/gse0;
    .locals 0

    .line 1
    iget-object p0, p0, Ljavax/servlet/ServletRequestEvent;->request:Ll/gse0;

    .line 2
    .line 3
    return-object p0
.end method
