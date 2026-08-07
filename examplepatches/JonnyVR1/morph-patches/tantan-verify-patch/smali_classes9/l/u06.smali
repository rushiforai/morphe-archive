.class public final synthetic Ll/u06;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v06;


# direct methods
.method public synthetic constructor <init>(Ll/v06;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u06;->a:Ll/v06;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u06;->a:Ll/v06;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;

    invoke-static {p0, p1}, Ll/v06;->X3(Ll/v06;Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;)V

    return-void
.end method
