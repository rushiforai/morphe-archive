.class public final synthetic Lcom/momo/xeengine/gift/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/gift/GiftLogUploader;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/gift/GiftLogUploader;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/gift/b;->a:Lcom/momo/xeengine/gift/GiftLogUploader;

    iput-object p2, p0, Lcom/momo/xeengine/gift/b;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/b;->a:Lcom/momo/xeengine/gift/GiftLogUploader;

    iget-object p0, p0, Lcom/momo/xeengine/gift/b;->b:Ljava/util/List;

    invoke-static {v0, p0}, Lcom/momo/xeengine/gift/GiftLogUploader;->a(Lcom/momo/xeengine/gift/GiftLogUploader;Ljava/util/List;)V

    return-void
.end method
