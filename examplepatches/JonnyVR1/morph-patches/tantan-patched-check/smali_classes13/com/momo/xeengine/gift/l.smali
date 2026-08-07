.class public final synthetic Lcom/momo/xeengine/gift/l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/gift/GiftPlayer$1;

.field public final synthetic b:Lcom/momo/xeengine/gift/GiftProgress;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/gift/GiftPlayer$1;Lcom/momo/xeengine/gift/GiftProgress;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/gift/l;->a:Lcom/momo/xeengine/gift/GiftPlayer$1;

    iput-object p2, p0, Lcom/momo/xeengine/gift/l;->b:Lcom/momo/xeengine/gift/GiftProgress;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/l;->a:Lcom/momo/xeengine/gift/GiftPlayer$1;

    iget-object p0, p0, Lcom/momo/xeengine/gift/l;->b:Lcom/momo/xeengine/gift/GiftProgress;

    invoke-static {v0, p0}, Lcom/momo/xeengine/gift/GiftPlayer$1;->e(Lcom/momo/xeengine/gift/GiftPlayer$1;Lcom/momo/xeengine/gift/GiftProgress;)V

    return-void
.end method
