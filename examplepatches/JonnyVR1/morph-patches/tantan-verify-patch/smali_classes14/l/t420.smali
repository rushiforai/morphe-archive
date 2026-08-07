.class public final synthetic Ll/t420;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/w420;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;


# direct methods
.method public synthetic constructor <init>(Ll/w420;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t420;->a:Ll/w420;

    iput-object p2, p0, Ll/t420;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t420;->a:Ll/w420;

    iget-object p0, p0, Ll/t420;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    invoke-static {v0, p0, p1}, Ll/w420;->c(Ll/w420;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;Landroid/view/View;)V

    return-void
.end method
