.class public final synthetic Ll/yv90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yv90;->a:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yv90;->a:Ll/y20;

    check-cast p1, Ljava/lang/String;

    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    invoke-static {p0, p1, p2}, Ll/aw90;->o(Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method
