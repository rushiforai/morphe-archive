.class public final synthetic Ll/yu10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/cv10;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;


# direct methods
.method public synthetic constructor <init>(Ll/cv10;ILcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yu10;->a:Ll/cv10;

    iput p2, p0, Ll/yu10;->b:I

    iput-object p3, p0, Ll/yu10;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yu10;->a:Ll/cv10;

    iget v1, p0, Ll/yu10;->b:I

    iget-object p0, p0, Ll/yu10;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    invoke-static {v0, v1, p0, p1}, Ll/cv10;->d(Ll/cv10;ILcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Landroid/view/View;)V

    return-void
.end method
