.class public final synthetic Ll/yb4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gcg0;


# direct methods
.method public synthetic constructor <init>(Ll/gcg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yb4;->a:Ll/gcg0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yb4;->a:Ll/gcg0;

    check-cast p1, Ljava/io/File;

    invoke-static {p0, p1}, Ll/oc4;->q(Ll/gcg0;Ljava/io/File;)V

    return-void
.end method
