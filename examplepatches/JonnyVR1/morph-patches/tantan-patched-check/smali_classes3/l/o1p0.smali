.class public final synthetic Ll/o1p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/p1p0;


# direct methods
.method public synthetic constructor <init>(Ll/p1p0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o1p0;->a:Ll/p1p0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o1p0;->a:Ll/p1p0;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/p1p0;->J3(Ll/p1p0;Ljava/lang/Throwable;)V

    return-void
.end method
