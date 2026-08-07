.class public final synthetic Ll/vq90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/xq90;

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Ll/xq90;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vq90;->a:Ll/xq90;

    iput-object p2, p0, Ll/vq90;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iput-object p3, p0, Ll/vq90;->c:Lcom/p1/mobile/putong/data/User;

    iput-object p4, p0, Ll/vq90;->d:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vq90;->a:Ll/xq90;

    iget-object v1, p0, Ll/vq90;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iget-object v2, p0, Ll/vq90;->c:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/vq90;->d:Lkotlin/jvm/functions/Function1;

    invoke-static {v0, v1, v2, p0, p1}, Ll/xq90;->D(Ll/xq90;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;Lkotlin/jvm/functions/Function1;Landroid/view/View;)V

    return-void
.end method
