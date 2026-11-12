.class public final Lns5;
.super Lk73;
.source "SourceFile"


# instance fields
.field public final g:Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;

.field public final h:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lorg/chromium/content_public/browser/WebContents;Landroid/view/ViewGroup;Ljs5;Lg1j;Ljv0;Lwln;)V
    .registers 13

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    invoke-direct/range {v0 .. v5}, Lk73;-><init>(Landroid/view/ViewGroup;Ljs5;Lg1j;Ljv0;Lwln;)V

    new-instance p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;

    invoke-direct {p0, p1, v0}, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;-><init>(Lorg/chromium/content_public/browser/WebContents;Lns5;)V

    iput-object p0, v0, Lns5;->g:Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iput-object p0, v0, Lns5;->h:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final t(Lge5;)V
    .registers 6

    iget-object p0, p0, Lns5;->g:Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;

    iget-object v0, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->f:Lge5;

    if-nez v0, :cond_19

    iget-wide v0, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->c:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_13

    const/4 p0, 0x0

    invoke-virtual {p1, p0, p0}, Lge5;->p(Ljava/lang/String;[B)V

    return-void

    :cond_13
    iput-object p1, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->f:Lge5;

    invoke-static {v0, v1}, LJ/N;->M77a30vc(J)V

    return-void

    :cond_19
    new-instance v1, Lge5;

    const/4 v2, 0x2

    invoke-direct {v1, v0, p1, v2}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->f:Lge5;

    return-void
.end method

.method public final u(Lge5;)V
    .registers 6

    iget-object p0, p0, Lns5;->g:Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;

    iget-object v0, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->e:Lge5;

    if-nez v0, :cond_19

    iget-wide v0, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->c:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_13

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Lge5;->n(Ljava/lang/String;)V

    return-void

    :cond_13
    iput-object p1, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->e:Lge5;

    invoke-static {v0, v1}, LJ/N;->MC2MvdYg(J)V

    return-void

    :cond_19
    new-instance v1, Lge5;

    const/4 v2, 0x3

    invoke-direct {v1, v0, p1, v2}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->e:Lge5;

    return-void
.end method

.method public final v(ILks5;Lls5;)V
    .registers 6

    iget-object p0, p0, Lns5;->g:Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;

    iget-object v0, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->a:Ljava/util/ArrayDeque;

    new-instance v1, Lms5;

    invoke-direct {v1, p1, p2, p3}, Lms5;-><init>(ILks5;Lls5;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->d:Lms5;

    if-nez p1, :cond_13

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->a()V

    :cond_13
    return-void
.end method

.method public final y(Lqs5;Z)Z
    .registers 7

    iget-object v0, p0, Lns5;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_7
    if-ge v2, v1, :cond_19

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Los5;

    invoke-virtual {v3, p1, p2}, Lk73;->y(Lqs5;Z)Z

    move-result v3

    if-eqz v3, :cond_7

    const/4 p0, 0x1

    return p0

    :cond_19
    invoke-super {p0, p1, p2}, Lk73;->y(Lqs5;Z)Z

    move-result p0

    return p0
.end method
