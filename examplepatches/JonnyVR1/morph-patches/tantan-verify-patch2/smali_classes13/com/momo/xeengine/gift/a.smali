.class public final synthetic Lcom/momo/xeengine/gift/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/gift/GiftLogUploader;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/gift/GiftLogUploader;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/gift/a;->a:Lcom/momo/xeengine/gift/GiftLogUploader;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/a;->a:Lcom/momo/xeengine/gift/GiftLogUploader;

    invoke-static {p0}, Lcom/momo/xeengine/gift/GiftLogUploader;->b(Lcom/momo/xeengine/gift/GiftLogUploader;)V

    return-void
.end method
