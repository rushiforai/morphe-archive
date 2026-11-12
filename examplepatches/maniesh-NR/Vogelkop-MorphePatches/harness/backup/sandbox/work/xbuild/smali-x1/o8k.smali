.class public abstract Lo8k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpde;

.field public final b:Lcom/opera/android/BrowserActivity;

.field public final c:Lcom/opera/android/browser/OperaPageRootView;

.field public d:Landroid/os/Parcelable;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lpde;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lo8k;->d:Landroid/os/Parcelable;

    iput-object p1, p0, Lo8k;->b:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lo8k;->a:Lpde;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const/4 p2, 0x0

    const v0, 0x7f0d03b8

    invoke-virtual {p1, v0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/browser/OperaPageRootView;

    iput-object p1, p0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    return-void
.end method
