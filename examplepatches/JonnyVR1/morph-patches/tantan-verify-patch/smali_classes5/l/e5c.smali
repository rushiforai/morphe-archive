.class public final synthetic Ll/e5c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/k5c;


# direct methods
.method public synthetic constructor <init>(Ll/k5c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e5c;->a:Ll/k5c;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e5c;->a:Ll/k5c;

    check-cast p1, Ljava/lang/String;

    check-cast p2, Ll/x20;

    invoke-static {p0, p1, p2}, Ll/k5c;->d(Ll/k5c;Ljava/lang/String;Ll/x20;)V

    return-void
.end method
