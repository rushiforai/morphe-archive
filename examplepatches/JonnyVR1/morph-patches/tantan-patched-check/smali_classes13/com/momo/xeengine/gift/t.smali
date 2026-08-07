.class public final synthetic Lcom/momo/xeengine/gift/t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/gift/ResourceChecker;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:[I

.field public final synthetic e:I

.field public final synthetic f:Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/gift/ResourceChecker;Ljava/util/List;Ljava/lang/String;[IILcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/gift/t;->a:Lcom/momo/xeengine/gift/ResourceChecker;

    iput-object p2, p0, Lcom/momo/xeengine/gift/t;->b:Ljava/util/List;

    iput-object p3, p0, Lcom/momo/xeengine/gift/t;->c:Ljava/lang/String;

    iput-object p4, p0, Lcom/momo/xeengine/gift/t;->d:[I

    iput p5, p0, Lcom/momo/xeengine/gift/t;->e:I

    iput-object p6, p0, Lcom/momo/xeengine/gift/t;->f:Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;

    return-void
.end method


# virtual methods
.method public final onComplete(Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/t;->a:Lcom/momo/xeengine/gift/ResourceChecker;

    iget-object v1, p0, Lcom/momo/xeengine/gift/t;->b:Ljava/util/List;

    iget-object v2, p0, Lcom/momo/xeengine/gift/t;->c:Ljava/lang/String;

    iget-object v3, p0, Lcom/momo/xeengine/gift/t;->d:[I

    iget v4, p0, Lcom/momo/xeengine/gift/t;->e:I

    iget-object v5, p0, Lcom/momo/xeengine/gift/t;->f:Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;

    move v6, p1

    invoke-static/range {v0 .. v6}, Lcom/momo/xeengine/gift/ResourceChecker;->c(Lcom/momo/xeengine/gift/ResourceChecker;Ljava/util/List;Ljava/lang/String;[IILcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;Z)V

    return-void
.end method
