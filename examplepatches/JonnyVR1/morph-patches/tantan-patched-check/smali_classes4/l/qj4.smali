.class public final synthetic Ll/qj4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qk4;


# direct methods
.method public synthetic constructor <init>(Ll/qk4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qj4;->a:Ll/qk4;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qj4;->a:Ll/qk4;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/c;->t(Ll/qk4;)V

    return-void
.end method
