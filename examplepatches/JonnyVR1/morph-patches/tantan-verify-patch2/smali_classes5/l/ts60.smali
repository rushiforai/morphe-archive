.class public final synthetic Ll/ts60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ts60;->a:Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ts60;->a:Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->e0(Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
