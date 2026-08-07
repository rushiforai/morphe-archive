.class public final synthetic Ll/w1v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x1v;


# direct methods
.method public synthetic constructor <init>(Ll/x1v;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w1v;->a:Ll/x1v;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w1v;->a:Ll/x1v;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/x1v;->g0(Ll/x1v;Ljava/lang/Throwable;)V

    return-void
.end method
