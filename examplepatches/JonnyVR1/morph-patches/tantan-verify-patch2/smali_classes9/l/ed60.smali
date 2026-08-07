.class public final synthetic Ll/ed60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gd60;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/jjs;

.field public final synthetic d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Ll/gd60;Lcom/p1/mobile/android/app/Act;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ed60;->a:Ll/gd60;

    iput-object p2, p0, Ll/ed60;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/ed60;->c:Ll/jjs;

    iput-object p4, p0, Ll/ed60;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    iput p5, p0, Ll/ed60;->e:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ed60;->a:Ll/gd60;

    iget-object v1, p0, Ll/ed60;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/ed60;->c:Ll/jjs;

    iget-object v3, p0, Ll/ed60;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    iget v4, p0, Ll/ed60;->e:I

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;

    invoke-static/range {v0 .. v5}, Ll/gd60;->a(Ll/gd60;Lcom/p1/mobile/android/app/Act;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;)V

    return-void
.end method
