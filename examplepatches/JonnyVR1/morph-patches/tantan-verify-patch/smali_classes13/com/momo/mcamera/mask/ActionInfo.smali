.class public Lcom/momo/mcamera/mask/ActionInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/ActionInfo$BodyBean;
    }
.end annotation


# instance fields
.field private body:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/ActionInfo$BodyBean;",
            ">;"
        }
    .end annotation
.end field

.field private eye:Ljava/lang/String;

.field private hand:Ljava/lang/String;

.field private head:Ljava/lang/String;

.field private mouth:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/mask/ActionInfo;->hand:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/momo/mcamera/mask/ActionInfo;->mouth:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/ActionInfo;->head:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/mcamera/mask/ActionInfo;->eye:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getBody()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/ActionInfo$BodyBean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/ActionInfo;->body:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEye()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/ActionInfo;->eye:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHand()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/ActionInfo;->hand:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHead()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/ActionInfo;->head:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMouth()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/ActionInfo;->mouth:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
