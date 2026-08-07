.class public final synthetic Ll/sqb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/tqb;


# direct methods
.method public synthetic constructor <init>(Ll/tqb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sqb;->a:Ll/tqb;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sqb;->a:Ll/tqb;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Ll/tqb;->a3(Ll/tqb;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/GrowthBlindBox;

    move-result-object p0

    return-object p0
.end method
