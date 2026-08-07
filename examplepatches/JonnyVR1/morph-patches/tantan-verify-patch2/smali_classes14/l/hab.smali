.class public final synthetic Ll/hab;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/hab;->a:I

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Ll/hab;->a:I

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/b0;->u3(I)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
