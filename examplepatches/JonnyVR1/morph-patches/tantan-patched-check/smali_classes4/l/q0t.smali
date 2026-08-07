.class public final synthetic Ll/q0t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/v0t;


# direct methods
.method public synthetic constructor <init>(Ll/v0t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q0t;->a:Ll/v0t;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0t;->a:Ll/v0t;

    invoke-static {p0}, Ll/v0t;->e(Ll/v0t;)V

    return-void
.end method
