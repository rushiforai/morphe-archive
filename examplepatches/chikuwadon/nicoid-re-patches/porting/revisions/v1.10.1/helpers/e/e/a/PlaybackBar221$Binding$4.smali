.class Le/e/a/PlaybackBar221$Binding$4;
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

    .line 52
    iput-object p1, p0, Le/e/a/PlaybackBar221$Binding$4;->this$1:Le/e/a/PlaybackBar221$Binding;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6

    .line 52
    :try_start_0
    iget-object p1, p0, Le/e/a/PlaybackBar221$Binding$4;->this$1:Le/e/a/PlaybackBar221$Binding;

    iget-object p1, p1, Le/e/a/PlaybackBar221$Binding;->owner:Ljava/lang/Object;

    const-string v0, "e"

    invoke-static {p1, v0}, Le/e/a/PlaybackBar221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "pause"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Le/e/a/PlaybackBar221$Binding$4;->this$1:Le/e/a/PlaybackBar221$Binding;

    iget-object p1, p1, Le/e/a/PlaybackBar221$Binding;->owner:Ljava/lang/Object;

    check-cast p1, Landroid/app/Service;

    invoke-virtual {p1}, Landroid/app/Service;->stopSelf()V

    invoke-static {}, Le/e/a/PlaybackBar221;->remove()V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_28} :catch_29

    goto :goto_31

    :catch_29
    move-exception p1

    const-string v0, "nicoid-bar"

    const-string v1, "Cannot stop background playback"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_31
    return-void
.end method
