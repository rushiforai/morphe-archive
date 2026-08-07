.class public final synthetic Ll/rag;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/fbg;


# direct methods
.method public synthetic constructor <init>(Ll/fbg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rag;->a:Ll/fbg;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rag;->a:Ll/fbg;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;

    invoke-static {p0, p1}, Ll/vag;->b(Ll/fbg;Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
