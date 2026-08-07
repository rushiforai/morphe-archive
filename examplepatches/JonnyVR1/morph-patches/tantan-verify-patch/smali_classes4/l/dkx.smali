.class public final synthetic Ll/dkx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ikx;


# direct methods
.method public synthetic constructor <init>(Ll/ikx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dkx;->a:Ll/ikx;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dkx;->a:Ll/ikx;

    check-cast p1, Lcom/p1/mobile/putong/data/Counter;

    invoke-static {p0, p1}, Ll/ikx;->u0(Ll/ikx;Lcom/p1/mobile/putong/data/Counter;)V

    return-void
.end method
