.class public final synthetic Ll/l8v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/o8v;


# direct methods
.method public synthetic constructor <init>(Ll/o8v;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l8v;->a:Ll/o8v;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l8v;->a:Ll/o8v;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/o8v;->u2(Ll/o8v;Ljava/lang/Throwable;)V

    return-void
.end method
