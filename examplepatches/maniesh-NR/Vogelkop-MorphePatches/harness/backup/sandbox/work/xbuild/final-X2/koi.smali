.class public final Lkoi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/base/Callback;


# instance fields
.field public final a:Lb7f;

.field public final b:Lfoi;

.field public c:Lcom/opera/android/browser/WebContentsWrapper;

.field public d:Landroid/view/ViewGroup;

.field public final e:Ljava/util/ArrayList;

.field public final f:Ljava/util/HashMap;

.field public g:Z


# direct methods
.method public constructor <init>(Lb7f;)V
    .registers 5

    new-instance v0, Lfoi;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lfoi;-><init>(B)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lkoi;->e:Ljava/util/ArrayList;

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lkoi;->f:Ljava/util/HashMap;

    iput-object p1, p0, Lkoi;->a:Lb7f;

    iput-object v0, p0, Lkoi;->b:Lfoi;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, p0}, Lb7f;->c(Lorg/chromium/base/Callback;)Ljava/lang/Object;

    const/4 p0, 0x0

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final b()Lcom/opera/android/browser/WebContentsWrapper;
    .registers 5

    iget-object v0, p0, Lkoi;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_8
    if-lez v1, :cond_22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/opera/android/browser/WebContentsWrapper;

    iget-object v3, p0, Lkoi;->f:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1f

    return-object v2

    :cond_1f
    add-int/lit8 v1, v1, -0x1

    goto :goto_8

    :cond_22
    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/browser/WebContentsWrapper;

    return-object p0
.end method

.method public final onResult(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Lcom/opera/android/browser/WebContentsWrapper;

    iget-object v0, p0, Lkoi;->e:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lkoi;->b()Lcom/opera/android/browser/WebContentsWrapper;

    move-result-object v0

    if-ne p1, v0, :cond_45

    iput-object p1, p0, Lkoi;->c:Lcom/opera/android/browser/WebContentsWrapper;

    iget-object v0, p0, Lkoi;->b:Lfoi;

    iget-object v1, v0, Lfoi;->a:Ljava/lang/Object;

    check-cast v1, Lioi;

    iget-object v1, v1, Lioi;->a:Lhoi;

    iput-object p1, v1, Lhoi;->b:Lcom/opera/android/browser/WebContentsWrapper;

    if-eqz p1, :cond_45

    iget-boolean v1, p0, Lkoi;->g:Z

    if-nez v1, :cond_45

    iget-object v1, p0, Lkoi;->d:Landroid/view/ViewGroup;

    if-eqz v1, :cond_2d

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lfoi;->b(Landroid/view/ViewGroup;Lioi;)V

    iput-object v2, p0, Lkoi;->d:Landroid/view/ViewGroup;

    :cond_2d
    iget-boolean v1, p1, Lcom/opera/android/browser/WebContentsWrapper;->j:Z

    if-nez v1, :cond_45

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->getView()Landroid/view/View;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, p0, Lkoi;->d:Landroid/view/ViewGroup;

    if-eqz p1, :cond_45

    check-cast p1, Landroid/view/ViewGroup;

    iget-object p0, v0, Lfoi;->a:Ljava/lang/Object;

    check-cast p0, Lioi;

    invoke-static {p1, p0}, Lfoi;->b(Landroid/view/ViewGroup;Lioi;)V

    :cond_45
    return-void
.end method
