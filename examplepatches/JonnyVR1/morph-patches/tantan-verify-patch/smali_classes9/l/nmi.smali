.class public final synthetic Ll/nmi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tmi;


# direct methods
.method public synthetic constructor <init>(Ll/tmi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nmi;->a:Ll/tmi;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nmi;->a:Ll/tmi;

    check-cast p1, Ll/jsv;

    invoke-static {p0, p1}, Ll/tmi;->O3(Ll/tmi;Ll/jsv;)V

    return-void
.end method
