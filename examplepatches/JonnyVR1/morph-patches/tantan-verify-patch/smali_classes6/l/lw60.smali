.class public final synthetic Ll/lw60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vw60;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ll/vw60;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lw60;->a:Ll/vw60;

    iput-object p2, p0, Ll/lw60;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/lw60;->c:Lcom/p1/mobile/android/app/Act;

    iput-boolean p4, p0, Ll/lw60;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lw60;->a:Ll/vw60;

    iget-object v1, p0, Ll/lw60;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/lw60;->c:Lcom/p1/mobile/android/app/Act;

    iget-boolean p0, p0, Ll/lw60;->d:Z

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, v2, p0, p1}, Ll/vw60;->d(Ll/vw60;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;ZLl/uxj0;)V

    return-void
.end method
