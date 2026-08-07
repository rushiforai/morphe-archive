.class public final synthetic Lcom/momo/xeengine/gift/n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/gift/GiftPlayer;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/gift/GiftPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/gift/n;->a:Lcom/momo/xeengine/gift/GiftPlayer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/n;->a:Lcom/momo/xeengine/gift/GiftPlayer;

    invoke-static {p0}, Lcom/momo/xeengine/gift/GiftPlayer$2;->b(Lcom/momo/xeengine/gift/GiftPlayer;)V

    return-void
.end method
