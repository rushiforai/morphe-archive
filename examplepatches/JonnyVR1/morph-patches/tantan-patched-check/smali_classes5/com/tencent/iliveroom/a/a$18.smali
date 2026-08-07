.class Lcom/tencent/iliveroom/a/a$18;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->setAudioMode(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$18;->b:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/iliveroom/a/a$18;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/tencent/iliveroom/a/a$18;->a:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v2, 0x1

    .line 8
    if-ne v0, v2, :cond_1

    .line 9
    .line 10
    move v1, v2

    .line 11
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$18;->b:Lcom/tencent/iliveroom/a/a;

    .line 12
    .line 13
    invoke-static {p0, v1}, Lcom/tencent/iliveroom/a/a;->i(Lcom/tencent/iliveroom/a/a;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
