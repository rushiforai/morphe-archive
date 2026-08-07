.class public final synthetic Ll/wnr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xnr;


# direct methods
.method public synthetic constructor <init>(Ll/xnr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wnr;->a:Ll/xnr;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wnr;->a:Ll/xnr;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {p0, p1}, Ll/xnr;->g0(Ll/xnr;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
