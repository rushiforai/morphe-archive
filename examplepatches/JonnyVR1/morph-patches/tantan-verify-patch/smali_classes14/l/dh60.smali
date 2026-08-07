.class public final synthetic Ll/dh60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/eh60;


# direct methods
.method public synthetic constructor <init>(Ll/eh60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dh60;->a:Ll/eh60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dh60;->a:Ll/eh60;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/eh60;->e0(Ll/eh60;Ljava/lang/Throwable;)V

    return-void
.end method
