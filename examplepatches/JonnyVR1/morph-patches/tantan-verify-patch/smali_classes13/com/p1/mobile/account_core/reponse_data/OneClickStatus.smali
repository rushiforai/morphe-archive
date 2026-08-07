.class public Lcom/p1/mobile/account_core/reponse_data/OneClickStatus;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public chinaMobile:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "china-mobile"
    .end annotation
.end field

.field public chinaUnicom:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "china-unicom"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/account_core/reponse_data/OneClickStatus;->chinaMobile:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/account_core/reponse_data/OneClickStatus;->chinaUnicom:Z

    .line 8
    .line 9
    return-void
.end method
