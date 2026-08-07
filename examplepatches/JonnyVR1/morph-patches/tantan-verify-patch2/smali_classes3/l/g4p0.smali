.class public final synthetic Ll/g4p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/i4p0;


# direct methods
.method public synthetic constructor <init>(Ll/i4p0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g4p0;->a:Ll/i4p0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g4p0;->a:Ll/i4p0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-static {p0, p1, p2}, Ll/i4p0;->b(Ll/i4p0;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;I)V

    return-void
.end method
