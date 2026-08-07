.class public final synthetic Ll/uyn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/bzn;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/bzn;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uyn;->a:Ll/bzn;

    iput-object p2, p0, Ll/uyn;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/uyn;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uyn;->a:Ll/bzn;

    iget-object v1, p0, Ll/uyn;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/uyn;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/bzn;->d(Ll/bzn;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
