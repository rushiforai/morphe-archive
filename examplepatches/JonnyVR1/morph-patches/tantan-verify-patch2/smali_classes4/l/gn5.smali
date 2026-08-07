.class public final synthetic Ll/gn5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;Ljava/util/List;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gn5;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

    iput-object p2, p0, Ll/gn5;->b:Ljava/util/List;

    iput-boolean p3, p0, Ll/gn5;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gn5;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

    iget-object v1, p0, Ll/gn5;->b:Ljava/util/List;

    iget-boolean p0, p0, Ll/gn5;->c:Z

    check-cast p1, Landroid/view/View;

    check-cast p2, Ljava/lang/Integer;

    invoke-static {v0, v1, p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->c(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;Ljava/util/List;ZLandroid/view/View;Ljava/lang/Integer;)V

    return-void
.end method
