.class public final synthetic Ll/zb20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zb20;->a:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zb20;->a:Lcom/p1/mobile/android/app/Act;

    invoke-static {p0, p1}, Ll/bc20;->m(Lcom/p1/mobile/android/app/Act;Landroid/content/DialogInterface;)V

    return-void
.end method
