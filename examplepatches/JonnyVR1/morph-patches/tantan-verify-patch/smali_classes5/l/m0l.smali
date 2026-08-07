.class public final synthetic Ll/m0l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/view/HeartView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/view/HeartView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m0l;->a:Lcom/p1/mobile/putong/core/view/HeartView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m0l;->a:Lcom/p1/mobile/putong/core/view/HeartView;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/view/HeartView;->a(Lcom/p1/mobile/putong/core/view/HeartView;Landroid/graphics/Bitmap;)V

    return-void
.end method
