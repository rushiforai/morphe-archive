.class public final synthetic Ll/ktk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ktk;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/ktk;->b:Lcom/p1/mobile/putong/data/User;

    iput-boolean p3, p0, Ll/ktk;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ktk;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/ktk;->b:Lcom/p1/mobile/putong/data/User;

    iget-boolean p0, p0, Ll/ktk;->c:Z

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Ll/qtk;->K(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLl/uxj0;)V

    return-void
.end method
