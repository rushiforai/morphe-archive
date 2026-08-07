.class public final synthetic Ll/nnj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/snj;

.field public final synthetic b:[B

.field public final synthetic c:Lcom/clevertap/android/sdk/gif/GifImageView;

.field public final synthetic d:Landroid/view/ViewGroup;

.field public final synthetic e:Lcom/clevertap/android/sdk/inapp/pipsdk/a;


# direct methods
.method public synthetic constructor <init>(Ll/snj;[BLcom/clevertap/android/sdk/gif/GifImageView;Landroid/view/ViewGroup;Lcom/clevertap/android/sdk/inapp/pipsdk/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nnj;->a:Ll/snj;

    iput-object p2, p0, Ll/nnj;->b:[B

    iput-object p3, p0, Ll/nnj;->c:Lcom/clevertap/android/sdk/gif/GifImageView;

    iput-object p4, p0, Ll/nnj;->d:Landroid/view/ViewGroup;

    iput-object p5, p0, Ll/nnj;->e:Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/nnj;->a:Ll/snj;

    iget-object v1, p0, Ll/nnj;->b:[B

    iget-object v2, p0, Ll/nnj;->c:Lcom/clevertap/android/sdk/gif/GifImageView;

    iget-object v3, p0, Ll/nnj;->d:Landroid/view/ViewGroup;

    iget-object p0, p0, Ll/nnj;->e:Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    invoke-static {v0, v1, v2, v3, p0}, Ll/snj;->n(Ll/snj;[BLcom/clevertap/android/sdk/gif/GifImageView;Landroid/view/ViewGroup;Lcom/clevertap/android/sdk/inapp/pipsdk/a;)V

    return-void
.end method
