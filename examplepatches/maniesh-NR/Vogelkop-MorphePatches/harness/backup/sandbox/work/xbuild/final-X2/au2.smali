.class public final Lau2;
.super Lygc;
.source "SourceFile"

# interfaces
.implements Ljvk;


# static fields
.field public static final f:Lcs;


# instance fields
.field public final b:Lwth;

.field public final c:Lw4g;

.field public final d:Lflb;

.field public final e:Lmvk;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lcs;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lcs;-><init>(B)V

    sput-object v0, Lau2;->f:Lcs;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lwth;Lw4g;)V
    .registers 5

    sget-object v0, Lau2;->f:Lcs;

    invoke-direct {p0, v0}, Lygc;-><init>(Lgyg;)V

    iput-object p2, p0, Lau2;->b:Lwth;

    iput-object p3, p0, Lau2;->c:Lw4g;

    new-instance p2, Lnvk;

    invoke-direct {p2, p1, p0}, Lnvk;-><init>(Landroid/content/Context;Ljvk;)V

    new-instance p1, Lflb;

    invoke-direct {p1, p2}, Lflb;-><init>(Lblb;)V

    iput-object p1, p0, Lau2;->d:Lflb;

    const p1, 0x7f140567

    invoke-static {p1}, Lnvk;->v(I)Lmvk;

    move-result-object p1

    iput-object p1, p0, Lau2;->e:Lmvk;

    return-void
.end method


# virtual methods
.method public final h(Landroidx/recyclerview/widget/i;[Lhvk;)V
    .registers 3

    const/4 p1, 0x0

    iget-object p0, p0, Lau2;->e:Lmvk;

    aput-object p0, p2, p1

    const/4 p1, 0x1

    aput-object p0, p2, p1

    return-void
.end method

.method public final k(Landroidx/recyclerview/widget/i;Lhvk;)V
    .registers 8

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result p1

    iget-object p2, p0, Lygc;->a:Lxd2;

    iget-object p2, p2, Lxd2;->f:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lw3g;

    new-instance v0, Lgv;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lgv;-><init>(Ljava/lang/Object;IB)V

    iget-object p0, p0, Lau2;->b:Lwth;

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Leu2;

    invoke-virtual {p0}, Leu2;->H0()Lhu2;

    move-result-object p1

    iget-object p0, p0, Leu2;->w:Lua7;

    iget-object v1, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v1, Lgjm;

    invoke-virtual {p0}, Lua7;->p()Ln37;

    move-result-object p0

    invoke-interface {p0}, Ln37;->getId()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {v1, p0}, Lgjm;->a(Ljava/lang/Class;)Loje;

    move-result-object p0

    iget-object v1, p1, Lhu2;->b:Lgjm;

    new-instance v2, La27;

    iget-object v3, p2, Lw3g;->c:Ljava/lang/String;

    invoke-direct {v2, v3}, La27;-><init>(Ljava/lang/String;)V

    new-instance v3, Lf9;

    const/16 v4, 0xa

    invoke-direct {v3, p1, p2, v0, v4}, Lf9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p1, Lug;

    const/16 p2, 0x9

    invoke-direct {p1, v3, p2}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, v2, p0, p1}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    return-void
.end method

.method public final n(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    iget-object p0, p0, Lau2;->d:Lflb;

    invoke-virtual {p0, p1}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 6

    check-cast p1, Lzt2;

    iget-object p0, p0, Lygc;->a:Lxd2;

    iget-object p0, p0, Lxd2;->f:Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lw3g;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p2, p0, Lw3g;->a:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    iput-object p2, p1, Lzt2;->f:Ljava/lang/Integer;

    iget-object p2, p0, Lw3g;->b:Lorg/chromium/url/GURL;

    iget-object p2, p2, Lorg/chromium/url/GURL;->a:Ljava/lang/String;

    iput-object p2, p1, Lzt2;->g:Ljava/lang/String;

    iget-object p2, p0, Lw3g;->c:Ljava/lang/String;

    iput-object p2, p1, Lzt2;->h:Ljava/lang/String;

    new-instance v0, Li4g;

    iget-object v1, p1, Lzt2;->d:Lw4g;

    iget v2, p1, Lzt2;->e:I

    invoke-direct {v0, v1, p0, v2, p1}, Li4g;-><init>(Lw4g;Lw3g;ILh4g;)V

    iget-object v0, p1, Lzt2;->b:Ljt;

    iget-object v0, v0, Ljt;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v1, Lqxh;

    invoke-direct {v1, p2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget-object p2, p0, Lw3g;->f:Ljava/lang/String;

    new-instance v1, Lqxh;

    invoke-direct {v1, p2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    new-instance p2, Lyt2;

    const/4 v1, 0x0

    invoke-direct {p2, p1, p0, v1}, Lyt2;-><init>(Lzt2;Lw3g;B)V

    invoke-virtual {v0, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lyt2;

    const/4 v1, 0x1

    invoke-direct {p2, p1, p0, v1}, Lyt2;-><init>(Lzt2;Lw3g;B)V

    invoke-virtual {v0, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 4

    new-instance p2, Lzt2;

    iget-object v0, p0, Lau2;->b:Lwth;

    iget-object p0, p0, Lau2;->c:Lw4g;

    invoke-direct {p2, p1, v0, p0}, Lzt2;-><init>(Landroid/view/ViewGroup;Lwth;Lw4g;)V

    return-object p2
.end method

.method public final onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    iget-object p0, p0, Lau2;->d:Lflb;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method
