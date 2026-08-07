.class public final synthetic Ll/l0u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r0u;


# direct methods
.method public synthetic constructor <init>(Ll/r0u;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l0u;->a:Ll/r0u;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l0u;->a:Ll/r0u;

    check-cast p1, Lcom/p1/mobile/putong/live/base/util/IntSet;

    invoke-static {p0, p1}, Ll/r0u;->v0(Ll/r0u;Lcom/p1/mobile/putong/live/base/util/IntSet;)V

    return-void
.end method
