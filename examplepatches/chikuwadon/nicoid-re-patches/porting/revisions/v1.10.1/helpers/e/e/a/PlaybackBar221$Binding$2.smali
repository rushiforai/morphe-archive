.class Le/e/a/PlaybackBar221$Binding$2;
.super Ljava/lang/Object;
.source "PlaybackBar221.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/PlaybackBar221$Binding;-><init>(Landroid/app/Activity;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/PlaybackBar221$Binding;


# direct methods
.method constructor <init>(Le/e/a/PlaybackBar221$Binding;)V
    .registers 2

    .line 50
    iput-object p1, p0, Le/e/a/PlaybackBar221$Binding$2;->this$1:Le/e/a/PlaybackBar221$Binding;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .line 50
    iget-object p1, p0, Le/e/a/PlaybackBar221$Binding$2;->this$1:Le/e/a/PlaybackBar221$Binding;

    iget-object p1, p1, Le/e/a/PlaybackBar221$Binding;->owner:Ljava/lang/Object;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Le/e/a/PlaybackTransfer221;->restore(Ljava/lang/Object;Z)Z

    return-void
.end method
