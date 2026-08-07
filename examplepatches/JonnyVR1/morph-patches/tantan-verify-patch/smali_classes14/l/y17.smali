.class public final synthetic Ll/y17;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/m27;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lrx/c$d;


# direct methods
.method public synthetic constructor <init>(Ll/m27;Ljava/lang/String;Lrx/c$d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y17;->a:Ll/m27;

    iput-object p2, p0, Ll/y17;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/y17;->c:Lrx/c$d;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y17;->a:Ll/m27;

    iget-object v1, p0, Ll/y17;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/y17;->c:Lrx/c$d;

    invoke-static {v0, v1, p0}, Ll/m27;->c3(Ll/m27;Ljava/lang/String;Lrx/c$d;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
