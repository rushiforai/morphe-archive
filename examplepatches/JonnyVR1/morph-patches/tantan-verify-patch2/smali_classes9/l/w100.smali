.class public final synthetic Ll/w100;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w100;->a:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w100;->a:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;

    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->s(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
