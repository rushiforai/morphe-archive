.class public final synthetic Ll/m8i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/n8i;


# direct methods
.method public synthetic constructor <init>(Ll/n8i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m8i;->a:Ll/n8i;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m8i;->a:Ll/n8i;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    invoke-static {p0, p1}, Ll/n8i;->g0(Ll/n8i;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
