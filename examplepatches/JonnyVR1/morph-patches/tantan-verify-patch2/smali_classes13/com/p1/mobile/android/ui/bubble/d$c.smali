.class public Lcom/p1/mobile/android/ui/bubble/d$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/ui/bubble/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lcom/p1/mobile/android/ui/bubble/BubbleView;

.field public d:Lcom/p1/mobile/android/ui/bubble/a;

.field public final synthetic e:Lcom/p1/mobile/android/ui/bubble/d;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/ui/bubble/d;Ljava/lang/String;Lcom/p1/mobile/android/ui/bubble/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/d$c;->e:Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/android/ui/bubble/d$c;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/android/ui/bubble/d$c;->d:Lcom/p1/mobile/android/ui/bubble/a;

    .line 9
    .line 10
    return-void
.end method
