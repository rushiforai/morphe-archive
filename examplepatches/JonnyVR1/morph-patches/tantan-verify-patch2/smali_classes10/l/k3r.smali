.class public final synthetic Ll/k3r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/t3r;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/t3r;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k3r;->a:Ll/t3r;

    iput-object p2, p0, Ll/k3r;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/k3r;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k3r;->a:Ll/t3r;

    iget-object v1, p0, Ll/k3r;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/k3r;->c:Z

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Ll/t3r;->Y3(Ll/t3r;Ljava/lang/String;ZLjava/util/List;)V

    return-void
.end method
