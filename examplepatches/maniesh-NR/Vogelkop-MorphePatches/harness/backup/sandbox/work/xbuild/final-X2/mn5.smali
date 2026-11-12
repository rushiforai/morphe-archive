.class public final Lmn5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Lcom/opera/android/custom_views/StylingTextView;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/custom_views/StylingTextView;B)V
    .registers 3

    iput-byte p2, p0, Lmn5;->a:B

    iput-object p1, p0, Lmn5;->b:Lcom/opera/android/custom_views/StylingTextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Landroid/view/View;)Lmn5;
    .registers 3

    if-eqz p0, :cond_b

    new-instance v0, Lmn5;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lmn5;-><init>(Lcom/opera/android/custom_views/StylingTextView;B)V

    return-object v0

    :cond_b
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lmn5;->a:B

    iget-object p0, p0, Lmn5;->b:Lcom/opera/android/custom_views/StylingTextView;

    return-object p0
.end method
