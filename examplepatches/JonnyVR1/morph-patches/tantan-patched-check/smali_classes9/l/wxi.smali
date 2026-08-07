.class public final synthetic Ll/wxi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jyi;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;


# direct methods
.method public synthetic constructor <init>(Ll/jyi;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wxi;->a:Ll/jyi;

    iput-object p2, p0, Ll/wxi;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/wxi;->c:Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wxi;->a:Ll/jyi;

    iget-object v1, p0, Ll/wxi;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/wxi;->c:Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Ll/jyi;->P3(Ll/jyi;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveFollowConditions;Ljava/lang/String;)V

    return-void
.end method
