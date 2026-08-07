.class public final synthetic Ll/xmh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zmh;


# direct methods
.method public synthetic constructor <init>(Ll/zmh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xmh;->a:Ll/zmh;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xmh;->a:Ll/zmh;

    check-cast p1, Lcom/p1/mobile/putong/data/FeedFlower;

    invoke-static {p0, p1}, Ll/zmh;->Z1(Ll/zmh;Lcom/p1/mobile/putong/data/FeedFlower;)V

    return-void
.end method
