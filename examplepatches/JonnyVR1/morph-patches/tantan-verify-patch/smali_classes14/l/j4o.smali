.class public final synthetic Ll/j4o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/k4o;


# direct methods
.method public synthetic constructor <init>(Ll/k4o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j4o;->a:Ll/k4o;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j4o;->a:Ll/k4o;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/k4o;->V2(Ll/k4o;Ljava/lang/Throwable;)V

    return-void
.end method
