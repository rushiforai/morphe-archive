.class public final synthetic Ll/srr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/urr;


# direct methods
.method public synthetic constructor <init>(Ll/urr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/srr;->a:Ll/urr;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/srr;->a:Ll/urr;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/urr;->S2(Ll/urr;Ljava/lang/Boolean;)V

    return-void
.end method
