.class public final synthetic Ll/gcx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/xcx;


# direct methods
.method public synthetic constructor <init>(Ll/xcx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gcx;->a:Ll/xcx;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gcx;->a:Ll/xcx;

    invoke-static {p0}, Ll/xcx;->f(Ll/xcx;)V

    return-void
.end method
