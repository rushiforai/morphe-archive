.class public final synthetic Ll/a2v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a2v;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;

    iput p2, p0, Ll/a2v;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a2v;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;

    iget p0, p0, Ll/a2v;->b:I

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->b(Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;I)V

    return-void
.end method
