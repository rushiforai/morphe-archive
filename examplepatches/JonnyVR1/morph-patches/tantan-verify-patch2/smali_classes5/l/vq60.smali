.class public final synthetic Ll/vq60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/br60;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/br60;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vq60;->a:Ll/br60;

    iput-object p2, p0, Ll/vq60;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vq60;->a:Ll/br60;

    iget-object p0, p0, Ll/vq60;->b:Ll/x20;

    check-cast p1, Ll/pf60;

    invoke-static {v0, p0, p1}, Ll/br60;->e(Ll/br60;Ll/x20;Ll/pf60;)V

    return-void
.end method
