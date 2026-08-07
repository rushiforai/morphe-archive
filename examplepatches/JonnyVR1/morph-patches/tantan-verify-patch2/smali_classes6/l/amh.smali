.class public final synthetic Ll/amh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/umh;


# direct methods
.method public synthetic constructor <init>(Ll/umh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/amh;->a:Ll/umh;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/amh;->a:Ll/umh;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    invoke-static {p0, p1}, Ll/umh;->z0(Ll/umh;Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
