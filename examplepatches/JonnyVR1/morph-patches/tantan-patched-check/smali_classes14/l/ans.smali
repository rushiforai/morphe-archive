.class public final synthetic Ll/ans;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/nns;


# direct methods
.method public synthetic constructor <init>(Ll/nns;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ans;->a:Ll/nns;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ans;->a:Ll/nns;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Ll/nns;->n3(Ljava/lang/Boolean;)V

    return-void
.end method
