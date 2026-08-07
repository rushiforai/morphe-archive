.class public final synthetic Ll/k0x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/l0x;


# direct methods
.method public synthetic constructor <init>(Ll/l0x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k0x;->a:Ll/l0x;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k0x;->a:Ll/l0x;

    invoke-static {p0}, Ll/l0x;->k(Ll/l0x;)V

    return-void
.end method
