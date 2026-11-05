.class Le/e/a/ChannelPage$2;
.super Ljava/lang/Object;
.source "ChannelPage.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/ChannelPage;->open(Landroid/app/Activity;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$state:Le/e/a/ChannelPage$Listing;


# direct methods
.method constructor <init>(Le/e/a/ChannelPage$Listing;)V
    .registers 2

    .line 14
    iput-object p1, p0, Le/e/a/ChannelPage$2;->val$state:Le/e/a/ChannelPage$Listing;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    .line 14
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 14
    iget-object p1, p0, Le/e/a/ChannelPage$2;->val$state:Le/e/a/ChannelPage$Listing;

    invoke-virtual {p1}, Le/e/a/ChannelPage$Listing;->stop()V

    return-void
.end method
