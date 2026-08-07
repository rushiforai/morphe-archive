.class public final synthetic Ll/y87;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/CoreBusinessModule;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/CoreBusinessModule;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y87;->a:Lcom/p1/mobile/putong/core/CoreBusinessModule;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y87;->a:Lcom/p1/mobile/putong/core/CoreBusinessModule;

    check-cast p1, Lcom/p1/mobile/android/app/Act;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->c0(Lcom/p1/mobile/putong/core/CoreBusinessModule;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method
