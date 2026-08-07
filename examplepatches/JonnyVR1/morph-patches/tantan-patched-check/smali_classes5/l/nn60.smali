.class public final synthetic Ll/nn60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/pn60;

.field public final synthetic b:Ll/jn60;

.field public final synthetic c:Ll/l5;


# direct methods
.method public synthetic constructor <init>(Ll/pn60;Ll/jn60;Ll/l5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nn60;->a:Ll/pn60;

    iput-object p2, p0, Ll/nn60;->b:Ll/jn60;

    iput-object p3, p0, Ll/nn60;->c:Ll/l5;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nn60;->a:Ll/pn60;

    iget-object v1, p0, Ll/nn60;->b:Ll/jn60;

    iget-object p0, p0, Ll/nn60;->c:Ll/l5;

    invoke-static {v0, v1, p0}, Ll/pn60;->d(Ll/pn60;Ll/jn60;Ll/l5;)V

    return-void
.end method
