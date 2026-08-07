.class public Lcom/ss/bytertc/engine/type/SubtitleMessage;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public definite:Z

.field public language:Ljava/lang/String;

.field public mode:Lcom/ss/bytertc/engine/type/SubtitleMode;

.field public sequence:I

.field public text:Ljava/lang/String;

.field public userId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/type/SubtitleMode;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/type/SubtitleMessage;->userId:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/type/SubtitleMessage;->text:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/ss/bytertc/engine/type/SubtitleMessage;->language:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/ss/bytertc/engine/type/SubtitleMessage;->mode:Lcom/ss/bytertc/engine/type/SubtitleMode;

    .line 11
    .line 12
    iput p5, p0, Lcom/ss/bytertc/engine/type/SubtitleMessage;->sequence:I

    .line 13
    .line 14
    iput-boolean p6, p0, Lcom/ss/bytertc/engine/type/SubtitleMessage;->definite:Z

    .line 15
    .line 16
    return-void
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZ)Lcom/ss/bytertc/engine/type/SubtitleMessage;
    .locals 7
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/type/SubtitleMessage;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/ss/bytertc/engine/type/SubtitleMode;->fromId(I)Lcom/ss/bytertc/engine/type/SubtitleMode;

    .line 4
    .line 5
    .line 6
    move-result-object v4

    .line 7
    move-object v1, p0

    .line 8
    move-object v2, p1

    .line 9
    move-object v3, p2

    .line 10
    move v5, p4

    .line 11
    move v6, p5

    .line 12
    invoke-direct/range {v0 .. v6}, Lcom/ss/bytertc/engine/type/SubtitleMessage;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/type/SubtitleMode;IZ)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method
