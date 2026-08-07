.class public final synthetic Ll/npi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ppi0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;


# direct methods
.method public synthetic constructor <init>(Ll/ppi0;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/npi0;->a:Ll/ppi0;

    iput-object p2, p0, Ll/npi0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/npi0;->a:Ll/ppi0;

    iget-object p0, p0, Ll/npi0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    invoke-static {v0, p0, p1}, Ll/ppi0;->e(Ll/ppi0;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;Lcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method
