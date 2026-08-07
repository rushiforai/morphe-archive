.class public final synthetic Ll/uya;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/cza;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/cza;Ljava/lang/String;ZLl/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uya;->a:Ll/cza;

    iput-object p2, p0, Ll/uya;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/uya;->c:Z

    iput-object p4, p0, Ll/uya;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uya;->a:Ll/cza;

    iget-object v1, p0, Ll/uya;->b:Ljava/lang/String;

    iget-boolean v2, p0, Ll/uya;->c:Z

    iget-object p0, p0, Ll/uya;->d:Ll/x20;

    invoke-static {v0, v1, v2, p0}, Ll/cza;->r3(Ll/cza;Ljava/lang/String;ZLl/x20;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
