.class public final synthetic Ll/c1h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Z

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;ZLl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c1h;->a:Lcom/p1/mobile/android/app/Act;

    iput-boolean p2, p0, Ll/c1h;->b:Z

    iput-object p3, p0, Ll/c1h;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c1h;->a:Lcom/p1/mobile/android/app/Act;

    iget-boolean v1, p0, Ll/c1h;->b:Z

    iget-object p0, p0, Ll/c1h;->c:Ll/y20;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Ll/k3h;->I(Lcom/p1/mobile/android/app/Act;ZLl/y20;Ll/uxj0;)V

    return-void
.end method
