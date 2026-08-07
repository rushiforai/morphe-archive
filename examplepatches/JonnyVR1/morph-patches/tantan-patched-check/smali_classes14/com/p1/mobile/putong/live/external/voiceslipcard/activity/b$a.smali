.class public Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->l(Ljava/util/List;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b$a;->b:Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b$a;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(ILcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b$a;->b:Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->z(ILcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->schema:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b$a;->b:Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->i(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;)Ll/x1v;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->schema:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/x1v;->m0(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->i(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;)Ll/x1v;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->voiceLiveId:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->userId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Ll/x1v;->l0(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    iget p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b$a;->a:I

    .line 34
    .line 35
    invoke-static {p1, v0, p0}, Ll/evo0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;ZI)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
