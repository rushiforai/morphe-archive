.class public final synthetic Ll/vgx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wgx$f;


# direct methods
.method public synthetic constructor <init>(Ll/wgx$f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vgx;->a:Ll/wgx$f;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vgx;->a:Ll/wgx$f;

    invoke-static {p0}, Ll/wgx$f;->a(Ll/wgx$f;)V

    return-void
.end method
