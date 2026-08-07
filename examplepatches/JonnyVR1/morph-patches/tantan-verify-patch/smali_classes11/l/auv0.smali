.class public final synthetic Ll/auv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field public final synthetic a:Ll/g1w0;


# direct methods
.method public synthetic constructor <init>(Ll/g1w0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/auv0;->a:Ll/g1w0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/auv0;->a:Ll/g1w0;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/g1w0;->g(Ll/g1w0;Landroid/os/Message;)Z

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method
