.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final a:Landroid/view/View;

.field public final b:I

.field public final synthetic c:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;Landroid/view/View;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$b;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$b;->a:Landroid/view/View;

    .line 7
    .line 8
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$b;->b:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$b;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->h(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)Ll/ykl0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$b;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->h(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)Ll/ykl0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {v0, v1}, Ll/ykl0;->n(Z)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$b;->a:Landroid/view/View;

    .line 27
    .line 28
    invoke-static {v0, p0}, Ll/kkl0;->b0(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$b;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 33
    .line 34
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$b;->b:I

    .line 35
    .line 36
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->k(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
