.class public final synthetic Ll/nxe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uxe;


# direct methods
.method public synthetic constructor <init>(Ll/uxe;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nxe;->a:Ll/uxe;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxe;->a:Ll/uxe;

    invoke-static {p0}, Ll/uxe;->l(Ll/uxe;)V

    return-void
.end method
