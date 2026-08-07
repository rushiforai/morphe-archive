.class public final synthetic Ll/zba;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/jka;


# direct methods
.method public synthetic constructor <init>(Ll/jka;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zba;->a:Ll/jka;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zba;->a:Ll/jka;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/RawFeed;

    invoke-static {p0, p1}, Ll/jka;->b1(Ll/jka;Lcom/p1/mobile/putong/feed/data/RawFeed;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
