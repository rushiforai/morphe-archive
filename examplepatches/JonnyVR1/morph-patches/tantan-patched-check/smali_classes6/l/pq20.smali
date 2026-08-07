.class public final synthetic Ll/pq20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/app/PutongAct;

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/Object;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pq20;->a:Lcom/p1/mobile/putong/app/PutongAct;

    iput-object p2, p0, Ll/pq20;->b:Ljava/lang/Object;

    iput-object p3, p0, Ll/pq20;->c:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pq20;->a:Lcom/p1/mobile/putong/app/PutongAct;

    iget-object v1, p0, Ll/pq20;->b:Ljava/lang/Object;

    iget-object p0, p0, Ll/pq20;->c:Ljava/util/ArrayList;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->w(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/Object;Ljava/util/ArrayList;Landroid/view/View;)V

    return-void
.end method
