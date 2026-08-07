.class public final synthetic Lcom/momo/xeengine/gift/m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/gift/GiftPlayer$1;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/momo/xeengine/gift/GiftPlayerEventListener;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/gift/GiftPlayer$1;Ljava/lang/String;Lcom/momo/xeengine/gift/GiftPlayerEventListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/gift/m;->a:Lcom/momo/xeengine/gift/GiftPlayer$1;

    iput-object p2, p0, Lcom/momo/xeengine/gift/m;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/momo/xeengine/gift/m;->c:Lcom/momo/xeengine/gift/GiftPlayerEventListener;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/m;->a:Lcom/momo/xeengine/gift/GiftPlayer$1;

    iget-object v1, p0, Lcom/momo/xeengine/gift/m;->b:Ljava/lang/String;

    iget-object p0, p0, Lcom/momo/xeengine/gift/m;->c:Lcom/momo/xeengine/gift/GiftPlayerEventListener;

    invoke-static {v0, v1, p0}, Lcom/momo/xeengine/gift/GiftPlayer$1;->c(Lcom/momo/xeengine/gift/GiftPlayer$1;Ljava/lang/String;Lcom/momo/xeengine/gift/GiftPlayerEventListener;)V

    return-void
.end method
