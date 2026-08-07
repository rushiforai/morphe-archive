.class public final synthetic Ll/qg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/lh;


# direct methods
.method public synthetic constructor <init>(Ll/lh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qg;->a:Ll/lh;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qg;->a:Ll/lh;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/lh;->r(Ll/lh;Ljava/util/List;)V

    return-void
.end method
