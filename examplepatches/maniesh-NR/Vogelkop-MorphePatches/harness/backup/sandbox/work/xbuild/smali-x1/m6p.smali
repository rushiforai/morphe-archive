.class public final synthetic Lm6p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhko;


# instance fields
.field public final synthetic a:Lo7p;


# direct methods
.method public synthetic constructor <init>(Lo7p;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lm6p;->a:Lo7p;

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 7

    iget-object p0, p0, Lm6p;->a:Lo7p;

    iget-object v0, p0, Lpxo;->e:Lbap;

    invoke-virtual {v0}, Lbap;->f()V

    iget-object v0, p0, Lpxo;->f:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    if-eqz v0, :cond_c7

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v2

    if-eqz v2, :cond_c7

    new-instance v2, Ld82;

    const/4 v3, 0x6

    invoke-direct {v2, v0, v3}, Ld82;-><init>(Ljava/lang/Object;B)V

    sget-object v0, Lk0l;->L:Lk0l;

    invoke-static {v2, v0}, Ly1j;->c(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lv39;

    move-result-object v0

    invoke-static {v0}, Ly1j;->g(Lkotlin/sequences/Sequence;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_bd

    const/4 v3, 0x1

    if-eq v2, v3, :cond_38

    iget-object v0, p0, Lpxo;->i:Lp7p;

    if-eqz v0, :cond_c7

    sget-object v2, Lp7p;->c:Ljava/util/LinkedHashSet;

    const/16 v2, 0x3f3

    :goto_33
    invoke-virtual {v0, v2, v1}, Lp7p;->g(ILjava/lang/String;)V

    goto/16 :goto_c7

    :cond_38
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->Z(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkko;

    iget-object v2, v0, Lkko;->c:Lkho;

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-eq v2, v0, :cond_51

    iget-object v2, p0, Lpxo;->i:Lp7p;

    if-eqz v2, :cond_51

    sget-object v4, Lp7p;->c:Ljava/util/LinkedHashSet;

    const/16 v4, 0x3f8

    invoke-virtual {v2, v4, v1}, Lp7p;->g(ILjava/lang/String;)V

    :cond_51
    iget-object v2, v0, Lkko;->c:Lkho;

    invoke-virtual {v2}, Landroid/view/View;->isShown()Z

    move-result v2

    if-nez v2, :cond_64

    iget-object v2, p0, Lpxo;->i:Lp7p;

    if-eqz v2, :cond_64

    sget-object v4, Lp7p;->c:Ljava/util/LinkedHashSet;

    const/16 v4, 0x3f4

    invoke-virtual {v2, v4, v1}, Lp7p;->g(ILjava/lang/String;)V

    :cond_64
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-eq v2, v3, :cond_8a

    iget-object v2, p0, Lpxo;->i:Lp7p;

    if-eqz v2, :cond_8a

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Ad choice view has "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " children, expected 1."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x3f5

    invoke-virtual {v2, v4, v3}, Lp7p;->g(ILjava/lang/String;)V

    :cond_8a
    iget-object v2, v0, Lkko;->b:Landroid/view/View$OnClickListener;

    iget-object v0, v0, Lkko;->a:Loep;

    if-ne v2, v0, :cond_93

    sget-object v0, Lrgo;->a:Lrgo;

    goto :goto_9a

    :cond_93
    if-nez v2, :cond_98

    sget-object v0, Lrgo;->b:Lrgo;

    goto :goto_9a

    :cond_98
    sget-object v0, Lrgo;->c:Lrgo;

    :goto_9a
    sget-object v2, Ls6p;->a:[I

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    aget v0, v2, v0

    const/4 v2, 0x2

    if-eq v0, v2, :cond_b4

    const/4 v2, 0x3

    if-ne v0, v2, :cond_c7

    iget-object v0, p0, Lpxo;->i:Lp7p;

    if-eqz v0, :cond_c7

    sget-object v2, Lp7p;->c:Ljava/util/LinkedHashSet;

    const/16 v2, 0x3f7

    :goto_b0
    invoke-virtual {v0, v2, v1}, Lp7p;->g(ILjava/lang/String;)V

    goto :goto_c7

    :cond_b4
    iget-object v0, p0, Lpxo;->i:Lp7p;

    if-eqz v0, :cond_c7

    sget-object v2, Lp7p;->c:Ljava/util/LinkedHashSet;

    const/16 v2, 0x3f6

    goto :goto_b0

    :cond_bd
    iget-object v0, p0, Lpxo;->i:Lp7p;

    if-eqz v0, :cond_c7

    sget-object v2, Lp7p;->c:Ljava/util/LinkedHashSet;

    const/16 v2, 0x3f2

    goto/16 :goto_33

    :cond_c7
    :goto_c7
    iget-object v0, p0, Lpxo;->i:Lp7p;

    if-eqz v0, :cond_d0

    sget-object v2, Lp7p;->c:Ljava/util/LinkedHashSet;

    invoke-virtual {v0, v1, v1, v1}, Lp7p;->b(Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;)V

    :cond_d0
    iget-object v0, p0, Lo7p;->m:Ligi;

    if-eqz v0, :cond_132

    iget-object v0, v0, Ligi;->b:Ljava/lang/Object;

    check-cast v0, Lksd;

    if-eqz v0, :cond_132

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v2

    if-nez v2, :cond_ec

    iget-object v0, p0, Lpxo;->i:Lp7p;

    if-eqz v0, :cond_132

    sget-object v2, Lp7p;->c:Ljava/util/LinkedHashSet;

    const/16 v2, 0x3fa

    invoke-virtual {v0, v2, v1}, Lp7p;->g(ILjava/lang/String;)V

    goto :goto_132

    :cond_ec
    iget-object v1, p0, Lpxo;->a:Landroid/content/Context;

    const/high16 v2, 0x42f00000    # 120.0f

    invoke-static {v1, v2}, Lnxg;->d(Landroid/content/Context;F)I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lt v2, v1, :cond_100

    if-ge v0, v1, :cond_132

    :cond_100
    iget-object v3, p0, Lpxo;->i:Lp7p;

    if-eqz v3, :cond_132

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "MediaView size "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v2, 0x78

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "px is below the recommended minimum "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "px (120dp)"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x3f9

    invoke-virtual {v3, v1, v0}, Lp7p;->g(ILjava/lang/String;)V

    :cond_132
    :goto_132
    iget-object v0, p0, Lpxo;->g:Lsxo;

    if-eqz v0, :cond_139

    invoke-virtual {v0}, Lsxo;->c()V

    :cond_139
    iget-object p0, p0, Lpxo;->c:Luuj;

    if-eqz p0, :cond_140

    invoke-virtual {p0}, Luuj;->c()V

    :cond_140
    return-void
.end method
