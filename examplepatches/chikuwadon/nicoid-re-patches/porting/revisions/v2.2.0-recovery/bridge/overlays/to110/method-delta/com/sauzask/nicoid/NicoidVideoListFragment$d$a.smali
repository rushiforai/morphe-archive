.class public Lcom/sauzask/nicoid/NicoidVideoListFragment$d$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a(Ljava/util/HashMap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidVideoListFragment$d;


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/NicoidVideoListFragment$d;)V
    .registers 2

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d$a;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment$d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    invoke-static {p3}, Le/e/a/PlaylistSort219;->remoteId(I)I

    move-result p3

    const/4 p1, 0x6

    const/4 p2, 0x7

    const/4 p4, 0x4

    const/4 p5, 0x5

    const/16 v0, 0x8

    const/16 v1, 0x9

    if-nez p3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x1

    if-ne p3, v2, :cond_1

    const/4 p1, 0x7

    goto :goto_0

    :cond_1
    const/4 v2, 0x2

    if-ne p3, v2, :cond_2

    const/4 p1, 0x4

    goto :goto_0

    :cond_2
    const/4 v2, 0x3

    if-ne p3, v2, :cond_3

    const/4 p1, 0x5

    goto :goto_0

    :cond_3
    if-ne p3, p4, :cond_4

    const/16 p1, 0x8

    goto :goto_0

    :cond_4
    if-ne p3, p5, :cond_5

    const/16 p1, 0x9

    goto :goto_0

    :cond_5
    if-ne p3, p1, :cond_6

    const/16 p1, 0xc

    goto :goto_0

    :cond_6
    if-ne p3, p2, :cond_7

    const/16 p1, 0xd

    goto :goto_0

    :cond_7
    if-ne p3, v0, :cond_8

    const/16 p1, 0xe

    goto :goto_0

    :cond_8
    if-ne p3, v1, :cond_9

    const/16 p1, 0xf

    goto :goto_0

    :cond_9
    const/16 p1, 0xa

    if-ne p3, p1, :cond_a

    const/16 p1, 0x10

    goto :goto_0

    :cond_a
    const/16 p1, 0xb

    if-ne p3, p1, :cond_b

    const/16 p1, 0x11

    goto :goto_0

    :cond_b
    add-int/lit8 p1, p3, 0x6

    :goto_0
    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d$a;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment$d;

    iget-object p2, p2, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    invoke-static {p2, p1}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a(Lcom/sauzask/nicoid/NicoidVideoListFragment;I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d$a;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment$d;

    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 1
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->x0:Landroid/content/SharedPreferences;

    .line 2
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "sortlast"

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    return-void
.end method
