.class public final synthetic Ll/wk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wk;->a:Lcom/p1/mobile/android/app/Dialog;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wk;->a:Lcom/p1/mobile/android/app/Dialog;

    invoke-static {p0}, Ll/xk$a;->c(Lcom/p1/mobile/android/app/Dialog;)V

    return-void
.end method
