.class public Ll/uk50;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/uk50$a;
    }
.end annotation


# static fields
.field public static d:Ll/uk50;


# instance fields
.field public a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/uk50$a;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/c4k0;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Lcom/p1/mobile/putong/oms/OmsBaseRender;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/uk50;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/uk50;->b:Ljava/util/ArrayList;

    .line 17
    .line 18
    new-instance v0, Ljava/util/Stack;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/uk50;->c:Ljava/util/Stack;

    .line 24
    .line 25
    return-void
.end method

.method public static f()Ll/uk50;
    .locals 2

    .line 1
    sget-object v0, Ll/uk50;->d:Ll/uk50;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/uk50;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/uk50;->d:Ll/uk50;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/uk50;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/uk50;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/uk50;->d:Ll/uk50;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/uk50;->d:Ll/uk50;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/String;)Lcom/p1/mobile/putong/app/PutongAct;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uk50;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/uk50$a;

    .line 8
    .line 9
    iget-object v0, v0, Ll/uk50$a;->b:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object p0, p0, Ll/uk50;->a:Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ll/uk50$a;

    .line 22
    .line 23
    iget-object p0, p0, Ll/uk50$a;->b:Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 30
    .line 31
    return-object p0
.end method

.method public b()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/c4k0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/uk50;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uk50;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uk50;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e(Ljava/lang/String;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uk50;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/uk50$a;

    .line 8
    .line 9
    iget-object p0, p0, Ll/uk50$a;->a:Landroid/view/View;

    .line 10
    .line 11
    return-object p0
.end method

.method public g(Ljava/lang/String;)Lcom/p1/mobile/putong/oms/OmsBaseRender;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/uk50;->c:Ljava/util/Stack;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public h()Lcom/p1/mobile/putong/oms/OmsBaseRender;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uk50;->c:Ljava/util/Stack;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/uk50;->c:Ljava/util/Stack;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 18
    .line 19
    return-object p0
.end method

.method public i()Lcom/p1/mobile/putong/oms/OmsBaseRender;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uk50;->c:Ljava/util/Stack;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/uk50;->c:Ljava/util/Stack;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 18
    .line 19
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/oms/OmsBaseRender;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uk50;->c:Ljava/util/Stack;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/c4k0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/uk50;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uk50;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Ljava/lang/String;Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uk50;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/uk50$a;

    .line 8
    .line 9
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/uk50$a;->b:Ljava/lang/ref/WeakReference;

    .line 15
    .line 16
    return-void
.end method

.method public n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/OMSDialogInfo;)Z
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/OMSDialogInfo;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz p2, :cond_3

    .line 8
    .line 9
    iget-object v2, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 10
    .line 11
    const-string v3, "morph"

    .line 12
    .line 13
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->R()V

    .line 21
    .line 22
    .line 23
    iget-object v2, v0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->i:Landroid/view/View;

    .line 24
    .line 25
    if-eqz v2, :cond_3

    .line 26
    .line 27
    iget-boolean v2, v0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->h:Z

    .line 28
    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    iget-object v1, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSDialogContent;->morph:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 37
    .line 38
    const-string v2, "fullScreen"

    .line 39
    .line 40
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    const/4 v2, 0x1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    new-instance v1, Ll/uk50$a;

    .line 48
    .line 49
    invoke-direct {v1}, Ll/uk50$a;-><init>()V

    .line 50
    .line 51
    .line 52
    iget-object v3, v0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->i:Landroid/view/View;

    .line 53
    .line 54
    iput-object v3, v1, Ll/uk50$a;->a:Landroid/view/View;

    .line 55
    .line 56
    iget-object p0, p0, Ll/uk50;->a:Ljava/util/HashMap;

    .line 57
    .line 58
    iget-object v3, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    iput-boolean v2, v0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->j:Z

    .line 64
    .line 65
    iget-object p0, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 68
    .line 69
    iget-boolean p2, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->cancelAble:Z

    .line 70
    .line 71
    invoke-static {p1, p0, v0, p2}, Lcom/p1/mobile/putong/ui/oms/OmsPageAct;->Z1(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/data/OmsMerCuryData;Z)Landroid/content/Intent;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 76
    .line 77
    .line 78
    return v2

    .line 79
    :cond_2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->c0()V

    .line 80
    .line 81
    .line 82
    return v2

    .line 83
    :cond_3
    :goto_0
    return v1
.end method
