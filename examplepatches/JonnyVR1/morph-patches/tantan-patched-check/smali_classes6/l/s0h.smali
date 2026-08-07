.class public final synthetic Ll/s0h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/t0h;


# direct methods
.method public synthetic constructor <init>(Ll/t0h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s0h;->a:Ll/t0h;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s0h;->a:Ll/t0h;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {p0, p1}, Ll/t0h;->H(Ll/t0h;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
