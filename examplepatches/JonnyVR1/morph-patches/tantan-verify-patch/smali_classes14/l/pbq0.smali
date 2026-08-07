.class public final synthetic Ll/pbq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ccq0;


# direct methods
.method public synthetic constructor <init>(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pbq0;->a:Ll/ccq0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pbq0;->a:Ll/ccq0;

    check-cast p1, Lrx/AsyncEmitter;

    invoke-static {p0, p1}, Ll/ccq0;->z0(Ll/ccq0;Lrx/AsyncEmitter;)V

    return-void
.end method
