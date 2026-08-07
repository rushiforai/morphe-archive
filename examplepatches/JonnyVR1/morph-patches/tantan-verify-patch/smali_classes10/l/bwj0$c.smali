.class public Ll/bwj0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bwj0;->j(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;ILjava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

.field public final synthetic b:Ll/bwj0;


# direct methods
.method public constructor <init>(Ll/bwj0;Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/bwj0$c;->b:Ll/bwj0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/bwj0$c;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/bwj0$c;->b:Ll/bwj0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/puj0;->c:Ll/ouj0;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    check-cast p1, Ll/awj0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/bwj0$c;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ll/awj0;->U3(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
