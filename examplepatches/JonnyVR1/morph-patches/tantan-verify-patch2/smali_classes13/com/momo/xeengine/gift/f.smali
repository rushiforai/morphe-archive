.class public final synthetic Lcom/momo/xeengine/gift/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/gift/GiftPlayer$1;

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/gift/GiftPlayer$1;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/gift/f;->a:Lcom/momo/xeengine/gift/GiftPlayer$1;

    iput p2, p0, Lcom/momo/xeengine/gift/f;->b:I

    iput-object p3, p0, Lcom/momo/xeengine/gift/f;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/f;->a:Lcom/momo/xeengine/gift/GiftPlayer$1;

    iget v1, p0, Lcom/momo/xeengine/gift/f;->b:I

    iget-object p0, p0, Lcom/momo/xeengine/gift/f;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/momo/xeengine/gift/GiftPlayer$1;->d(Lcom/momo/xeengine/gift/GiftPlayer$1;ILjava/lang/String;)V

    return-void
.end method
