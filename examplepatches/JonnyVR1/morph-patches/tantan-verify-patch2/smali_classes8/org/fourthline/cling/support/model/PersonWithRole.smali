.class public Lorg/fourthline/cling/support/model/PersonWithRole;
.super Lorg/fourthline/cling/support/model/Person;
.source "SourceFile"


# instance fields
.field private role:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lorg/fourthline/cling/support/model/Person;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/fourthline/cling/support/model/Person;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lorg/fourthline/cling/support/model/PersonWithRole;->role:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getRole()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/PersonWithRole;->role:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setOnElement(Lorg/w3c/dom/Element;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/Person;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p1, v0}, Lorg/w3c/dom/Node;->setTextContent(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/PersonWithRole;->getRole()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const-string v0, "role"

    .line 15
    .line 16
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/PersonWithRole;->getRole()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p1, v0, p0}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
