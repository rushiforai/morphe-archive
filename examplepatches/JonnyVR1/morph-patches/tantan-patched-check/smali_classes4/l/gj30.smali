.class public final synthetic Ll/gj30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Recommended;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Recommended;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gj30;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/gj30;->b:Lcom/p1/mobile/putong/core/data/Recommended;

    iput-object p3, p0, Ll/gj30;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gj30;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/gj30;->b:Lcom/p1/mobile/putong/core/data/Recommended;

    iget-object p0, p0, Ll/gj30;->c:Ll/x20;

    invoke-static {v0, v1, p0}, Ll/vj30;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Recommended;Ll/x20;)V

    return-void
.end method
