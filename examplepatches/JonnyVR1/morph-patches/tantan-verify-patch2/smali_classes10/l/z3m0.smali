.class public final synthetic Ll/z3m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/b4m0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;


# direct methods
.method public synthetic constructor <init>(Ll/b4m0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z3m0;->a:Ll/b4m0;

    iput-object p2, p0, Ll/z3m0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z3m0;->a:Ll/b4m0;

    iget-object p0, p0, Ll/z3m0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;

    invoke-static {v0, p0, p1}, Ll/b4m0;->H(Ll/b4m0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;Landroid/view/View;)V

    return-void
.end method
