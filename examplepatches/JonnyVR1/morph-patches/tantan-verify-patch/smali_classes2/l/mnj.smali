.class public final synthetic Ll/mnj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/snj;

.field public final synthetic b:Lcom/clevertap/android/sdk/inapp/pipsdk/a;

.field public final synthetic c:Lcom/clevertap/android/sdk/gif/GifImageView;

.field public final synthetic d:Landroid/view/ViewGroup;


# direct methods
.method public synthetic constructor <init>(Ll/snj;Lcom/clevertap/android/sdk/inapp/pipsdk/a;Lcom/clevertap/android/sdk/gif/GifImageView;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mnj;->a:Ll/snj;

    iput-object p2, p0, Ll/mnj;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    iput-object p3, p0, Ll/mnj;->c:Lcom/clevertap/android/sdk/gif/GifImageView;

    iput-object p4, p0, Ll/mnj;->d:Landroid/view/ViewGroup;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mnj;->a:Ll/snj;

    iget-object v1, p0, Ll/mnj;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    iget-object v2, p0, Ll/mnj;->c:Lcom/clevertap/android/sdk/gif/GifImageView;

    iget-object p0, p0, Ll/mnj;->d:Landroid/view/ViewGroup;

    invoke-static {v0, v1, v2, p0}, Ll/snj;->k(Ll/snj;Lcom/clevertap/android/sdk/inapp/pipsdk/a;Lcom/clevertap/android/sdk/gif/GifImageView;Landroid/view/ViewGroup;)V

    return-void
.end method
