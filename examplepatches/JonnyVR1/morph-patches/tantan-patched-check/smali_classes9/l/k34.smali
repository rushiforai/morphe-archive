.class public final synthetic Ll/k34;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/w34;


# direct methods
.method public synthetic constructor <init>(Ll/w34;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k34;->a:Ll/w34;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k34;->a:Ll/w34;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

    invoke-static {p0, p1}, Ll/w34;->b4(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)V

    return-void
.end method
