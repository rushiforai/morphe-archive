.class public Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->S(Ljava/util/List;Ll/dyy;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/dyy;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Ll/dyy;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$d;->b:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$d;->a:Ll/dyy;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rxy;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$d;->a:Ll/dyy;

    .line 8
    .line 9
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$d;->a:Ll/dyy;

    .line 23
    .line 24
    invoke-interface {p0, v0, p1, v2}, Ll/dyy;->b(Ll/rxy;Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    const/4 p0, 0x2

    .line 28
    invoke-virtual {v0, p0}, Ll/rxy;->e(I)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    xor-int/2addr p0, v2

    .line 33
    return p0
.end method
