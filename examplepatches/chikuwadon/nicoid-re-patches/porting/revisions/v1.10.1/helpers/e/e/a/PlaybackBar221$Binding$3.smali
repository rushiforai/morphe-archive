.class Le/e/a/PlaybackBar221$Binding$3;
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

    .line 51
    iput-object p1, p0, Le/e/a/PlaybackBar221$Binding$3;->this$1:Le/e/a/PlaybackBar221$Binding;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 2

    .line 51
    iget-object p1, p0, Le/e/a/PlaybackBar221$Binding$3;->this$1:Le/e/a/PlaybackBar221$Binding;

    iget-object p1, p1, Le/e/a/PlaybackBar221$Binding;->owner:Ljava/lang/Object;

    invoke-static {p1}, Le/e/a/PlaybackBar221;->toggle(Ljava/lang/Object;)V

    return-void
.end method
