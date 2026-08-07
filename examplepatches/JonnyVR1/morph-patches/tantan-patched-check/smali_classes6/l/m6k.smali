.class public final synthetic Ll/m6k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/o6k;


# direct methods
.method public synthetic constructor <init>(Ll/o6k;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m6k;->a:Ll/o6k;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m6k;->a:Ll/o6k;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/o6k;->c(Ll/o6k;Ljava/lang/Throwable;)V

    return-void
.end method
