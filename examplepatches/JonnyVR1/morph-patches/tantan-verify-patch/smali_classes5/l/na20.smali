.class public final synthetic Ll/na20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Visitor;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsItemView;

.field public final synthetic e:Ll/z920;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/Visitor;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsItemView;Ll/z920;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/na20;->a:Lcom/p1/mobile/putong/data/Visitor;

    iput-object p2, p0, Ll/na20;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/na20;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/na20;->d:Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsItemView;

    iput-object p5, p0, Ll/na20;->e:Ll/z920;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/na20;->a:Lcom/p1/mobile/putong/data/Visitor;

    iget-object v1, p0, Ll/na20;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/na20;->c:Lcom/p1/mobile/android/app/Act;

    iget-object v3, p0, Ll/na20;->d:Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsItemView;

    iget-object v4, p0, Ll/na20;->e:Ll/z920;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsItemView;->d(Lcom/p1/mobile/putong/data/Visitor;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsItemView;Ll/z920;Landroid/view/View;)V

    return-void
.end method
