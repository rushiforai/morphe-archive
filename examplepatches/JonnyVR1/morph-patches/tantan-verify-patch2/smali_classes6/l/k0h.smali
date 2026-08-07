.class public final synthetic Ll/k0h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/t0h;


# direct methods
.method public synthetic constructor <init>(Ll/t0h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k0h;->a:Ll/t0h;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k0h;->a:Ll/t0h;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/t0h;->M(Ll/t0h;Ljava/lang/Throwable;)V

    return-void
.end method
