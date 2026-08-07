.class public final synthetic Ll/x6b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y6b;


# direct methods
.method public synthetic constructor <init>(Ll/y6b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x6b;->a:Ll/y6b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x6b;->a:Ll/y6b;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/y6b;->e3(Ll/y6b;Ljava/lang/Throwable;)V

    return-void
.end method
