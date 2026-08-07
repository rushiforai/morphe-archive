.class public final synthetic Ll/dkm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jkm;

.field public final synthetic b:Lcom/clevertap/android/sdk/inapp/pipsdk/a;

.field public final synthetic c:Landroid/widget/ImageView;


# direct methods
.method public synthetic constructor <init>(Ll/jkm;Lcom/clevertap/android/sdk/inapp/pipsdk/a;Landroid/widget/ImageView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dkm;->a:Ll/jkm;

    iput-object p2, p0, Ll/dkm;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    iput-object p3, p0, Ll/dkm;->c:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dkm;->a:Ll/jkm;

    iget-object v1, p0, Ll/dkm;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    iget-object p0, p0, Ll/dkm;->c:Landroid/widget/ImageView;

    invoke-static {v0, v1, p0}, Ll/jkm;->n(Ll/jkm;Lcom/clevertap/android/sdk/inapp/pipsdk/a;Landroid/widget/ImageView;)V

    return-void
.end method
