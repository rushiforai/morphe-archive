.class public final synthetic Ll/wan;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wan;->a:Lcom/p1/mobile/android/app/Dialog;

    return-void
.end method


# virtual methods
.method public final onFocusChange(Landroid/view/View;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wan;->a:Lcom/p1/mobile/android/app/Dialog;

    invoke-static {p0, p1, p2}, Ll/ebn;->y(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;Z)V

    return-void
.end method
