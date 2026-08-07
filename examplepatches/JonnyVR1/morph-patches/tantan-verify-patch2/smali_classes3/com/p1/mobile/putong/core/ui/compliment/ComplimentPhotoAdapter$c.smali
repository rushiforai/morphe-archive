.class public final Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0086\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u001d\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0015\u0010\r\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\r\u0010\u000eR\u0014\u0010\u0012\u001a\u00020\u000f8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010\u0011R\u0014\u0010\u0014\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010\u0013\u00a8\u0006\u0015"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;",
        "Landroidx/recyclerview/widget/RecyclerView$e0;",
        "Landroid/view/View;",
        "itemView",
        "<init>",
        "(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;Landroid/view/View;)V",
        "Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$b;",
        "item",
        "",
        "isSelected",
        "",
        "b",
        "(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$b;Z)V",
        "c",
        "(Z)V",
        "Lv/AutoVDraweeView;",
        "a",
        "Lv/AutoVDraweeView;",
        "photoView",
        "Landroid/view/View;",
        "selectedBorder",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Lv/AutoVDraweeView;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Landroid/view/View;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;Landroid/view/View;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;->c:Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;

    .line 5
    .line 6
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    sget p1, Ll/adc0;->y9:I

    .line 10
    .line 11
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    check-cast p1, Lv/AutoVDraweeView;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;->a:Lv/AutoVDraweeView;

    .line 21
    .line 22
    sget p1, Ll/adc0;->Yb:I

    .line 23
    .line 24
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;->b:Landroid/view/View;

    .line 32
    .line 33
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->z(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;)Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$e0;->getAdapterPosition()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final b(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$b;Z)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$b;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;->a:Lv/AutoVDraweeView;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$b;->a()Lcom/p1/mobile/putong/data/Picture;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {v0, v1, p1, v2}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;->c(Z)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 24
    .line 25
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;->c:Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;

    .line 26
    .line 27
    new-instance v0, Ll/as5;

    .line 28
    .line 29
    invoke-direct {v0, p2, p0}, Ll/as5;-><init>(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final c(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;->c:Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->y(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;)Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$TabMode;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c$a;->a:[I

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    aget p1, v0, p1

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    if-eq p1, v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    if-ne p1, v1, :cond_0

    .line 22
    .line 23
    sget p1, Ll/dbc0;->h1:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-static {}, Ll/nbr;->a()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    sget p1, Ll/dbc0;->g1:I

    .line 31
    .line 32
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;->b:Landroid/view/View;

    .line 33
    .line 34
    invoke-virtual {v1, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;->b:Landroid/view/View;

    .line 38
    .line 39
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;->b:Landroid/view/View;

    .line 44
    .line 45
    const/4 p1, 0x0

    .line 46
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    return-void
.end method
