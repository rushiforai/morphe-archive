.class public final synthetic Ll/kti;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/lti;


# direct methods
.method public synthetic constructor <init>(Ll/lti;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kti;->a:Ll/lti;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kti;->a:Ll/lti;

    check-cast p1, Ll/hti;

    invoke-static {p0, p1}, Ll/lti;->a(Ll/lti;Ll/hti;)V

    return-void
.end method
