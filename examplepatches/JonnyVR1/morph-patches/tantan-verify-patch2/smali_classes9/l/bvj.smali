.class public final synthetic Ll/bvj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;ILjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bvj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    iput p2, p0, Ll/bvj;->b:I

    iput-object p3, p0, Ll/bvj;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bvj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    iget v1, p0, Ll/bvj;->b:I

    iget-object p0, p0, Ll/bvj;->c:Ljava/lang/Object;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;->h0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;ILjava/lang/Object;)V

    return-void
.end method
