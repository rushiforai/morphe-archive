.class public final synthetic Ll/jfu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jfu;->a:Lcom/p1/mobile/android/app/Dialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jfu;->a:Lcom/p1/mobile/android/app/Dialog;

    invoke-static {p0, p1}, Ll/pfu;->e(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V

    return-void
.end method
