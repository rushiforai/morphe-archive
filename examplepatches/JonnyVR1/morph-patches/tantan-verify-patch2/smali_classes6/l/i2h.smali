.class public final synthetic Ll/i2h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/android/app/Dialog;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Dialog;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i2h;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/i2h;->b:Lcom/p1/mobile/android/app/Dialog;

    iput-object p3, p0, Ll/i2h;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i2h;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/i2h;->b:Lcom/p1/mobile/android/app/Dialog;

    iget-object p0, p0, Ll/i2h;->c:Ll/x20;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Ll/k3h;->l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Dialog;Ll/x20;Ll/uxj0;)V

    return-void
.end method
