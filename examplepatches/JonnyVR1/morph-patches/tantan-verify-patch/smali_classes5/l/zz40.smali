.class public final synthetic Ll/zz40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zz40;->a:Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zz40;->a:Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;

    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;->Z1(Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;Lcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method
