.class public Ll/v8x$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/v8x;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/Media;

.field public b:I

.field public c:Lcom/p1/mobile/putong/core/ui/PictureView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, -0x232324

    .line 5
    .line 6
    .line 7
    iput v0, p0, Ll/v8x$b;->b:I

    .line 8
    .line 9
    iput-object p1, p0, Ll/v8x$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 10
    .line 11
    return-void
.end method
