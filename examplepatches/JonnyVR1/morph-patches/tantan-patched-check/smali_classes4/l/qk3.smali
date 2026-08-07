.class public final synthetic Ll/qk3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Dialog;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qk3;->a:Lcom/p1/mobile/android/app/Dialog;

    iput-object p2, p0, Ll/qk3;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qk3;->a:Lcom/p1/mobile/android/app/Dialog;

    iget-object p0, p0, Ll/qk3;->b:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, p0, p1}, Ll/hl3;->o(Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
