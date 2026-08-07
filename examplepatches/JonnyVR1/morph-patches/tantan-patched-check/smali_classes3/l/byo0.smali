.class public final synthetic Ll/byo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kyo0;


# direct methods
.method public synthetic constructor <init>(Ll/kyo0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/byo0;->a:Ll/kyo0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/byo0;->a:Ll/kyo0;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/kyo0;->Y3(Ll/kyo0;Ljava/lang/Throwable;)V

    return-void
.end method
