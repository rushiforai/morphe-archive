.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Landroid/content/Context;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/bhf;

.field public d:Ljava/lang/String;

.field public e:Landroidx/recyclerview/widget/RecyclerView;

.field public f:Ll/x20;

.field public g:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/dhf;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/y20;Ll/x20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->b:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->a:Landroid/content/Context;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->g:Ll/y20;

    .line 14
    .line 15
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->f:Ll/x20;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->e(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->d(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->h:Ll/dhf;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic d(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->d:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->g:Ll/y20;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic e(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->f:Ll/x20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public f(Ljava/util/List;Ljava/lang/String;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->b:Ljava/util/List;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->c:Ll/bhf;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/bhf;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->a:Landroid/content/Context;

    .line 10
    .line 11
    new-instance v2, Ll/phf;

    .line 12
    .line 13
    invoke-direct {v2, p0}, Ll/phf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v1, v2}, Ll/bhf;-><init>(Landroid/content/Context;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->c:Ll/bhf;

    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->c:Ll/bhf;

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2, p3}, Ll/bhf;->I(Ljava/util/List;Ljava/lang/String;Ljava/util/Map;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public g(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    return-void
.end method

.method public h()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/dhf;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->a:Landroid/content/Context;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/dhf;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->h:Ll/dhf;

    .line 13
    .line 14
    new-instance v1, Ll/ohf;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/ohf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->h:Ll/dhf;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->c:Ll/bhf;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/dhf;->t(Ll/bhf;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->h:Ll/dhf;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/dhf;->show()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomHomeTownTypeFrag$a;->c:Ll/bhf;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
