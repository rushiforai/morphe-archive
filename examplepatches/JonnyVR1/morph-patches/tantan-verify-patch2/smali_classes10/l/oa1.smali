.class public final synthetic Ll/oa1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field public final synthetic a:Ll/pa1;


# direct methods
.method public synthetic constructor <init>(Ll/pa1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oa1;->a:Ll/pa1;

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oa1;->a:Ll/pa1;

    invoke-static {p0, p1}, Ll/pa1;->a(Ll/pa1;Landroid/os/Message;)Z

    move-result p0

    return p0
.end method
