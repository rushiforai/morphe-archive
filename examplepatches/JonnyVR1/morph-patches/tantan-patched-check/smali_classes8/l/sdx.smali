.class public final synthetic Ll/sdx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ydx;


# direct methods
.method public synthetic constructor <init>(Ll/ydx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sdx;->a:Ll/ydx;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sdx;->a:Ll/ydx;

    check-cast p1, Lcom/p1/mobile/putong/data/Counter;

    invoke-static {p0, p1}, Ll/ydx;->F0(Ll/ydx;Lcom/p1/mobile/putong/data/Counter;)V

    return-void
.end method
