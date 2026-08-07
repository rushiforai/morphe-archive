.class public final synthetic Ll/ub6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/sj6;

.field public final synthetic c:Ljava/util/HashSet;

.field public final synthetic d:Ljava/util/HashSet;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/sj6;Ljava/util/HashSet;Ljava/util/HashSet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ub6;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/ub6;->b:Ll/sj6;

    iput-object p3, p0, Ll/ub6;->c:Ljava/util/HashSet;

    iput-object p4, p0, Ll/ub6;->d:Ljava/util/HashSet;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ub6;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/ub6;->b:Ll/sj6;

    iget-object v2, p0, Ll/ub6;->c:Ljava/util/HashSet;

    iget-object p0, p0, Ll/ub6;->d:Ljava/util/HashSet;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->g1(Ljava/lang/String;Ll/sj6;Ljava/util/HashSet;Ljava/util/HashSet;Landroid/view/View;)V

    return-void
.end method
