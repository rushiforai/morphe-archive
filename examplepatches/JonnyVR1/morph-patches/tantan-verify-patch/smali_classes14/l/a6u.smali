.class public final synthetic Ll/a6u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/h6u;


# direct methods
.method public synthetic constructor <init>(Ll/h6u;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a6u;->a:Ll/h6u;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a6u;->a:Ll/h6u;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/h6u;->U2(Ll/h6u;Ljava/lang/Throwable;)V

    return-void
.end method
