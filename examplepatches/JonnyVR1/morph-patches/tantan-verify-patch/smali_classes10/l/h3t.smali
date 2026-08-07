.class public final synthetic Ll/h3t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h3t;->a:Ljava/lang/Runnable;

    iput-object p2, p0, Ll/h3t;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h3t;->a:Ljava/lang/Runnable;

    iget-object p0, p0, Ll/h3t;->b:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, p0, p1}, Ll/k3t;->c(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
