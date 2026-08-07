.class public abstract Lorg/seamless/xml/DOMElement$ArrayBuilder;
.super Lorg/seamless/xml/DOMElement$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/seamless/xml/DOMElement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "ArrayBuilder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lorg/seamless/xml/DOMElement;",
        ">",
        "Lorg/seamless/xml/DOMElement<",
        "TCHI",
        "LD;",
        "TPARENT;>.Builder<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/seamless/xml/DOMElement;


# direct methods
.method public constructor <init>(Lorg/seamless/xml/DOMElement;Lorg/seamless/xml/DOMElement;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/seamless/xml/DOMElement$ArrayBuilder;->this$0:Lorg/seamless/xml/DOMElement;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lorg/seamless/xml/DOMElement$Builder;-><init>(Lorg/seamless/xml/DOMElement;Lorg/seamless/xml/DOMElement;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public buildArray([Lorg/seamless/xml/DOMElement;)[Lorg/seamless/xml/DOMElement;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/seamless/xml/DOMElement;",
            ")[TT;"
        }
    .end annotation

    .line 1
    array-length v0, p1

    .line 2
    invoke-virtual {p0, v0}, Lorg/seamless/xml/DOMElement$ArrayBuilder;->newChildrenArray(I)[Lorg/seamless/xml/DOMElement;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    array-length v2, v0

    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    aget-object v2, p1, v1

    .line 11
    .line 12
    invoke-virtual {v2}, Lorg/seamless/xml/DOMElement;->getW3CElement()Lorg/w3c/dom/Element;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {p0, v2}, Lorg/seamless/xml/DOMElement$Builder;->build(Lorg/w3c/dom/Element;)Lorg/seamless/xml/DOMElement;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    aput-object v2, v0, v1

    .line 21
    .line 22
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-object v0
.end method

.method public getChildElements()[Lorg/seamless/xml/DOMElement;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/seamless/xml/DOMElement$Builder;->element:Lorg/seamless/xml/DOMElement;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/seamless/xml/DOMElement;->getChildren()[Lorg/seamless/xml/DOMElement;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Lorg/seamless/xml/DOMElement$ArrayBuilder;->buildArray([Lorg/seamless/xml/DOMElement;)[Lorg/seamless/xml/DOMElement;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getChildElements(Ljava/lang/String;)[Lorg/seamless/xml/DOMElement;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")[TT;"
        }
    .end annotation

    .line 12
    iget-object v0, p0, Lorg/seamless/xml/DOMElement$Builder;->element:Lorg/seamless/xml/DOMElement;

    invoke-virtual {v0, p1}, Lorg/seamless/xml/DOMElement;->getChildren(Ljava/lang/String;)[Lorg/seamless/xml/DOMElement;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/seamless/xml/DOMElement$ArrayBuilder;->buildArray([Lorg/seamless/xml/DOMElement;)[Lorg/seamless/xml/DOMElement;

    move-result-object p0

    return-object p0
.end method

.method public abstract newChildrenArray(I)[Lorg/seamless/xml/DOMElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)[TT;"
        }
    .end annotation
.end method
