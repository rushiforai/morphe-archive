.class public final synthetic Ll/xm00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zm00;


# direct methods
.method public synthetic constructor <init>(Ll/zm00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xm00;->a:Ll/zm00;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xm00;->a:Ll/zm00;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {p0, p1}, Ll/zm00;->n0(Ll/zm00;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
