.class public final synthetic Ll/ky30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b240;


# direct methods
.method public synthetic constructor <init>(Ll/b240;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ky30;->a:Ll/b240;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ky30;->a:Ll/b240;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/b240;->k4(Ll/b240;Ljava/lang/Long;)V

    return-void
.end method
