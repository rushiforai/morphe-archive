.class public abstract Lcom/leanplum/internal/BaseActionContext;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected args:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private isPreview:Z

.field protected isRooted:Z

.field protected messageId:Ljava/lang/String;

.field protected originalMessageId:Ljava/lang/String;

.field protected priority:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/leanplum/internal/BaseActionContext;->isRooted:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/leanplum/internal/BaseActionContext;->isPreview:Z

    iput-object p1, p0, Lcom/leanplum/internal/BaseActionContext;->messageId:Ljava/lang/String;

    iput-object p2, p0, Lcom/leanplum/internal/BaseActionContext;->originalMessageId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getArgs()Ljava/util/Map;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/leanplum/internal/BaseActionContext;->args:Ljava/util/Map;

    return-object p0
.end method

.method public getMessageId()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/BaseActionContext;->messageId:Ljava/lang/String;

    return-object p0
.end method

.method public getOriginalMessageId()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/BaseActionContext;->originalMessageId:Ljava/lang/String;

    return-object p0
.end method

.method public getPriority()I
    .registers 1

    iget p0, p0, Lcom/leanplum/internal/BaseActionContext;->priority:I

    return p0
.end method

.method public isPreview()Z
    .registers 1

    iget-boolean p0, p0, Lcom/leanplum/internal/BaseActionContext;->isPreview:Z

    return p0
.end method

.method public setIsPreview(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/leanplum/internal/BaseActionContext;->isPreview:Z

    return-void
.end method

.method public setIsRooted(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/leanplum/internal/BaseActionContext;->isRooted:Z

    return-void
.end method
