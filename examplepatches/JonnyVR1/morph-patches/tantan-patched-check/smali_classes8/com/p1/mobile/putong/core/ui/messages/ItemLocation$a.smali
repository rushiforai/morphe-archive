.class public Lcom/p1/mobile/putong/core/ui/messages/ItemLocation$a;
.super Ll/li2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->A(Lcom/p1/mobile/putong/core/data/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/li2<",
        "Ll/qim;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation$a;->b:Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/li2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic b(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    check-cast p2, Ll/qim;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation$a;->i(Ljava/lang/String;Ll/qim;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation$a;->b:Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->b(Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;)Lv/VImage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic e(Ljava/lang/String;Ljava/lang/Object;Landroid/graphics/drawable/Animatable;)V
    .locals 0
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/drawable/Animatable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    check-cast p2, Ll/qim;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation$a;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 0
    .param p2    # Ll/qim;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/drawable/Animatable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation$a;->b:Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;->b(Lcom/p1/mobile/putong/core/ui/messages/ItemLocation;)Lv/VImage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public i(Ljava/lang/String;Ll/qim;)V
    .locals 0
    .param p2    # Ll/qim;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method
