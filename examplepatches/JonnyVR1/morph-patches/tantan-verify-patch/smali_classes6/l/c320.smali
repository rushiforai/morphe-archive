.class public final synthetic Ll/c320;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/k6c;


# direct methods
.method public synthetic constructor <init>(Ll/k6c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c320;->a:Ll/k6c;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c320;->a:Ll/k6c;

    check-cast p1, Ljava/lang/Throwable;

    invoke-interface {p0, p1}, Ll/k6c;->a(Ljava/lang/Throwable;)V

    return-void
.end method
