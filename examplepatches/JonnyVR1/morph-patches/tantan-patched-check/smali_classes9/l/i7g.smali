.class public final synthetic Ll/i7g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/x7g;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/cm0;


# direct methods
.method public synthetic constructor <init>(Ll/x7g;Ljava/lang/String;Ll/cm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i7g;->a:Ll/x7g;

    iput-object p2, p0, Ll/i7g;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/i7g;->c:Ll/cm0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i7g;->a:Ll/x7g;

    iget-object v1, p0, Ll/i7g;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/i7g;->c:Ll/cm0;

    invoke-static {v0, v1, p0}, Ll/x7g;->c(Ll/x7g;Ljava/lang/String;Ll/cm0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
