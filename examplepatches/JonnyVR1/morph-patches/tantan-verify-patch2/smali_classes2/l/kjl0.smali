.class public final synthetic Ll/kjl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ljl0;

.field public final synthetic b:Landroidx/media3/common/PlaybackException;

.field public final synthetic c:Landroid/view/ViewGroup;

.field public final synthetic d:Lcom/clevertap/android/sdk/inapp/pipsdk/a;


# direct methods
.method public synthetic constructor <init>(Ll/ljl0;Landroidx/media3/common/PlaybackException;Landroid/view/ViewGroup;Lcom/clevertap/android/sdk/inapp/pipsdk/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kjl0;->a:Ll/ljl0;

    iput-object p2, p0, Ll/kjl0;->b:Landroidx/media3/common/PlaybackException;

    iput-object p3, p0, Ll/kjl0;->c:Landroid/view/ViewGroup;

    iput-object p4, p0, Ll/kjl0;->d:Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kjl0;->a:Ll/ljl0;

    iget-object v1, p0, Ll/kjl0;->b:Landroidx/media3/common/PlaybackException;

    iget-object v2, p0, Ll/kjl0;->c:Landroid/view/ViewGroup;

    iget-object p0, p0, Ll/kjl0;->d:Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    invoke-static {v0, v1, v2, p0}, Ll/ljl0;->l(Ll/ljl0;Landroidx/media3/common/PlaybackException;Landroid/view/ViewGroup;Lcom/clevertap/android/sdk/inapp/pipsdk/a;)V

    return-void
.end method
