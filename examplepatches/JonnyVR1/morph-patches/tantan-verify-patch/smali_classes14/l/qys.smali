.class public final synthetic Ll/qys;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rys;


# direct methods
.method public synthetic constructor <init>(Ll/rys;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qys;->a:Ll/rys;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qys;->a:Ll/rys;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/rys;->a(Ll/rys;Ljava/lang/String;)V

    return-void
.end method
