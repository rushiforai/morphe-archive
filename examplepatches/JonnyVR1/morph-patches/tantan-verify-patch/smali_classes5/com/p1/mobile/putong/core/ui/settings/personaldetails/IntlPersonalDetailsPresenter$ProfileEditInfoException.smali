.class final Lcom/p1/mobile/putong/core/ui/settings/personaldetails/IntlPersonalDetailsPresenter$ProfileEditInfoException;
.super Ljava/lang/RuntimeException;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/settings/personaldetails/IntlPersonalDetailsPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ProfileEditInfoException"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0002\u0018\u00002\u00060\u0001j\u0002`\u0002B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006R\u0011\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/settings/personaldetails/IntlPersonalDetailsPresenter$ProfileEditInfoException;",
        "Ljava/lang/RuntimeException;",
        "Lkotlin/RuntimeException;",
        "editInfo",
        "Lcom/p1/mobile/putong/core/data/ProfileEditInfo;",
        "<init>",
        "(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)V",
        "getEditInfo",
        "()Lcom/p1/mobile/putong/core/data/ProfileEditInfo;",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final editInfo:Lcom/p1/mobile/putong/core/data/ProfileEditInfo;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/ProfileEditInfo;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/IntlPersonalDetailsPresenter$ProfileEditInfoException;->editInfo:Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final getEditInfo()Lcom/p1/mobile/putong/core/data/ProfileEditInfo;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/IntlPersonalDetailsPresenter$ProfileEditInfoException;->editInfo:Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    .line 2
    .line 3
    return-object p0
.end method
