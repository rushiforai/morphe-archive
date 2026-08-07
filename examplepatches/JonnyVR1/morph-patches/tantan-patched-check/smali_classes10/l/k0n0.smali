.class public final synthetic Ll/k0n0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/t0n0;


# direct methods
.method public synthetic constructor <init>(Ll/t0n0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k0n0;->a:Ll/t0n0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k0n0;->a:Ll/t0n0;

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Ll/t0n0;->c4(Ll/t0n0;Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
