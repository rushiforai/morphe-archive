.class public final synthetic Ll/k8i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/n8i;


# direct methods
.method public synthetic constructor <init>(Ll/n8i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k8i;->a:Ll/n8i;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k8i;->a:Ll/n8i;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/n8i;->h0(Ll/n8i;Ljava/util/List;)V

    return-void
.end method
