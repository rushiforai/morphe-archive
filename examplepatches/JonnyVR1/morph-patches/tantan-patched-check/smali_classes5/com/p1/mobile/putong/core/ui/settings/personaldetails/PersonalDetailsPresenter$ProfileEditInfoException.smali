.class Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter$ProfileEditInfoException;
.super Ljava/lang/RuntimeException;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ProfileEditInfoException"
.end annotation


# instance fields
.field private editInfo:Lcom/p1/mobile/putong/core/data/ProfileEditInfo;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter$ProfileEditInfoException;->editInfo:Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getEditInfo()Lcom/p1/mobile/putong/core/data/ProfileEditInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter$ProfileEditInfoException;->editInfo:Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    .line 2
    .line 3
    return-object p0
.end method
