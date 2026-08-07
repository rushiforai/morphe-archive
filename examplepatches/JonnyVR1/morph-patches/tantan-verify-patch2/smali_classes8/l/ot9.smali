.class public final synthetic Ll/ot9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ut9;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ut9;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ot9;->a:Ll/ut9;

    iput-object p2, p0, Ll/ot9;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ot9;->a:Ll/ut9;

    iget-object p0, p0, Ll/ot9;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    invoke-static {v0, p0, p1}, Ll/ut9;->i0(Ll/ut9;Ljava/lang/String;Lcom/p1/mobile/putong/data/Media;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
