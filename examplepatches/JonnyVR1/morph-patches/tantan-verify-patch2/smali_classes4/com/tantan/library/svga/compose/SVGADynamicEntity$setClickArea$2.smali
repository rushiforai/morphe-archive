.class public final Lcom/tantan/library/svga/compose/SVGADynamicEntity$setClickArea$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/compose/SVGADynamicEntity$IClickAreaListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setClickArea(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J0\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u00072\u0006\u0010\t\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u0007H\u0016\u00a8\u0006\u000b"
    }
    d2 = {
        "com/tantan/library/svga/compose/SVGADynamicEntity$setClickArea$2",
        "Lcom/tantan/library/svga/compose/SVGADynamicEntity$IClickAreaListener;",
        "onResponseArea",
        "",
        "key",
        "",
        "x0",
        "",
        "y0",
        "x1",
        "y1",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantan/library/svga/compose/SVGADynamicEntity;


# direct methods
.method public constructor <init>(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/SVGADynamicEntity$setClickArea$2;->this$0:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onResponseArea(Ljava/lang/String;IIII)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantan/library/svga/compose/SVGADynamicEntity$setClickArea$2;->this$0:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->getMClickMap$svga_lib_release()Ljava/util/HashMap;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    filled-new-array {p2, p3, p4, p5}, [I

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, [I

    .line 29
    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    aput p2, p0, p1

    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    aput p3, p0, p1

    .line 37
    .line 38
    const/4 p1, 0x2

    .line 39
    aput p4, p0, p1

    .line 40
    .line 41
    const/4 p1, 0x3

    .line 42
    aput p5, p0, p1

    .line 43
    .line 44
    :cond_1
    return-void
.end method
