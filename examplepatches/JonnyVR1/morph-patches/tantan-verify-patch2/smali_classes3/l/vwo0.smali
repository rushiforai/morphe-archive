.class public final synthetic Ll/vwo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Ll/wwo0;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Ll/wwo0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vwo0;->a:Ljava/util/ArrayList;

    iput-object p2, p0, Ll/vwo0;->b:Ll/wwo0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vwo0;->a:Ljava/util/ArrayList;

    iget-object p0, p0, Ll/vwo0;->b:Ll/wwo0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpInviteRecord;

    invoke-static {v0, p0, p1}, Ll/wwo0;->H(Ljava/util/ArrayList;Ll/wwo0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpInviteRecord;)V

    return-void
.end method
