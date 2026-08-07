.class public final synthetic Ll/n60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/o60;


# direct methods
.method public synthetic constructor <init>(Ll/o60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n60;->a:Ll/o60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n60;->a:Ll/o60;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/o60;->E(Ll/o60;Ljava/lang/Throwable;)V

    return-void
.end method
