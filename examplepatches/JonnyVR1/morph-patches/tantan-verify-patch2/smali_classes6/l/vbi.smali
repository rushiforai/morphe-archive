.class public final synthetic Ll/vbi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xbi;


# direct methods
.method public synthetic constructor <init>(Ll/xbi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vbi;->a:Ll/xbi;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vbi;->a:Ll/xbi;

    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    invoke-static {p0, p1}, Ll/xbi;->g0(Ll/xbi;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method
