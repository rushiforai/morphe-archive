.class public final synthetic Ll/c9i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/d9i;


# direct methods
.method public synthetic constructor <init>(Ll/d9i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c9i;->a:Ll/d9i;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c9i;->a:Ll/d9i;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    invoke-static {p0, p1}, Ll/d9i;->e0(Ll/d9i;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
