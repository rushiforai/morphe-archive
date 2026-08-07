.class public abstract Lorg/seamless/xml/DOMParser$NodeVisitor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/seamless/xml/DOMParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "NodeVisitor"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private nodeType:S


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(S)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-short p1, p0, Lorg/seamless/xml/DOMParser$NodeVisitor;->nodeType:S

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic access$000(Lorg/seamless/xml/DOMParser$NodeVisitor;)S
    .locals 0

    .line 1
    iget-short p0, p0, Lorg/seamless/xml/DOMParser$NodeVisitor;->nodeType:S

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public isHalted()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public abstract visit(Lorg/w3c/dom/Node;)V
.end method
