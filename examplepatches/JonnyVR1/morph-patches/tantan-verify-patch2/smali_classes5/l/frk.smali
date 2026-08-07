.class public final synthetic Ll/frk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Lv/VEditText;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lv/VEditText;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/frk;->a:Lv/VEditText;

    iput-object p2, p0, Ll/frk;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/frk;->c:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/frk;->a:Lv/VEditText;

    iget-object v1, p0, Ll/frk;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/frk;->c:Ljava/lang/Runnable;

    invoke-static {v0, v1, p0, p1}, Ll/qtk;->v0(Lv/VEditText;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Landroid/content/DialogInterface;)V

    return-void
.end method
