.class Le/e/a/PopupControl222$1;
.super Ljava/lang/Object;
.source "PopupControl222.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/PopupControl222;->bind(Le/e/a/PopupControls193;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$owner:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 16
    iput-object p1, p0, Le/e/a/PopupControl222$1;->val$owner:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .line 16
    iget-object p1, p0, Le/e/a/PopupControl222$1;->val$owner:Ljava/lang/Object;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Le/e/a/PlaybackTransfer221;->restore(Ljava/lang/Object;Z)Z

    return-void
.end method
