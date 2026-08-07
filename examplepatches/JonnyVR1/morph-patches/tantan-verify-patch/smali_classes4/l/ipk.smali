.class public final synthetic Ll/ipk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatGroup;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ipk;->a:Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;

    iput-object p2, p0, Ll/ipk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iput-object p3, p0, Ll/ipk;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/ipk;->d:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ipk;->a:Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;

    iget-object v1, p0, Ll/ipk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iget-object v2, p0, Ll/ipk;->c:Ljava/lang/String;

    iget-boolean p0, p0, Ll/ipk;->d:Z

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;->b(Lcom/p1/mobile/putong/core/newui/group/GroupSuggestItemView;Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/lang/String;ZLandroid/view/View;)V

    return-void
.end method
