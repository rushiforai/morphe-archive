.class public final synthetic Ll/lwa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pwa;

.field public final synthetic b:F

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/pwa;FLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lwa;->a:Ll/pwa;

    iput p2, p0, Ll/lwa;->b:F

    iput-object p3, p0, Ll/lwa;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lwa;->a:Ll/pwa;

    iget v1, p0, Ll/lwa;->b:F

    iget-object p0, p0, Ll/lwa;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    invoke-static {v0, v1, p0, p1}, Ll/pwa;->a3(Ll/pwa;FLjava/lang/String;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method
