.class public final synthetic Ll/kq50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/pq50;


# direct methods
.method public synthetic constructor <init>(Ll/pq50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kq50;->a:Ll/pq50;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kq50;->a:Ll/pq50;

    check-cast p1, Ljava/lang/Boolean;

    check-cast p2, Ljava/lang/String;

    invoke-static {p0, p1, p2}, Ll/pq50;->k(Ll/pq50;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method
