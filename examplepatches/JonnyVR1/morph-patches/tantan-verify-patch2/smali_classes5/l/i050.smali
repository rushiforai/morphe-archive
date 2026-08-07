.class public final synthetic Ll/i050;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/l050;


# direct methods
.method public synthetic constructor <init>(Ll/l050;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i050;->a:Ll/l050;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i050;->a:Ll/l050;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/l050;->h0(Ll/l050;Ljava/lang/Throwable;)V

    return-void
.end method
