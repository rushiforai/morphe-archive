.class public final synthetic Ll/kxu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mxu;


# direct methods
.method public synthetic constructor <init>(Ll/mxu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kxu;->a:Ll/mxu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kxu;->a:Ll/mxu;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/mxu;->a(Ll/mxu;Ljava/lang/String;)V

    return-void
.end method
