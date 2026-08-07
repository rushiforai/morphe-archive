.class public Ll/yxz$j;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yxz;->u5(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

.field public final synthetic b:Ll/yxz;


# direct methods
.method public constructor <init>(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yxz$j;->b:Ll/yxz;

    .line 2
    .line 3
    iput-object p2, p0, Ll/yxz$j;->a:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onStart()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/yxz$j;->b:Ll/yxz;

    .line 5
    .line 6
    iget-object p0, p0, Ll/yxz$j;->a:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/yxz;->z3(Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
