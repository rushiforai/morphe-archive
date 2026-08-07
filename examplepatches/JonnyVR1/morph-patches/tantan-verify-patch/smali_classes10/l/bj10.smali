.class public final synthetic Ll/bj10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cj10;


# direct methods
.method public synthetic constructor <init>(Ll/cj10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bj10;->a:Ll/cj10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bj10;->a:Ll/cj10;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/cj10;->J3(Ll/cj10;Ljava/util/List;)V

    return-void
.end method
