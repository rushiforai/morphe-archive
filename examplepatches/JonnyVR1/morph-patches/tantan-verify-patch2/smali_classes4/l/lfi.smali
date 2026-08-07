.class public final synthetic Ll/lfi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vfi;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/vfi;Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lfi;->a:Ll/vfi;

    iput-object p2, p0, Ll/lfi;->b:Lcom/p1/mobile/android/app/Act;

    iput-boolean p3, p0, Ll/lfi;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lfi;->a:Ll/vfi;

    iget-object v1, p0, Ll/lfi;->b:Lcom/p1/mobile/android/app/Act;

    iget-boolean p0, p0, Ll/lfi;->c:Z

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Ll/vfi;->d(Ll/vfi;Lcom/p1/mobile/android/app/Act;ZLl/uxj0;)V

    return-void
.end method
