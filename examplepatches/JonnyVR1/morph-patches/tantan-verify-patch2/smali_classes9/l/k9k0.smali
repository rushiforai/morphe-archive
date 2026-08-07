.class public final synthetic Ll/k9k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/m9k0;

.field public final synthetic b:Ll/nsv;


# direct methods
.method public synthetic constructor <init>(Ll/m9k0;Ll/nsv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k9k0;->a:Ll/m9k0;

    iput-object p2, p0, Ll/k9k0;->b:Ll/nsv;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k9k0;->a:Ll/m9k0;

    iget-object p0, p0, Ll/k9k0;->b:Ll/nsv;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/m9k0;->j4(Ll/m9k0;Ll/nsv;Ljava/lang/String;)V

    return-void
.end method
