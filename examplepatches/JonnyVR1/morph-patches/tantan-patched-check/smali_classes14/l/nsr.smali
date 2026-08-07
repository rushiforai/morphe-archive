.class public final synthetic Ll/nsr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/psr;


# direct methods
.method public synthetic constructor <init>(Ll/psr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nsr;->a:Ll/psr;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nsr;->a:Ll/psr;

    invoke-static {p0}, Ll/psr;->k(Ll/psr;)V

    return-void
.end method
