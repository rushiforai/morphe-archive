.class public final synthetic Ll/ycj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/cdj0;


# direct methods
.method public synthetic constructor <init>(Ll/cdj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ycj0;->a:Ll/cdj0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ycj0;->a:Ll/cdj0;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static {p0, p1}, Ll/cdj0;->h0(Ll/cdj0;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
