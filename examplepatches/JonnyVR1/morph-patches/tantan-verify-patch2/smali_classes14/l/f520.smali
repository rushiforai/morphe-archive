.class public final synthetic Ll/f520;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f520;->a:Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;

    iput p2, p0, Ll/f520;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f520;->a:Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;

    iget p0, p0, Ll/f520;->b:I

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->h0(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;I)V

    return-void
.end method
