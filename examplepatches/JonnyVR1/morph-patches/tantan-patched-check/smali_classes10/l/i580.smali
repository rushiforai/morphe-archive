.class public final synthetic Ll/i580;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/q580;


# direct methods
.method public synthetic constructor <init>(Ll/q580;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i580;->a:Ll/q580;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i580;->a:Ll/q580;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSummary;

    invoke-virtual {p0, p1}, Ll/q580;->y4(Lcom/p1/mobile/putong/live/base/data/BLivePkSummary;)V

    return-void
.end method
