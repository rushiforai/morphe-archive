.class public final synthetic Ll/m4x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m4x;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

    iput-object p2, p0, Ll/m4x;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m4x;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

    iget-object p0, p0, Ll/m4x;->b:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->g0(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
