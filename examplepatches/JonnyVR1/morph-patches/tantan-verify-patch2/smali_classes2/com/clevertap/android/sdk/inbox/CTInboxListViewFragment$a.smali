.class Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment$a;->a:Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment$a;->a:Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;->D:Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/customviews/MediaPlayerRecyclerView;->Q()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
