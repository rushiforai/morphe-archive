.class public final synthetic Lcom/p1/mobile/putong/live/livingroom/common/bottom/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo$Area;

.field public final synthetic d:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;Ll/y20;Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo$Area;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;

    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/a;->b:Ll/y20;

    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/a;->c:Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo$Area;

    iput-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/a;->d:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;

    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/a;->b:Ll/y20;

    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/a;->c:Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo$Area;

    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/a;->d:Ljava/util/ArrayList;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->d(Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;Ll/y20;Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo$Area;Ljava/util/ArrayList;I)V

    return-void
.end method
