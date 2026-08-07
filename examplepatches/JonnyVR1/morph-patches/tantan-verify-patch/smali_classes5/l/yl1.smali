.class public final synthetic Ll/yl1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/dm1;


# direct methods
.method public synthetic constructor <init>(Ll/dm1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yl1;->a:Ll/dm1;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yl1;->a:Ll/dm1;

    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    invoke-static {p0, p1}, Ll/dm1;->i0(Ll/dm1;Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
