.class public Ljavax/servlet/ServletContextEvent;
.super Ljava/util/EventObject;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/ase0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
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
