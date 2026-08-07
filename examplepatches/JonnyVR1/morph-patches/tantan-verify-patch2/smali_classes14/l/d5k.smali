.class public final synthetic Ll/d5k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/e5k;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/e5k;Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d5k;->a:Ll/e5k;

    iput-object p2, p0, Ll/d5k;->b:Lcom/p1/mobile/android/app/Act;

    iput-boolean p3, p0, Ll/d5k;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d5k;->a:Ll/e5k;

    iget-object v1, p0, Ll/d5k;->b:Lcom/p1/mobile/android/app/Act;

    iget-boolean p0, p0, Ll/d5k;->c:Z

    check-cast p1, Ll/kfn0;

    invoke-static {v0, v1, p0, p1}, Ll/e5k;->r(Ll/e5k;Lcom/p1/mobile/android/app/Act;ZLl/kfn0;)V

    return-void
.end method
