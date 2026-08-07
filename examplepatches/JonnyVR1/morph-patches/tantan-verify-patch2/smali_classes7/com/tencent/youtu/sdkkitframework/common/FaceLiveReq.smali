.class public Lcom/tencent/youtu/sdkkitframework/common/FaceLiveReq;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public app_id:Ljava/lang/String;

.field public config:Ljava/lang/String;

.field public data:Ljava/lang/String;

.field public session_id:Ljava/lang/String;

.field public sign:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "not_set"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/FaceLiveReq;->session_id:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method
