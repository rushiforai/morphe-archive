.class public final synthetic Ll/xo90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ap90;


# direct methods
.method public synthetic constructor <init>(Ll/ap90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xo90;->a:Ll/ap90;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xo90;->a:Ll/ap90;

    check-cast p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    invoke-static {p0, p1}, Ll/ap90;->v0(Ll/ap90;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    return-void
.end method
