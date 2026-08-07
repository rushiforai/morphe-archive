.class public final synthetic Ll/zpr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field public final synthetic a:Ll/bqr;


# direct methods
.method public synthetic constructor <init>(Ll/bqr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zpr;->a:Ll/bqr;

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zpr;->a:Ll/bqr;

    invoke-static {p0, p1}, Ll/bqr;->b(Ll/bqr;Landroid/os/Message;)Z

    move-result p0

    return p0
.end method
