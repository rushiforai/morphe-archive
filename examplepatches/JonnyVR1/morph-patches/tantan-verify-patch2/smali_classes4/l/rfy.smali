.class public final synthetic Ll/rfy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tfy;

.field public final synthetic b:Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;


# direct methods
.method public synthetic constructor <init>(Ll/tfy;Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rfy;->a:Ll/tfy;

    iput-object p2, p0, Ll/rfy;->b:Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rfy;->a:Ll/tfy;

    iget-object p0, p0, Ll/rfy;->b:Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;

    check-cast p1, Landroid/view/View;

    invoke-static {v0, p0, p1}, Ll/tfy;->E(Ll/tfy;Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;Landroid/view/View;)V

    return-void
.end method
