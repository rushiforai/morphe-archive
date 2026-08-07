.class public final synthetic Ll/ujs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

.field public final synthetic b:Z

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ZJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ujs;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    iput-boolean p2, p0, Ll/ujs;->b:Z

    iput-wide p3, p0, Ll/ujs;->c:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ujs;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    iget-boolean v1, p0, Ll/ujs;->b:Z

    iget-wide v2, p0, Ll/ujs;->c:J

    check-cast p1, Ljava/lang/Integer;

    invoke-static {v0, v1, v2, v3, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->k0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ZJLjava/lang/Integer;)V

    return-void
.end method
