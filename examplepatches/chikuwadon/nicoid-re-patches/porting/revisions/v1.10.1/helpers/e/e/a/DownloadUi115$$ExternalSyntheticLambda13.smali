.class public final synthetic Le/e/a/DownloadUi115$$ExternalSyntheticLambda13;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/IntConsumer;


# instance fields
.field public final synthetic f$0:Le/e/a/Ui110$Swipe;


# direct methods
.method public synthetic constructor <init>(Le/e/a/Ui110$Swipe;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/DownloadUi115$$ExternalSyntheticLambda13;->f$0:Le/e/a/Ui110$Swipe;

    return-void
.end method


# virtual methods
.method public final accept(I)V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/DownloadUi115$$ExternalSyntheticLambda13;->f$0:Le/e/a/Ui110$Swipe;

    invoke-virtual {v0, p1}, Le/e/a/Ui110$Swipe;->select(I)V

    return-void
.end method
