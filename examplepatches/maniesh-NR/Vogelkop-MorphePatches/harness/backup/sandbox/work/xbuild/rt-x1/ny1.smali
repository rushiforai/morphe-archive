.class public final Lny1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lny1;->a:Landroid/content/Context;

    iput-object p2, p0, Lny1;->b:Lumi;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Lcom/opera/api/Callback;)V
    .registers 6

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GET_CONTENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "*/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    sget-object v1, Lu92;->e:Ljava/util/Set;

    check-cast v1, Ljava/util/Collection;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    const-string v2, "android.intent.extra.MIME_TYPES"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "android.intent.extra.LOCAL_ONLY"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    invoke-static {p1}, Loi;->d(Landroid/content/Context;)Loi;

    move-result-object v1

    new-instance v2, Lmy1;

    invoke-direct {v2, p0, p1, p2}, Lmy1;-><init>(Lny1;Landroid/content/Context;Lcom/opera/api/Callback;)V

    check-cast v1, Lhjf;

    invoke-virtual {v1, v0, v2}, Lhjf;->D(Landroid/content/Intent;Lni;)V

    return-void
.end method
