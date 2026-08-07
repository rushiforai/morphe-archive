.class public final synthetic Lcom/momo/xeengine/gift/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/gift/GiftPlayer;

.field public final synthetic b:Lcom/momo/xeengine/gift/GiftPlayerListener;

.field public final synthetic c:Lcom/momo/xeengine/gift/GiftPlayData;

.field public final synthetic d:I

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftPlayerListener;Lcom/momo/xeengine/gift/GiftPlayData;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/gift/c;->a:Lcom/momo/xeengine/gift/GiftPlayer;

    iput-object p2, p0, Lcom/momo/xeengine/gift/c;->b:Lcom/momo/xeengine/gift/GiftPlayerListener;

    iput-object p3, p0, Lcom/momo/xeengine/gift/c;->c:Lcom/momo/xeengine/gift/GiftPlayData;

    iput p4, p0, Lcom/momo/xeengine/gift/c;->d:I

    iput-object p5, p0, Lcom/momo/xeengine/gift/c;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/c;->a:Lcom/momo/xeengine/gift/GiftPlayer;

    iget-object v1, p0, Lcom/momo/xeengine/gift/c;->b:Lcom/momo/xeengine/gift/GiftPlayerListener;

    iget-object v2, p0, Lcom/momo/xeengine/gift/c;->c:Lcom/momo/xeengine/gift/GiftPlayData;

    iget v3, p0, Lcom/momo/xeengine/gift/c;->d:I

    iget-object p0, p0, Lcom/momo/xeengine/gift/c;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/momo/xeengine/gift/GiftPlayer;->b(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftPlayerListener;Lcom/momo/xeengine/gift/GiftPlayData;ILjava/lang/String;)V

    return-void
.end method
