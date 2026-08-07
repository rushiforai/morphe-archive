.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/config/MVSegmentCfg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field folder:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "folder"
    .end annotation
.end field

.field templateList:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "templates"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;",
            ">;"
        }
    .end annotation
.end field

.field type:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "type"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getFolder()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/MVSegmentCfg;->folder:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTemplateList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/MVSegmentCfg;->templateList:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/MVSegmentCfg;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setFolder(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/MVSegmentCfg;->folder:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTemplateList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/MVSegmentCfg;->templateList:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/MVSegmentCfg;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
