.class Le/e/a/NicoliveActivity$2;
.super Ljava/lang/Object;
.source "NicoliveActivity.java"

# interfaces
.implements Le/e/a/NicoliveBrowser$Result;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/NicoliveActivity;->load()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Le/e/a/NicoliveActivity;

.field private final synthetic val$token:I


# direct methods
.method constructor <init>(Le/e/a/NicoliveActivity;I)V
    .registers 3

    .line 538
    iput-object p1, p0, Le/e/a/NicoliveActivity$2;->this$0:Le/e/a/NicoliveActivity;

    iput p2, p0, Le/e/a/NicoliveActivity$2;->val$token:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/String;)V
    .registers 6

    .line 540
    iget-object v0, p0, Le/e/a/NicoliveActivity$2;->this$0:Le/e/a/NicoliveActivity;

    iget v1, p0, Le/e/a/NicoliveActivity$2;->val$token:I

    # invokes: Le/e/a/NicoliveActivity;->currentLoad(I)Z
    invoke-static {v0, v1}, Le/e/a/NicoliveActivity;->access$2(Le/e/a/NicoliveActivity;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 542
    :cond_0
    :try_start_0
    iget-object v0, p0, Le/e/a/NicoliveActivity$2;->this$0:Le/e/a/NicoliveActivity;

    iget-object v0, v0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 543
    invoke-static {p1}, Le/e/a/NicoliveData;->listings(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_3

    .line 544
    iget-object p1, p0, Le/e/a/NicoliveActivity$2;->this$0:Le/e/a/NicoliveActivity;

    iget-object p1, p1, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2

    const-string/jumbo p1, "\u653e\u9001\u4e2d\u306e\u756a\u7d44\u304c\u898b\u3064\u304b\u308a\u307e\u305b\u3093"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    iget-object v0, p0, Le/e/a/NicoliveActivity$2;->this$0:Le/e/a/NicoliveActivity;

    const-string/jumbo v1, "\u653e\u9001\u4e2d "

    const-string v2, "Live "

    const-string/jumbo v3, "\u76f4\u64ad\u4e2d "

    invoke-static {v0, v1, v2, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Le/e/a/NicoliveActivity$2;->this$0:Le/e/a/NicoliveActivity;

    iget-object v0, v0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    iget-object v0, p0, Le/e/a/NicoliveActivity$2;->this$0:Le/e/a/NicoliveActivity;

    const-string v1, "\u4ef6 / "

    const-string v2, " items / "

    const-string v3, " \u500b\u7bc0\u76ee\uff0f"

    invoke-static {v0, v1, v2, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Le/e/a/NicoliveActivity$2;->this$0:Le/e/a/NicoliveActivity;

    iget-object v0, v0, Le/e/a/NicoliveActivity;->query:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 545
    :goto_1
    iget-object v0, p0, Le/e/a/NicoliveActivity$2;->this$0:Le/e/a/NicoliveActivity;

    # invokes: Le/e/a/NicoliveActivity;->showResults(Ljava/lang/String;)V
    invoke-static {v0, p1}, Le/e/a/NicoliveActivity;->access$3(Le/e/a/NicoliveActivity;Ljava/lang/String;)V

    return-void

    .line 543
    :cond_3
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/NicoliveData$Program;

    invoke-virtual {v0}, Le/e/a/NicoliveData$Program;->onAir()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Le/e/a/NicoliveActivity$2;->this$0:Le/e/a/NicoliveActivity;

    iget-object v1, v1, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 546
    :catch_0
    invoke-virtual {p0}, Le/e/a/NicoliveActivity$2;->error()V

    return-void
.end method

.method public error()V
    .registers 3

    .line 548
    iget-object v0, p0, Le/e/a/NicoliveActivity$2;->this$0:Le/e/a/NicoliveActivity;

    iget v1, p0, Le/e/a/NicoliveActivity$2;->val$token:I

    # invokes: Le/e/a/NicoliveActivity;->currentLoad(I)Z
    invoke-static {v0, v1}, Le/e/a/NicoliveActivity;->access$2(Le/e/a/NicoliveActivity;I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Le/e/a/NicoliveActivity$2;->this$0:Le/e/a/NicoliveActivity;

    const-string v0, "\u4e00\u89a7\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    # invokes: Le/e/a/NicoliveActivity;->showResults(Ljava/lang/String;)V
    invoke-static {p0, v0}, Le/e/a/NicoliveActivity;->access$3(Le/e/a/NicoliveActivity;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
