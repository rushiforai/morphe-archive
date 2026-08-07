.class public final synthetic Ll/jya;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cza;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/z20;


# direct methods
.method public synthetic constructor <init>(Ll/cza;Ljava/lang/String;Ll/z20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jya;->a:Ll/cza;

    iput-object p2, p0, Ll/jya;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/jya;->c:Ll/z20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jya;->a:Ll/cza;

    iget-object v1, p0, Ll/jya;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/jya;->c:Ll/z20;

    check-cast p1, Lrx/c;

    invoke-static {v0, v1, p0, p1}, Ll/cza;->d3(Ll/cza;Ljava/lang/String;Ll/z20;Lrx/c;)V

    return-void
.end method
