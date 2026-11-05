.class Le/e/a/FeedbackHud219$Notice$2;
.super Ljava/lang/Object;
.source "FeedbackHud219.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/FeedbackHud219$Notice;->show()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/FeedbackHud219$Notice;


# direct methods
.method constructor <init>(Le/e/a/FeedbackHud219$Notice;)V
    .registers 2

    .line 59
    iput-object p1, p0, Le/e/a/FeedbackHud219$Notice$2;->this$1:Le/e/a/FeedbackHud219$Notice;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 59
    iget-object v0, p0, Le/e/a/FeedbackHud219$Notice$2;->this$1:Le/e/a/FeedbackHud219$Notice;

    invoke-virtual {v0}, Le/e/a/FeedbackHud219$Notice;->cancel()V

    return-void
.end method
