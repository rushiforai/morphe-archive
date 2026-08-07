.class public final synthetic Ll/mp1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/VDraweeView;


# direct methods
.method public synthetic constructor <init>(Lv/VDraweeView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mp1;->a:Lv/VDraweeView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mp1;->a:Lv/VDraweeView;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->d(Lv/VDraweeView;)V

    return-void
.end method
