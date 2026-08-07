.class public final synthetic Ll/fn5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/MyTabTask;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;Lcom/p1/mobile/putong/core/data/MyTabTask;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fn5;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

    iput-object p2, p0, Ll/fn5;->b:Lcom/p1/mobile/putong/core/data/MyTabTask;

    iput-object p3, p0, Ll/fn5;->c:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;

    iput-boolean p4, p0, Ll/fn5;->d:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fn5;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

    iget-object v1, p0, Ll/fn5;->b:Lcom/p1/mobile/putong/core/data/MyTabTask;

    iget-object v2, p0, Ll/fn5;->c:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;

    iget-boolean p0, p0, Ll/fn5;->d:Z

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->b(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;Lcom/p1/mobile/putong/core/data/MyTabTask;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;ZLandroid/view/View;)V

    return-void
.end method
