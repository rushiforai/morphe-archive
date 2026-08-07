.class public Lcom/p1/mobile/android/ui/bubble/d$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/ui/bubble/d;->w(Lcom/p1/mobile/android/ui/bubble/a;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/view/View;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/android/ui/bubble/d;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/ui/bubble/d;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/d$b;->b:Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/android/ui/bubble/d$b;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/android/ui/bubble/d$b;->b:Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/android/ui/bubble/d$b;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0
.end method
