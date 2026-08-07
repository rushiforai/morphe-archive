.class public final synthetic Ll/ep2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/sp2;


# direct methods
.method public synthetic constructor <init>(Ll/sp2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ep2;->a:Ll/sp2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ep2;->a:Ll/sp2;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/sp2;->m0(Ll/sp2;Ljava/lang/Boolean;)V

    return-void
.end method
