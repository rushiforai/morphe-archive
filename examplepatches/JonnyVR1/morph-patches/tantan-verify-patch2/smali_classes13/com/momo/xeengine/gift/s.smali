.class public final synthetic Lcom/momo/xeengine/gift/s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/gift/ResourceChecker;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/util/List;

.field public final synthetic d:[I

.field public final synthetic e:I

.field public final synthetic f:Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/gift/ResourceChecker;Ljava/lang/String;Ljava/util/List;[IILcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/gift/s;->a:Lcom/momo/xeengine/gift/ResourceChecker;

    iput-object p2, p0, Lcom/momo/xeengine/gift/s;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/momo/xeengine/gift/s;->c:Ljava/util/List;

    iput-object p4, p0, Lcom/momo/xeengine/gift/s;->d:[I

    iput p5, p0, Lcom/momo/xeengine/gift/s;->e:I

    iput-object p6, p0, Lcom/momo/xeengine/gift/s;->f:Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/s;->a:Lcom/momo/xeengine/gift/ResourceChecker;

    iget-object v1, p0, Lcom/momo/xeengine/gift/s;->b:Ljava/lang/String;

    iget-object v2, p0, Lcom/momo/xeengine/gift/s;->c:Ljava/util/List;

    iget-object v3, p0, Lcom/momo/xeengine/gift/s;->d:[I

    iget v4, p0, Lcom/momo/xeengine/gift/s;->e:I

    iget-object v5, p0, Lcom/momo/xeengine/gift/s;->f:Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;

    invoke-static/range {v0 .. v5}, Lcom/momo/xeengine/gift/ResourceChecker;->e(Lcom/momo/xeengine/gift/ResourceChecker;Ljava/lang/String;Ljava/util/List;[IILcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;)V

    return-void
.end method
