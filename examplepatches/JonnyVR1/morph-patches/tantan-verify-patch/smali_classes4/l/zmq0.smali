.class public final synthetic Ll/zmq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bnq0;


# direct methods
.method public synthetic constructor <init>(Ll/bnq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zmq0;->a:Ll/bnq0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zmq0;->a:Ll/bnq0;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/bnq0;->g0(Ll/bnq0;Ljava/util/List;)V

    return-void
.end method
