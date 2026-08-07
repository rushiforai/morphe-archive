.class public final synthetic Ll/z9x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jax;


# direct methods
.method public synthetic constructor <init>(Ll/jax;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z9x;->a:Ll/jax;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z9x;->a:Ll/jax;

    invoke-static {p0}, Ll/jax;->a(Ll/jax;)V

    return-void
.end method
