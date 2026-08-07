.class public final synthetic Ll/ti80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/ui80;

.field public final synthetic b:Ll/kcg0;


# direct methods
.method public synthetic constructor <init>(Ll/ui80;Ll/kcg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ti80;->a:Ll/ui80;

    iput-object p2, p0, Ll/ti80;->b:Ll/kcg0;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ti80;->a:Ll/ui80;

    iget-object p0, p0, Ll/ti80;->b:Ll/kcg0;

    invoke-static {v0, p0}, Ll/ui80;->a(Ll/ui80;Ll/kcg0;)V

    return-void
.end method
