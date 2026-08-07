.class public Ll/byw$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/byw;->d(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/byw;


# direct methods
.method public constructor <init>(Ll/byw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/byw$a;->a:Ll/byw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 1
    instance-of p0, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 6
    .line 7
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->t:Ll/x20;

    .line 8
    .line 9
    invoke-interface {p0}, Ll/x20;->call()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
