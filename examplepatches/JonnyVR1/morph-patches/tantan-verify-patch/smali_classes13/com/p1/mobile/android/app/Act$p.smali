.class public Lcom/p1/mobile/android/app/Act$p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/b30;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act$t;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Act$t;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/Act$p;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/android/app/Act$p;->a:Lcom/p1/mobile/android/app/Act$t;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$p;->a:Lcom/p1/mobile/android/app/Act$t;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p3, p5}, Lcom/p1/mobile/android/app/Act$t;->c(Landroid/view/View;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
