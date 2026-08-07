.class Lcom/tencent/rtmp/a$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/basic/c/o;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/TXLivePlayer$ITXSnapshotListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/rtmp/TXLivePlayer$ITXSnapshotListener;

.field final synthetic b:Lcom/tencent/rtmp/a;


# direct methods
.method public constructor <init>(Lcom/tencent/rtmp/a;Lcom/tencent/rtmp/TXLivePlayer$ITXSnapshotListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/a$1;->b:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/rtmp/a$1;->a:Lcom/tencent/rtmp/TXLivePlayer$ITXSnapshotListener;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onTakePhotoComplete(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/a$1;->b:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/rtmp/a$1;->a:Lcom/tencent/rtmp/TXLivePlayer$ITXSnapshotListener;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/a;Lcom/tencent/rtmp/TXLivePlayer$ITXSnapshotListener;Landroid/graphics/Bitmap;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
