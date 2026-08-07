.class public final synthetic Ll/s440;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/b;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s440;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    iput-object p2, p0, Ll/s440;->b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/s440;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    iget-object v1, p0, Ll/s440;->b:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    move-object v2, p1

    check-cast v2, Landroid/graphics/drawable/Drawable;

    move-object v3, p2

    check-cast v3, Ljava/lang/CharSequence;

    move-object v4, p3

    check-cast v4, Ljava/lang/Integer;

    move-object v5, p4

    check-cast v5, Ljava/lang/Integer;

    move-object v6, p5

    check-cast v6, Ljava/lang/Integer;

    move-object v7, p6

    check-cast v7, Ljava/lang/Boolean;

    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/core/newui/home/b;->i0(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method
