.class public Ll/hk4;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final PAGE_STYLE_BLACK:I = 0x0

.field public static final PAGE_STYLE_WHITE:I = 0x1


# instance fields
.field public lp:Ll/ner;

.field public pageStyle:I

.field private tabId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/hk4;->pageStyle:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/hk4;->lp:Ll/ner;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hk4;->tabId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/hk4;->pageStyle:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public c(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/hk4;->pageStyle:I

    .line 2
    .line 3
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hk4;->tabId:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
