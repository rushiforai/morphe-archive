.class public final synthetic Ll/kq4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kq4;->a:Ljava/lang/Runnable;

    iput-object p2, p0, Ll/kq4;->b:Lcom/p1/mobile/android/app/Act;

    iput-boolean p3, p0, Ll/kq4;->c:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kq4;->a:Ljava/lang/Runnable;

    iget-object v1, p0, Ll/kq4;->b:Lcom/p1/mobile/android/app/Act;

    iget-boolean p0, p0, Ll/kq4;->c:Z

    invoke-static {v0, v1, p0}, Ll/pq4;->g(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;Z)V

    return-void
.end method
