.class public final synthetic Ll/s6v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/VDraweeView;

.field public final synthetic b:Lv/VDraweeView;

.field public final synthetic c:Lv/VDraweeView;


# direct methods
.method public synthetic constructor <init>(Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s6v;->a:Lv/VDraweeView;

    iput-object p2, p0, Ll/s6v;->b:Lv/VDraweeView;

    iput-object p3, p0, Ll/s6v;->c:Lv/VDraweeView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s6v;->a:Lv/VDraweeView;

    iget-object v1, p0, Ll/s6v;->b:Lv/VDraweeView;

    iget-object p0, p0, Ll/s6v;->c:Lv/VDraweeView;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/honorgift/LiveVoiceHonorCardView;->a(Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;)V

    return-void
.end method
