.class public Lcom/p1/mobile/putong/account/data/AccountShareItemBean;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private action:Ll/x20;

.field private icon:I

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILl/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountShareItemBean;->name:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/account/data/AccountShareItemBean;->icon:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/account/data/AccountShareItemBean;->action:Ll/x20;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getAction()Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/AccountShareItemBean;->action:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIcon()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/account/data/AccountShareItemBean;->icon:I

    .line 2
    .line 3
    return p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/AccountShareItemBean;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setAction(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountShareItemBean;->action:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setIcon(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/account/data/AccountShareItemBean;->icon:I

    .line 2
    .line 3
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountShareItemBean;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
