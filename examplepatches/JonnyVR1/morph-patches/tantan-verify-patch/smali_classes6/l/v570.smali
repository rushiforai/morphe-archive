.class public final synthetic Ll/v570;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/v670;


# direct methods
.method public synthetic constructor <init>(Ll/v670;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v570;->a:Ll/v670;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v570;->a:Ll/v670;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {p0, p1}, Ll/v670;->j0(Ll/v670;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
