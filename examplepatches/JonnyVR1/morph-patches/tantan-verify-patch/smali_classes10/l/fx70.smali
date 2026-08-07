.class public final synthetic Ll/fx70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/gx70;


# direct methods
.method public synthetic constructor <init>(Ll/gx70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fx70;->a:Ll/gx70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fx70;->a:Ll/gx70;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;

    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;

    invoke-static {p0, p1, p2}, Ll/gx70;->W3(Ll/gx70;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;)V

    return-void
.end method
