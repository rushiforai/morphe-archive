.class public final synthetic Ll/yzi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/o0j;


# direct methods
.method public synthetic constructor <init>(Ll/o0j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yzi;->a:Ll/o0j;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yzi;->a:Ll/o0j;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/o0j;->M(Ll/o0j;Ljava/util/List;)V

    return-void
.end method
