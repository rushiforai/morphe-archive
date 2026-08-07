.class public final synthetic Ll/lw10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qw10;


# direct methods
.method public synthetic constructor <init>(Ll/qw10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lw10;->a:Ll/qw10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lw10;->a:Ll/qw10;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {p0, p1}, Ll/qw10;->n0(Ll/qw10;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
