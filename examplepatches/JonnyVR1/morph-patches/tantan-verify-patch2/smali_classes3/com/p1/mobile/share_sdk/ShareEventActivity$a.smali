.class public Lcom/p1/mobile/share_sdk/ShareEventActivity$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/share_sdk/ShareEventActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/share_sdk/ShareEventActivity;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/share_sdk/ShareEventActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/share_sdk/ShareEventActivity$a;->a:Lcom/p1/mobile/share_sdk/ShareEventActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/share_sdk/ShareEventActivity$a;->a:Lcom/p1/mobile/share_sdk/ShareEventActivity;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/share_sdk/ShareEventActivity$a;->a:Lcom/p1/mobile/share_sdk/ShareEventActivity;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
