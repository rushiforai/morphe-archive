.class public Ll/uih0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/uih0;->j1(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/b;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

.field public final synthetic c:Ll/uih0;


# direct methods
.method public constructor <init>(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/uih0$c;->c:Ll/uih0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/uih0$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    iput-object p3, p0, Ll/uih0$c;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/uih0$c;->c:Ll/uih0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/uih0$c;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    iget-object p0, p0, Ll/uih0$c;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->R:Landroid/view/ViewStub;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->Y()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v0, v1, p0, v2, v3}, Ll/uih0;->r1(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Landroid/view/ViewStub;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
